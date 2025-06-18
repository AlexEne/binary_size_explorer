use serde::{Deserialize, Serialize};

#[derive(Debug, Serialize, Deserialize, Clone)]
pub struct RowData {
    pub cells: Vec<String>,
    pub bg_color: Option<egui::Color32>,
    pub tooltip: Option<String>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct CodeViewer {
    rows: Vec<RowData>,
    language: String,
    function_start_line: usize, // Highlight it since it's the first line of the funtion selected.
    has_scrolled: bool,
    selected_row: Option<usize>,
    can_select_rows: bool,
}

impl CodeViewer {
    fn preprocess_code(&self, code: &[&str]) -> Vec<RowData> {
        let mut row_data = Vec::new();
        for (line, code) in code.iter().enumerate() {
            let bg_color = if self.function_start_line == line {
                Some(egui::Color32::from_rgb(200, 200, 200))
            } else {
                None
            };
            row_data.push(RowData {
                cells: vec![format!("{}", line), code.to_string()],
                bg_color,
                tooltip: None,
            });
        }

        row_data
    }

    pub fn for_language(language: &str) -> CodeViewer {
        CodeViewer {
            language: language.into(),
            rows: Vec::new(),
            selected_row: None,
            function_start_line: 0,
            has_scrolled: false,
            can_select_rows: language == "rust",
        }
    }

    pub fn set_source_code(&mut self, code: &[&str]) {
        self.rows = self.preprocess_code(code);
        self.has_scrolled = false;
    }

    pub fn set_row_data(&mut self, rows: Vec<RowData>) {
        self.rows = rows;
        self.has_scrolled = false;
    }

    pub fn set_highlighted_line(&mut self, line: usize) {
        self.function_start_line = line.min(self.rows.len());
    }

    pub fn selected_row(&self) -> Option<usize> {
        self.selected_row
    }

    pub fn highlight_line(&mut self, line: usize, color: egui::Color32) {
        if let Some(row) = self.rows.get_mut(line) {
            row.bg_color = Some(color);
        }
    }

    #[profiling::function]
    pub fn show_code_as_table(&mut self, ui: &mut egui::Ui) {
        egui::ScrollArea::vertical().show(ui, |ui| {
            let old_selectable_labels = ui.style().interaction.selectable_labels;
            ui.style_mut().interaction.selectable_labels = false;

            let available_height = ui.available_height();
            let mut table = egui_extras::TableBuilder::new(ui)
                .striped(true)
                .resizable(true)
                .cell_layout(egui::Layout::left_to_right(egui::Align::LEFT))
                .column(egui_extras::Column::auto().resizable(false))
                .column(egui_extras::Column::remainder())
                .max_scroll_height(available_height)
                .sense(egui::Sense::click());

            let max_width = self.rows.iter().fold(0, |max_width, row| {
                if row.cells.len() > max_width {
                    return row.cells.len();
                }

                max_width
            });

            for _ in 2..max_width {
                // First one is a hack since it's either address or line number
                table = table.column(egui_extras::Column::remainder());
            }

            if !self.has_scrolled {
                table = table.scroll_to_row(self.function_start_line, Some(egui::Align::TOP));
                self.has_scrolled = true;
            }

            table
                .header(20.0, |mut header| {
                    header.col(|ui| {
                        ui.strong("Line");
                    });
                    header.col(|ui| {
                        ui.strong("Code");
                    });
                })
                .body(|body| {
                    body.rows(20.0, self.rows.len(), |mut row| {
                        let idx = row.index();

                        if let Some(selected_row) = self.selected_row {
                            row.set_selected(idx == selected_row);
                        }

                        for cell in self.rows[idx].cells.iter() {
                            row.col(|ui| {
                                if let Some(bg_color) = self.rows[idx].bg_color {
                                    // Get the row's rect and paint it
                                    let rect = ui.available_rect_before_wrap();
                                    ui.painter().rect_filled(rect, 0.0, bg_color);
                                }
                                code_view_ui(ui, cell, &self.language);
                            });
                        }

                        if row.response().clicked() && self.can_select_rows {
                            self.selected_row = Some(idx);
                        }

                        if let Some(tooltip) = &self.rows[idx].tooltip {
                            row.response().on_hover_ui(|ui| {
                                ui.label(tooltip);
                            });
                        }
                    });
                });

            ui.style_mut().interaction.selectable_labels = old_selectable_labels;
        });
    }
}

fn code_view_ui(ui: &mut egui::Ui, code: &str, language: &str) {
    let theme = egui_extras::syntax_highlighting::CodeTheme::from_memory(ui.ctx(), ui.style());
    egui_extras::syntax_highlighting::code_view_ui(ui, &theme, code, language);
}
