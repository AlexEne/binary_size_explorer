use std::path;

use twiggy_opt::CommonCliOptions;
use wasmparser::{BinaryReader, FunctionBody};

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

        let wasm_data = std::fs::read(path).unwrap();
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

            let id_num = item.id().serializable();
            let func_section = (id_num >> 32) & 0xFFFF;
            let func_index = id_num & 0xFFFF;
            println!("Processing for item {:?}", item,);

            let range = item.bytes_range().clone();
            match item.kind() {
                twiggy_ir::ItemKind::Code(code) => {
                    let mut reader = wasmparser::BinaryReader::new(&wasm_data[range], 0);
                    let func_code_size = reader.read_bytes(1).unwrap();
                    let body_raw = FunctionBody::new(reader);
                    println!("Function body");
                    println!("Funciton body_raw reder: {:?}", body_raw);

                    let mut reader = body_raw.get_operators_reader().unwrap();
                    while let Ok(op) = reader.read() {
                        println!("Op: {:?}", op);
                    }
                }
                twiggy_ir::ItemKind::Data(data) => (),
                twiggy_ir::ItemKind::Debug(debug_info) => (),
                twiggy_ir::ItemKind::Misc(misc) => (),
            }

            // get_function_bytes(&wasm_data, func_section as _, func_index as _);
            // let function_body = FunctionBody::new(BinaryReader::new(buffer_ref), 0);

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

pub fn get_function_bytes(
    wasm_data: &[u8],
    section_idx: u32,
    entry_idx: u32,
) -> anyhow::Result<Vec<u8>> {
    // let section_idx = function_id.section();
    // let entry_idx = function_id.entry();

    let mut parser = wasmparser::Parser::new(0);
    let mut offset = 0;

    // Find the code section
    while offset < wasm_data.len() {
        let (payload, bytes_read) =
            match parser.parse(&wasm_data[offset..], offset == wasm_data.len()) {
                Ok(wasmparser::Chunk::Parsed { consumed, payload }) => (payload, consumed),
                Ok(wasmparser::Chunk::NeedMoreData { .. }) => {
                    return Err(anyhow::anyhow!("Unexpected end of WASM binary"));
                }
                Err(e) => return Err(anyhow::anyhow!("Failed to parse WASM: {}", e)),
            };

        match payload {
            wasmparser::Payload::CodeSectionStart { count, range, .. } => {
                // Found the code section
                let mut code_reader = wasmparser::CodeSectionReader::new(
                    wasmparser::BinaryReader::new(&wasm_data[range.start..range.end], range.start),
                )?;

                // Skip to our target function
                // for i in 0..entry_idx {
                //     if i >= count {
                //         return Err(anyhow::anyhow!("Function index out of range"));
                //     }
                //     code_reader.
                // }

                // // Get our target function
                // let function = code_reader.read()?;

                if let Some(section_data) = code_reader
                    .into_iter_with_offsets()
                    .skip(entry_idx as _)
                    .next()
                {
                    let (func_size, body) = section_data?;
                    println!("FuncSize: {:?} Body: {:?}", func_size, body);

                    let mut reader = body.get_operators_reader().unwrap();
                    while let Ok(op) = reader.read() {
                        println!("Op: {:?}", op);
                    }
                }
                return Ok(vec![]);
            }
            _ => {
                println!("Payload wasn't code section!");
            }
        }

        offset += bytes_read;
    }

    Err(anyhow::anyhow!("Could not find function bytes"))
}
