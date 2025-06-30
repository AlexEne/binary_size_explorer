use std::{collections::HashSet, hash::DefaultHasher, usize};

use hashbrown::{DefaultHashBuilder, HashMap};
use petgraph::{algo::dominators::Dominators, visit};
use wasmparser::{Encoding, FuncType, FunctionBody, Operator};

use crate::arena::{Arena, array::Array, scratch::scratch_arena, string::String};

pub struct WasmData<'a> {
    pub bytes: &'a [u8],

    /// The wasm version of the processed data.
    pub version: u16,

    /// Types section
    pub types_section: TypeSection<'a>,

    /// Functions section
    pub functions_section: FunctionSection<'a>,

    pub functions_dominators: Option<Dominators<usize>>,
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
            function_bodies: Array::new(arena, 0),
            function_called: Array::new(arena, 0),
            function_groups: Array::new(arena, 0),
            function_count: 0,
        };

        let mut root_idx = 0;
        let mut total = 0;

        let scratch = scratch_arena(&[arena]);
        let mut function_group_name_lookup =
            HashMap::<&str, usize, DefaultHashBuilder, &Arena>::with_capacity_in(0, &scratch);
        let mut function_groups = Array::new(arena, 0);

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
                    functions_section.function_called = Array::new(arena, count as usize);
                    for _ in 0..count {
                        functions_section.function_names.push("");
                    }

                    // TODO: (bruno) something better than 5 * count!
                    function_groups = Array::new(arena, 5 * count as usize);
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

                                            let demangled_name = demangled_name(arena, naming.name);

                                            let group_names = split_modules2(arena, demangled_name);
                                            let group_names_count = group_names.len();
                                            if group_names_count > 0 {
                                                let mut parent_group_idx = None;

                                                for i in 0..group_names_count {
                                                    let group_idx = match function_group_name_lookup
                                                        .get(group_names[i])
                                                        .copied()
                                                    {
                                                        Some(group_idx) => group_idx,
                                                        None => {
                                                            let new_group_idx =
                                                                function_groups.len();
                                                            function_groups.push(FunctionGroup {
                                                                name: group_names[i],
                                                                fn_index: None,
                                                                parent: parent_group_idx,
                                                                next_sibling: None,
                                                                first_child: None,
                                                                last_child: None,
                                                            });
                                                            function_group_name_lookup.insert(
                                                                group_names[i],
                                                                new_group_idx,
                                                            );

                                                            if let Some(parent_group_idx) =
                                                                parent_group_idx
                                                            {
                                                                if let Some(last_child_idx) =
                                                                    function_groups
                                                                        [parent_group_idx]
                                                                        .last_child
                                                                {
                                                                    function_groups
                                                                        [last_child_idx]
                                                                        .next_sibling =
                                                                        Some(new_group_idx);

                                                                    function_groups
                                                                        [parent_group_idx]
                                                                        .last_child =
                                                                        Some(new_group_idx);
                                                                } else {
                                                                    function_groups
                                                                        [parent_group_idx]
                                                                        .first_child =
                                                                        Some(new_group_idx);
                                                                    function_groups
                                                                        [parent_group_idx]
                                                                        .last_child =
                                                                        Some(new_group_idx);
                                                                }
                                                            }

                                                            new_group_idx
                                                        }
                                                    };

                                                    if i == group_names_count - 1 {
                                                        function_groups[group_idx].fn_index = Some(
                                                            naming.index as usize - imports_count,
                                                        );
                                                    }

                                                    parent_group_idx = Some(group_idx);
                                                }
                                            }

                                            println!(
                                                "Functio name {} {}",
                                                naming.index, demangled_name
                                            );

                                            functions_section.function_names
                                                [naming.index as usize - imports_count] =
                                                demangled_name;
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

        functions_section.function_groups = function_groups;
        // function_groups.shrink_to_fit();

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

        let mut wasm_data = Self {
            bytes,
            version,
            types_section,
            functions_section,
            functions_dominators: None,
        };

        let dominators = petgraph::algo::dominators::simple_fast(&wasm_data, usize::MAX);

        // for dom in dominators.immediately_dominated_by(dominators.root()) {
        //     println!("{:?}", dom);
        // }

        // print(&wasm_data, dominators.root(), &dominators, 0);

        wasm_data.functions_dominators = Some(dominators);

        wasm_data
    }
}

fn print<'a>(data: &WasmData<'a>, node: usize, dominators: &Dominators<usize>, indent: usize) {
    for _ in 0..indent {
        print!("\t");
    }

    if node != usize::MAX {
        println!("{}", data.functions_section.function_names[node]);
    } else {
        println!("root");
    }

    for child in dominators.immediately_dominated_by(node) {
        if node != child {
            print(data, child, dominators, indent + 1);
        }
    }
}

impl<'a> visit::GraphBase for WasmData<'a> {
    type EdgeId = ();

    type NodeId = usize;
}

impl<'a> visit::Visitable for WasmData<'a> {
    type Map = HashSet<usize>;

    fn visit_map(self: &Self) -> Self::Map {
        HashSet::with_capacity(self.functions_section.function_count)
    }

    fn reset_map(self: &Self, map: &mut Self::Map) {
        map.clear();
    }
}

impl<'a, 'b> visit::IntoNeighbors for &'b WasmData<'a> {
    type Neighbors = std::vec::IntoIter<usize>;

    fn neighbors(self, a: Self::NodeId) -> Self::Neighbors {
        if a == usize::MAX {
            let mut neighbors = Vec::with_capacity(self.functions_section.function_count);
            for i in 0..self.functions_section.function_count {
                neighbors.push(i);
            }
            neighbors.into_iter()
        } else {
            let mut neighbors = Vec::with_capacity(self.functions_section.function_called[a].len());
            neighbors.extend_from_slice(self.functions_section.function_called[a].as_slice());
            neighbors.into_iter()
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
    pub function_names: Array<'a, &'a str>,
    pub function_bodies: Array<'a, FunctionBody<'a>>,
    pub function_called: Array<'a, Array<'a, usize>>,

    pub function_groups: Array<'a, FunctionGroup<'a>>,
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

pub struct FunctionGroup<'a> {
    pub name: &'a str,
    pub fn_index: Option<usize>,
    pub parent: Option<usize>,
    pub next_sibling: Option<usize>,
    pub first_child: Option<usize>,
    pub last_child: Option<usize>,
}

// pub struct TreeArray<'a> {
//     pub indices: Array<'a>,
// }

// impl<'a> TreeArray<'a> {
//     pub fn new(arena: &'a Arena, capacity: usize) -> Self {

//     }

//     pub fn push_root(&mut self, index: usize) {
//         self.indices.push(item);
//     }

//     #[inline]
//     pub fn push(&mut self, parent_position: usize, ) {

//     }
// }

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

    while end < demangled_name.len() {
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
