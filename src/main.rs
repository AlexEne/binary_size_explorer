#![warn(clippy::all, rust_2018_idioms)]
#![cfg_attr(not(debug_assertions), windows_subsystem = "windows")] // hide console window on Windows in release

// When compiling natively:
fn main() -> eframe::Result {
    // // let bytes: [u8; 4] = [0xcb, 0x1c, 0xa9, 0x03];
    // let bytes: [u8; 2] = [0xa9, 0x03];
    // // let bytes: [u8; 4] = [0xE5, 0x8E, 0x26, 0x00];

    // let mut size: u32 = 0;
    // let mut bit_offsets = 0;
    // for byte in bytes.into_iter() {
    //     size |= ((byte & 0x7f) as u32) << bit_offsets;
    //     if byte & 0x80 == 0 {
    //         break;
    //     }
    //     bit_offsets += 7;
    // }

    // println!("Size {size}");

    env_logger::init(); // Log to stderr (if you run with `RUST_LOG=debug`).

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
