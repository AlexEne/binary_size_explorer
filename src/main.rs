#![warn(clippy::all, rust_2018_idioms)]
#![cfg_attr(not(debug_assertions), windows_subsystem = "windows")] // hide console window on Windows in release

use binary_size_explorer::arena::{Arena, memory};

// When compiling natively:
fn main() -> eframe::Result {
    env_logger::init(); // Log to stderr (if you run with `RUST_LOG=debug`).

    let arena = Arena::new(1 * memory::GB);
    let mut m = binary_size_explorer::arena::hash_map::HashMap::with_hasher(
        &arena,
        128,
        foldhash::fast::RandomState::default(),
    );
    m.insert(String::from("A"), 10);

    let native_options = eframe::NativeOptions {
        viewport: egui::ViewportBuilder::default().with_inner_size([600.0, 400.0]),
        ..Default::default()
    };
    eframe::run_native(
        "Binary Size Explorer",
        native_options,
        Box::new(|cc| Ok(Box::new(binary_size_explorer::TemplateApp::new(cc)))),
    )
}
