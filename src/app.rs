use std::{fs::File, io::BufWriter, path::PathBuf, u32};

use egui_file_dialog::FileDialog;
use twiggy_opt::CommonCliOptions;

use crate::{
    code_viewer::show_code,
    data_provider::{self, DataProvider},
    data_provider_twiggy::DataProviderTwiggy,
};

#[derive(serde::Deserialize, serde::Serialize)]
struct FileEntry {
    path: PathBuf,
    data_provider: Option<DataProviderTwiggy>,
}

/// We derive Deserialize/Serialize so we can persist app state on shutdown.
#[derive(serde::Deserialize, serde::Serialize)]
#[serde(default)] // if we add new fields, give them default values when deserializing old state
pub struct TemplateApp {
    label: String,

    #[serde(skip)]
    file_dialog: FileDialog,

    code: String,

    analyzer_state: Option<AnalyzerState>,
    twiggy_top_response: Option<String>,

    reversed_table: bool,

    file_entries: Vec<FileEntry>,

    value: f32,
}

#[derive(serde::Deserialize, serde::Serialize)]
enum AnalyzerState {
    AnalyzeWasm {
        path: PathBuf,
        wasm_file_data: Box<[u8]>,
    },
}

impl Default for TemplateApp {
    fn default() -> Self {
        Self {
            label: "Hello World!".to_owned(),
            file_dialog: FileDialog::new(),

            value: 2.7,
            analyzer_state: None,
            reversed_table: false,

            twiggy_top_response: None,
            file_entries: Vec::new(),

            code: r"
pub struct CodeExample {
    name: String,
    age: u32,
}

impl CodeExample {
    fn ui(&mut self, ui: &mut egui::Ui) {
        // Saves us from writing `&mut self.name` etc
        let Self { name, age } = self;"
                .into(),
        }
    }
}

impl TemplateApp {
    /// Called once before the first frame.
    pub fn new(cc: &eframe::CreationContext<'_>) -> Self {
        // This is also where you can customize the look and feel of egui using
        // `cc.egui_ctx.set_visuals` and `cc.egui_ctx.set_fonts`.

        // Load previous app state (if any).
        // Note that you must enable the `persistence` feature for this to work.
        if let Some(storage) = cc.storage {
            return eframe::get_value(storage, eframe::APP_KEY).unwrap_or_default();
        }

        Default::default()
    }
}

impl eframe::App for TemplateApp {
    /// Called by the frame work to save state before shutdown.
    fn save(&mut self, storage: &mut dyn eframe::Storage) {
        eframe::set_value(storage, eframe::APP_KEY, self);
    }

    /// Called each time the UI needs repainting, which may be many times per second.
    fn update(&mut self, ctx: &egui::Context, _frame: &mut eframe::Frame) {
        // Put your widgets into a `SidePanel`, `TopBottomPanel`, `CentralPanel`, `Window` or `Area`.
        // For inspiration and more examples, go to https://emilk.github.io/egui

        egui::TopBottomPanel::top("top_panel").show(ctx, |ui| {
            egui::menu::bar(ui, |ui| {
                ui.menu_button("File", |ui| {
                    if ui.button("Open").clicked() {
                        self.file_dialog.pick_file();
                    }
                    if ui.button("Quit").clicked() {
                        ctx.send_viewport_cmd(egui::ViewportCommand::Close);
                    }
                });

                self.file_dialog.update(ctx);
                if let Some(path) = self.file_dialog.picked() {
                    let file_data = std::fs::read(path).unwrap();
                    self.analyzer_state = Some(AnalyzerState::AnalyzeWasm {
                        path: path.to_path_buf(),
                        wasm_file_data: file_data.into_boxed_slice(),
                    });
                }

                ui.add_space(16.0);

                ui.with_layout(egui::Layout::right_to_left(egui::Align::RIGHT), |ui| {
                    egui::widgets::global_theme_preference_buttons(ui);
                });
            });
        });

        egui::SidePanel::right("RightPanel")
            .resizable(true)
            .width_range(100.0..=800.0)
            .show(ctx, |ui| {
                ui.vertical_centered(|ui| {
                    if let Some(twiggy_top) = &self.twiggy_top_response {
                        egui::ScrollArea::vertical().show(ui, |ui| {
                            // ui.with_layout(
                            //     egui::Layout::top_down(egui::Align::LEFT).with_cross_justify(false),
                            //     |ui| {
                            //         // ui.text_edit_multiline(&mut twiggy_top.as_str());
                            //         // show_code(ui, twiggy_top, "cpp");
                            //         self.table_ui(ui);
                            //     },
                            // );

                            use egui_extras::{Size, StripBuilder};
                            StripBuilder::new(ui)
                                .size(Size::remainder().at_least(100.0)) // for the table
                                .vertical(|mut strip| {
                                    strip.cell(|ui| {
                                        egui::ScrollArea::horizontal().show(ui, |ui| {
                                            self.table_ui(ui, 0);
                                        });
                                    });
                                });
                        });
                    }
                });
            });

        egui::CentralPanel::default().show(ctx, |ui| {
            // The central panel the region left after adding TopPanel's and SidePanel's
            ui.heading("eframe template");

            ui.horizontal(|ui| {
                ui.label("Write something: ");
                ui.text_edit_singleline(&mut self.label);
            });

            ui.add(egui::Slider::new(&mut self.value, 0.0..=10.0).text("value"));
            if ui.button("Increment").clicked() {
                self.value += 1.0;
            }

            ui.separator();

            show_code(ui, &self.code, "rs");

            ui.add(egui::github_link_file!(
                "https://github.com/emilk/eframe_template/blob/main/",
                "Source code."
            ));

            ui.with_layout(egui::Layout::bottom_up(egui::Align::LEFT), |ui| {
                powered_by_egui_and_eframe(ui);
                egui::warn_if_debug_build(ui);
            });
        });

        self.update_state();
    }
}

impl TemplateApp {
    fn table_ui(&mut self, ui: &mut egui::Ui, file_entry_idx: usize) {
        let Some(file_entry) = self.file_entries.get(file_entry_idx) else {
            return;
        };
        let Some(data_provider) = file_entry.data_provider.as_ref() else {
            return;
        };

        let table_rows_count = data_provider.get_functions_count();

        let available_height = ui.available_height();
        let mut table = egui_extras::TableBuilder::new(ui)
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
                    let row_index = if self.reversed_table {
                        table_rows_count - 1 - row.index()
                    } else {
                        row.index()
                    };

                    // row.set_selected(self.selection.contains(&row_index));
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
                });
            });
    }
    fn update_state(&mut self) {
        let mut next_state = None;

        if let Some(state) = self.analyzer_state.take() {
            match state {
                AnalyzerState::AnalyzeWasm { path, .. } => {
                    let opts = twiggy_opt::Options::Top(twiggy_opt::Top::new());
                    let mut items = twiggy_parser::read_and_parse(&path, opts.parse_mode()).unwrap();

                    let mut top_opts = twiggy_opt::Top::new();
                    top_opts.set_max_items(u32::MAX);
                    top_opts.set_retained(true);
                    let data = twiggy_analyze::top(&mut items, &top_opts).unwrap();

                    let mut buf = BufWriter::new(Vec::new());
                    data.emit_json(&items, &mut buf).unwrap();

                    let bytes = buf.into_inner().unwrap();
                    self.twiggy_top_response = String::from_utf8(bytes)
                        .ok()
                        .and_then(|s| json::parse(&s).ok())
                        .map(|s| s.pretty(4));

                    if let Some(twiggy_top_response) = &self.twiggy_top_response {
                        let json = json::parse(twiggy_top_response).unwrap();

                        self.file_entries.push(FileEntry {
                            path,
                            data_provider: Some(DataProviderTwiggy::from_json(&json)),
                        })
                    }
                }
            }
        }

        self.analyzer_state = next_state;
    }
}

fn powered_by_egui_and_eframe(ui: &mut egui::Ui) {
    ui.horizontal(|ui| {
        ui.spacing_mut().item_spacing.x = 0.0;
        ui.label("Powered by ");
        ui.hyperlink_to("egui", "https://github.com/emilk/egui");
        ui.label(" and ");
        ui.hyperlink_to(
            "eframe",
            "https://github.com/emilk/egui/tree/master/crates/eframe",
        );
        ui.label(".");
    });
}
