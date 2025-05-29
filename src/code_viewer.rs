use serde::{Deserialize, Serialize};

#[derive(Debug, Serialize, Deserialize)]
pub struct CodeViewer {
    code: Vec<String>,
    language: String,
    function_start_line: usize, // Highlight it since it's the first line of the funtion selected.
    selected_row: Option<usize>,
    can_select_rows: bool,
}

impl CodeViewer {
    fn preprocess_code(code: &[&str]) -> Vec<String> {
        code.iter().map(|x| x.to_string()).collect::<_>()
    }

    pub fn for_language(language: &str) -> CodeViewer {
        CodeViewer {
            language: language.into(),
            code: Vec::new(),
            selected_row: None,
            function_start_line: 0,
            can_select_rows: language == "rust",
        }
    }

    pub fn set_source_code(&mut self, code: &[&str]) {
        self.code = CodeViewer::preprocess_code(code);
    }

    pub fn set_highlighted_line(&mut self, line: usize) {
        self.function_start_line = line.min(self.code.len());
    }

    pub fn show_code_as_file(&self, ui: &mut egui::Ui) {
        if self.function_start_line >= self.code.len() {
            return;
        }

        for idx in 0..self.function_start_line {
            code_view_ui(ui, &self.code[idx], &self.language);
        }

        {
            let highlighted_line: egui::RichText = (&self.code[self.function_start_line]).into();

            let prev_color = ui.style_mut().visuals.code_bg_color;
            ui.style_mut().visuals.code_bg_color = egui::Color32::LIGHT_RED;

            ui.code(
                highlighted_line
                    .code()
                    .underline()
                    .color(egui::Color32::BLACK),
            );

            ui.style_mut().visuals.code_bg_color = prev_color;
        }

        for idx in (self.function_start_line + 1)..self.code.len() {
            code_view_ui(ui, &self.code[idx], &self.language);
        }
    }

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
                    body.rows(20.0, self.code.len(), |mut row| {
                        let idx = row.index();

                        if let Some(selected_row) = self.selected_row {
                            row.set_selected(idx == selected_row);
                        }

                        row.col(|ui| {
                            ui.label((idx + 1).to_string());
                        });
                        row.col(|ui| {
                            if self.function_start_line == idx {
                                let prev_color = ui.style_mut().visuals.code_bg_color;
                                ui.style_mut().visuals.code_bg_color = egui::Color32::LIGHT_RED;
                                ui.code(&self.code[idx]);
                                ui.style_mut().visuals.code_bg_color = prev_color;
                            } else {
                                code_view_ui(ui, &self.code[idx], &self.language);
                            }
                        });

                        if row.response().clicked() && self.can_select_rows {
                            self.selected_row = Some(idx);
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
