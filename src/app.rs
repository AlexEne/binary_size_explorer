use crate::code_viewer::show_code;
use crate::data_provider_twiggy::DataProviderTwiggy;
use crate::functions_exporer::FunctionsExplorer;
use egui_file_dialog::FileDialog;
use std::{io::BufWriter, path::PathBuf, u32};
use twiggy_opt::CommonCliOptions;

#[derive(serde::Deserialize, serde::Serialize)]
pub struct FileEntry {
    pub path: PathBuf,
    pub data_provider: Option<DataProviderTwiggy>,
}

struct TabViewer {}

impl egui_dock::TabViewer for TabViewer {
    type Tab = DockTab;

    fn title(&mut self, tab: &mut Self::Tab) -> egui::WidgetText {
        tab.title.clone().into()
    }

    fn ui(&mut self, ui: &mut egui::Ui, tab: &mut Self::Tab) {
        match &tab.contents {
            TabContent::SourceCodeViewer { code } => {
                //ui.label(code.clone());
                show_code(ui, code, "rs");
            }
        }
    }
}

#[derive(serde::Serialize, serde::Deserialize)]
struct DockTab {
    contents: TabContent,
    title: String,
}

impl DockTab {
    fn new(title: impl Into<String>) -> DockTab {
        DockTab {
            contents: TabContent::SourceCodeViewer {
                code: r"
pub struct CodeExample {
    name: String,
    age: u32,
}

impl CodeExample {
    fn ui(&mut self, ui: &mut egui::Ui) {
      // Saves us from writing `&mut self.name` etc
      let Self { name, age } = self;
    }
}"
                .into(),
            },
            title: title.into(),
        }
    }
}

#[derive(serde::Deserialize, serde::Serialize)]
enum TabContent {
    SourceCodeViewer { code: String },
}

/// We derive Deserialize/Serialize so we can persist app state on shutdown.
#[derive(serde::Deserialize, serde::Serialize)]
#[serde(default)] // if we add new fields, give them default values when deserializing old state
pub struct TemplateApp {
    #[serde(skip)]
    file_dialog: FileDialog,

    analyzer_state: Option<AnalyzerState>,
    twiggy_top_response: Option<String>,

    functions_explorer: FunctionsExplorer,

    file_entries: Vec<FileEntry>,

    tree: egui_dock::DockState<DockTab>,
}

#[derive(serde::Deserialize, serde::Serialize)]
enum AnalyzerState {
    AnalyzeWasm {
        path: PathBuf,
        wasm_file_data: Box<[u8]>,
    },
}

fn create_tree() -> egui_dock::DockState<DockTab> {
    let mut tree = egui_dock::DockState::new(vec![DockTab::new("First"), DockTab::new("Second")]);

    // You can modify the tree before constructing the dock
    let [_, _] = tree.main_surface_mut().split_left(
        egui_dock::NodeIndex::root(),
        0.3,
        vec![DockTab::new("Third")],
    );

    tree
}

impl Default for TemplateApp {
    fn default() -> Self {
        Self {
            file_dialog: FileDialog::new(),

            analyzer_state: None,

            functions_explorer: FunctionsExplorer::default(),

            twiggy_top_response: None,
            file_entries: Vec::new(),

            tree: create_tree(),
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
            .show(ctx, |ui| {
                if let Some(twiggy_top) = &self.twiggy_top_response {
                    if !self.file_entries.is_empty() {
                        if let Some(data_provider) = &self.file_entries[0].data_provider {
                            self.functions_explorer
                                .show_functions_table(ui, data_provider);
                        }
                    }
                }
            });

        egui::SidePanel::left("LeftPanel")
            .resizable(true)
            .width_range(100.0..=400.0)
            .show(ctx, |ui| {
                ui.vertical_centered(|ui| {
                    egui::CollapsingHeader::new("OpenFiles")
                        .default_open(true)
                        .show(ui, |ui| {
                            ui.label("TreeViewEntry");
                        })
                })
            });

        egui::CentralPanel::default().show(ctx, |ui| {
            // The central panel the region left after adding TopPanel's and SidePanel's
            // ui.heading("eframe template");

            // ui.add(egui::Slider::new(&mut self.value, 0.0..=10.0).text("value"));
            // if ui.button("Increment").clicked() {
            //     self.value += 1.0;
            // }

            // ui.separator();

            egui_dock::DockArea::new(&mut self.tree)
                .style(egui_dock::Style::from_egui(ctx.style().as_ref()))
                .show(ctx, &mut TabViewer {});

            ui.with_layout(egui::Layout::bottom_up(egui::Align::LEFT), |ui| {
                egui::warn_if_debug_build(ui);
            });
        });

        self.update_state();
    }
}

impl TemplateApp {
    fn update_state(&mut self) {
        let mut next_state = None;

        if let Some(state) = self.analyzer_state.take() {
            match state {
                AnalyzerState::AnalyzeWasm { path, .. } => {
                    let opts = twiggy_opt::Options::Top(twiggy_opt::Top::new());
                    let mut items =
                        twiggy_parser::read_and_parse(&path, opts.parse_mode()).unwrap();

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
