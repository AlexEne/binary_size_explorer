use wasmparser::{Encoding, FuncType, FunctionBody};

use crate::arena::{Arena, array::Array};

pub struct WasmData<'a> {
    pub bytes: &'a [u8],

    /// The wasm version of the processed data.
    pub version: u16,

    /// Types section
    pub types_section: TypeSection<'a>,

    /// Functions section
    pub functions_section: FunctionSection<'a>,
}

impl<'a> WasmData<'a> {
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
            function_count: 0,
        };

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

                        table.
                    }
                }
                // wasmparser::Payload::MemorySection(section_limited) => todo!(),
                // wasmparser::Payload::TagSection(section_limited) => todo!(),
                // wasmparser::Payload::GlobalSection(section_limited) => todo!(),
                // wasmparser::Payload::ExportSection(section_limited) => todo!(),
                // wasmparser::Payload::StartSection { func, range } => todo!(),
                // wasmparser::Payload::ElementSection(section_limited) => todo!(),
                // wasmparser::Payload::DataCountSection { count, range } => todo!(),
                // wasmparser::Payload::DataSection(section_limited) => todo!(),
                wasmparser::Payload::CodeSectionStart { count, .. } => {
                    functions_section.function_bodies = Array::new(arena, count as usize);

                    functions_section.function_names = Array::new(arena, count as usize);
                    for _ in 0..count {
                        functions_section.function_names.push("");
                    }
                    functions_section.function_count = count as usize;
                }
                wasmparser::Payload::CodeSectionEntry(function_body) => {
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

                                            functions_section.function_names
                                                [naming.index as usize - imports_count] =
                                                naming.name;
                                        }
                                    }
                                    // wasmparser::Name::Local(section_limited) => todo!(),
                                    // wasmparser::Name::Label(section_limited) => todo!(),
                                    // wasmparser::Name::Type(section_limited) => todo!(),
                                    // wasmparser::Name::Table(section_limited) => todo!(),
                                    // wasmparser::Name::Memory(section_limited) => todo!(),
                                    // wasmparser::Name::Global(section_limited) => todo!(),
                                    // wasmparser::Name::Element(section_limited) => todo!(),
                                    // wasmparser::Name::Data(section_limited) => todo!(),
                                    // wasmparser::Name::Field(section_limited) => todo!(),
                                    // wasmparser::Name::Tag(section_limited) => todo!(),
                                    // wasmparser::Name::Unknown { ty, data, range } => todo!(),
                                    _ => {}
                                }
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

pub struct FunctionSection<'a> {
    pub function_types: Array<'a, usize>,
    pub function_names: Array<'a, &'a str>,
    pub function_bodies: Array<'a, FunctionBody<'a>>,
    pub function_count: usize,
}

pub struct TableSection<'a> {
    pub tables: Array<'a, usize>,
}
