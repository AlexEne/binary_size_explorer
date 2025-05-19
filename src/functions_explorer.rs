use crate::data_provider::{self, Filter, FilterView};

// This thing is used to explore the functions, sort by sizes and such things.
#[derive(serde::Serialize, serde::Deserialize, Default)]
pub struct FunctionsExplorer {
    reversed_size_bytes: bool,
    pub selected_row: Option<usize>,

    filter_text: String,
}

impl FunctionsExplorer {
    pub fn show_functions_table(&mut self, ui: &mut egui::Ui, filtered_view: &mut dyn FilterView) {
        let table_rows_count = filtered_view.get_filtered_items_count();
        use egui_extras::{Size, StripBuilder};
        egui::ScrollArea::vertical().show(ui, |ui| {
            StripBuilder::new(ui)
                .size(Size::remainder().at_least(100.0)) // for the table
                .size(Size::exact(120.0))
                .vertical(|mut strip| {
                    strip.cell(|ui| {
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

                                        let filtered_item = filtered_view.get_item_at(row_index);

                                        row.col(|ui| {
                                            ui.label(&filtered_item.retained_size_bytes);
                                        });

                                        row.col(|ui| {
                                            ui.label(&filtered_item.shallow_size_bytes);
                                        });

                                        row.col(|ui| {
                                            ui.label(&filtered_item.retained_size_percent);
                                        });

                                        row.col(|ui| {
                                            ui.label(&filtered_item.shallow_size_percent);
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
                    });
                    strip.cell(|ui| {
                        ui.vertical(|ui| {
                            ui.separator();

                            ui.horizontal(|ui| {
                                ui.label("Filter: ");
                                if ui.text_edit_singleline(&mut self.filter_text).changed() {
                                    self.selected_row = None; // Reset selected row.
                                    if !self.filter_text.is_empty() {
                                        filtered_view
                                            .set_filter(Filter::name_filter(&self.filter_text));
                                    } else {
                                        filtered_view.set_filter(Filter::All);
                                    }
                                }
                            });

                            ui.separator();

                            ui.label("Stats");
                            ui.label(format!(
                                "Total count: {} Total size (MB): {:.2}, Total %: {:.4?}%",
                                filtered_view.get_filtered_items_count(),
                                filtered_view.get_total_size() as f32 / (1024.0 * 1024.0),
                                filtered_view.get_total_percent(),
                            ));
                        });
                    });
                });
        });
    }
}
