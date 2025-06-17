#![feature(allocator_api)]

mod app;
pub mod arena;
mod code_viewer;
mod data_provider;
mod data_provider_twiggy;
mod functions_explorer;
mod gui;
mod memory_viewer;
pub use app::TemplateApp;
