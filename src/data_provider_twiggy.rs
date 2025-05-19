use crate::data_provider::{
    DataProvider, Filter, FilterView, FunctionProperty, FunctionPropertyDebugInfo,
};
use std::{ops::Range, path};
use twiggy_opt::CommonCliOptions;
use wasmparser::BinaryReader;

#[derive(serde::Serialize, serde::Deserialize)]
pub struct FunctionData {
    pub function_property: FunctionProperty,
    pub debug_info: FunctionPropertyDebugInfo,
}

#[derive(serde::Serialize, serde::Deserialize)]
pub struct DataProviderTwiggy {
    raw_data: Vec<FunctionData>,

    items_filtered: Vec<usize>,
    total_size: u32,
    total_percent: f32,

    filter: Filter,
}

impl DataProviderTwiggy {
    pub fn from_path<P: AsRef<path::Path>>(path: P) -> Self {
        let opts = twiggy_opt::Options::Top(twiggy_opt::Top::new());

        let mut items = twiggy_parser::read_and_parse(&path, opts.parse_mode()).unwrap();

        items.compute_retained_sizes();

        let wasm_data = std::fs::read(path).unwrap();
        let mut raw_data = Vec::new();

        let ignore_item_by_name = |name: &str| -> bool {
            name.starts_with("custom section '.debug_") || name == "\"function names\" subsection"
        };

        let mut total_size = 0;
        for item in items.iter() {
            if !ignore_item_by_name(item.name()) {
                total_size += item.size();
            }
        }

        for item in items.iter() {
            // Filter out the meta root item
            if item.id() == items.meta_root() {
                continue;
            }

            let name = item.name();
            let monomorphization_of = item.monomorphization_of();

            if ignore_item_by_name(item.name()) {
                // Skip debug info from every stat
                continue;
            }

            let shallow_size_bytes = item.size();
            let shallow_size_percent = (shallow_size_bytes as f32 / total_size as f32) * 100.0;

            let retained_size_bytes = items.retained_size(item.id());
            let retained_size_percent = (retained_size_bytes as f32 / total_size as f32) * 100.0;

            let id_num = item.id().serializable();

            let range = item.bytes_range().clone();
            let mut locals = Vec::new();
            let mut function_ops = Vec::new();
            match item.kind() {
                twiggy_ir::ItemKind::Code(_) => {
                    // The function body is what we save in the range.
                    // In WASM the Code section is layed out as:
                    // CodeStart (0x0a) | CodeSectionSize(bytes) | FunctionCount | FunctionBodySize(Bytes) | LocalsSize | Locals | Operators
                    // We assume that range.start is starting with LocalsSize
                    //   and that range.end-range.start is equal FunctionBodySize(Bytes)
                    // We set the reader offset to 0 since range is an absolute offset in the wasm file.
                    // Decent reference here: https://blog.ttulka.com/learning-webassembly-2-wasm-binary-format/
                    (locals, function_ops) = get_locals_and_ops_for_function(&wasm_data, &range);
                }
                twiggy_ir::ItemKind::Data(_data) => (),
                twiggy_ir::ItemKind::Debug(_debug_info) => (),
                twiggy_ir::ItemKind::Misc(_misc) => (),
            }

            raw_data.push(FunctionData {
                function_property: FunctionProperty {
                    raw_name: name.to_string(),
                    shallow_size_bytes: shallow_size_bytes,
                    shallow_size_percent: shallow_size_percent,
                    retained_size_bytes,
                    retained_size_percent: retained_size_percent,
                },
                debug_info: FunctionPropertyDebugInfo {
                    raw_name: name.to_string(),
                    demangled_name: Some(name.to_string()),
                    monomorphization_of: monomorphization_of.map(ToOwned::to_owned),
                    shallow_size_bytes: format!("{}", shallow_size_bytes),
                    shallow_size_percent: format!("{:.2}%", shallow_size_percent),
                    retained_size_bytes: format!("{}", retained_size_bytes),
                    retained_size_percent: format!("{:.2}%", retained_size_percent),
                    locals,
                    function_ops,
                },
            });
        }

        raw_data.sort_by(|a, b| {
            a.function_property
                .shallow_size_bytes
                .cmp(&b.function_property.shallow_size_bytes)
        });

        let mut provider = DataProviderTwiggy {
            raw_data,
            total_size: 0,
            total_percent: 0.0,
            items_filtered: Vec::new(),
            filter: Filter::NameFilter { name: "".into() }, // A bit hacky 2 step initialization.
        };
        provider.set_filter(Filter::All);

        provider
    }
}

fn get_locals_and_ops_for_function(
    data: &[u8],
    range: &Range<usize>,
) -> (Vec<String>, Vec<String>) {
    let mut locals = Vec::new();
    let mut ops = Vec::new();
    let function_body =
        wasmparser::FunctionBody::new(BinaryReader::new(&data[range.start..range.end], 0));

    // for i in range.start..range.end {
    //     print!("{:02?} ", i);
    // }
    // println!();

    // for i in range.start..range.end {
    //     print!("{:02?} ", data[i]);
    // }
    // println!();

    if let Ok(mut locals_reader) = function_body.get_locals_reader() {
        let mut local_index = 0;
        // We must check the locals count since this reader will just read even if we have 0 locals.
        while local_index < locals_reader.get_count() {
            if let Ok(local) = locals_reader.read() {
                locals.push(format!("{:?}", local));
            }
            local_index += 1;
        }
    }

    let mut body = function_body.get_operators_reader().unwrap();
    while let Ok((op, offset)) = body.read_with_offset() {
        ops.push(format!("{:#06x}: {:?}", offset + range.start, op));
    }

    (locals, ops)
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

impl FilterView for DataProviderTwiggy {
    fn get_filtered_items_count(&self) -> usize {
        self.items_filtered.len()
    }

    fn set_filter(&mut self, filter: crate::data_provider::Filter) {
        if self.filter != filter {
            self.items_filtered.clear();
            self.total_size = 0;
            self.total_percent = 0.0;
            for idx in 0..self.raw_data.len() {
                let item = &self.raw_data[idx].function_property;
                let added = match &filter {
                    Filter::NameFilter { name } => {
                        if item.raw_name.to_lowercase().contains(name) {
                            self.items_filtered.push(idx);
                            true
                        } else {
                            false
                        }
                    }
                    Filter::All => {
                        self.items_filtered.push(idx);
                        true
                    }
                };

                if added {
                    self.total_size += item.shallow_size_bytes;
                    self.total_percent += item.shallow_size_percent;
                }
            }
        }
    }

    fn get_item_at(&self, idx: usize) -> &FunctionPropertyDebugInfo {
        let original_idx = self.items_filtered[idx];
        &self.raw_data[original_idx].debug_info
    }

    fn get_total_size(&self) -> u32 {
        self.total_size
    }

    fn get_total_percent(&self) -> f32 {
        self.total_percent
    }
    
    fn get_locals_at(&self, idx: usize) -> &[String] {
        let original_idx = self.items_filtered[idx];
        &self.raw_data[original_idx].debug_info.locals
    }
    
    fn get_ops_at(&self, idx: usize) -> &[String] {
        let original_idx = self.items_filtered[idx];
        &self.raw_data[original_idx].debug_info.function_ops
    }
}

#[cfg(test)]
mod test {
    use super::*;

    #[test]
    fn test_a_simple_wasm_function_that_returns_42() {
        let function_bytes = [0, 65, 42, 15, 11];
        let (locals, ops) = get_locals_and_ops_for_function(&function_bytes, &(0..5));
        assert_eq!(locals.len(), 0);
        assert_eq!(ops.len(), 3);

        let ref_ops = ["I32Const { value: 42 }", "Return", "End"];

        for idx in 0..3 {
            assert_eq!(ops[idx], ref_ops[idx]);
        }
    }
}
