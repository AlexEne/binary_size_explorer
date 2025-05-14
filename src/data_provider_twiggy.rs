use std::fmt::format;

use json::JsonValue;

use crate::data_provider::{DataProvider, FunctionProperty};

#[derive(serde::Serialize, serde::Deserialize)]
struct FunctionData {
    function_property: FunctionProperty,
    debug_info: FunctionPropertyDebugInfo,
}

#[derive(serde::Serialize, serde::Deserialize)]
struct FunctionPropertyDebugInfo {
    demangled_name: Option<String>,
    size_bytes: String,
    shallow_size_bytes: String,
    shallow_size_percent: String,
    retained_size_percent: String,
}

#[derive(serde::Serialize, serde::Deserialize)]
pub struct DataProviderTwiggy {
    raw_data: Vec<FunctionData>,
}

impl DataProviderTwiggy {
    pub fn from_json(json: &JsonValue) -> Self {
        let mut raw_data = Vec::new();

        for function in json.members() {
            let raw_name = function["name"].to_string();
            // let demangled_name = function["demangled_name"].as_str().map(|s| s.to_string());
            let size_bytes = function["retained_size"].as_u32().unwrap_or(0);
            let shallow_size_bytes = function["shallow_size"].as_u32().unwrap_or(0);
            let shallow_size_percent = function["shallow_size_percent"].as_f32().unwrap_or(0.0);
            let retained_size_percent = function["retained_size_percent"].as_f32().unwrap_or(0.0);

            raw_data.push(FunctionData {
                function_property: FunctionProperty {
                    raw_name,
                    size_bytes,
                    shallow_size_bytes,
                    shallow_size_percent,
                    retained_size_percent,
                },
                debug_info: FunctionPropertyDebugInfo {
                    demangled_name: None, // TODO add demangled name
                    size_bytes: format!("{}", size_bytes),
                    shallow_size_bytes: format!("{}", shallow_size_bytes),
                    shallow_size_percent: format!("{:.2}%", shallow_size_percent),
                    retained_size_percent: format!("{:.2}%", retained_size_percent),
                },
            });
        }

        DataProviderTwiggy { raw_data }
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

    fn str_get_demangled_name_at(&self, idx: usize) -> Option<&str> {
        self.raw_data[idx].debug_info.demangled_name.as_deref()
    }

    fn str_get_size_bytes_at(&self, idx: usize) -> &str {
        &self.raw_data[idx].debug_info.size_bytes
    }

    fn str_get_shallow_size_bytes_at(&self, idx: usize) -> &str {
        &self.raw_data[idx].debug_info.shallow_size_bytes
    }

    fn str_get_shallow_size_percent_at(&self, idx: usize) -> &str {
        &self.raw_data[idx].debug_info.shallow_size_percent
    }

    fn str_get_retained_size_percent_at(&self, idx: usize) -> &str {
        &self.raw_data[idx].debug_info.retained_size_percent
    }
}
