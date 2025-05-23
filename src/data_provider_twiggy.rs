use crate::data_provider::{
    DominatorsView, DwarfLocationData, Filter, FunctionOp, FunctionProperty,
    FunctionPropertyDebugInfo, FunctionsView, SourceCodeView, TopsView, ViewMode,
};
use addr2line::LookupResult;
use egui::ahash::{HashMap, HashMapExt};
use std::{ops::Range, path};
use twiggy_opt::CommonCliOptions;
use wasm_tools::addr2line::Addr2lineModules;
use wasmparser::BinaryReader;

pub struct FunctionData {
    pub function_property: FunctionProperty,
    pub debug_info: FunctionPropertyDebugInfo,
    pub open: bool,
    pub visible: bool,
    pub children: Vec<usize>,
}

pub struct DataProviderTwiggy {
    view_mode: ViewMode,
    raw_data: Vec<FunctionData>,

    roots: Vec<usize>,
    items_filtered: Vec<usize>,
    total_size: u32,
    total_percent: f32,

    filter: Filter,

    wasm_data_bytes: Vec<u8>,
}

impl DataProviderTwiggy {
    pub fn from_path<P: AsRef<path::Path>>(path: P) -> Self {
        let opts = twiggy_opt::Options::Top(twiggy_opt::Top::new());

        let mut items = twiggy_parser::read_and_parse(&path, opts.parse_mode()).unwrap();
        let mut id_to_idx = HashMap::new();

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

            id_to_idx.insert(item.id(), raw_data.len());

            raw_data.push(FunctionData {
                function_property: FunctionProperty {
                    raw_name: name.to_string(),
                    demangled_name: Some(name.to_string()),
                    monomorphization_of: monomorphization_of.map(ToOwned::to_owned),
                    shallow_size_bytes,
                    shallow_size_percent,
                    retained_size_bytes,
                    retained_size_percent,
                },
                debug_info: FunctionPropertyDebugInfo {
                    locals,
                    function_ops,
                },
                open: false,
                visible: true,
                children: Vec::with_capacity(
                    items
                        .dominator_tree()
                        .get(&item.id())
                        .map(|children| children.len())
                        .unwrap_or(4),
                ),
            });
        }

        let dominator_tree = items.dominator_tree();
        for item in items.iter() {
            let Some(index) = id_to_idx.get(&item.id()).copied() else {
                continue;
            };

            if let Some(children_ids) = dominator_tree.get(&item.id()) {
                let mut children = Vec::with_capacity(raw_data[index].children.len());
                for child_id in children_ids {
                    if let Some(child_index) = id_to_idx.get(child_id).copied() {
                        children.push(child_index);
                    }
                }

                children.sort_by(|a, b| {
                    raw_data[*b]
                        .function_property
                        .retained_size_bytes
                        .cmp(&raw_data[*a].function_property.retained_size_bytes)
                });

                raw_data[index].children = children;
            }
        }

        let mut roots = Vec::new();
        if let Some(root_ids) = items.dominator_tree().get(&items.meta_root()) {
            for root_id in root_ids {
                if let Some(idx) = id_to_idx.get(root_id).copied() {
                    roots.push(idx);
                }
            }
        }

        roots.sort_by(|a, b| {
            raw_data[*b]
                .function_property
                .retained_size_bytes
                .cmp(&raw_data[*a].function_property.retained_size_bytes)
        });

        let items_filtered: Vec<usize> = Vec::with_capacity(raw_data.len());

        let mut provider = DataProviderTwiggy {
            view_mode: ViewMode::Tops,
            raw_data,
            total_size: 0,
            total_percent: 0.0,
            roots,
            items_filtered,
            filter: Filter::All,
            wasm_data_bytes: wasm_data,
        };
        provider.recompute_index_map();

        provider
    }
}

fn get_locals_and_ops_for_function<'a>(
    data: &'a [u8],
    range: &'a Range<usize>,
) -> (Vec<String>, Vec<FunctionOp>) {
    let mut locals = Vec::new();
    let mut ops = Vec::new();
    let function_body =
        wasmparser::FunctionBody::new(BinaryReader::new(&data[range.start..range.end], 0));

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
        // let addr = 0x000273 + offset;
        let addr = range.start + offset;
        ops.push(FunctionOp::new(addr as u64, format!("{:?}", op)));
    }

    (locals, ops)
}

impl DataProviderTwiggy {
    /// This functions recomputes the index map used to return
    /// the correct item/size information to the active view.
    ///
    /// Whenever the view mode or filter changes, this function
    /// should be called to update the internal state shared
    /// between tops and dominators view modes.
    fn recompute_index_map(&mut self) {
        match self.view_mode {
            ViewMode::Tops => {
                self.items_filtered.clear();
                self.total_size = 0;
                self.total_percent = 0.0;
                for idx in 0..self.raw_data.len() {
                    let item = &self.raw_data[idx].function_property;
                    let added = match &self.filter {
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

                let Self {
                    raw_data,
                    items_filtered,
                    ..
                } = self;

                items_filtered.sort_by(|a, b| {
                    raw_data[*a]
                        .function_property
                        .retained_size_bytes
                        .cmp(&raw_data[*b].function_property.retained_size_bytes)
                });
            }
            ViewMode::Dominators => {
                fn should_be_visible(
                    raw_data: &mut Vec<FunctionData>,
                    total_size: &mut u32,
                    total_percent: &mut f32,
                    idx: usize,
                    parent_visible: bool,
                    filter: &str,
                ) -> bool {
                    let item = &raw_data[idx];

                    let name = item.function_property.demangled_name.clone().unwrap();
                    let visible = name.to_lowercase().contains(filter);

                    if visible && !parent_visible {
                        *total_size += item.function_property.retained_size_bytes;
                        *total_percent += item.function_property.retained_size_percent;
                    }

                    let children = item.children.clone();
                    let mut child_visible = false;
                    for child in children {
                        if should_be_visible(
                            raw_data,
                            total_size,
                            total_percent,
                            child,
                            parent_visible | visible,
                            filter,
                        ) {
                            child_visible = true;
                        }
                    }

                    if child_visible {
                        raw_data[idx].open = true;
                    }

                    raw_data[idx].visible = parent_visible | visible | child_visible;

                    raw_data[idx].visible
                }

                let filter = match &self.filter {
                    Filter::All => "",
                    Filter::NameFilter { name } => name,
                };

                self.total_size = 0;
                self.total_percent = 0.0;

                for &root in &self.roots {
                    should_be_visible(
                        &mut self.raw_data,
                        &mut self.total_size,
                        &mut self.total_percent,
                        root,
                        false,
                        filter,
                    );
                }
            }
        }
    }
}

impl FunctionsView for DataProviderTwiggy {
    fn set_view_mode(&mut self, view_mode: ViewMode) {
        if self.view_mode == view_mode {
            return;
        }

        self.view_mode = view_mode;
        self.recompute_index_map();
    }

    fn set_filter(&mut self, filter: Filter) {
        if self.filter == filter {
            return;
        }

        self.filter = filter;
        self.recompute_index_map();
    }

    fn get_total_size(&self) -> u32 {
        self.total_size
    }

    fn get_total_percent(&self) -> f32 {
        self.total_percent
    }
}

impl TopsView for DataProviderTwiggy {
    fn get_tops_items_count(&self) -> usize {
        self.items_filtered.len()
    }

    fn get_tops_item_at(&self, idx: usize) -> &FunctionProperty {
        let original_idx = self.items_filtered[idx];
        &self.raw_data[original_idx].function_property
    }

    fn get_locals_at(&self, idx: usize) -> &[String] {
        let original_idx = self.items_filtered[idx];
        &self.raw_data[original_idx].debug_info.locals
    }

    fn get_ops_at(&self, idx: usize) -> &[FunctionOp] {
        let original_idx = self.items_filtered[idx];
        &self.raw_data[original_idx].debug_info.function_ops
    }

    fn get_start_addr(&self, idx: usize) -> u64 {
        let original_idx = self.items_filtered[idx];
        let Some(first_op) = self.raw_data[original_idx].debug_info.function_ops.first() else {
            return 0;
        };

        first_op.address
    }
}

impl DominatorsView for DataProviderTwiggy {
    fn get_roots(&self) -> &Vec<usize> {
        &self.roots
        // if let Filter::NameFilter { name } = &self.filter {
        //     let mut roots: Vec<usize> = Vec::with_capacity(self.roots.len());
        //     for &root in &self.roots {
        //         if !self.raw_data[root]
        //             .function_property
        //             .raw_name
        //             .to_lowercase()
        //             .contains(name)
        //         {
        //             continue;
        //         }

        //         roots.push(root);
        //     }

        //     return roots;
        // } else {
        //     self.roots.clone()
        // }
    }

    fn get_dominator_item_at(&self, idx: usize) -> &FunctionProperty {
        &self.raw_data[idx].function_property
    }

    fn get_children_of(&self, idx: usize) -> &Vec<usize> {
        &self.raw_data[idx].children
        // if let Filter::NameFilter { name } = &self.filter {
        //     let mut children: Vec<usize> = Vec::with_capacity(self.roots.len());
        //     for &child in &self.raw_data[idx].children {
        //         if !self.raw_data[child]
        //             .function_property
        //             .raw_name
        //             .to_lowercase()
        //             .contains(name)
        //         {
        //             continue;
        //         }

        //         children.push(child);
        //     }

        //     return children;
        // } else {
        //     self.raw_data[idx].children.clone()
        // }
    }

    fn is_child_visible(&self, idx: usize) -> bool {
        self.raw_data[idx].visible
    }

    fn is_child_open(&self, idx: usize) -> bool {
        self.raw_data[idx].open
    }

    fn set_child_open(&mut self, idx: usize, open: bool) {
        self.raw_data[idx].open = open;
    }
}

impl SourceCodeView for DataProviderTwiggy {
    fn get_location_for_addr(&self, virtual_addr: u64) -> Option<DwarfLocationData> {
        //TODO(alex): Remove this parse on each location find.
        let Some(mut modules) = Addr2lineModules::parse(&self.wasm_data_bytes).ok() else {
            return None;
        };

        find_frames(virtual_addr, &mut modules)
    }
}

fn find_frames(addr: u64, modules: &mut Addr2lineModules<'_>) -> Option<DwarfLocationData> {
    let (context, text_rel_addr) = modules.context(addr, false).ok()??;
    let mut frames = match context.find_frames(text_rel_addr) {
        LookupResult::Output(result) => result.ok()?,
        LookupResult::Load { .. } => panic!("Split dwarf not supported"),
    };

    while let Ok(Some(frame)) = frames.next() {
        if let Some(location) = frame.location.as_ref() {
            return Some(DwarfLocationData {
                file: location.file.map(|f| f.to_string()),
                line: location.line,
                column: location.column,
            });
        }
    }

    return None;
}

#[cfg(test)]
mod test {
    use super::*;
    use std::fs;
    use wasm_tools::addr2line::Addr2lineModules;

    #[test]
    fn test_a_simple_wasm_function_that_returns_42() {
        let function_bytes = [0, 65, 42, 15, 11];
        let (locals, ops) = get_locals_and_ops_for_function(&function_bytes, &(0..5));
        assert_eq!(locals.len(), 0);
        assert_eq!(ops.len(), 3);

        let ref_ops = ["I32Const { value: 42 }", "Return", "End"];

        for idx in 0..3 {
            assert_eq!(ops[idx].op, ref_ops[idx]);
        }
    }

    #[test]
    fn debug_loader_things() {
        // let loader = Loader::new("wasm_test_with_debug.wasm").unwrap();
        // let loc = loader.find_location(0x19e6).unwrap().unwrap();

        let addr_and_expectations = [
            (
                0x000213,
                DwarfLocationData {
                    file: Some(
                        "/Users/alexene/Desktop/ws/simple_wasm_test_with_dwarf/src/lib.rs".into(),
                    ),
                    line: Some(2),
                    column: Some(0),
                },
            ),
            (
                0x000315,
                DwarfLocationData {
                    file: Some(
                        "/rustc/05f9846f893b09a1be1fc8560e33fc3c815cfecb/library/core/src/fmt/mod.rs".into(),
                    ),
                    line: Some(2652),
                    column: Some(71),
                },
            ),
            ];

        let wasm_file_data = fs::read("simple_wasm_test_with_dwarf.wasm").unwrap();
        let mut modules = Addr2lineModules::parse(&wasm_file_data).unwrap();

        // Rev iter since I want to make sure there's no requirement on order of addresses.
        // Not sure why modules is &mut tho :(
        for (addr, expectation) in addr_and_expectations.iter().rev() {
            let dwarf_loc = find_frames(*addr, &mut modules).unwrap();
            assert_eq!(dwarf_loc.file, expectation.file);
            assert_eq!(dwarf_loc.line, expectation.line);
            assert_eq!(dwarf_loc.column, expectation.column);
        }
    }
}
