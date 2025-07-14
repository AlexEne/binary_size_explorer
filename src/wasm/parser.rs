use std::{
    hash::{DefaultHasher, Hash, Hasher},
    ops::Range,
    time::Instant,
    u32,
};

use gimli::{
    AttributeValue, DW_AT_high_pc, DW_AT_inline, DW_AT_linkage_name, DW_AT_low_pc, DW_AT_name,
    DW_AT_specification, DW_INL_inlined, DW_TAG_namespace, DW_TAG_structure_type,
    DW_TAG_subprogram, DebugInfoOffset, EndianSlice, LittleEndian, UnitType,
};
use hashbrown::{DefaultHashBuilder, HashMap};
use wasmparser::{Encoding, FuncType, FunctionBody};

use crate::arena::{Arena, array::Array, scratch::scratch_arena, string::String, tree::Tree};

pub struct WasmData<'a> {
    pub bytes: &'a [u8],

    /// The wasm version of the processed data.
    pub version: u16,

    /// Types section
    pub types_section: TypeSection<'a>,

    /// Functions section
    pub functions_section: FunctionSection<'a>,
}

#[derive(Clone, Copy, Debug, Hash, PartialEq, Eq)]
pub struct SymbolName<'a> {
    hash: u64,
    name: &'a str,
}

impl<'a> SymbolName<'a> {
    pub fn root() -> Self {
        const NAME: &'static str = "<root>";
        let mut hasher = DefaultHasher::new();
        NAME.hash(&mut hasher);
        let hash = hasher.finish();

        Self { hash, name: NAME }
    }

    pub fn new_with_parent(parent: SymbolName<'a>, name: &'a str) -> Self {
        let mut hasher = DefaultHasher::new();
        parent.hash.hash(&mut hasher);
        name.hash(&mut hasher);
        let hash = hasher.finish();

        Self { hash, name }
    }

    pub fn as_str(&self) -> &'a str {
        self.name
    }
}

impl<'a> WasmData<'a> {
    #[profiling::function]
    pub fn from_bytes(arena: &'a Arena, bytes: &'a [u8]) -> (Self, Tree<'a, FunctionGroup<'a>>) {
        let mut version = 0;
        let mut types_section = TypeSection {
            types: Array::new(arena, 0),
        };
        let mut imports_count = 0;
        let mut functions_section = FunctionSection {
            range: Default::default(),
            function_types: Array::new(arena, 0),
            function_names: Array::new(arena, 0),
            function_original_names: Array::new(arena, 0),
            function_sizes: Array::new(arena, 0),
            function_bodies: Array::new(arena, 0),
            function_called: Array::new(arena, 0),
            function_count: 0,
        };

        let scratch = scratch_arena(&[arena]);
        let mut function_group_name_lookup =
            HashMap::<SymbolName<'a>, usize, DefaultHashBuilder, &Arena>::with_capacity_in(
                0, &scratch,
            );
        let mut function_index_lookup =
            HashMap::<&str, u32, DefaultHashBuilder, &Arena>::with_capacity_in(0, &scratch);
        let mut offset_index_lookup = HashMap::<DebugInfoOffset<usize>, usize>::new();
        let mut function_groups = Tree::new(
            arena,
            0,
            FunctionGroup {
                ty: FunctionGroupType::Namespace,
                name: SymbolName::root(),
                demangled_name: "",
                size: 0,
                fn_index: u32::MAX,
            },
        );

        let mut debug_sections = HashMap::new();

        for section in wasmparser::Parser::new(0).parse_all(bytes) {
            let payload = match section {
                Ok(section) => section,
                Err(err) => panic!("Failed to parse section with error {}", err),
            };

            match payload {
                wasmparser::Payload::Version { num, encoding, .. } => {
                    assert!(
                        encoding == Encoding::Module,
                        "Encoding '{:?}' not supported",
                        encoding
                    );

                    version = num;
                }
                wasmparser::Payload::TypeSection(type_section_reader) => {
                    types_section.types = Array::new(arena, type_section_reader.count() as usize);

                    for rec_group in type_section_reader.into_iter() {
                        let rec_group = match rec_group {
                            Ok(rec_group) => rec_group,
                            Err(err) => panic!("Failed to parse type with error {}", err),
                        };

                        for ty in rec_group.into_types() {
                            assert!(ty.is_final, "Unexepcted sub-type in type section");
                            assert!(
                                !ty.composite_type.shared,
                                "Unexpected shared type in type section"
                            );

                            match ty.composite_type.inner {
                                wasmparser::CompositeInnerType::Func(func_type) => {
                                    types_section.types.push(func_type)
                                }
                                _ => panic!("Unexpected non-function-type in type section"),
                            }
                        }
                    }
                }
                wasmparser::Payload::ImportSection(import_section_reader) => {
                    imports_count += import_section_reader.count();
                    // for import in import_section_reader.into_iter() {
                    //     let import = match import {
                    //         Ok(import) => import,
                    //         Err(err) => {
                    //             panic!("Failed to parse import function with error {}", err)
                    //         }
                    //     };

                    //     println!("Import: {} - {}", import.module, import.name);
                    // }
                }
                wasmparser::Payload::FunctionSection(function_section_reader) => {
                    functions_section.function_types =
                        Array::new(arena, function_section_reader.count() as usize);

                    for fn_type_idx in function_section_reader.into_iter() {
                        let fn_type_idx = match fn_type_idx {
                            Ok(fn_type_id) => fn_type_id,
                            Err(err) => panic!("Failed to parse function type with error {}", err),
                        };

                        functions_section.function_types.push(fn_type_idx as usize);
                    }
                }
                wasmparser::Payload::CodeSectionStart { count, range, .. } => {
                    functions_section.range = range;
                    functions_section.function_bodies = Array::new(arena, count as usize);
                    functions_section.function_sizes = Array::new(arena, count as usize);

                    functions_section.function_names = Array::new(arena, count as usize);
                    functions_section.function_original_names = Array::new(arena, count as usize);
                    functions_section.function_called = Array::new(arena, count as usize);
                    for _ in 0..count {
                        functions_section.function_names.push("");
                        functions_section.function_original_names.push("");
                    }

                    // TODO: (bruno) something better than 5 * count!
                    // function_groups = Array::new(arena, 10000 * count as usize);
                    function_groups = Tree::new(
                        arena,
                        10000 * count as usize,
                        FunctionGroup {
                            ty: FunctionGroupType::Namespace,
                            name: SymbolName::root(),
                            demangled_name: "",
                            size: 0,
                            fn_index: u32::MAX,
                        },
                    );

                    function_group_name_lookup =
                        HashMap::with_capacity_in(5 * count as usize, &scratch);

                    functions_section.function_count = count as usize;
                }
                wasmparser::Payload::CodeSectionEntry(function_body) => {
                    functions_section
                        .function_sizes
                        .push(function_body.as_bytes().len() as u32);
                    functions_section.function_bodies.push(function_body);
                }
                wasmparser::Payload::CustomSection(custom_section_reader) => {
                    match custom_section_reader.as_known() {
                        wasmparser::KnownCustom::Name(name_section_reader) => {
                            for name in name_section_reader.into_iter() {
                                let name = match name {
                                    Ok(name) => name,
                                    Err(err) => panic!("Failed to parse name with error {}", err),
                                };

                                match name {
                                    wasmparser::Name::Function(name_map) => {
                                        for naming in
                                            name_map.into_iter().skip(imports_count as usize)
                                        {
                                            let naming = match naming {
                                                Ok(naming) => naming,
                                                Err(err) => panic!(
                                                    "Failed to parse function name with error {}",
                                                    err
                                                ),
                                            };

                                            functions_section.function_names
                                                [(naming.index - imports_count) as usize] =
                                                naming.name;
                                            functions_section.function_original_names
                                                [(naming.index - imports_count) as usize] =
                                                naming.name;

                                            function_index_lookup
                                                .insert(naming.name, naming.index - imports_count);
                                        }
                                    }
                                    _ => {}
                                }
                            }
                        }
                        wasmparser::KnownCustom::Unknown => {
                            if custom_section_reader.name().starts_with(".debug") {
                                debug_sections
                                    .insert(custom_section_reader.name(), custom_section_reader);
                            }
                        }
                        _ => {}
                    }
                }
                _ => {}
            }
        }

        // // Extract symbol dependencies
        // for idx in 0..functions_section.function_bodies.len() {
        //     let function_body = &functions_section.function_bodies[idx];

        //     // TODO: (bruno) what is the minimum instruction size here? surely it's not 1 byte
        //     let mut dependants = Array::new(arena, function_body.as_bytes().len());

        //     let mut operators_reader = match function_body.get_operators_reader() {
        //         Ok(operators_reader) => operators_reader,
        //         Err(err) => {
        //             panic!("Failed to parse function operators with error {}", err)
        //         }
        //     };

        //     while !operators_reader.eof() {
        //         let operator = match operators_reader.read() {
        //             Ok(operator) => operator,
        //             Err(err) => {
        //                 panic!("Failed to parse function operator with error {}", err)
        //             }
        //         };

        //         match operator {
        //             Operator::Call { function_index } => {
        //                 if function_index >= imports_count {
        //                     dependants.push(function_index - imports_count);
        //                 }
        //             }
        //             // Operator::CallIndirect { type_index, table_index } => todo!(),
        //             _ => {}
        //         }
        //     }

        //     dependants.shrink_to_fit();
        //     functions_section.function_called.push(dependants);
        // }

        // Parse DWARF info
        {
            let start = Instant::now();
            let dwarf = gimli::Dwarf::load::<_, ()>(|section_id| {
                let section = debug_sections
                    .get(section_id.name())
                    .map_or::<&[u8], _>(&[], |section| section.data());

                Ok(EndianSlice::new(section, LittleEndian))
            })
            .expect("Failed to load the DWARF info");

            let root_symbol_name = function_groups.root().name;

            let mut group_index_stack = Array::new(&scratch, 128);

            let mut units = dwarf.units();
            while let Ok(Some(unit_header)) = units.next() {
                if unit_header.type_() != UnitType::Compilation {
                    println!("Unity type '{:?}' not supported!", unit_header.type_());
                    continue;
                }

                let unit = dwarf.unit(unit_header).unwrap();
                let unit_ref = unit.unit_ref(&dwarf);

                group_index_stack.clear();
                group_index_stack.push((0, root_symbol_name));

                let mut prev_parent_group_index = 0;
                let mut prev_parent_group_name = root_symbol_name;

                let mut entries = unit_ref.entries_raw(None).unwrap();
                let mut baseline_depth = 0;
                while !entries.is_empty() {
                    let offset = entries.next_offset();
                    let depth = entries.next_depth();
                    let Ok(abbreviation) = entries.read_abbreviation() else {
                        continue;
                    };

                    let mut depth_diff = depth - baseline_depth;
                    baseline_depth = depth;
                    assert!(depth_diff <= 1, "Unexpected offset: {}>1", depth_diff);

                    // If offset is negative, it means that we are climbing back the tree
                    while depth_diff < 0 {
                        group_index_stack.pop();

                        depth_diff += 1;
                    }

                    // If offset is 1, we are processing a nested entry, so we should update
                    // parent index with the previous function group index
                    if depth_diff == 1 {
                        group_index_stack.push((prev_parent_group_index, prev_parent_group_name));
                    }

                    let (parent_group_index, parent_group_name) =
                        group_index_stack.last().copied().unwrap();

                    let Some(abbreviation) = abbreviation else {
                        continue;
                    };

                    #[allow(non_upper_case_globals)]
                    #[allow(non_snake_case)]
                    match abbreviation.tag() {
                        DW_TAG_namespace => {
                            let mut name_str = "";

                            for attr_spec in abbreviation.attributes() {
                                if let Ok(attr) = entries.read_attribute(*attr_spec) {
                                    if attr.name() == DW_AT_name {
                                        name_str = unsafe {
                                            str::from_utf8_unchecked(
                                                attr.string_value(&dwarf.debug_str)
                                                    .unwrap()
                                                    .slice(),
                                            )
                                        };
                                    }
                                }
                            }

                            let new_group_name =
                                SymbolName::new_with_parent(parent_group_name, name_str);

                            prev_parent_group_index = match function_group_name_lookup
                                .get(&new_group_name)
                                .copied()
                            {
                                Some(group_idx) => group_idx,
                                None => {
                                    let ty = match abbreviation.tag() {
                                        DW_TAG_structure_type => FunctionGroupType::Struct,
                                        DW_TAG_namespace if name_str.starts_with("{impl#") => {
                                            FunctionGroupType::Impl
                                        }
                                        _ => FunctionGroupType::Namespace,
                                    };

                                    function_groups.add_child(
                                        parent_group_index,
                                        FunctionGroup {
                                            ty,
                                            name: new_group_name,
                                            demangled_name: "",
                                            size: 0,
                                            fn_index: u32::MAX,
                                        },
                                    );
                                    let new_function_group_index = function_groups.len() - 1;

                                    let offset = offset.to_debug_info_offset(&unit_header).unwrap();

                                    offset_index_lookup.insert(offset, new_function_group_index);
                                    function_group_name_lookup
                                        .insert(new_group_name, new_function_group_index);

                                    new_function_group_index
                                }
                            };

                            prev_parent_group_name = new_group_name;
                        }
                        DW_TAG_structure_type if depth > 1 => {
                            let mut name_str = "";

                            for attr_spec in abbreviation.attributes() {
                                if let Ok(attr) = entries.read_attribute(*attr_spec) {
                                    if attr.name() == DW_AT_name {
                                        name_str = unsafe {
                                            str::from_utf8_unchecked(
                                                attr.string_value(&dwarf.debug_str)
                                                    .unwrap()
                                                    .slice(),
                                            )
                                        };
                                    }
                                }
                            }

                            let new_group_name =
                                SymbolName::new_with_parent(parent_group_name, name_str);

                            prev_parent_group_index = match function_group_name_lookup
                                .get(&new_group_name)
                                .copied()
                            {
                                Some(group_idx) => group_idx,
                                None => {
                                    function_groups.add_child(
                                        parent_group_index,
                                        FunctionGroup {
                                            ty: FunctionGroupType::Struct,
                                            name: new_group_name,
                                            demangled_name: "",
                                            size: 0,
                                            fn_index: u32::MAX,
                                        },
                                    );
                                    let new_function_group_index = function_groups.len() - 1;

                                    let offset = offset.to_debug_info_offset(&unit_header).unwrap();

                                    offset_index_lookup.insert(offset, new_function_group_index);
                                    function_group_name_lookup
                                        .insert(new_group_name, new_function_group_index);

                                    new_function_group_index
                                }
                            };

                            prev_parent_group_name = new_group_name;
                        }
                        DW_TAG_subprogram => {
                            let mut linkage_name = "";
                            let mut name = "";
                            let mut specification = None;
                            let mut inlined = false;
                            let mut low_pc = 0;
                            let mut high_pc = 0;

                            // let mut attributes = entry.attrs();
                            for attr_spec in abbreviation.attributes() {
                                let attr = entries.read_attribute(*attr_spec).unwrap();

                                // while let Ok(Some(attr)) = attributes.next() {
                                #[allow(non_upper_case_globals)]
                                #[allow(non_snake_case)]
                                match attr.name() {
                                    DW_AT_name => {
                                        if let Some(attr_value) =
                                            attr.string_value(&dwarf.debug_str)
                                        {
                                            name = unsafe {
                                                str::from_utf8_unchecked(attr_value.slice())
                                            };
                                        }
                                    }
                                    DW_AT_linkage_name => {
                                        if let Some(attr_value) =
                                            attr.string_value(&dwarf.debug_str)
                                        {
                                            linkage_name = unsafe {
                                                str::from_utf8_unchecked(attr_value.slice())
                                            };
                                        }
                                    }
                                    DW_AT_specification => {
                                        if let AttributeValue::UnitRef(unit_offset) =
                                            attr.raw_value()
                                        {
                                            specification = Some(unit_offset);
                                        }
                                    }
                                    DW_AT_inline => {
                                        // println!("Inline: {:?}", attr);
                                        let attr_value = attr.u8_value().expect(
                                            "Failed to parse subprogram 'inline' attribute value",
                                        );

                                        if attr_value == DW_INL_inlined.0 {
                                            inlined = true;
                                        }
                                    }
                                    DW_AT_low_pc => match attr.raw_value() {
                                        AttributeValue::Addr(addr) => {
                                            low_pc = addr;
                                        }
                                        _ => {
                                            panic!(
                                                "Unable to parse 'low_pc' attribute: '{:?}'",
                                                attr
                                            );
                                        }
                                    },
                                    DW_AT_high_pc => match attr.raw_value() {
                                        AttributeValue::Addr(addr) => {
                                            high_pc = addr - low_pc;
                                        }
                                        AttributeValue::Data4(data) => high_pc = data as u64,
                                        _ => {
                                            panic!(
                                                "Unable to parse 'high_pc' attribute: '{:?}'",
                                                attr
                                            );
                                        }
                                    },
                                    _ => {}
                                }
                            }

                            let subprogram_symbol_name =
                                SymbolName::new_with_parent(parent_group_name, name);

                            // When the name is empty, it's usually an inline DEI of a previously
                            // declared function. In those cases, we can get the original function
                            // info by looking at the symbol at the given specification location.
                            if name.is_empty() {
                                if let Some(specification) = specification {
                                    let offset =
                                        specification.to_debug_info_offset(&unit_header).unwrap();

                                    let index =
                                        offset_index_lookup.get(&offset).copied().expect(&format!(
                                            "Failed to resolve specification offset: '{}'",
                                            offset.0
                                        ));

                                    debug_assert!(matches!(
                                        function_groups.get(index).ty,
                                        FunctionGroupType::FunctionInstance
                                            | FunctionGroupType::FunctionInlinedInstance
                                    ));
                                    function_groups.get_mut(index).ty =
                                        FunctionGroupType::FunctionInlinedInstance;
                                }
                            } else {
                                let parent_group = *function_groups.get(parent_group_index);
                                let subprogram_group_index = if let Some(subprogram_index) =
                                    function_group_name_lookup.get(&subprogram_symbol_name)
                                {
                                    *subprogram_index
                                } else {
                                    function_groups.add_child(
                                        parent_group_index,
                                        FunctionGroup {
                                            ty: FunctionGroupType::Function,
                                            name: subprogram_symbol_name,
                                            demangled_name: "",
                                            size: 0,
                                            fn_index: u32::MAX,
                                        },
                                    );
                                    let new_function_group_index = function_groups.len() - 1;

                                    function_group_name_lookup
                                        .insert(subprogram_symbol_name, new_function_group_index);

                                    new_function_group_index
                                };

                                let demangled_name = demangled_name(&arena, linkage_name);
                                if matches!(parent_group.ty, FunctionGroupType::Impl) {
                                    if let Some((type_name, trait_name)) =
                                        extract_trait_from_demangled_name(demangled_name)
                                    {
                                        let mut trait_impl_name = String::new(
                                            arena,
                                            type_name.len() + trait_name.len() + " for ".len(),
                                        );

                                        trait_impl_name.push_str(trait_name);
                                        trait_impl_name.push_str(" for ");
                                        trait_impl_name.push_str(type_name);
                                        function_groups.get_mut(parent_group_index).name =
                                            SymbolName::new_with_parent(
                                                parent_group_name,
                                                trait_impl_name.to_str(),
                                            );
                                    } else {
                                        let mut trait_impl_name =
                                            String::new(arena, demangled_name.len());

                                        trait_impl_name.push_str(demangled_name);
                                        function_groups.get_mut(parent_group_index).name =
                                            SymbolName::new_with_parent(
                                                parent_group_name,
                                                trait_impl_name.to_str(),
                                            );
                                    }
                                }

                                let instance_name =
                                    SymbolName::new_with_parent(subprogram_symbol_name, name);

                                let new_function_group_index =
                                    if let Some(new_function_group_index) =
                                        function_group_name_lookup.get(&instance_name)
                                    {
                                        *new_function_group_index
                                    } else {
                                        let fn_index =
                                            function_index_lookup.get(linkage_name).copied();

                                        if let Some(fn_index) = fn_index {
                                            functions_section.function_names[fn_index as usize] =
                                                demangled_name;
                                            functions_section.function_original_names
                                                [fn_index as usize] = linkage_name;
                                        }

                                        function_groups.add_child(
                                            subprogram_group_index,
                                            FunctionGroup {
                                                ty: if !inlined {
                                                    FunctionGroupType::FunctionInstance
                                                } else {
                                                    FunctionGroupType::FunctionInlinedInstance
                                                },
                                                name: subprogram_symbol_name,
                                                demangled_name: demangled_name,
                                                size: high_pc as u32,
                                                fn_index: fn_index.unwrap_or(u32::MAX),
                                            },
                                        );
                                        let new_function_group_index = function_groups.len() - 1;

                                        function_group_name_lookup
                                            .insert(instance_name, new_function_group_index);

                                        new_function_group_index
                                    };

                                let offset = offset.to_debug_info_offset(&unit_header).unwrap();
                                offset_index_lookup.insert(offset, new_function_group_index);
                            }
                        }
                        _ => {
                            entries
                                .skip_attributes(abbreviation.attributes())
                                .expect("Failed to skip attributes");
                        }
                    }
                }
            }

            for idx in (0..function_groups.len()).rev() {
                let size = function_groups.get(idx).size;
                if let Some(parent_idx) = function_groups.get_parent_index(idx) {
                    function_groups.get_mut(parent_idx).size += size;
                }
            }

            println!("Dwarf parsing: {}s", (Instant::now() - start).as_secs_f32());
        }

        drop(function_index_lookup);
        drop(function_group_name_lookup);

        (
            Self {
                bytes,
                version,
                types_section,
                functions_section,
            },
            function_groups,
        )
    }
}

pub struct TypeSection<'a> {
    pub types: Array<'a, FuncType>,
}

pub struct FunctionSection<'a> {
    pub range: Range<usize>,
    pub function_types: Array<'a, usize>,
    pub function_original_names: Array<'a, &'a str>,
    pub function_names: Array<'a, &'a str>,
    pub function_bodies: Array<'a, FunctionBody<'a>>,
    pub function_sizes: Array<'a, u32>,
    pub function_called: Array<'a, Array<'a, u32>>,
    pub function_count: usize,
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum FunctionGroupType {
    Namespace,
    Struct,
    Impl,
    Function,
    FunctionInstance,
    FunctionInlinedInstance,
}

#[derive(Clone, Copy)]
pub struct FunctionGroup<'a> {
    pub ty: FunctionGroupType,
    pub name: SymbolName<'a>,
    pub demangled_name: &'a str,
    pub size: u32,
    pub fn_index: u32,
}

fn demangled_name<'a>(arena: &'a Arena, name: &'a str) -> &'a str {
    use std::fmt::Write;
    let demangled_symbol = rustc_demangle::demangle(name);

    // Demangled names should be shorter, generally, but adding buffer here just in case
    let mut demangled_name = String::new(arena, name.len() * 2);

    _ = write!(&mut demangled_name, "{}", demangled_symbol);

    demangled_name.shrink_to_fit();
    demangled_name.to_str()
}

fn parse_type_as_trait<'a>(demangled_name: &'a str) -> Option<(&'a str, &'a str)> {
    if demangled_name.is_empty() {
        return None;
        // panic!("Failed to parse type as trait: name is empty");
    }

    let bytes_len = demangled_name.as_bytes().len();
    let demangled_name =
        unsafe { str::from_utf8_unchecked(&demangled_name.as_bytes()[1..(bytes_len - 1)]) };

    if let Some(position) = demangled_name.find(" as ") {
        Some((
            &demangled_name[0..position],
            &demangled_name[(position + " as ".len())..],
        ))
    } else {
        None
    }
}

fn extract_trait_from_demangled_name<'a>(demangled_name: &'a str) -> Option<(&'a str, &'a str)> {
    let mut colon = false;
    let mut start = 0;
    let mut end = 0;
    let mut ticks = 0;
    let mut brackets = 0;

    let mut contains_space = false;
    let mut is_type_as_trait = false;

    while end < demangled_name.as_bytes().len() {
        let c = demangled_name.as_bytes()[end];
        match c {
            b':' if colon && brackets == 0 && ticks == 0 => {
                end += 1;
                start = end;
                contains_space = false;
            }
            b'<' => {
                if start == end {
                    is_type_as_trait = true;
                }

                ticks += 1;
                end += 1;
            }
            b'>' => {
                ticks -= 1;
                end += 1;

                if is_type_as_trait && contains_space && ticks == 0 {
                    // This is the slice of the type `<foo::Type as bar::Trait>`
                    let type_as_trait_str =
                        unsafe { str::from_utf8_unchecked(&demangled_name.as_bytes()[start..end]) };

                    if let Some((type_name, trait_name)) = parse_type_as_trait(type_as_trait_str) {
                        return Some((type_name, trait_name));
                    } else {
                        return None;
                    }
                }
            }
            b'[' => {
                brackets += 1;
                end += 1;
            }
            b']' => {
                brackets -= 1;
                end += 1;
            }
            b' ' => {
                contains_space = true;
                end += 1;
            }
            _ => {
                end += 1;
            }
        }

        colon = c == b':';
    }

    None
}

#[cfg(test)]
mod test {
    use super::extract_trait_from_demangled_name;

    #[test]
    fn extract_trait_from_demangled_name_works() {
        assert_eq!(
            extract_trait_from_demangled_name("<foo::bar::BarImpl as other::TraitName>"),
            Some(("foo::bar::BarImpl", "other::TraitName"))
        );
        assert_eq!(
            extract_trait_from_demangled_name(
                "foo::<bar::BarImpl as other::TraitName>::foo_function"
            ),
            Some(("bar::BarImpl", "other::TraitName"))
        );

        assert_eq!(
            extract_trait_from_demangled_name("foo::bar::BarImpl<usize>"),
            None
        );
        assert_eq!(extract_trait_from_demangled_name("foo::bar::BarImpl"), None);

        assert_eq!(
            extract_trait_from_demangled_name("<*const usize as other::TraitName>::foo_function"),
            Some(("*const usize", "other::TraitName"))
        );
    }
}
