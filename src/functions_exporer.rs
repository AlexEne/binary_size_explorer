use crate::data_provider::DataProvider;

// This thing is used to explore the functions, sort by sizes and such things.
#[derive(serde::Serialize, serde::Deserialize, Default)]
pub struct FunctionsExplorer {
    reversed_size_bytes: bool,
    selected_row: Option<usize>,

    filter_text: String,
    // filtered_count: usize,
    total_size: u32,
    total_percent: f32,
}

impl FunctionsExplorer {
    pub fn show_functions_table(&mut self, ui: &mut egui::Ui, data_provider: &dyn DataProvider) {
        let table_rows_count = data_provider.get_functions_count();
        use egui_extras::{Size, StripBuilder};
        // egui::ScrollArea::vertical().show(ui, |ui| {
        StripBuilder::new(ui)
            .size(Size::remainder().at_least(100.0)) // for the table
            .size(Size::exact(120.0))
            .vertical(|mut strip| {
                strip.cell(|ui| {
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
                                                    "⬆"
                                                } else {
                                                    "⬇"
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
                                    ui.strong("Mangled Name");
                                });
                            })
                            .body(|body| {
                                body.rows(18.0, table_rows_count, |mut row| {
                                    let row_index = if self.reversed_size_bytes {
                                        table_rows_count - 1 - row.index()
                                    } else {
                                        row.index()
                                    };
                                    let mut curr_item_index = row_index;
                                    if !self.filter_text.is_empty() {
                                        while curr_item_index < table_rows_count {
                                            let name =
                                                data_provider.str_get_name_at(curr_item_index);
                                            if name.contains(&self.filter_text) {
                                                break;
                                            }

                                            curr_item_index += 1;
                                        }
                                    }
                                    
                                    if curr_item_index >= table_rows_count {
                                        return;
                                    }

                                    if let Some(selected_row) = self.selected_row {
                                        row.set_selected(row_index == selected_row);
                                    }

                                    row.col(|ui| {
                                        ui.label(data_provider.str_get_size_bytes_at(curr_item_index));
                                    });

                                    row.col(|ui| {
                                        ui.label(
                                            data_provider.str_get_shallow_size_bytes_at(curr_item_index),
                                        );
                                    });

                                    row.col(|ui| {
                                        ui.label(
                                            data_provider
                                                .str_get_retained_size_percent_at(curr_item_index),
                                        );
                                    });

                                    row.col(|ui| {
                                        ui.label(
                                            data_provider
                                                .str_get_shallow_size_percent_at(curr_item_index),
                                        );
                                    });

                                    row.col(|ui| {
                                        ui.label("demangled_name_here");
                                    });

                                    row.col(|ui| {
                                        ui.label(data_provider.str_get_name_at(curr_item_index));
                                    });

                                    if row.response().clicked() {
                                        self.selected_row = Some(row_index);
                                    }
                                });
                            });
                    });
                });
                strip.cell(|ui| {
                    ui.vertical(|ui| {
                        ui.separator();

                        ui.horizontal(|ui| {
                            ui.label("Filter: ");
                            if ui.text_edit_singleline(&mut self.filter_text).changed() {
                                self.total_size = 0;
                                self.total_percent = 0.0;

                                for i in 0..data_provider.get_functions_count() {
                                    let property = data_provider.get_property_at(i);
                                    if property.raw_name.contains(&self.filter_text) {
                                        self.total_size += property.size_bytes;
                                        self.total_percent += property.shallow_size_percent;
                                    }
                                }
                            }
                        });

                        ui.separator();

                        ui.label("Stats");
                        ui.label(format!("Filtered size: {:?}", self.total_size));
                        ui.label(format!("Filtered size %: {:.4}", self.total_percent));
                    });
                });
            });
        // });
    }
}
