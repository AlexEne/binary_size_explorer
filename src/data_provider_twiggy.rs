use crate::{
    arena::{Arena, array::Array, scratch::scratch_arena, string::String, vec::Vec},
    data_provider::{
        Filter, FunctionOp, FunctionProperty, FunctionPropertyDebugInfo, FunctionsView,
        SourceCodeView, ViewMode,
    },
    dwarf::{DwData, DwFileEntry, DwLineInfo, DwNode, DwNodeType},
    gui::tree_view::{TreeItemStateFlags, TreeState},
    wasm::parser::WasmData,
};
use std::{fs::File, io::Read};
use std::{ops::Range, time::Instant};
use wasmparser::{BinaryReader, ValType};

pub struct FunctionItemState {
    pub size: u32,
}

pub struct FunctionData<'a> {
    pub function_property: FunctionProperty<'a>,
    pub debug_info: FunctionPropertyDebugInfo<'a>,
}

pub struct DataProviderTwiggy<'a> {
    pub wasm_data: WasmData<'a>,

    pub dw_line_infos: Array<'a, DwLineInfo>,
    pub dw_file_entries: Array<'a, DwFileEntry<'a>>,

    pub view_mode: ViewMode,
    pub raw_data: Array<'a, FunctionData<'a>>,

    pub total_size: u32,
    pub total_percent: f32,

    pub top_view_items_filtered: Vec<'a, usize>,
    pub dominator_state: TreeState<'a, DwNode<'a>, FunctionItemState>,
}

impl<'a> DataProviderTwiggy<'a> {
    #[profiling::function]
    pub fn from_path<P: AsRef<std::path::Path>>(arena: &'a Arena, path: P) -> Result<Self, ()> {
        let start = Instant::now();

        let file_bytes: &'a [u8] = {
            let Ok(mut file) = File::open(path) else {
                return Err(());
            };
            let size = file
                .metadata()
                .map(|m| m.len() as usize)
                .ok()
                .expect("Failed to reas wasm file size");

            let mut wasm_data = arena.alloc_slice_zeroed(size);
            let bytes_read = file.read(&mut wasm_data).expect("Failed to read wasm file");
            assert!(
                bytes_read == size,
                "Failed to read the entire wasm file {}<{}",
                bytes_read,
                size
            );

            wasm_data
        };

        let wasm_data = WasmData::from_bytes(arena, file_bytes);
        let dw_data = DwData::from_raw_sections(arena, &wasm_data.debug_sections);

        let mut item_count = 0;
        let mut total_size = 0;
        for idx in 0..wasm_data.functions_section.function_count {
            item_count += 1;
            total_size += wasm_data.functions_section.function_bodies[idx]
                .as_bytes()
                .len();
        }

        let mut raw_data = Array::new(arena, item_count);

        for idx in 0..wasm_data.functions_section.function_count {
            let name = wasm_data.functions_section.function_names[idx];
            let monomorphization_of = "";

            let shallow_size_bytes = wasm_data.functions_section.function_bodies[idx]
                .as_bytes()
                .len() as u32;
            let shallow_size_percent = (shallow_size_bytes as f32 / total_size as f32) * 100.0;

            let retained_size_bytes = wasm_data.functions_section.function_bodies[idx]
                .as_bytes()
                .len() as u32;
            let retained_size_percent = (retained_size_bytes as f32 / total_size as f32) * 100.0;

            let range = wasm_data.functions_section.function_bodies[idx].range();

            // The function body is what we save in the range.
            // In WASM the Code section is layed out as:
            // CodeStart (0x0a) | CodeSectionSize(bytes) | FunctionCount | FunctionBodySize(Bytes) | LocalsSize | Locals | Operators
            // We assume that range.start is starting with LocalsSize
            //   and that range.end-range.start is equal FunctionBodySize(Bytes)
            // We set the reader offset to 0 since range is an absolute offset in the wasm file.
            // Decent reference here: https://blog.ttulka.com/learning-webassembly-2-wasm-binary-format/
            let (locals, function_ops) =
                get_locals_and_ops_for_function(arena, wasm_data.bytes, &range);

            raw_data.push(FunctionData {
                function_property: FunctionProperty {
                    raw_name: String::from_str(arena, name).to_str(),
                    monomorphization_of: Some(monomorphization_of),
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

        let top_view_items_filtered = Vec::new(arena, raw_data.len());
        let dominator_state: TreeState<'a, DwNode<'a>, FunctionItemState> = TreeState::from_tree(
            arena,
            dw_data.nodes,
            1,
            |item, _| FunctionItemState { size: item.size },
            |(_, a), (_, b)| b.size.cmp(&a.size),
        );

        let mut provider = DataProviderTwiggy {
            wasm_data: wasm_data,
            dw_line_infos: dw_data.line_infos,
            dw_file_entries: dw_data.file_entries,
            view_mode: ViewMode::Tops,
            raw_data,
            total_size: 0,
            total_percent: 0.0,
            top_view_items_filtered,
            dominator_state,
        };
        provider.recompute_index_map(Filter::All);

        println!("Total time {}", (Instant::now() - start).as_secs_f32());

        Ok(provider)
    }
}

fn get_locals_and_ops_for_function<'a, 'b>(
    arena: &'a Arena,
    data: &'a [u8],
    range: &'b Range<usize>,
) -> (Array<'a, (u32, ValType)>, Array<'a, FunctionOp<'a>>) {
    let function_body =
        wasmparser::FunctionBody::new(BinaryReader::new(&data[range.start..range.end], 0));

    let mut locals = Array::new(arena, 0);
    if let Ok(mut locals_reader) = function_body.get_locals_reader() {
        let mut local_index = 0;
        locals = Array::new(arena, locals_reader.get_count() as usize);
        // We must check the locals count since this reader will just read even if we have 0 locals.
        while local_index < locals_reader.get_count() {
            if let Ok(local) = locals_reader.read() {
                locals.push(local);
            }
            local_index += 1;
        }
    }

    let mut body = function_body.get_operators_reader().unwrap();

    let mut ops = Array::new(arena, body.get_binary_reader().bytes_remaining() * 8);
    while let Ok((op, offset)) = body.read_with_offset() {
        // let addr = 0x000273 + offset;
        let addr = range.start + offset;

        ops.push(FunctionOp::new(addr as u64, op));
    }
    ops.shrink_to_fit();

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
        let function_section = &self.wasm_data.functions_section;

        // Update tops
        {
            self.top_view_items_filtered.clear();
            self.total_size = 0;
            self.total_percent = 0.0;

            for idx in 0..function_section.function_count {
                let scratch = scratch_arena(&[]);

                let function_name = function_section.function_names[idx];
                let function_size = function_section.function_sizes[idx];
                let added = match &filter {
                    Filter::NameFilter { name } => {
                        let mut raw_name = String::new(&scratch, function_name.len());
                        raw_name.push_str(function_name);
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
                    self.total_size += function_size;
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

        self.total_percent = 100.0 * self.total_size as f32 / function_section.size_in_bytes as f32;

        // Update dominators
        {
            fill_tree_view_state(&self.wasm_data, &mut self.dominator_state, &filter);

            if !self.dominator_state.row_indices.is_empty() {
                self.total_size = self.dominator_state.items_ui_data[0].size;
            } else {
                self.total_size = 0;
            }
        }
    }
}

fn fill_tree_view_state<'a>(
    wams_data: &WasmData<'a>,
    state: &mut TreeState<'a, DwNode<'a>, FunctionItemState>,
    filter: &Filter,
) {
    let start = Instant::now();

    match filter {
        Filter::All => {
            for idx in 0..state.items_state.len() {
                state.items_state[idx]
                    .flags
                    .insert(TreeItemStateFlags::VISIBLE);
                state.items_state[idx]
                    .flags
                    .remove(TreeItemStateFlags::FORCE_OPENED);
            }
        }
        Filter::NameFilter { name } => {
            for idx in 0..state.items_state.len() {
                // let fn_index = state.tree[idx].value.fn_index;
                let fn_index = u32::MAX;
                let visible = if fn_index != u32::MAX {
                    wams_data.functions_section.function_names[fn_index as usize].contains(name)
                } else {
                    state.tree[idx].value.name.as_str().contains(name)
                };

                state.items_state[idx]
                    .flags
                    .set(TreeItemStateFlags::FORCE_OPENED, false);
                state.items_state[idx]
                    .flags
                    .set(TreeItemStateFlags::VISIBLE, visible);

                if visible {
                    // Force parents to be visible
                    let mut cur_idx = state.tree[idx].parent.unwrap_or(0);
                    while cur_idx > 0 {
                        let cur_node = &mut state.items_state[cur_idx];
                        cur_node.flags.set(TreeItemStateFlags::FORCE_OPENED, true);
                        cur_node.flags.set(TreeItemStateFlags::VISIBLE, true);
                        cur_idx = state.tree[cur_idx].parent.unwrap_or(0);
                    }
                }
            }
        }
    };

    println!("Time to filter {}", (Instant::now() - start).as_secs_f32());

    // Reset size and then recompute it by just taking visible nodes into account
    for idx in 0..state.items_ui_data.len() {
        state.items_ui_data[idx].size = 0;
    }

    for idx in (0..state.tree.len()).rev() {
        if !state.items_state[idx].visible() {
            continue;
        }

        let item_ui_data = &mut state.items_ui_data[idx];

        let dw_node = &state.tree[idx].value;

        if matches!(
            dw_node.ty,
            DwNodeType::FunctionInstance | DwNodeType::FunctionInlinedInstance
        ) {
            item_ui_data.size = dw_node.size;
        }

        if let Some(parent_idx) = state.tree[idx].parent {
            state.items_ui_data[parent_idx].size += state.items_ui_data[idx].size;
        }
    }

    state.recompute_indices();
}

impl<'a> FunctionsView for DataProviderTwiggy<'a> {
    fn set_view_mode(&mut self, view_mode: ViewMode) {
        if self.view_mode == view_mode {
            return;
        }

        self.view_mode = view_mode;
    }

    fn set_filter<'b>(&mut self, filter: Filter<'b>) {
        self.recompute_index_map(filter);
    }

    fn get_total_size(&self) -> u32 {
        self.total_size
    }

    fn get_total_percent(&self) -> f32 {
        self.total_percent
    }

    fn get_locals_at(&self, idx: usize) -> &[(u32, ValType)] {
        &self.raw_data[idx].debug_info.locals
    }

    fn get_ops_at(&self, idx: usize) -> &[FunctionOp<'a>] {
        &self.raw_data[idx].debug_info.function_ops
    }
}

impl<'a> SourceCodeView for DataProviderTwiggy<'a> {
    fn get_line_info_for_addr(&self, virtual_addr: u64) -> Option<&DwLineInfo> {
        let code_section_start = self.wasm_data.functions_section.range.start as u64;
        let adjusted_addr = virtual_addr - code_section_start;

        match self
            .dw_line_infos
            .binary_search_by(|line_info| line_info.address.cmp(&adjusted_addr))
        {
            Ok(idx) => self.dw_line_infos.get(idx),
            Err(idx) => self.dw_line_infos.get(idx),
        }
    }
}

#[cfg(test)]
mod test {
    use crate::arena::memory::MB;

    use super::*;

    #[test]
    fn test_a_simple_wasm_function_that_returns_42() {
        let function_bytes = [0, 65, 42, 15, 11];

        let arena = Arena::new(2 * MB);
        let (locals, ops) = get_locals_and_ops_for_function(&arena, &function_bytes, &(0..5));
        assert_eq!(locals.len(), 0);
        assert_eq!(ops.len(), 3);

        let ref_ops = ["I32Const { value: 42 }", "Return", "End"];

        for idx in 0..3 {
            let ops = format!("{:?}", ops[idx].op);
            assert_eq!(ops, ref_ops[idx]);
        }
    }
}
