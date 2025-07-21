use std::{cmp::Ordering, time::Instant};

use egui::{Id, Rect, Response, Sense, Ui, UiBuilder, pos2, scroll_area::ScrollAreaOutput, vec2};

use crate::arena::{Arena, array::Array, scratch::scratch_arena, tree::Tree};

bitflags::bitflags! {
    pub struct TreeItemStateFlags: u8 {
        const OPENED = 0b00000001;
        const FORCE_OPENED = 0b00000010;
        const VISIBLE = 0b00000100;
    }
}

pub struct TreeItemState {
    // pub descendants_count: u32,
    pub flags: TreeItemStateFlags,
    pub depth: u8,
}

impl TreeItemState {
    #[inline(always)]
    pub fn visible(&self) -> bool {
        self.flags.contains(TreeItemStateFlags::VISIBLE)
    }
}

pub struct TreeState<'a, T, D> {
    /// The input tree used to create this tree state.
    pub tree: Tree<'a, T>,

    /// This state of the
    pub items_state: Array<'a, TreeItemState>,

    /// Associated UI data for each item in the tree.
    pub items_ui_data: Array<'a, D>,

    /// The indices to display the visible items (in order)
    /// This allows us to compute the order of indices
    /// to use when displaying each item one after the other.
    pub row_indices: Array<'a, usize>,

    /// The minimum depth in the tree to start displaying items.
    /// This is useful in case where the first few levels of
    /// the tree are not meant to be displayed in the UI.
    pub min_depth_to_display: u8,

    pub sort_fn: fn((&T, &D), (&T, &D)) -> Ordering,

    pub hovered_index: usize,
    pub selected_index: usize,
}

impl<'a, T, D> TreeState<'a, T, D> {
    pub fn from_tree(
        arena: &'a Arena,
        tree: Tree<'a, T>,
        min_depth_to_display: u8,
        state: fn(&T, usize) -> D,
        sort: fn((&T, &D), (&T, &D)) -> Ordering,
    ) -> Self {
        let mut items_state: Array<'_, TreeItemState> = Array::new(arena, tree.len());
        let mut items_ui_data: Array<'_, D> = Array::new(arena, tree.len());

        for idx in 0..tree.len() {
            items_state.push(TreeItemState {
                flags: TreeItemStateFlags::VISIBLE,
                depth: 0,
            });
            items_ui_data.push(state(tree.get(idx), idx));
        }

        fn add_tree_item<T, D>(
            items_state: &mut Array<'_, TreeItemState>,
            items_ui_data: &mut Array<'_, D>,
            tree: &Tree<'_, T>,
            state: fn(&T, usize) -> D,
            sort: fn((&T, &D), (&T, &D)) -> Ordering,
            item_idx: usize,
            depth: u8,
        ) {
            items_state[item_idx].depth = depth;

            let scratch = scratch_arena(&[]);
            let mut children_idx: Vec<usize, &Arena> = Vec::new_in(&scratch);

            for child_idx in tree.get_children(item_idx) {
                children_idx.push(child_idx);
            }

            children_idx.sort_by(|a, b| {
                sort(
                    (&tree[*a].value, &items_ui_data[*a]),
                    (&tree[*b].value, &items_ui_data[*b]),
                )
            });

            for child_idx in children_idx {
                add_tree_item(
                    items_state,
                    items_ui_data,
                    tree,
                    state,
                    sort,
                    child_idx,
                    depth + 1,
                );
            }
        }

        add_tree_item(
            &mut items_state,
            &mut items_ui_data,
            &tree,
            state,
            sort,
            0,
            0,
        );

        if !items_state.is_empty() {
            items_state[0].flags.set(TreeItemStateFlags::OPENED, true);
        }

        let row_indices = Array::new(arena, items_state.len());

        let mut result = Self {
            tree,
            items_state,
            items_ui_data,
            row_indices,
            min_depth_to_display,
            sort_fn: sort,
            hovered_index: usize::MAX,
            selected_index: usize::MAX,
        };

        result.recompute_indices();
        result
    }

    pub(crate) fn recompute_indices(&mut self) {
        let start = Instant::now();
        self.row_indices.clear();

        let scratch = scratch_arena(&[]);
        let mut node_stack: Vec<_, &Arena> = Vec::with_capacity_in(1024 * 1024, &scratch);

        node_stack.push(0);

        while let Some(idx) = node_stack.pop() {
            if self.items_state[idx].depth >= self.min_depth_to_display {
                self.row_indices.push(idx);
            }

            if !self.items_state[idx]
                .flags
                .intersects(TreeItemStateFlags::OPENED | TreeItemStateFlags::FORCE_OPENED)
            {
                continue;
            }

            let base_index = node_stack.len();
            for child_idx in self.tree.get_children(idx) {
                if !self.items_state[child_idx].visible() {
                    continue;
                }

                node_stack.push(child_idx);
            }

            // Sort
            node_stack[base_index..].sort_by(|a, b| {
                (self.sort_fn)(
                    (&self.tree[*b].value, &self.items_ui_data[*b]),
                    (&self.tree[*a].value, &self.items_ui_data[*a]),
                )
            });
        }

        println!(
            "Time to compute indices {}",
            (Instant::now() - start).as_secs_f32()
        );
    }
}

pub struct TreeItem<'a, T, S> {
    pub item: &'a T,
    pub item_state: &'a S,
    pub selected: bool,
    pub response: &'a Response,
}

pub struct TreeView;

impl TreeView {
    pub fn body<T, S>(
        &mut self,
        ui: &mut Ui,
        state: &mut TreeState<T, S>,
        row_height_sans_spacing: f32,
        mut add_item: impl FnMut(&mut Ui, TreeItem<'_, T, S>),
    ) -> ScrollAreaOutput<()> {
        let items_count = state.row_indices.len();
        let available_height = ui.available_height();
        let available_width = ui.available_width();

        let mut table = egui_extras::TableBuilder::new(ui)
            .striped(true)
            .resizable(true)
            .cell_layout(egui::Layout::left_to_right(egui::Align::Center))
            .column(egui_extras::Column::exact(available_width))
            .min_scrolled_height(0.0)
            .max_scroll_height(available_height);

        // Prepare it so it is clickable and we see when we hover rows.
        table = table.sense(egui::Sense::click());

        let mut item_state_changed = false;

        let scroll_area_output = table
            .header(0.0, |mut header| {
                header.col(|_| {});
            })
            .body(|body| {
                body.rows(18.0, items_count, |mut row| {
                    let item_index = state.row_indices[row.index()];

                    row.set_hovered(state.hovered_index == item_index);
                    row.set_selected(state.selected_index == item_index);

                    row.col(|ui| {
                        let id = Id::new(item_index);
                        let id = ui.make_persistent_id(id);

                        let available = ui.available_rect_before_wrap();
                        let (_, mut rect) =
                            ui.allocate_space(vec2(available.width(), row_height_sans_spacing));

                        let header_response = ui.interact(rect, id, Sense::click());

                        if header_response.clicked() {
                            let node = &mut state.items_state[item_index];
                            if node.flags.intersects(
                                TreeItemStateFlags::OPENED | TreeItemStateFlags::FORCE_OPENED,
                            ) {
                                node.flags.remove(TreeItemStateFlags::OPENED);
                                node.flags.remove(TreeItemStateFlags::FORCE_OPENED);
                            } else {
                                node.flags.insert(TreeItemStateFlags::OPENED);
                            }

                            state.selected_index = item_index;

                            item_state_changed = true;
                        }

                        if header_response.hovered() {
                            state.hovered_index = item_index;
                        }

                        let openness = if state.items_state[item_index].flags.intersects(
                            TreeItemStateFlags::OPENED | TreeItemStateFlags::FORCE_OPENED,
                        ) {
                            1.0
                        } else {
                            0.0
                        };

                        // Indent the rect before rendering icon and content
                        let indent = 32.0
                            * (state.items_state[item_index].depth - state.min_depth_to_display)
                                as f32;
                        rect.min.x += indent;

                        let (mut icon_rect, _) = ui.spacing().icon_rectangles(rect);
                        icon_rect.set_center(pos2(
                            rect.left() + ui.spacing().indent / 2.0,
                            rect.center().y,
                        ));
                        let icon_response = header_response.clone().with_new_rect(icon_rect);
                        paint_tree_icon(
                            ui,
                            openness,
                            state.tree[item_index].first_child.is_some(),
                            &icon_response,
                        );

                        // Indent the rect by the space used by the icon
                        rect.min.x += ui.spacing().indent;
                        let mut child_ui =
                            ui.new_child(UiBuilder::new().id_salt(id).max_rect(rect));
                        add_item(
                            &mut child_ui,
                            TreeItem {
                                // index: state.row_indices[item_index],
                                item: &state.tree[item_index].value,
                                item_state: &state.items_ui_data[item_index],
                                selected: state.selected_index == item_index,
                                response: &header_response,
                            },
                        );
                    });
                });
            });

        // State is changed after processing all rows because the item count changes and we can't simply interrupt
        // the table widget.
        // Once we fully implement this withouth relying on TableView, we can make this a lot better
        if item_state_changed {
            state.recompute_indices();
        }

        scroll_area_output
    }
}

fn paint_tree_icon(ui: &mut egui::Ui, openness: f32, paint: bool, response: &egui::Response) {
    let visuals = ui.style().interact(response);
    let rect = response.rect;

    // Draw a pointy triangle arrow:
    let rect = Rect::from_center_size(rect.center(), vec2(rect.width(), rect.height()) * 0.75);
    let rect = rect.expand(visuals.expansion);
    if paint {
        let mut points = vec![rect.left_top(), rect.right_top(), rect.center_bottom()];
        use std::f32::consts::TAU;
        let rotation = emath::Rot2::from_angle(emath::remap(openness, 0.0..=1.0, -TAU / 4.0..=0.0));
        for p in &mut points {
            *p = rect.center() + rotation * (*p - rect.center());
        }

        ui.painter().add(egui::Shape::convex_polygon(
            points,
            visuals.fg_stroke.color,
            egui::Stroke::NONE,
        ));
    } else {
        // Allocate space anyways if paint is disabled
        ui.allocate_space(rect.size());
    }
}
