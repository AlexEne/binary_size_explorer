use std::ops::Range;
use wasmparser::{Encoding, FuncType, FunctionBody};

use crate::arena::{Arena, array::Array, string::String};

pub struct WasmData<'a> {
    pub bytes: &'a [u8],

    /// The wasm version of the processed data.
    pub version: u16,

    /// Types section
    pub types_section: TypeSection<'a>,

    /// Functions section
    pub functions_section: FunctionSection<'a>,

    /// All the `debug_*` sections in the bundle.
    pub debug_sections: Vec<(&'a str, &'a [u8]), &'a Arena>,
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
            range: Default::default(),
            function_types: Array::new(arena, 0),
            function_names: Array::new(arena, 0),
            function_original_names: Array::new(arena, 0),
            function_sizes: Array::new(arena, 0),
            function_bodies: Array::new(arena, 0),
            function_called: Array::new(arena, 0),
            function_count: 0,
        };
        let mut debug_sections = Vec::new_in(arena);

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

                                            let linkage_name = naming.name;
                                            let demangled_name =
                                                demangled_name(arena, linkage_name);

                                            functions_section.function_names
                                                [(naming.index - imports_count) as usize] =
                                                demangled_name;
                                            functions_section.function_original_names
                                                [(naming.index - imports_count) as usize] =
                                                linkage_name;
                                        }
                                    }
                                    _ => {}
                                }
                            }
                        }
                        wasmparser::KnownCustom::Unknown => {
                            if custom_section_reader.name().starts_with(".debug") {
                                debug_sections.push((
                                    custom_section_reader.name(),
                                    custom_section_reader.data(),
                                ));
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

        Self {
            bytes,
            version,
            types_section,
            functions_section,
            debug_sections,
        }
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

fn demangled_name<'a>(arena: &'a Arena, name: &'a str) -> &'a str {
    use std::fmt::Write;
    let demangled_symbol = rustc_demangle::demangle(name);

    // Demangled names should be shorter, generally, but adding buffer here just in case
    let mut demangled_name = String::new(arena, name.len() * 2);

    _ = write!(&mut demangled_name, "{}", demangled_symbol);

    demangled_name.shrink_to_fit();
    demangled_name.to_str()
}
