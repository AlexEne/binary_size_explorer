use egui::{CollapsingHeader, ComboBox, Vec2b};

use crate::data_provider::{DominatorsView, Filter, FunctionsView, ViewMode};
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
        functions_view: &mut dyn FunctionsView,
    ) {
        ComboBox::from_label("Mode")
            .selected_text(format!("{:?}", self.mode))
            .show_ui(ui, |ui| {
                ui.selectable_value(&mut self.mode, ViewMode::Tops, "Tops");
                ui.selectable_value(&mut self.mode, ViewMode::Dominators, "Dominators");
            });

        functions_view.set_view_mode(self.mode);

        use egui_extras::{Size, StripBuilder};
        egui::ScrollArea::vertical().show(ui, |ui| {
            StripBuilder::new(ui)
                .size(Size::remainder().at_least(100.0)) // for the table
                .size(Size::exact(120.0))
                .vertical(|mut strip| {
                    strip.cell(|ui| {
                        // Render actual view
                        match self.mode {
                            ViewMode::Tops => self.show_tops(ui, functions_view),
                            ViewMode::Dominators => self.show_dominators(ui, functions_view),
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
                                        functions_view
                                            .set_filter(Filter::name_filter(&self.filter_text));
                                    } else {
                                        functions_view.set_filter(Filter::All);
                                    }
                                }
                            });

                            ui.separator();

                            ui.label("Stats");

                            if self.mode == ViewMode::Tops {
                                ui.label(format!(
                                    "Total count: {} Total size (MB): {:.2}, Total %: {:.4?}%",
                                    functions_view.get_tops_items_count(),
                                    functions_view.get_total_size() as f32 / (1024.0 * 1024.0),
                                    functions_view.get_total_percent(),
                                ));
                            } else {
                                ui.label(format!(
                                    "Total size (MB): {:.2}, Total %: {:.4?}%",
                                    functions_view.get_total_size() as f32 / (1024.0 * 1024.0),
                                    functions_view.get_total_percent(),
                                ));
                            }
                        });
                    });
                });
        });
    }

    fn show_tops(&mut self, ui: &mut egui::Ui, filtered_view: &mut dyn FunctionsView) {
        let table_rows_count = filtered_view.get_tops_items_count();
        // use egui_extras::{Size, StripBuilder};
        egui::ScrollArea::vertical().show(ui, |ui| {
            //     StripBuilder::new(ui)
            //         .size(Size::remainder().at_least(100.0)) // for the table
            //         .size(Size::exact(120.0))
            //         .vertical(|mut strip| {
            //             strip.cell(|ui| {
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
                        body.rows(18.0, table_rows_count, |mut row| {
                            let row_index = if self.reversed_size_bytes {
                                table_rows_count - 1 - row.index()
                            } else {
                                row.index()
                            };

                            if let Some(selected_row) = self.selected_row {
                                row.set_selected(row_index == selected_row);
                            }

                            let filtered_item = filtered_view.get_tops_item_at(row_index);

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
                                ui.label(&filtered_item.raw_name);
                            });

                            row.col(|ui| {
                                ui.label(
                                    filtered_item
                                        .monomorphization_of
                                        .as_ref()
                                        .unwrap_or(&"".to_string()),
                                );
                            });

                            if row.response().clicked() {
                                self.selected_row = Some(row_index);
                            }
                        });
                    });
            });
            ui.style_mut().interaction.selectable_labels = old_selectable_labels;
            //             });
            //             strip.cell(|ui| {
            //                 ui.vertical(|ui| {
            //                     ui.separator();

            //                     ui.horizontal(|ui| {
            //                         ui.label("Filter: ");
            //                         if ui.text_edit_singleline(&mut self.filter_text).changed() {
            //                             self.selected_row = None; // Reset selected row.
            //                             if !self.filter_text.is_empty() {
            //                                 filtered_view
            //                                     .set_filter(Filter::name_filter(&self.filter_text));
            //                             } else {
            //                                 filtered_view.set_filter(Filter::All);
            //                             }
            //                         }
            //                     });

            //                     ui.separator();

            //                     ui.label("Stats");
            //                     ui.label(format!(
            //                         "Total count: {} Total size (MB): {:.2}, Total %: {:.4?}%",
            //                         filtered_view.get_tops_items_count(),
            //                         filtered_view.get_total_size() as f32 / (1024.0 * 1024.0),
            //                         filtered_view.get_total_percent(),
            //                     ));
            //                 });
            //             });
        });
        // });
    }

    fn show_dominators(&mut self, ui: &mut egui::Ui, dominator_view: &mut dyn FunctionsView) {
        // use egui_extras::{Size, StripBuilder};

        // StripBuilder::new(ui)
        //     .size(Size::remainder().at_least(100.0)) // for the table
        //     .size(Size::exact(120.0))
        //     .vertical(|mut strip| {
        //         strip.cell(|ui| {
        egui::ScrollArea::both()
            .auto_shrink(Vec2b::new(false, true))
            .show(ui, |ui| {
                fn render_item(
                    ui: &mut egui::Ui,
                    dominator_view: &mut dyn DominatorsView,
                    index: usize,
                ) {
                    let item = dominator_view.get_dominator_item_at(index);
                    let visible = dominator_view.is_child_visible(index);
                    let open = dominator_view.is_child_open(index);

                    if !visible {
                        return;
                    }

                    let children = dominator_view.get_children_of(index).clone();

                    let name = format!(
                        "{:.2}: {} - {}",
                        item.retained_size_percent,
                        item.retained_size_bytes,
                        item.demangled_name.clone().unwrap_or_default()
                    );

                    let response = CollapsingHeader::new(name).open(Some(open)).show(ui, |ui| {
                        for child in children {
                            render_item(ui, dominator_view, child);
                        }
                    });

                    if response.header_response.clicked() {
                        dominator_view.set_child_open(index, !open);
                    }
                }

                let roots = dominator_view.get_roots().clone();
                for root in roots {
                    render_item(ui, dominator_view, root);
                }
            });
        //     });
        //     strip.cell(|ui| {
        //         ui.vertical(|ui| {
        //             ui.separator();

        //             ui.horizontal(|ui| {
        //                 ui.label("Filter: ");
        //                 if ui.text_edit_singleline(&mut self.filter_text).changed() {
        //                     self.selected_row = None; // Reset selected row.
        //                     if !self.filter_text.is_empty() {
        //                         dominator_view
        //                             .set_filter(Filter::name_filter(&self.filter_text));
        //                     } else {
        //                         dominator_view.set_filter(Filter::All);
        //                     }
        //                 }
        //             });

        //             ui.separator();

        //             ui.label("Stats");
        //             ui.label(format!(
        //                 "Total size (MB): {:.2}, Total %: {:.4?}%",
        //                 // dominator_view.get_filtered_items_count(),
        //                 dominator_view.get_total_size() as f32 / (1024.0 * 1024.0),
        //                 dominator_view.get_total_percent(),
        //             ));
        //         });
        //     });
        // });
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
