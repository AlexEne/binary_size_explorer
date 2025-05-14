use crate::data_provider::DataProvider;

// This thing is used to explore the functions, sort by sizes and such things.
#[derive(serde::Serialize, serde::Deserialize, Default)]
pub struct FunctionsExplorer {
    reversed_size_bytes: bool,
    selected_row: Option<usize>,
}

impl FunctionsExplorer {
    pub fn show_functions_table(&mut self, ui: &mut egui::Ui, data_provider: &dyn DataProvider) {
        let table_rows_count = data_provider.get_functions_count();

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
            // .column(
            //     egui_extras::Column::remainder()
            //         .at_least(40.0)
            //         .clip(true)
            //         .resizable(true),
            // )
            // .column(egui_extras::Column::auto())
            // .column(egui_extras::Column::remainder())
            // .column(egui_extras::Column::remainder())
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
                            self.reversed_table ^= ui
                                .button(if self.reversed_table { "⬆" } else { "⬇" })
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
            .body(|mut body| {
                body.rows(18.0, table_rows_count, |mut row| {
                    let row_index = if self.reversed_size_bytes {
                        table_rows_count - 1 - row.index()
                    } else {
                        row.index()
                    };

                    if let Some(selected_row) = self.selected_row {
                        row.set_selected(row_index == selected_row);
                    }

                    row.col(|ui| {
                        ui.label(data_provider.str_get_size_bytes_at(row_index));
                    });

                    row.col(|ui| {
                        ui.label(data_provider.str_get_shallow_size_bytes_at(row_index));
                    });

                    row.col(|ui| {
                        ui.label(data_provider.str_get_retained_size_percent_at(row_index));
                    });

                    row.col(|ui| {
                        ui.label(data_provider.str_get_shallow_size_percent_at(row_index));
                    });

                    row.col(|ui| {
                        ui.label("demangled_name_here");
                    });

                    row.col(|ui| {
                        ui.label(format!("{}", data_provider.str_get_name_at(row_index)));
                    });

                    if row.response().clicked() {
                        self.selected_row = Some(row_index);
                    }
                });
            });
    }
}
