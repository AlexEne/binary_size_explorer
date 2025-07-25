#![feature(allocator_api)]

mod app;
pub mod arena;
mod code_viewer;
mod data_provider;
mod data_provider_twiggy;
mod dwarf;
mod functions_explorer;
mod gui;
mod memory_viewer;
mod path;
mod wasm;
pub use app::TemplateApp;
