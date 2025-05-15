use std::path;

use twiggy_opt::CommonCliOptions;

use crate::data_provider::{DataProvider, FunctionProperty};

#[derive(serde::Serialize, serde::Deserialize)]
pub struct FunctionData {
    pub function_property: FunctionProperty,
    pub debug_info: FunctionPropertyDebugInfo,
}

#[derive(serde::Serialize, serde::Deserialize)]
pub struct FunctionPropertyDebugInfo {
    demangled_name: Option<String>,
    monomorphization_of: Option<String>,
    shallow_size_bytes: String,
    shallow_size_percent: String,
    retained_size_bytes: String,
    retained_size_percent: String,
}

#[derive(serde::Serialize, serde::Deserialize)]
pub struct DataProviderTwiggy {
    raw_data: Vec<FunctionData>,
}

impl DataProviderTwiggy {
    pub fn from_path<P: AsRef<path::Path>>(path: P) -> Self {
        let opts = twiggy_opt::Options::Top(twiggy_opt::Top::new());

        let mut items = twiggy_parser::read_and_parse(&path, opts.parse_mode()).unwrap();
        items.compute_retained_sizes();

        let mut raw_data = Vec::new();
        let total_size = items.size();
        for item in items.iter() {
            // Filter out the meta root item
            if item.id() == items.meta_root() {
                continue;
            }

            let name = item.name();
            let monomorphization_of = item.monomorphization_of();

            let shallow_size_bytes = item.size();
            let shallow_size_percent = (shallow_size_bytes as f32 / total_size as f32) * 100.0;

            let retained_size_bytes = items.retained_size(item.id());
            let retained_size_percent = (retained_size_bytes as f32 / total_size as f32) * 100.0;

            raw_data.push(FunctionData {
                function_property: FunctionProperty {
                    raw_name: name.to_string(),
                    shallow_size_bytes: shallow_size_bytes,
                    shallow_size_percent: shallow_size_percent,
                    retained_size_bytes,
                    retained_size_percent: retained_size_percent,
                },
                debug_info: FunctionPropertyDebugInfo {
                    demangled_name: Some(name.to_string()),
                    monomorphization_of: monomorphization_of.map(ToOwned::to_owned),
                    shallow_size_bytes: format!("{}", shallow_size_bytes),
                    shallow_size_percent: format!("{:.2}%", shallow_size_percent),
                    retained_size_bytes: format!("{}", retained_size_bytes),
                    retained_size_percent: format!("{:.2}%", retained_size_percent),
                },
            });
        }

        raw_data.sort_by(|a, b| {
            a.function_property
                .shallow_size_bytes
                .cmp(&b.function_property.shallow_size_bytes)
        });

        Self { raw_data }
    }
}

impl DataProvider for DataProviderTwiggy {
    fn get_property_at(&self, idx: usize) -> &FunctionProperty {
        &self.raw_data[idx].function_property
    }

    fn get_functions_count(&self) -> usize {
        self.raw_data.len()
    }

    fn str_get_name_at(&self, idx: usize) -> &str {
        &self.raw_data[idx].function_property.raw_name
    }

    fn str_get_monomorphization_of_at(&self, idx: usize) -> Option<&str> {
        self.raw_data[idx].debug_info.monomorphization_of.as_deref()
    }

    fn str_get_shallow_size_bytes_at(&self, idx: usize) -> &str {
        &self.raw_data[idx].debug_info.shallow_size_bytes
    }

    fn str_get_shallow_size_percent_at(&self, idx: usize) -> &str {
        &self.raw_data[idx].debug_info.shallow_size_percent
    }

    fn str_get_retained_size_bytes_at(&self, idx: usize) -> &str {
        &self.raw_data[idx].debug_info.retained_size_bytes
    }
    fn str_get_retained_size_percent_at(&self, idx: usize) -> &str {
        &self.raw_data[idx].debug_info.retained_size_percent
    }
}
