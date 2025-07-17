use egui::{
    Color32, ComboBox, Id, Rect, Sense, Shape, TextStyle, TextWrapMode, WidgetText,
    epaint::RectShape, pos2, vec2,
};

use crate::{
    arena::{array::Array, scratch::scratch_arena},
    data_provider::{Filter, FunctionsView, ViewMode},
    data_provider_twiggy::DataProviderTwiggy,
    dwarf::DwNodeType,
    gui::tree_view::TreeView,
};
use core::str;

#[derive(Clone, Copy, Default, Debug, PartialEq, Eq, serde::Serialize, serde::Deserialize)]
enum FunctionsExplorerMode {
    #[default]
    Tops,
    Dominators,
}

// This thing is used to explore the functions, sort by sizes and such things.
#[derive(serde::Serialize, serde::Deserialize, Default)]
pub struct FunctionsExplorer {
    #[serde(skip)]
    mode: ViewMode,
    reversed_size_bytes: bool,
    pub selected_row: Option<usize>,

    filter_text: String,
}

impl FunctionsExplorer {
    pub fn show_functions_table(
        &mut self,
        ui: &mut egui::Ui,
        functions_data: &mut DataProviderTwiggy,
    ) {
        ComboBox::from_label("Mode")
            .selected_text(format!("{:?}", self.mode))
            .show_ui(ui, |ui| {
                ui.selectable_value(&mut self.mode, ViewMode::Tops, "Tops");
                ui.selectable_value(&mut self.mode, ViewMode::Dominators, "Dominators");
            });

        functions_data.set_view_mode(self.mode);

        use egui_extras::{Size, StripBuilder};
        egui::ScrollArea::vertical().show(ui, |ui| {
            StripBuilder::new(ui)
                .size(Size::remainder().at_least(100.0)) // for the table
                .size(Size::exact(120.0))
                .vertical(|mut strip| {
                    strip.cell(|ui| {
                        // Render actual view
                        match self.mode {
                            ViewMode::Tops => self.show_tops(ui, functions_data),
                            ViewMode::Dominators => self.show_dominators(ui, functions_data),
                        }
                    });
                    strip.cell(|ui| {
                        ui.vertical(|ui| {
                            ui.separator();

                            ui.horizontal(|ui| {
                                ui.label("Filter: ");
                                if ui.text_edit_singleline(&mut self.filter_text).changed() {
                                    self.selected_row = None; // Reset selected row.
                                    if !self.filter_text.is_empty() {
                                        functions_data
                                            .set_filter(Filter::name_filter(&self.filter_text));
                                    } else {
                                        functions_data.set_filter(Filter::All);
                                    }
                                }
                            });

                            ui.separator();

                            ui.label("Stats");

                            if self.mode == ViewMode::Tops {
                                ui.label(format!(
                                    "Total count: {} Total size (MB): {:.2}, Total %: {:.4?}%",
                                    functions_data.top_view_items_filtered.len(),
                                    functions_data.get_total_size() as f32 / (1024.0 * 1024.0),
                                    functions_data.get_total_percent(),
                                ));
                            } else {
                                ui.label(format!(
                                    "Total size (MB): {:.2}, Total %: {:.4?}%",
                                    functions_data.get_total_size() as f32 / (1024.0 * 1024.0),
                                    functions_data.get_total_percent(),
                                ));
                            }
                        });
                    });
                });
        });
    }

    fn show_tops(&mut self, ui: &mut egui::Ui, filtered_view: &mut DataProviderTwiggy) {
        let table_rows_count = filtered_view.top_view_items_filtered.len();
        egui::ScrollArea::vertical().show(ui, |ui| {
            let old_selectable_labels = ui.style().interaction.selectable_labels;
            ui.style_mut().interaction.selectable_labels = false;
            egui::ScrollArea::horizontal().show(ui, |ui| {
                let available_height = ui.available_height();
                let mut table = egui_extras::TableBuilder::new(ui)
                    .striped(true)
                    .resizable(true)
                    .cell_layout(egui::Layout::left_to_right(egui::Align::Center))
                    .column(egui_extras::Column::auto())
                    .column(egui_extras::Column::auto())
                    .column(egui_extras::Column::auto())
                    .column(egui_extras::Column::auto())
                    .column(egui_extras::Column::auto())
                    .column(egui_extras::Column::auto())
                    .min_scrolled_height(0.0)
                    .max_scroll_height(available_height);

                // Prepare it so it is clickable and we see when we hover rows.
                table = table.sense(egui::Sense::click());

                table
                    .header(20.0, |mut header| {
                        header.col(|ui| {
                            egui::Sides::new().show(
                                ui,
                                |ui| {
                                    ui.strong("Size (bytes)");
                                },
                                |ui| {
                                    self.reversed_size_bytes ^= ui
                                        .button(if self.reversed_size_bytes {
                                            "⬇"
                                        } else {
                                            "⬆"
                                        })
                                        .clicked();
                                },
                            );
                        });
                        header.col(|ui| {
                            ui.strong("Shallow Size (bytes)");
                        });
                        header.col(|ui| {
                            ui.strong("Size (%)");
                        });
                        header.col(|ui| {
                            ui.strong("Shallow Size (%)");
                        });
                        header.col(|ui| {
                            ui.strong("Name");
                        });
                        header.col(|ui| {
                            ui.strong("Monomorphization of");
                        });
                    })
                    .body(|body| {
                        body.rows(20.0, table_rows_count, |mut row| {
                            let row_index = if self.reversed_size_bytes {
                                table_rows_count - 1 - row.index()
                            } else {
                                row.index()
                            };

                            let symbol_index = filtered_view.top_view_items_filtered[row_index];

                            if let Some(selected_row) = self.selected_row {
                                row.set_selected(symbol_index == selected_row);
                            }

                            let filtered_item =
                                &filtered_view.raw_data[symbol_index].function_property;

                            row.col(|ui| {
                                ui.label_memory(filtered_item.retained_size_bytes);
                            });

                            row.col(|ui| {
                                ui.label_memory(filtered_item.shallow_size_bytes);
                            });

                            row.col(|ui| {
                                ui.label_percentage(filtered_item.retained_size_percent);
                            });

                            row.col(|ui| {
                                ui.label_percentage(filtered_item.shallow_size_percent);
                            });

                            row.col(|ui| {
                                ui.label(filtered_item.raw_name);
                            });

                            row.col(|ui| {
                                ui.label(filtered_item.monomorphization_of.unwrap_or(""));
                            });

                            if row.response().clicked() {
                                self.selected_row = Some(symbol_index);
                            }
                        });
                    });
            });
            ui.style_mut().interaction.selectable_labels = old_selectable_labels;
        });
    }

    fn show_dominators(&mut self, ui: &mut egui::Ui, dominator_view: &mut DataProviderTwiggy) {
        let state = &mut dominator_view.dominator_state;

        TreeView.body(ui, state, 20.0, |ui, tree_item| {
            let dw_node = tree_item.item;
            let item_ui_data = tree_item.item_state;

            let label = match dw_node.ty {
                DwNodeType::Struct => {
                    format!("struct {}", dw_node.name.as_str())
                }
                DwNodeType::Impl => {
                    format!("impl {} - {}", dw_node.name.as_str(), item_ui_data.size)
                }
                DwNodeType::FunctionInlinedInstance => {
                    format!("[inlined] {}", dw_node.name.as_str())
                }
                _ => {
                    format!("{} - {}", dw_node.name.as_str(), item_ui_data.size,)
                }
            };

            let retained_size_percent =
                100.0 * (item_ui_data.size as f32 / dominator_view.total_size as f32);

            let available = ui.available_rect_before_wrap();

            const PERCENTAGE_WIDTH: f32 = 50.0;
            const PERCENTAGE_BAR_HEIGHT: f32 = 2.0;

            let percentage_text_pos = available.min;
            let percentage_text: WidgetText = format!("{:.2}%", retained_size_percent).into();
            let percentage_galley = percentage_text.into_galley(
                ui,
                Some(TextWrapMode::Extend),
                PERCENTAGE_WIDTH,
                TextStyle::Button,
            );

            let text_pos = available.min + vec2(PERCENTAGE_WIDTH, 0.0);
            let wrap_width = available.right() - text_pos.x;

            // TODO: build galley from scratch?
            let text: WidgetText = label.as_str().into();
            let symbol_galley = text.into_galley(
                ui,
                Some(TextWrapMode::Extend),
                wrap_width,
                TextStyle::Button,
            );

            let button_padding = ui.spacing().button_padding;
            let text_max_x = text_pos.x + symbol_galley.size().x;
            let desired_width = text_max_x + button_padding.x - available.left();
            let desired_size = vec2(
                desired_width,
                symbol_galley.size().y + 2.0 * button_padding.y + 2.0 * PERCENTAGE_BAR_HEIGHT,
            );

            let (_, rect) = ui.allocate_space(desired_size);

            // Center text element on the vertical axis
            let percentage_text_pos = pos2(
                percentage_text_pos.x,
                available.center().y - percentage_galley.size().y / 2.0,
            );
            let symbol_text_pos = pos2(
                text_pos.x,
                available.center().y - symbol_galley.size().y / 2.0,
            );

            let percentage_response = ui.interact(
                Rect {
                    min: percentage_text_pos,
                    max: percentage_text_pos + percentage_galley.size(),
                },
                Id::new(label),
                Sense::hover(),
            );

            let visuals = ui
                .style()
                .interact_selectable(&tree_item.response, tree_item.selected);

            // Percentage label
            ui.painter()
                .galley(percentage_text_pos, percentage_galley, visuals.text_color());
            ui.painter().add(Shape::Rect(RectShape::filled(
                Rect {
                    min: pos2(
                        percentage_text_pos.x,
                        rect.min.y + rect.height() - PERCENTAGE_BAR_HEIGHT,
                    ),
                    max: pos2(
                        percentage_text_pos.x + (retained_size_percent / 100.0) * PERCENTAGE_WIDTH,
                        rect.min.y + rect.height(),
                    ),
                },
                0.0,
                Color32::GREEN,
            )));

            // Percentage tooltip
            if percentage_response.hovered() {
                let scratch = scratch_arena(&[]);
                let mut buffer: Array<'_, u8> = Array::new(&scratch, 1024);

                // TODO: (bruno) probably should just use auto-layout here
                use std::fmt::Write;
                _ = writeln!(
                    &mut buffer,
                    "Size: {:5.2}(MB)",
                    item_ui_data.size as f32 / (1024.0 * 1024.0)
                );

                percentage_response.show_tooltip_ui(|ui| {
                    ui.monospace(std::str::from_utf8(&buffer).unwrap());
                });
            }

            // Symbol label
            ui.painter()
                .galley(symbol_text_pos, symbol_galley, visuals.text_color());
        });
    }
}

trait WidgetMemory {
    fn label_memory(&mut self, bytes: u32) -> egui::Response;
    fn label_percentage(&mut self, percentage: f32) -> egui::Response;
}

impl WidgetMemory for egui::Ui {
    fn label_memory(&mut self, mut bytes: u32) -> egui::Response {
        let mut buffer = [0u8; 20];
        let mut idx = 19;

        while idx > 0 && bytes > 0 {
            let digit = bytes % 10;
            bytes /= 10;

            buffer[idx] = digit as u8 + b'0';
            idx -= 1;
        }

        self.label(unsafe { str::from_utf8_unchecked(&buffer[idx..]) })
    }

    fn label_percentage(&mut self, percentage: f32) -> egui::Response {
        self.label(format!("{:.2}", percentage))
    }
}
