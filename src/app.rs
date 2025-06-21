use crate::arena::memory::GB;
use crate::arena::scratch::scratch_arena;
use crate::arena::{self, Arena};
use crate::code_viewer::{CodeViewer, RowData};
use crate::data_provider::{FunctionsView, SourceCodeView};
use crate::data_provider_twiggy::DataProviderTwiggy;
use crate::functions_explorer::FunctionsExplorer;
use crate::memory_viewer::MemoryViewer;
use egui::{CollapsingHeader, ScrollArea, TextBuffer, Vec2b};
use egui_file_dialog::FileDialog;
use serde::ser::SerializeStruct;
use std::collections::HashMap;
use std::fs;
use std::path::PathBuf;

#[derive(Clone, Copy, serde::Deserialize, serde::Serialize)]
pub enum FileType {
    Wasm,
}

pub struct FileEntry {
    pub path: PathBuf,
    pub ty: FileType,

    pub data_provider: Option<DataProviderTwiggy<'static>>,
    // TODO: (bruno) We need a better way to have both the arena
    // and the object allocated with it as part of a struct
    #[allow(unused)]
    pub arena: Arena,
}

struct TabViewer<'a> {
    /// All the file entries currently loaded.
    file_entries: &'a Vec<FileEntry>,
}

impl egui_dock::TabViewer for TabViewer<'_> {
    type Tab = DockTab;

    fn title(&mut self, tab: &mut Self::Tab) -> egui::WidgetText {
        tab.title.clone().into()
    }

    fn ui(&mut self, ui: &mut egui::Ui, tab: &mut Self::Tab) {
        match &mut tab.contents {
            TabContent::SourceCodeViewer { code_viewer, .. } => {
                code_viewer.show_code_as_table(ui);
            }

            TabContent::AssemblyViewer { asm, .. } => {
                asm.show_code_as_table(ui);
            }

            TabContent::RawBinaryViewer { file_index } => {
                if let Some(data_provider) = &self.file_entries[*file_index].data_provider {
                    MemoryViewer::show(ui, &data_provider.wasm_data);
                }
            }

            TabContent::SectionsBinaryViewer { file_index } => {
                if let Some(data_provider) = &self.file_entries[*file_index].data_provider {
                    ScrollArea::both().auto_shrink(Vec2b::FALSE).show(ui, |ui| {
                        for (idx, section) in data_provider.sections.iter().enumerate() {
                            let section_name = section.name;
                            let section_raw_data = &data_provider.wasm_data
                                [section.offset..(section.offset + section.length)];

                            let header_response = CollapsingHeader::new(section_name)
                                .id_salt(idx)
                                .show(ui, |ui| {
                                    MemoryViewer::show(ui, section_raw_data);
                                })
                                .header_response;

                            if header_response.hovered() {
                                header_response
                                    .show_tooltip_text(format!("Size: {}", section.length));
                            }
                        }
                    });
                }
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
    fn new(title: impl Into<String>, contents: TabContent) -> DockTab {
        DockTab {
            contents,
            title: title.into(),
        }
    }
}

#[derive(serde::Deserialize, serde::Serialize)]
enum TabContent {
    SourceCodeViewer {
        code_viewer: CodeViewer,
        file_path: String,
        first_address: u64,
    },
    AssemblyViewer {
        asm: CodeViewer,
        first_address: u64,
    },
    RawBinaryViewer {
        file_index: usize,
    },
    SectionsBinaryViewer {
        file_index: usize,
    },
}

pub struct TemplateApp {
    file_dialog: FileDialog,

    last_path_picked: PathBuf,

    analyzer_state: Option<AnalyzerState>,

    functions_explorer: FunctionsExplorer,

    file_entries: Vec<FileEntry>,

    tree: egui_dock::DockState<DockTab>,

    settings: AppSettings,
}

#[derive(Debug, Default)]
struct AppSettings {
    source_code_search_folders: Vec<PathBuf>,
    source_file_dialog: FileDialog,
}

enum AnalyzerState {
    AnalyzeWasm { path: PathBuf },
}

impl Default for TemplateApp {
    fn default() -> Self {
        let tree = egui_dock::DockState::new(vec![]);

        Self {
            file_dialog: FileDialog::new(),
            last_path_picked: "".into(),

            analyzer_state: None,

            functions_explorer: FunctionsExplorer::default(),

            file_entries: Vec::new(),

            tree,

            settings: AppSettings::default(),
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

    fn show_src_folder_pick_window(&mut self, ctx: &egui::Context) {
        egui::Window::new("Source code folders").show(ctx, |_| {
            self.file_dialog.pick_directory();
        });
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

                ui.menu_button("Views", |ui| {
                    if ui.button("Raw Binary").clicked() {
                        self.tree.main_surface_mut().push_to_first_leaf(DockTab {
                            title: String::from("Raw Binary"),
                            contents: TabContent::RawBinaryViewer { file_index: 0 },
                        });
                    }

                    if ui.button("Sections Binary").clicked() {
                        self.tree.main_surface_mut().push_to_first_leaf(DockTab {
                            title: String::from("Sections Binary"),
                            contents: TabContent::SectionsBinaryViewer { file_index: 0 },
                        });
                    }
                });

                ui.menu_button("Settings", |ui| {
                    if ui.button("Set source code folders").clicked() {
                        self.show_src_folder_pick_window(ctx);
                    }
                });

                self.file_dialog.update(ctx);
                if let Some(path) = self.file_dialog.picked() {
                    if path != self.last_path_picked {
                        self.analyzer_state = Some(AnalyzerState::AnalyzeWasm {
                            path: path.to_path_buf(),
                        });
                        self.last_path_picked = path.into();
                        self.functions_explorer = FunctionsExplorer::default();
                    }
                }

                self.settings.source_file_dialog.update(ctx);
                if let Some(folder) = self.settings.source_file_dialog.picked() {
                    self.settings.source_code_search_folders.push(folder.into());
                }

                ui.add_space(16.0);

                ui.with_layout(egui::Layout::right_to_left(egui::Align::RIGHT), |ui| {
                    egui::widgets::global_theme_preference_buttons(ui);
                });
            });
        });

        egui::TopBottomPanel::bottom("BottomPanel")
            .resizable(false)
            .show(ctx, |ui| {
                let label = self.file_entries[0].path.to_string_lossy();
                ui.label(label.as_str());
            });

        egui::SidePanel::right("RightPanel")
            .resizable(true)
            .show(ctx, |ui| {
                if !self.file_entries.is_empty() {
                    if let Some(data_provider) = &mut self.file_entries[0].data_provider {
                        self.functions_explorer
                            .show_functions_table(ui, data_provider);

                        if let Some(idx) = self.functions_explorer.selected_row {
                            let (
                                mut asm_row_data,
                                op_start_idx,
                                ops_addresses,
                                first_selected_address,
                            ): (Vec<RowData>, usize, Vec<u64>, u64) = {
                                let mut row_data = Vec::new();
                                let mut ops_addresses = Vec::new();
                                for (index, &local) in
                                    data_provider.get_locals_at(idx).iter().enumerate()
                                {
                                    row_data.push(RowData {
                                        cells: vec![format!("{:?}", index), String::from(local)],
                                        bg_color: None,
                                        tooltip: None,
                                    });
                                }

                                for op in data_provider.get_ops_at(idx).iter() {
                                    row_data.push(RowData {
                                        cells: vec![
                                            format!("0x{:04x}", op.address),
                                            format!("{:?}", op.op),
                                        ],
                                        bg_color: None,
                                        tooltip: None,
                                    });
                                    ops_addresses.push(op.address);
                                }

                                (
                                    row_data,
                                    data_provider.get_locals_at(idx).len(),
                                    ops_addresses,
                                    data_provider.get_start_addr(idx),
                                )
                            };

                            let mut code_rows = Vec::new();
                            let mut current_color_idx = 0;
                            let mut colors_for_source: HashMap<u32, egui::Color32> =
                                HashMap::default();
                            const COLORS: [egui::Color32; 4] = [
                                egui::Color32::LIGHT_RED,
                                egui::Color32::LIGHT_GREEN,
                                egui::Color32::LIGHT_BLUE,
                                egui::Color32::LIGHT_GRAY,
                            ];

                            let mut selected_file_path = "";
                            if let Some(location) =
                                data_provider.get_location_for_addr(first_selected_address)
                            {
                                selected_file_path = location.file.as_str();
                                if let Ok(source_code) = fs::read_to_string(selected_file_path) {
                                    for (idx, line) in source_code.lines().enumerate() {
                                        code_rows.push(RowData {
                                            cells: vec![format!("{:?}", idx), line.to_string()],
                                            bg_color: None,
                                            tooltip: None,
                                        });
                                    }

                                    for (idx, address) in ops_addresses.iter().enumerate() {
                                        if let Some(location) =
                                            data_provider.get_location_for_addr(*address)
                                        {
                                            let color = colors_for_source
                                                .entry(location.line)
                                                .or_insert_with(|| {
                                                    current_color_idx += 1;
                                                    COLORS[current_color_idx % COLORS.len()]
                                                });
                                            // code_viewer.highlight_line(location.line as usize, *color);
                                            if location.file.as_str() == selected_file_path {
                                                code_rows[location.line as usize].bg_color =
                                                    Some(*color);
                                            }

                                            let asm_row_data =
                                                &mut asm_row_data[op_start_idx + idx];
                                            asm_row_data.bg_color = Some(*color);
                                            asm_row_data.tooltip = Some(format!(
                                                "File: {}\nLine: {}",
                                                location.file.as_str(),
                                                location.line
                                            ));
                                        }
                                    }
                                }
                            }

                            self.tree.iter_all_tabs_mut().for_each(|(_, tab)| {
                                match &mut tab.contents {
                                    TabContent::SourceCodeViewer {
                                        code_viewer,
                                        file_path,
                                        first_address,
                                    } => {
                                        if *first_address != first_selected_address {
                                            *first_address = first_selected_address;
                                            *file_path = String::from(selected_file_path);

                                            code_viewer.set_row_data(code_rows.clone());
                                        }
                                    }
                                    TabContent::AssemblyViewer { asm, first_address } => {
                                        if *first_address != first_selected_address {
                                            *first_address = first_selected_address;
                                            asm.set_row_data(asm_row_data.clone());
                                        }
                                    }
                                    _ => {}
                                }
                            });
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
            let Self {
                tree, file_entries, ..
            } = self;

            egui_dock::DockArea::new(tree)
                .style(egui_dock::Style::from_egui(ctx.style().as_ref()))
                .show(ctx, &mut TabViewer { file_entries });

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
                    self.file_entries.clear(); // Not supporting multiple for now.

                    let arena = Arena::new(16 * GB);
                    let data_provider = Some(DataProviderTwiggy::from_path(
                        unsafe { std::mem::transmute(&arena) },
                        &path,
                    ));

                    self.file_entries.push(FileEntry {
                        path,
                        ty: FileType::Wasm,
                        arena,
                        data_provider,
                    });

                    // Reset the tree.
                    self.tree = egui_dock::DockState::new(vec![
                        DockTab::new(
                            "WASM",
                            TabContent::AssemblyViewer {
                                asm: CodeViewer::for_language("wasm"),
                                first_address: 0,
                            },
                        ),
                        DockTab::new(
                            "Source Code",
                            TabContent::SourceCodeViewer {
                                code_viewer: CodeViewer::for_language("rust"),
                                file_path: "".into(),
                                first_address: 0, //address that took us to that path.
                            },
                        ),
                        DockTab::new(
                            "Raw Binary",
                            TabContent::RawBinaryViewer {
                                file_index: self.file_entries.len() - 1,
                            },
                        ),
                        DockTab::new(
                            "Sections Binary",
                            TabContent::SectionsBinaryViewer {
                                file_index: self.file_entries.len() - 1,
                            },
                        ),
                    ]);

                    // self.tree.split((0, 0), egui_dock::Split::Right, 0.5, )

                    next_state = None;
                }
            }
        }

        self.analyzer_state = next_state;
    }
}

const SERIALIZABLE_FIELDS: &[&str] = &[
    "last_path_picked",
    "functions_explorer",
    "settings_src_folders",
    "file_entries",
    "tree",
];

impl serde::Serialize for TemplateApp {
    fn serialize<S>(&self, serializer: S) -> Result<S::Ok, S::Error>
    where
        S: serde::Serializer,
    {
        let mut s = serializer.serialize_struct("TemplateApp", SERIALIZABLE_FIELDS.len())?;
        s.serialize_field("tree", &self.tree)?;
        s.serialize_field("last_path_picked", &self.last_path_picked)?;
        s.serialize_field("functions_explorer", &self.functions_explorer)?;
        s.serialize_field(
            "settings_src_folders",
            &self.settings.source_code_search_folders,
        )?;

        let mut files: Vec<(PathBuf, FileType)> = Vec::with_capacity(self.file_entries.len());
        for file_entry in &self.file_entries {
            files.push((file_entry.path.clone(), file_entry.ty));
        }
        s.serialize_field("file_entries", &files)?;
        s.end()
    }
}

impl<'de> serde::Deserialize<'de> for TemplateApp {
    fn deserialize<D>(deserializer: D) -> Result<Self, D::Error>
    where
        D: serde::Deserializer<'de>,
    {
        struct TemplateAppVisitor;

        impl<'de> serde::de::Visitor<'de> for TemplateAppVisitor {
            type Value = TemplateApp;

            fn expecting(&self, formatter: &mut std::fmt::Formatter) -> std::fmt::Result {
                formatter.write_str("struct TemplateApp")
            }

            fn visit_map<A>(self, mut map: A) -> Result<Self::Value, A::Error>
            where
                A: serde::de::MapAccess<'de>,
            {
                let mut tree = None;
                let mut last_path_picked: Option<PathBuf> = None;
                let mut functions_explorer = None;
                let mut file_entries = None;
                let mut settings = AppSettings::default();

                while let Some(key) = map.next_key()? {
                    match key {
                        "tree" => {
                            tree = Some(map.next_value()?);
                        }
                        "last_path_picked" => {
                            last_path_picked = Some(map.next_value()?);
                        }
                        "functions_explorer" => {
                            functions_explorer = Some(map.next_value()?);
                        }
                        "settings_src_folders" => {
                            settings.source_code_search_folders = map.next_value()?;
                        }
                        "file_entries" => {
                            let files: Vec<(PathBuf, FileType)> = map.next_value()?;

                            let mut fe = Vec::with_capacity(files.len());
                            for (path, ty) in files {
                                let arena = Arena::new(16 * GB);
                                let data_provider = match ty {
                                    FileType::Wasm => Some(DataProviderTwiggy::from_path(
                                        unsafe { std::mem::transmute(&arena) },
                                        &path,
                                    )),
                                };

                                fe.push(FileEntry {
                                    path,
                                    ty,
                                    arena,
                                    data_provider,
                                });
                            }

                            file_entries = Some(fe);
                        }
                        _ => {
                            return Err(serde::de::Error::unknown_field(key, SERIALIZABLE_FIELDS));
                        }
                    }
                }

                let tree = tree.ok_or_else(|| serde::de::Error::missing_field("tree"))?;
                let last_path_picked = last_path_picked
                    .ok_or_else(|| serde::de::Error::missing_field("last_path_picked"))?;
                let functions_explorer = functions_explorer
                    .ok_or_else(|| serde::de::Error::missing_field("functions_explorer"))?;
                let file_entries = file_entries
                    .ok_or_else(|| serde::de::Error::missing_field("functions_explorer"))?;

                Ok(TemplateApp {
                    file_dialog: FileDialog::default().initial_directory(last_path_picked.clone()),
                    last_path_picked,
                    analyzer_state: None,
                    functions_explorer,
                    file_entries,
                    tree,
                    settings,
                })
            }
        }

        deserializer.deserialize_struct("TemplateApp", SERIALIZABLE_FIELDS, TemplateAppVisitor)
    }
}
