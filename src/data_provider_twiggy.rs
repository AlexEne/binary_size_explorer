use crate::{
    arena::{Arena, array::Array, scratch::scratch_arena, string::String},
    data_provider::{
        CodeLocation, DwarfLocationData, Filter, FunctionOp, FunctionProperty,
        FunctionPropertyDebugInfo, FunctionsView, SourceCodeView, ViewMode,
    },
    gui::tree_view::{TreeItemState, TreeState},
};
use addr2line::LookupResult;
use hashbrown::{DefaultHashBuilder, HashMap};
use std::{
    fmt::Write,
    hash::{DefaultHasher, Hash, Hasher},
};
use std::{ops::Range, time::Instant};
use wasm_tools::addr2line::Addr2lineModules;
use wasmparser::BinaryReader;

pub struct FunctionData<'a> {
    pub function_property: FunctionProperty<'a>,
    pub debug_info: FunctionPropertyDebugInfo<'a>,
}

pub struct DataProviderTwiggy<'a> {
    /// The raw binary data of the loaded wasm file.
    pub wasm_data: Vec<u8>,

    pub view_mode: ViewMode,
    pub raw_data: Array<'a, FunctionData<'a>>,

    pub total_size: u32,
    pub total_percent: f32,

    pub top_view_items_filtered: Vec<usize, &'a Arena>,
    pub dominator_view_tree_state: TreeState<'a>,

    /// The array of code locations loaded from the file.
    code_locations: Array<'a, CodeLocation<'a>>,

    /// This is a map of source file / line locations -> Assembly
    locations_reverse_map: HashMap<u64, Vec<u64>, DefaultHashBuilder, &'a Arena>,
    addr_to_location: HashMap<u64, usize, DefaultHashBuilder, &'a Arena>,
}

impl<'a> DataProviderTwiggy<'a> {
    #[profiling::function]
    pub fn from_path<P: AsRef<std::path::Path>>(arena: &'a Arena, path: P) -> Self {
        let start = Instant::now();

        let wasm_data = std::fs::read(path).unwrap();

        let mut items = twiggy_parser::parse(&wasm_data).unwrap();
        let mut id_to_idx = HashMap::new();

        items.compute_retained_sizes();

        let ignore_item_by_name = |name: &str| -> bool {
            name.starts_with("custom section '.debug_") || name == "\"function names\" subsection"
        };

        let mut item_count = 0;
        let mut total_size = 0;
        for item in items.iter() {
            if !ignore_item_by_name(item.name()) {
                item_count += 1;
                total_size += item.size();
            }
        }

        let mut raw_data = Array::new(arena, item_count);
        let mut modules = Addr2lineModules::parse(&wasm_data).ok();
        let mut code_location_count = 0;

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

            let (locals, function_ops) = match item.kind() {
                twiggy_ir::ItemKind::Code(_) => {
                    // The function body is what we save in the range.
                    // In WASM the Code section is layed out as:
                    // CodeStart (0x0a) | CodeSectionSize(bytes) | FunctionCount | FunctionBodySize(Bytes) | LocalsSize | Locals | Operators
                    // We assume that range.start is starting with LocalsSize
                    //   and that range.end-range.start is equal FunctionBodySize(Bytes)
                    // We set the reader offset to 0 since range is an absolute offset in the wasm file.
                    // Decent reference here: https://blog.ttulka.com/learning-webassembly-2-wasm-binary-format/
                    let (locals, function_ops) =
                        get_locals_and_ops_for_function(arena, &wasm_data, &range);

                    if modules.is_some() {
                        code_location_count += function_ops.len();
                    }

                    (locals, function_ops)
                }
                _ => (Array::new(arena, 0), Array::new(arena, 0)),
            };

            id_to_idx.insert(item.id(), raw_data.len());

            raw_data.push(FunctionData {
                function_property: FunctionProperty {
                    raw_name: String::from_str(arena, name).to_str(),
                    demangled_name: Some(String::from_str(arena, name).to_str()),
                    monomorphization_of: monomorphization_of
                        .map(|m| String::from_str(arena, m).to_str()),
                    shallow_size_bytes,
                    shallow_size_percent,
                    retained_size_bytes,
                    retained_size_percent,
                },
                debug_info: FunctionPropertyDebugInfo {
                    locals,
                    function_ops,
                },
            });
        }

        // Compute code locations
        let mut code_locations = Array::new(arena, code_location_count);
        // CL index -> addresses
        let mut locations_reverse_map: HashMap<u64, Vec<u64>, _, &'a Arena> =
            HashMap::with_capacity_in(code_location_count, arena);
        // Add -> CL index
        let mut addr_to_location: HashMap<u64, usize, _, &'a Arena> =
            HashMap::with_capacity_in(code_location_count, arena);

        for raw_data_item in raw_data.iter() {
            let FunctionPropertyDebugInfo { function_ops, .. } = &raw_data_item.debug_info;

            if let Some(modules) = modules.as_mut() {
                for function_op in function_ops.iter() {
                    let addr = function_op.address;
                    if let Some(location_data) = find_frames(arena, addr, modules) {
                        if let (Some(file), Some(line)) = (location_data.file, location_data.line) {
                            let cl_index = code_locations.len();

                            let mut hasher = DefaultHasher::new();
                            file.as_str().hash(&mut hasher);
                            line.saturating_sub(1).hash(&mut hasher);
                            let hash = hasher.finish();

                            code_locations.push(CodeLocation {
                                file,
                                line: line.saturating_sub(1), //Dwarf lines are 1 based. 0 means no line info present :/
                                column: 0,
                            });
                            addr_to_location.insert(addr, cl_index);

                            locations_reverse_map.entry(hash).or_default().push(addr);
                        }
                    }
                }
            }
        }

        let dominator_tree = items.dominator_tree();
        let mut tree_items: Array<'_, TreeItemState> = Array::new(arena, raw_data.len());

        let scratch = scratch_arena(&[arena]);
        let mut node_stack = Array::new(&scratch, raw_data.len());
        let mut children_scratch = Array::new(&scratch, raw_data.len());
        node_stack.push((0, items.meta_root()));

        while let Some((parent_index, id)) = node_stack.pop() {
            let index = tree_items.len();
            let indent = if !tree_items.is_empty() {
                tree_items[parent_index].indent + 1
            } else {
                0
            };
            tree_items.push(TreeItemState {
                index: id_to_idx.get(&id).copied().unwrap_or(0),
                parent: parent_index,
                descendants_count: 0,
                opened: false,
                force_opened: false,
                visible: true,
                indent,
            });

            if let Some(children) = dominator_tree.get(&id) {
                children_scratch.clear();
                children_scratch.extend_from_slice(&children[..]);

                // Order as asc because children will be processed
                // in the reverse order
                children_scratch.sort_by(|a, b| {
                    let a: usize = id_to_idx.get(a).copied().unwrap_or(0);
                    let b: usize = id_to_idx.get(b).copied().unwrap_or(0);
                    raw_data[a]
                        .function_property
                        .retained_size_bytes
                        .cmp(&raw_data[b].function_property.retained_size_bytes)
                });

                for &child in children_scratch.iter() {
                    node_stack.push((index, child));
                }
            }
        }

        for index in (0..tree_items.len()).rev() {
            let parent = tree_items[index].parent;
            let descendants_count = tree_items[index].descendants_count;
            tree_items[parent].descendants_count += descendants_count + 1;
        }

        let top_view_items_filtered = Vec::with_capacity_in(raw_data.len(), arena);
        let dominator_view_tree_state = TreeState::new(arena, tree_items);

        let mut provider = DataProviderTwiggy {
            wasm_data,
            view_mode: ViewMode::Tops,
            raw_data,
            total_size: 0,
            total_percent: 0.0,
            top_view_items_filtered,
            dominator_view_tree_state,
            code_locations,
            locations_reverse_map,
            addr_to_location,
        };
        provider.recompute_index_map(Filter::All);

        println!("Total time {}", (Instant::now() - start).as_secs_f32());

        provider
    }
}

fn get_locals_and_ops_for_function<'a, 'b>(
    arena: &'a Arena,
    data: &'b [u8],
    range: &'b Range<usize>,
) -> (Array<'a, &'a str>, Array<'a, FunctionOp<'a>>) {
    let function_body =
        wasmparser::FunctionBody::new(BinaryReader::new(&data[range.start..range.end], 0));

    let mut locals = Array::new(arena, 0);
    if let Ok(mut locals_reader) = function_body.get_locals_reader() {
        let mut local_index = 0;
        locals = Array::new(arena, locals_reader.get_count() as usize);
        // We must check the locals count since this reader will just read even if we have 0 locals.
        while local_index < locals_reader.get_count() {
            if let Ok(local) = locals_reader.read() {
                let mut local_str = String::new(arena, 1024);
                _ = write!(&mut local_str, "{:?}", local);
                local_str.shrink_to_fit();

                locals.push(local_str.to_str());
            }
            local_index += 1;
        }
    }

    let mut body = function_body.get_operators_reader().unwrap();

    let scratch = scratch_arena(&[arena]);
    let mut temp_ops = Array::new(&scratch, 4096 * 128);
    while let Ok((op, offset)) = body.read_with_offset() {
        // let addr = 0x000273 + offset;
        let addr = range.start + offset;

        let mut decoded_asm = String::new(arena, 1024);
        _ = write!(&mut decoded_asm, "{:?}", op);
        decoded_asm.shrink_to_fit();

        temp_ops.push(FunctionOp::new(addr as u64, decoded_asm.to_str()));
    }

    let mut ops = Array::new(arena, temp_ops.len());
    unsafe {
        ops.extend_from_slice_unchecked(temp_ops.as_slice());
    }

    (locals, ops)
}

impl DataProviderTwiggy<'_> {
    /// This functions recomputes the index map used to return
    /// the correct item/size information to the active view.
    ///
    /// Whenever the view mode or filter changes, this function
    /// should be called to update the internal state shared
    /// between tops and dominators view modes.
    fn recompute_index_map<'a>(&mut self, filter: Filter<'a>) {
        // Update tops
        {
            self.top_view_items_filtered.clear();
            self.total_size = 0;
            self.total_percent = 0.0;
            for idx in 0..self.raw_data.len() {
                let scratch = scratch_arena(&[]);

                let item = &self.raw_data[idx].function_property;
                let added = match &filter {
                    Filter::NameFilter { name } => {
                        let mut raw_name = String::new(&scratch, item.raw_name.len());
                        raw_name.make_ascii_lowercase();

                        if raw_name.contains(name) {
                            self.top_view_items_filtered.push(idx);
                            true
                        } else {
                            false
                        }
                    }
                    Filter::All => {
                        self.top_view_items_filtered.push(idx);
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
                top_view_items_filtered: items_filtered,
                ..
            } = self;

            items_filtered.sort_by(|a, b| {
                raw_data[*a]
                    .function_property
                    .retained_size_bytes
                    .cmp(&raw_data[*b].function_property.retained_size_bytes)
            });
        }

        // Update dominators
        {
            let filter = match &filter {
                Filter::All => "",
                Filter::NameFilter { name } => name,
            };

            self.total_size = 0;
            self.total_percent = 0.0;

            let mut idx = 1;
            while idx < self.dominator_view_tree_state.nodes.len() {
                let item = &self.raw_data[self.dominator_view_tree_state.nodes[idx].index];
                let name = item.function_property.name();

                // TODO (bruno): remove this string allocation
                let visible = name.to_lowercase().contains(filter);

                self.dominator_view_tree_state.nodes[idx].force_opened = false;
                self.dominator_view_tree_state.nodes[idx].visible = visible;

                if visible {
                    self.total_size += item.function_property.retained_size_bytes;
                    self.total_percent += item.function_property.retained_size_percent;

                    // Force parents to be visible
                    let mut cur_idx = self.dominator_view_tree_state.nodes[idx].parent;
                    while cur_idx > 0 {
                        let cur_node = &mut self.dominator_view_tree_state.nodes[cur_idx];
                        cur_node.force_opened = true;
                        cur_node.visible = true;
                        cur_idx = cur_node.parent;
                    }

                    // Clear force_opened from descendants
                    let mut cur_idx = idx + 1;
                    while cur_idx
                        <= idx + self.dominator_view_tree_state.nodes[idx].descendants_count
                    {
                        self.dominator_view_tree_state.nodes[cur_idx].force_opened = false;
                        self.dominator_view_tree_state.nodes[cur_idx].visible = true;
                        cur_idx += 1;
                    }

                    idx += self.dominator_view_tree_state.nodes[idx].descendants_count + 1;
                    continue;
                }

                idx += 1;
            }

            self.dominator_view_tree_state.recompute_indices();
        }
    }
}

impl FunctionsView for DataProviderTwiggy<'_> {
    fn set_view_mode(&mut self, view_mode: ViewMode) {
        if self.view_mode == view_mode {
            return;
        }

        self.view_mode = view_mode;
    }

    fn set_filter<'a>(&mut self, filter: Filter<'a>) {
        self.recompute_index_map(filter);
    }

    fn get_total_size(&self) -> u32 {
        self.total_size
    }

    fn get_total_percent(&self) -> f32 {
        self.total_percent
    }

    fn get_locals_at(&self, idx: usize) -> &[&str] {
        &self.raw_data[idx].debug_info.locals
    }

    fn get_ops_at(&self, idx: usize) -> &[FunctionOp] {
        &self.raw_data[idx].debug_info.function_ops
    }

    fn get_start_addr(&self, idx: usize) -> u64 {
        let Some(first_op) = self.raw_data[idx].debug_info.function_ops.first() else {
            return 0;
        };

        first_op.address
    }
}

impl<'a> SourceCodeView for DataProviderTwiggy<'a> {
    fn get_location_for_addr(&self, virtual_addr: u64) -> Option<&CodeLocation<'a>> {
        if let Some(index) = self.addr_to_location.get(&virtual_addr).copied() {
            Some(&self.code_locations[index])
        } else {
            None
        }
    }

    fn get_locations_for_line_of_code(
        &self,
        file: &str,
        line: u32,
        _column: u32,
    ) -> Option<&Vec<u64>> {
        let mut hasher = DefaultHasher::new();
        file.hash(&mut hasher);
        line.hash(&mut hasher);
        let hash = hasher.finish();

        self.locations_reverse_map.get(&hash)
    }
}

fn find_frames<'a>(
    arena: &'a Arena,
    addr: u64,
    modules: &mut Addr2lineModules<'_>,
) -> Option<DwarfLocationData<'a>> {
    let (context, text_rel_addr) = modules.context(addr, false).ok()??;
    let mut frames = match context.find_frames(text_rel_addr) {
        LookupResult::Output(result) => result.ok()?,
        LookupResult::Load { .. } => panic!("Split dwarf not supported"),
    };

    while let Ok(Some(frame)) = frames.next() {
        if let Some(location) = frame.location.as_ref() {
            return Some(DwarfLocationData {
                file: location.file.map(|f| String::from_str(arena, f)),
                line: location.line,
                column: location.column,
            });
        }
    }

    return None;
}

#[cfg(test)]
mod test {
    use crate::arena::memory::MB;

    use super::*;
    use std::fs;
    use wasm_tools::addr2line::Addr2lineModules;

    #[test]
    fn test_a_simple_wasm_function_that_returns_42() {
        let function_bytes = [0, 65, 42, 15, 11];

        let arena = Arena::new(2 * MB);
        let (locals, ops) = get_locals_and_ops_for_function(&arena, &function_bytes, &(0..5));
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
        let arena = Arena::new(2 * MB);
        let addr_and_expectations = [
            (
                0x000213,
                DwarfLocationData {
                    file: Some(String::from_str(
                        &arena,
                        "/Users/alexene/Desktop/ws/simple_wasm_test_with_dwarf/src/lib.rs",
                    )),
                    line: Some(2),
                    column: Some(0),
                },
            ),
            (
                0x000315,
                DwarfLocationData {
                    file: Some(String::from_str(
                        &arena,
                        "/rustc/05f9846f893b09a1be1fc8560e33fc3c815cfecb/library/core/src/fmt/mod.rs",
                    )),
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
            let dwarf_loc = find_frames(&arena, *addr, &mut modules).unwrap();
            assert_eq!(dwarf_loc.file, expectation.file);
            assert_eq!(dwarf_loc.line, expectation.line);
            assert_eq!(dwarf_loc.column, expectation.column);
        }
    }
}
