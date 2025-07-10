use std::{
    collections::HashSet,
    hash::{DefaultHasher, Hash, Hasher},
};

use gimli::{
    AttributeValue, DW_AT_decl_file, DW_AT_decl_line, DW_AT_declaration, DW_AT_inline,
    DW_AT_linkage_name, DW_AT_name, DW_AT_specification, DW_INL_inlined, DW_TAG_namespace,
    DW_TAG_structure_type, DW_TAG_subprogram, DebugInfoOffset, EndianSlice, LittleEndian,
    UnitOffset, UnitType,
};
use hashbrown::{DefaultHashBuilder, HashMap};
use petgraph::{algo::dominators::Dominators, visit};
use wasmparser::{Encoding, FuncType, FunctionBody, Operator};

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
    pub fn from_bytes(arena: &'a Arena, bytes: &'a [u8]) -> Self {
        let mut version = 0;
        let mut types_section = TypeSection {
            types: Array::new(arena, 0),
        };
        let mut imports_count = 0;
        let mut functions_section = FunctionSection {
            function_types: Array::new(arena, 0),
            function_names: Array::new(arena, 0),
            function_original_names: Array::new(arena, 0),
            function_bodies: Array::new(arena, 0),
            function_called: Array::new(arena, 0),
            function_groups: Tree::new(
                arena,
                0,
                FunctionGroup {
                    ty: FunctionGroupType::Namespace,
                    name: SymbolName::root(),
                    demangled_name: "",
                    original_name: "",
                    implements: None,
                    decl_file: "",
                    decl_line: 0,
                    fn_index: None,
                },
            ),
            function_count: 0,
        };

        let mut root_idx = 0;
        let mut total = 0;

        let scratch = scratch_arena(&[arena]);
        let mut function_group_name_lookup =
            HashMap::<SymbolName<'a>, usize, DefaultHashBuilder, &Arena>::with_capacity_in(
                0, &scratch,
            );
        let mut function_index_lookup =
            HashMap::<&str, usize, DefaultHashBuilder, &Arena>::with_capacity_in(0, &scratch);
        let mut offset_index_lookup = HashMap::<DebugInfoOffset<usize>, usize>::new();
        // let mut function_groups = Array::new(arena, 0);
        let mut function_groups = Tree::new(
            arena,
            0,
            FunctionGroup {
                ty: FunctionGroupType::Namespace,
                name: SymbolName::root(),
                demangled_name: "",
                original_name: "",
                implements: None,
                decl_file: "",
                decl_line: 0,
                fn_index: None,
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
                    imports_count += import_section_reader.count() as usize;
                    for import in import_section_reader.into_iter() {
                        let import = match import {
                            Ok(import) => import,
                            Err(err) => {
                                panic!("Failed to parse import function with error {}", err)
                            }
                        };

                        println!("Import: {} - {}", import.module, import.name);
                    }
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
                wasmparser::Payload::TableSection(table_section_reader) => {
                    for table in table_section_reader.into_iter() {
                        let table = match table {
                            Ok(table) => table,
                            Err(err) => {
                                panic!("Failed to parse table entry with error {}", err)
                            }
                        };

                        // table.
                    }
                }
                // wasmparser::Payload::MemorySection(section_limited) => todo!(),
                // wasmparser::Payload::TagSection(section_limited) => todo!(),
                // wasmparser::Payload::GlobalSection(section_limited) => todo!(),
                // wasmparser::Payload::ExportSection(section_limited) => todo!(),
                wasmparser::Payload::StartSection { func, .. } => {
                    root_idx = func;
                }
                // wasmparser::Payload::ElementSection(section_limited) => todo!(),
                // wasmparser::Payload::DataCountSection { count, range } => todo!(),
                // wasmparser::Payload::DataSection(section_limited) => todo!(),
                wasmparser::Payload::CodeSectionStart { count, .. } => {
                    functions_section.function_bodies = Array::new(arena, count as usize);

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
                            original_name: "",
                            implements: None,
                            decl_file: "",
                            decl_line: 0,
                            fn_index: None,
                        },
                    );

                    function_group_name_lookup =
                        HashMap::with_capacity_in(5 * count as usize, &scratch);

                    functions_section.function_count = count as usize;
                }
                wasmparser::Payload::CodeSectionEntry(function_body) => {
                    let mut locals_reader = function_body.get_locals_reader().unwrap();
                    for i in 0..locals_reader.get_count() {
                        if locals_reader.read().unwrap().0 != 0 {
                            total += 1;
                        }
                    }

                    let mut operators_reder = function_body.get_operators_reader().unwrap();
                    while !operators_reder.eof() {
                        match operators_reder.read().unwrap() {
                            wasmparser::Operator::Call { .. } => {
                                total += 1;
                            }
                            _ => {}
                        }
                    }

                    functions_section.function_bodies.push(function_body);
                }
                // wasmparser::Payload::ModuleSection {
                //     parser,
                //     unchecked_range,
                // } => todo!(),
                // wasmparser::Payload::InstanceSection(section_limited) => todo!(),
                // wasmparser::Payload::CoreTypeSection(section_limited) => todo!(),
                // wasmparser::Payload::ComponentSection {
                //     parser,
                //     unchecked_range,
                // } => todo!(),
                // wasmparser::Payload::ComponentInstanceSection(section_limited) => todo!(),
                // wasmparser::Payload::ComponentAliasSection(section_limited) => todo!(),
                // wasmparser::Payload::ComponentTypeSection(section_limited) => todo!(),
                // wasmparser::Payload::ComponentCanonicalSection(section_limited) => todo!(),
                // wasmparser::Payload::ComponentStartSection { start, range } => todo!(),
                // wasmparser::Payload::ComponentImportSection(import_section_reader) => todo!(),
                // wasmparser::Payload::ComponentExportSection(section_limited) => todo!(),
                wasmparser::Payload::CustomSection(custom_section_reader) => {
                    println!("Section: {}", custom_section_reader.name());
                    match custom_section_reader.as_known() {
                        wasmparser::KnownCustom::Name(name_section_reader) => {
                            for name in name_section_reader.into_iter() {
                                let name = match name {
                                    Ok(name) => name,
                                    Err(err) => panic!("Failed to parse name with error {}", err),
                                };

                                match name {
                                    // wasmparser::Name::Module { name, name_range } => todo!(),
                                    wasmparser::Name::Function(name_map) => {
                                        for naming in name_map.into_iter().skip(imports_count) {
                                            let naming = match naming {
                                                Ok(naming) => naming,
                                                Err(err) => panic!(
                                                    "Failed to parse function name with error {}",
                                                    err
                                                ),
                                            };

                                            // if naming.name.contains(":main:") {
                                            //     root_idx = naming.index;
                                            // }

                                            // if naming.name.contains("core::slice") {
                                            //     println!("Core slice");
                                            // }

                                            // let demangled_name = demangled_name(arena, naming.name);

                                            // let group_names = split_modules2(arena, demangled_name);
                                            // let group_names_count = group_names.len();
                                            // if group_names_count > 0 {
                                            //     let mut parent_group_idx = None;

                                            //     for i in 0..group_names_count {
                                            //         let group_idx = match function_group_name_lookup
                                            //             .get(group_names[i])
                                            //             .copied()
                                            //         {
                                            //             Some(group_idx) => group_idx,
                                            //             None => {
                                            //                 let new_group_idx =
                                            //                     function_groups.len();
                                            //                 function_groups.push(FunctionGroup {
                                            //                     name: group_names[i],
                                            //                     original_name: naming.name,
                                            //                     fn_index: None,
                                            //                     parent: parent_group_idx,
                                            //                     next_sibling: None,
                                            //                     first_child: None,
                                            //                     last_child: None,
                                            //                 });
                                            //                 function_group_name_lookup.insert(
                                            //                     group_names[i],
                                            //                     new_group_idx,
                                            //                 );

                                            //                 if let Some(parent_group_idx) =
                                            //                     parent_group_idx
                                            //                 {
                                            //                     if let Some(last_child_idx) =
                                            //                         function_groups
                                            //                             [parent_group_idx]
                                            //                             .last_child
                                            //                     {
                                            //                         function_groups
                                            //                             [last_child_idx]
                                            //                             .next_sibling =
                                            //                             Some(new_group_idx);

                                            //                         function_groups
                                            //                             [parent_group_idx]
                                            //                             .last_child =
                                            //                             Some(new_group_idx);
                                            //                     } else {
                                            //                         function_groups
                                            //                             [parent_group_idx]
                                            //                             .first_child =
                                            //                             Some(new_group_idx);
                                            //                         function_groups
                                            //                             [parent_group_idx]
                                            //                             .last_child =
                                            //                             Some(new_group_idx);
                                            //                     }
                                            //                 }

                                            //                 new_group_idx
                                            //             }
                                            //         };

                                            //         if i == group_names_count - 1 {
                                            //             function_groups[group_idx].fn_index = Some(
                                            //                 naming.index as usize - imports_count,
                                            //             );
                                            //         }

                                            //         parent_group_idx = Some(group_idx);
                                            //     }
                                            // }

                                            // println!(
                                            //     "Functio name {} {}",
                                            //     naming.index, demangled_name
                                            // );

                                            // functions_section.function_names
                                            //     [naming.index as usize - imports_count] =
                                            //     demangled_name;
                                            // functions_section.function_original_names
                                            //     [naming.index as usize - imports_count] =
                                            //     naming.name;

                                            function_index_lookup.insert(
                                                naming.name,
                                                naming.index as usize - imports_count,
                                            );
                                        }
                                    }
                                    // wasmparser::Name::Local(section_limited) => todo!(),
                                    // wasmparser::Name::Label(section_limited) => todo!(),
                                    // wasmparser::Name::Type(section_limited) => todo!(),
                                    // wasmparser::Name::Table(section_limited) => todo!(),
                                    // wasmparser::Name::Memory(section_limited) => todo!(),
                                    wasmparser::Name::Global(name_map) => {
                                        for naming in name_map.into_iter().skip(imports_count) {
                                            let naming = match naming {
                                                Ok(naming) => naming,
                                                Err(err) => panic!(
                                                    "Failed to parse function name with error {}",
                                                    err
                                                ),
                                            };

                                            println!("Global name {}", naming.name);
                                        }
                                    }
                                    // wasmparser::Name::Element(section_limited) => todo!(),
                                    // wasmparser::Name::Data(section_limited) => todo!(),
                                    // wasmparser::Name::Field(section_limited) => todo!(),
                                    // wasmparser::Name::Tag(section_limited) => todo!(),
                                    // wasmparser::Name::Unknown { ty, data, range } => todo!(),
                                    _ => {}
                                }
                            }
                        }
                        wasmparser::KnownCustom::Unknown => {
                            println!("Section {}", custom_section_reader.name());

                            if custom_section_reader.name().starts_with(".debug") {
                                debug_sections
                                    .insert(custom_section_reader.name(), custom_section_reader);
                            }
                        }
                        _ => {}
                    }
                }
                // wasmparser::Payload::UnknownSection {
                //     id,
                //     contents,
                //     range,
                // } => todo!(),
                // wasmparser::Payload::End(_) => todo!(),
                _ => {}
            }
        }

        // Extract symbol dependencies
        for idx in 0..functions_section.function_bodies.len() {
            let function_body = &functions_section.function_bodies[idx];

            // TODO: (bruno) what is the minimum instruction size here? surely it's not 1 byte
            let mut dependants = Array::new(arena, function_body.as_bytes().len());

            let mut operators_reader = match function_body.get_operators_reader() {
                Ok(operators_reader) => operators_reader,
                Err(err) => {
                    panic!("Failed to parse function operators with error {}", err)
                }
            };

            while !operators_reader.eof() {
                let operator = match operators_reader.read() {
                    Ok(operator) => operator,
                    Err(err) => {
                        panic!("Failed to parse function operator with error {}", err)
                    }
                };

                match operator {
                    Operator::Call { function_index } => {
                        if function_index as usize >= imports_count {
                            dependants.push(function_index as usize - imports_count);
                        }
                    }
                    // Operator::CallIndirect { type_index, table_index } => todo!(),
                    _ => {}
                }
            }

            dependants.shrink_to_fit();
            functions_section.function_called.push(dependants);
        }

        let dwarf = gimli::Dwarf::load::<_, ()>(|section_id| {
            println!("Return section {}", section_id.name());
            let section = debug_sections
                .get(section_id.name())
                .map_or::<&[u8], _>(&[], |section| section.data());

            Ok(EndianSlice::new(section, LittleEndian))
        })
        .unwrap();

        // let mut namespace_stack = Array::new(&scratch, 128);
        let root_symbol_name = function_groups.root().name;

        let mut group_index_stack = Array::new(&scratch, 128);

        // let mut hasher = DefaultHasher::new();
        // SymbolName::new(0, "<root>").hash(&mut hasher);
        // let root_hash = hasher.finish();

        let mut units = dwarf.units();
        while let Ok(Some(unit_header)) = units.next() {
            if unit_header.type_() != UnitType::Compilation {
                println!("Unity type '{:?}' not supported!", unit_header.type_());
                continue;
            }

            println!("Unit {:?}", unit_header);
            let Ok(abbreviations) = dwarf.abbreviations(&unit_header) else {
                continue;
            };

            // let unit_ref = dwarf.unit(unit).unwrap().unit_ref(&dwarf);

            // let mut parent_group_index: usize = 0;
            group_index_stack.clear();
            group_index_stack.push((0, root_symbol_name));

            let mut prev_parent_group_index = 0;
            let mut prev_parent_group_name = root_symbol_name;

            let mut entries = unit_header.entries(&abbreviations);
            while let Ok(Some((mut offset, entry))) = entries.next_dfs() {
                assert!(offset <= 1, "Unexpected offset: {}>1", offset);

                println!("offset {offset}");
                // If offset is negative, it means that we are climbing back the tree
                while offset < 0 {
                    group_index_stack.pop();
                    // if let Some((idx, _)) = group_index_stack.pop() {
                    //     if idx == function_groups.len() - 1
                    //         && matches!(
                    //             dbg!(function_groups.get(idx).ty),
                    //             FunctionGroupType::Namespace | FunctionGroupType::Struct
                    //         )
                    //     {
                    //         function_groups.pop();
                    //     }
                    // }

                    // parent_group_index = function_groups[parent_group_index].parent.unwrap();
                    offset += 1;
                }

                // If offset is 1, we are processing a nested entry, so we should update
                // parent index with the previous function group index
                if offset == 1 {
                    group_index_stack.push((prev_parent_group_index, prev_parent_group_name));
                    // parent_group_index = function_groups.len() - 1;
                }

                let (parent_group_index, parent_group_name) =
                    group_index_stack.last().copied().unwrap();

                if entry.tag() == DW_TAG_namespace || entry.tag() == DW_TAG_structure_type {
                    let name_str = entry
                        .attr(DW_AT_name)
                        .expect("Failed to parse namespace name attribute")
                        .map(|attr| attr.string_value(&dwarf.debug_str))
                        .flatten()
                        .map(|value| unsafe { str::from_utf8_unchecked(value.slice()) })
                        // .unwrap();
                        .unwrap_or("");
                    // .expect("Failed to get name of namespace");

                    let new_group_name = SymbolName::new_with_parent(parent_group_name, name_str);

                    // let mut hasher = DefaultHasher::new();
                    // parent_group_hash.hash(&mut hasher);
                    // name_str.hash(&mut hasher);
                    // let new_group_hash = hasher.finish();

                    prev_parent_group_index =
                        match function_group_name_lookup.get(&new_group_name).copied() {
                            Some(group_idx) => group_idx,
                            None => {
                                // Add child
                                // let parent_group: FunctionGroup<'_> =
                                //     *function_groups.get(parent_group_index);

                                // if name_str.is_empty() {
                                //     println!("WTF");
                                // }

                                let ty = match entry.tag() {
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
                                        original_name: name_str,
                                        demangled_name: name_str,
                                        implements: None,
                                        decl_file: "",
                                        decl_line: 0,
                                        fn_index: None,
                                    },
                                );
                                let new_function_group_index = function_groups.len() - 1;

                                let offset =
                                    entry.offset().to_debug_info_offset(&unit_header).unwrap();

                                offset_index_lookup.insert(offset, new_function_group_index);
                                function_group_name_lookup
                                    .insert(new_group_name, new_function_group_index);

                                new_function_group_index
                            }
                        };

                    prev_parent_group_name = new_group_name;
                }

                println!(
                    "Entry: {:x} - {}",
                    entry.offset().to_debug_info_offset(&unit_header).unwrap().0,
                    entry.tag()
                );

                if entry.tag() != DW_TAG_subprogram {
                    continue;
                }

                let mut linkage_name = "";
                let mut name = "";
                let mut declaration = false;
                let mut specification = None;
                let mut inlined = false;
                let mut decl_file = "";
                let mut decl_line = 0;

                let mut attributes = entry.attrs();
                while let Ok(Some(attr)) = attributes.next() {
                    #[allow(non_upper_case_globals)]
                    #[allow(non_snake_case)]
                    match attr.name() {
                        DW_AT_name => {
                            let attr_value = attr
                                .string_value(&dwarf.debug_str)
                                .expect("Failed to parse subprogram 'name' attribute value");

                            name = unsafe { str::from_utf8_unchecked(attr_value.slice()) };
                        }
                        DW_AT_linkage_name => {
                            let attr_value = attr.string_value(&dwarf.debug_str).expect(
                                "Failed to parse subprogram 'linkage_name' attribute value",
                            );

                            // linkage_name = unsafe { str::from_utf8_unchecked(attr_value.slice()) };
                            linkage_name = unsafe { str::from_utf8_unchecked(attr_value.slice()) };
                        }
                        DW_AT_declaration => {
                            println!("Declaration: {:?}", attr);

                            // match attr.raw_value() {
                            //     AttributeValue::Flag(value) => {
                            //         if value {
                            //             continue 'entry_loop;
                            //         }
                            //     }
                            //     _ => {
                            //         panic!(
                            //             "Failed to parse subprogram 'declaration' attribute value: unexpected attribue value format"
                            //         )
                            //     }
                            // }
                        }
                        DW_AT_specification => {
                            println!("Specification: {:?}", attr);
                            if let AttributeValue::UnitRef(unit_offset) = attr.raw_value() {
                                println!(
                                    "UnitOffset: {:x}",
                                    unit_offset.to_debug_info_offset(&unit_header).unwrap().0
                                );
                                specification = Some(unit_offset);
                            }

                            // let attr_value = attr.offset_value().expect(
                            //     "Failed to parse subprogram 'specification' attribute value",
                            // );
                        }
                        DW_AT_inline => {
                            // println!("Inline: {:?}", attr);
                            let attr_value = attr
                                .u8_value()
                                .expect("Failed to parse subprogram 'inline' attribute value");

                            if attr_value == DW_INL_inlined.0 {
                                inlined = true;
                            }
                        }
                        DW_AT_decl_file => {
                            println!("{} {:?}", name, attr);

                            let attr_value = attr
                                .string_value(&dwarf.debug_str)
                                .expect("Failed to parse subprogram 'decl_file' attribute value");

                            decl_file = unsafe { str::from_utf8_unchecked(attr_value.slice()) };
                        }
                        // DW_AT_decl_line => {
                        //     println!("{} {:?}", name, attr);
                        //     let attr_value = match attr.raw_value() {
                        //         AttributeValue::Addr(addr) => addr,
                        //         AttributeValue::Data4(value) => value as u64,
                        //         _ => {
                        //             0
                        //             // panic!("Failed to parse subprogram 'decl_line' attribute value")
                        //         }
                        //     };

                        //     decl_line = attr_value;
                        // }
                        _ => {}
                    }
                }

                let subprogram_symbol_name = SymbolName::new_with_parent(parent_group_name, name);

                if name.is_empty() {
                    if let Some(specification) = specification {
                        let offset = specification.to_debug_info_offset(&unit_header).unwrap();

                        // assert!(
                        //     inlined,
                        //     "Unexpected specification entry that is not inlined"
                        // );

                        println!(
                            "SUBPROGRAM inlined pointing to specification: {:x}",
                            offset.0
                        );

                        let Some(index) = offset_index_lookup.get(&offset).copied() else {
                            continue;
                        };
                        // let index: usize = offset_index_lookup.get(&offset).copied().unwrap();
                        println!("Function group ty {:?}", function_groups.get(index).ty);
                        assert!(
                            function_groups.get(index).ty == FunctionGroupType::FunctionInstance
                                || function_groups.get(index).ty
                                    == FunctionGroupType::FunctionInlinedInstance
                        );
                        function_groups.get_mut(index).ty =
                            FunctionGroupType::FunctionInlinedInstance;
                    }
                } else {
                    if name.starts_with("print_foo") {
                        println!("Break");
                    }

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
                                original_name: "",
                                demangled_name: "",
                                implements: None,
                                decl_file: "",
                                decl_line: 0,
                                fn_index: None,
                            },
                        );
                        let new_function_group_index = function_groups.len() - 1;

                        // let offset = entry.offset().to_debug_info_offset(&unit_header).unwrap();
                        // offset_index_lookup.insert(offset, new_function_group_index);
                        function_group_name_lookup
                            .insert(subprogram_symbol_name, new_function_group_index);

                        new_function_group_index
                    };

                    let demangled_name = demangled_name(arena, linkage_name);

                    if matches!(
                        parent_group.ty,
                        FunctionGroupType::Struct | FunctionGroupType::Impl
                    ) {
                        if let Some((type_name, trait_name)) =
                            extract_trait_from_demangled_name(demangled_name)
                        {
                            function_groups.get_mut(parent_group_index).original_name = type_name;
                            function_groups.get_mut(parent_group_index).implements =
                                Some(trait_name);
                        }
                    }

                    let instance_name = SymbolName::new_with_parent(subprogram_symbol_name, name);

                    let new_function_group_index = if let Some(new_function_group_index) =
                        function_group_name_lookup.get(&instance_name)
                    {
                        *new_function_group_index
                    } else {
                        function_groups.add_child(
                            subprogram_group_index,
                            FunctionGroup {
                                ty: if !inlined {
                                    FunctionGroupType::FunctionInstance
                                } else {
                                    FunctionGroupType::FunctionInlinedInstance
                                },
                                name: subprogram_symbol_name,
                                original_name: linkage_name,
                                demangled_name: demangled_name,
                                implements: None,
                                decl_file: decl_file,
                                decl_line: decl_line,
                                fn_index: None,
                            },
                        );
                        let new_function_group_index = function_groups.len() - 1;

                        new_function_group_index
                    };

                    let offset = entry.offset().to_debug_info_offset(&unit_header).unwrap();
                    offset_index_lookup.insert(offset, new_function_group_index);
                }
            }
        }

        functions_section.function_groups = function_groups;

        Self {
            bytes,
            version,
            types_section,
            functions_section,
        }
    }
}

pub struct TypeSection<'a> {
    pub types: Array<'a, FuncType>,
}

pub struct FunctionNode {
    pub parent: usize,
    pub first_child: usize,
    pub last_sibling: usize,
}

pub struct FunctionSection<'a> {
    pub function_types: Array<'a, usize>,
    pub function_original_names: Array<'a, &'a str>,
    pub function_names: Array<'a, &'a str>,
    pub function_bodies: Array<'a, FunctionBody<'a>>,
    pub function_called: Array<'a, Array<'a, usize>>,

    pub function_groups: Tree<'a, FunctionGroup<'a>>,
    pub function_count: usize,
}

pub struct TableSection<'a> {
    pub tables: Array<'a, usize>,
}

// #[derive(Clone, Copy)]
// pub enum FunctionIndex {
//     Group(usize),
//     Fn(usize),
// }

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
    pub original_name: &'a str,
    pub demangled_name: &'a str,
    pub implements: Option<&'a str>,
    pub decl_file: &'a str,
    pub decl_line: usize,
    pub fn_index: Option<usize>,
    // pub parent: Option<usize>,
    // pub next_sibling: Option<usize>,
    // pub first_child: Option<usize>,
    // pub last_child: Option<usize>,
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

fn process_function_name<'a>(arena: &'a Arena, demangled_name: &'a str) {
    let mut segments = Array::new(arena, 1024);
    for segment in demangled_name.split("::") {
        println!("Segment: {segment}");
        segments.push(segment);
    }

    segments.shrink_to_fit();
}

fn split_modules<'a>(arena: &'a Arena, demangled_name: &'a str) -> &'a [&'a str] {
    let mut modules = Array::new(arena, 128);

    let mut position = 0;
    for segment in demangled_name.split("::") {
        println!("Segment {}", segment);
    }

    modules.shrink_to_fit();
    modules.to_slice()
}

fn split_modules2<'a>(arena: &'a Arena, demangled_name: &'a str) -> &'a [&'a str] {
    let mut modules = Array::new(arena, 128);

    let mut colon = false;
    let mut start = 0;
    let mut end = 0;
    let mut ticks = 0;
    let mut brackets = 0;

    while end < demangled_name.as_bytes().len() {
        match demangled_name.as_bytes()[end] {
            b':' if brackets == 0 && ticks == 0 => {
                if !colon {
                    if end != start {
                        modules.push(unsafe {
                            str::from_utf8_unchecked(&demangled_name.as_bytes()[start..end])
                        });
                    }

                    colon = true;
                }

                end += 1;
                start = end;
            }
            b'<' => {
                ticks += 1;
                end += 1;
            }
            b'>' => {
                ticks -= 1;
                end += 1;
            }
            b'[' => {
                brackets += 1;
                end += 1;
            }
            b']' => {
                brackets -= 1;
                end += 1;
            }
            _ => {
                colon = false;
                end += 1;
            }
        }
    }

    if start < end {
        modules.push(unsafe { str::from_utf8_unchecked(&demangled_name.as_bytes()[start..end]) });
    }

    for module in modules.iter() {
        println!("Module {}", module);
    }

    // let mut position = 0;
    // for segment in demangled_name.split("::") {
    //     println!("Segment {}", segment);
    // }

    modules.shrink_to_fit();
    modules.to_slice()
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

    // let bytes_len = demangled_name.as_bytes().len();
    // if demangled_name.as_bytes()[0] != b'<' {
    //     return None;
    //     // panic!("Failed to parse type as trait: didn't start with '<' character");
    // }
    // if demangled_name.as_bytes()[bytes_len - 1] != b'>' {
    //     return None;
    //     // panic!("Failed to parse type as trait: didn't end with '>' character");
    // }

    // let demangled_name =
    //     unsafe { str::from_utf8_unchecked(&demangled_name.as_bytes()[1..(bytes_len - 1)]) };

    // let mut tokens = demangled_name.split_ascii_whitespace();

    // let type_name = tokens.next()?;
    // // .expect("Failed to parse type as trait: missing type name");

    // // Token 'as'
    // let _ = tokens.next()?;
    // // .expect("Failed to parse type as trait: missing 'as' token");

    // let trait_name = tokens.next()?;
    // // .expect("Failed to parse type as trait: missing trait name");

    // Some((type_name, trait_name))
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

    // if start < end {
    //     let segment = unsafe { str::from_utf8_unchecked(&demangled_name.as_bytes()[start..end]) };

    //     if demangled_name.as_bytes()[start] == b'<' {
    //         let (type_name, trait_name) = parse_type_as_trait(segment);

    //         modules.push(ModuleSegment::TypeAsTrait(type_name, trait_name));
    //     } else {
    //         modules.push(ModuleSegment::Group(segment));
    //     }
    // }

    // for module in modules.iter() {
    //     println!("Module {:?}", module);
    // }

    // let mut position = 0;
    // for segment in demangled_name.split("::") {
    //     println!("Segment {}", segment);
    // }

    // modules.shrink_to_fit();
    // modules.to_slice()
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
