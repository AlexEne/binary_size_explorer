pub(crate) fn code_view_ui(ui: &mut egui::Ui, code: &str, language: &str) {
    let theme = egui_extras::syntax_highlighting::CodeTheme::from_memory(ui.ctx(), ui.style());
    egui_extras::syntax_highlighting::code_view_ui(ui, &theme, code, language);
}

pub fn show_code(ui: &mut egui::Ui, code: &[String], language: &str, highlight_line: u32) {
    let highlight_line = highlight_line as usize;
    if highlight_line >= code.len() {
        return;
    }
    for idx in 0..highlight_line {
        let code = remove_leading_indentation(code[idx].trim_start_matches('\n'));
        code_view_ui(ui, &code, language);
    }

    {
        let highlighted_line =
            remove_leading_indentation(code[highlight_line].trim_start_matches('\n'));
        let highlighted_line: egui::RichText = highlighted_line.into();

        let prev_color = ui.style_mut().visuals.code_bg_color;
        ui.style_mut().visuals.code_bg_color = egui::Color32::LIGHT_RED;

        ui.code(
            highlighted_line
                .code()
                .underline()
                .color(egui::Color32::BLACK),
        );

        // Restore prev color
        ui.style_mut().visuals.code_bg_color = prev_color;
    }

    for idx in (highlight_line + 1)..code.len() {
        let code = remove_leading_indentation(code[idx].trim_start_matches('\n'));
        code_view_ui(ui, &code, language);
    }
}

fn remove_leading_indentation(code: &str) -> String {
    fn is_indent(c: &u8) -> bool {
        matches!(*c, b' ' | b'\t')
    }

    let first_line_indent = code.bytes().take_while(is_indent).count();

    let mut out = String::new();

    let mut code = code;
    while !code.is_empty() {
        let indent = code.bytes().take_while(is_indent).count();
        let start = first_line_indent.min(indent);
        let end = code
            .find('\n')
            .map_or_else(|| code.len(), |endline| endline + 1);
        out += &code[start..end];
        code = &code[end..];
    }
    out
}
