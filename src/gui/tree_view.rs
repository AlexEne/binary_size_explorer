use egui::{Id, Rect, Response, Sense, Ui, UiBuilder, pos2, scroll_area::ScrollAreaOutput, vec2};

use crate::arena::{Arena, array::Array};

pub struct TreeItemState {
    pub parent: usize,
    pub index: usize,
    pub descendants_count: usize,
    pub force_opened: bool,
    pub opened: bool,
    pub visible: bool,
    pub indent: u8,
}

pub struct TreeState<'a> {
    pub nodes: Array<'a, TreeItemState>,
    pub indices: Array<'a, usize>,

    pub hovered_index: usize,
    pub selected_index: usize,
}

impl<'a> TreeState<'a> {
    pub fn new(arena: &'a Arena, mut nodes: Array<'a, TreeItemState>) -> Self {
        let indices = Array::new(arena, nodes.len());

        if !nodes.is_empty() {
            nodes[0].opened = true;
        }

        let mut result = Self {
            nodes,
            indices,
            hovered_index: usize::MAX,
            selected_index: usize::MAX,
        };

        result.recompute_indices();
        result
    }

    #[inline(always)]
    pub fn node_at(&self, pos: usize) -> &TreeItemState {
        &self.nodes[self.indices[pos]]
    }

    #[inline(always)]
    pub fn node_at_mut(&mut self, pos: usize) -> &mut TreeItemState {
        &mut self.nodes[self.indices[pos]]
    }

    pub(crate) fn recompute_indices(&mut self) {
        let mut node_index = 0;

        self.indices.clear();

        while node_index < self.nodes.len() {
            if self.nodes[node_index].visible {
                self.indices.push(node_index);

                if self.nodes[node_index].parent != 0 {
                    self.nodes[node_index].indent =
                        self.nodes[self.nodes[node_index].parent].indent + 1;
                } else {
                    self.nodes[node_index].indent = 0;
                }
            }
            // If children are not visible, skip all the descendants
            if !self.nodes[node_index].opened && !self.nodes[node_index].force_opened {
                node_index += self.nodes[node_index].descendants_count;
            }

            node_index += 1;
        }
    }
}

pub struct TreeItem<'a> {
    pub index: usize,
    pub selected: bool,
    pub response: &'a Response,
}

pub struct TreeView;

impl TreeView {
    pub fn body(
        &mut self,
        ui: &mut Ui,
        state: &mut TreeState,
        row_height_sans_spacing: f32,
        mut add_item: impl FnMut(&mut Ui, TreeItem<'_>),
    ) -> ScrollAreaOutput<()> {
        let items_count = state.indices.len() - 1;
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
            .header(20.0, |mut header| {
                header.col(|ui| {
                    ui.strong("Name");
                });
            })
            .body(|body| {
                body.rows(18.0, items_count, |mut row| {
                    let item_index = row.index() + 1;

                    row.set_hovered(state.hovered_index == item_index);
                    row.set_selected(state.selected_index == item_index);

                    row.col(|ui| {
                        let id = Id::new(state.node_at(item_index).index);
                        let id = ui.make_persistent_id(id);

                        let available = ui.available_rect_before_wrap();
                        let (_, mut rect) =
                            ui.allocate_space(vec2(available.width(), row_height_sans_spacing));

                        let header_response = ui.interact(rect, id, Sense::click());

                        if header_response.clicked() {
                            let node = state.node_at_mut(item_index);
                            node.opened = !node.opened;

                            // If node was explicitely closed, disabled force opened
                            if node.opened == false {
                                node.force_opened = false;
                            }

                            state.selected_index = item_index;

                            item_state_changed = true;
                        }

                        if header_response.hovered() {
                            state.hovered_index = item_index;
                        }

                        let openness = if state.node_at(item_index).opened
                            || state.node_at(item_index).force_opened
                        {
                            1.0
                        } else {
                            0.0
                        };

                        // Indent the rect before rendering icon and content
                        let indent = 32.0 * state.node_at(item_index).indent as f32;
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
                            state.node_at(item_index).descendants_count > 0,
                            &icon_response,
                        );

                        // Indent the rect by the space used by the icon
                        rect.min.x += ui.spacing().indent;
                        let mut child_ui =
                            ui.new_child(UiBuilder::new().id_salt(id).max_rect(rect));
                        add_item(
                            &mut child_ui,
                            TreeItem {
                                index: state.node_at(item_index).index,
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
