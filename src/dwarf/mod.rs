use std::{
    hash::{DefaultHasher, Hash, Hasher},
    time::Instant,
};

use gimli::{
    AttributeValue, DW_AT_high_pc, DW_AT_inline, DW_AT_linkage_name, DW_AT_low_pc, DW_AT_name,
    DW_AT_specification, DW_INL_inlined, DW_TAG_namespace, DW_TAG_structure_type,
    DW_TAG_subprogram, EndianSlice, LittleEndian, UnitType,
};
use hashbrown::{DefaultHashBuilder, HashMap};

use crate::arena::{Arena, array::Array, scratch::scratch_arena, string::String, tree::Tree};

#[derive(Clone, Copy)]
pub struct DwNode<'a> {
    pub ty: DwNodeType,
    pub name: SymbolName<'a>,
    pub size: u32,
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum DwNodeType {
    Namespace,
    Struct,
    Impl,
    FunctionInstance,
    FunctionInlinedInstance,
}

#[derive(Clone, Copy, Debug, Hash, PartialEq, Eq)]
pub struct SymbolName<'a> {
    parent_hash: u64,
    name: &'a str,
}

impl<'a> SymbolName<'a> {
    pub fn root() -> Self {
        const NAME: &'static str = "<root>";

        Self {
            parent_hash: 0,
            name: NAME,
        }
    }

    pub fn new_with_parent(parent: SymbolName<'a>, name: &'a str) -> Self {
        let mut hasher = DefaultHasher::new();
        parent.hash(&mut hasher);
        let parent_hash = hasher.finish();

        Self { parent_hash, name }
    }

    pub fn as_str(&self) -> &'a str {
        self.name
    }
}

pub struct DwData<'a> {
    pub nodes: Tree<'a, DwNode<'a>>,
}

impl<'a> DwData<'a> {
    pub fn from_raw_sections(
        arena: &'a Arena,
        debug_sections: &Vec<(&'a str, &'a [u8]), &'a Arena>,
    ) -> Self {
        let mut dw_node_tree = Tree::new(
            arena,
            1024,
            DwNode {
                ty: DwNodeType::Namespace,
                name: SymbolName::root(),
                size: 0,
            },
        );

        let start = Instant::now();
        let dwarf = gimli::Dwarf::load::<_, ()>(|section_id| {
            let section = debug_sections
                .iter()
                .find(|section| section.0 == section_id.name())
                .map_or::<&[u8], _>(&[], |section| section.1);

            Ok(EndianSlice::new(section, LittleEndian))
        })
        .expect("Failed to load the DWARF info");

        let root_symbol_name = dw_node_tree.root().name;

        let scratch = scratch_arena(&[arena]);
        let mut dw_node_stack = Array::new(&scratch, 128);
        let mut dw_node_name_lookup =
            HashMap::<SymbolName<'a>, usize, DefaultHashBuilder, &Arena>::with_capacity_in(
                0, &scratch,
            );

        let mut units = dwarf.units();
        while let Ok(Some(unit_header)) = units.next() {
            if unit_header.type_() != UnitType::Compilation {
                println!("Unity type '{:?}' not supported!", unit_header.type_());
                continue;
            }

            let unit = dwarf.unit(unit_header).unwrap();
            let unit_ref = unit.unit_ref(&dwarf);

            dw_node_stack.clear();
            dw_node_stack.push((1, 0, root_symbol_name));

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

                // If we are climbing up the DEI tree or going to the next sibling,
                // we need to potentially pop entries from the stack.
                if depth_diff <= 0 {
                    while let Some((count, idx, _)) = dw_node_stack.last_mut() {
                        // If we are climbing down not enouth to pop a node from stack
                        // then we just adjust the depth and break from this loop
                        if *count > -depth_diff {
                            *count += depth_diff;
                            break;
                        } else {
                            depth_diff += *count;
                            *count = 0;
                        }

                        // Remove if necessary
                        let idx = *idx;
                        if idx == dw_node_tree.len() - 1
                            && matches!(
                                dw_node_tree[idx].value.ty,
                                DwNodeType::Namespace | DwNodeType::Struct
                            )
                            && dw_node_tree[idx].first_child.is_none()
                        {
                            dw_node_name_lookup.remove(&dw_node_tree[idx].value.name);
                            dw_node_tree.pop();
                        }

                        dw_node_stack.pop();
                    }
                }

                // If offset is 1, we are processing a child entry, so we should update
                // parent index with the previous function group index
                if depth_diff == 1 {
                    dw_node_stack
                        .last_mut()
                        .expect("Failed to get entry from the stack. This is likely a bug")
                        .0 += 1;
                }

                let (_, parent_dw_node_idx, parent_symbol_name) = dw_node_stack
                    .last()
                    .copied()
                    .expect("Failed to get entry from the stack. This is likely a bug");

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
                                            attr.string_value(&dwarf.debug_str).unwrap().slice(),
                                        )
                                    };
                                }
                            }
                        }

                        let new_symbol_name =
                            SymbolName::new_with_parent(parent_symbol_name, name_str);

                        let dw_node_idx = match dw_node_name_lookup.get(&new_symbol_name).copied() {
                            Some(dw_node_idx) => dw_node_idx,
                            None => {
                                let ty = match abbreviation.tag() {
                                    DW_TAG_structure_type => DwNodeType::Struct,
                                    DW_TAG_namespace if name_str.starts_with("{impl#") => {
                                        DwNodeType::Impl
                                    }
                                    _ => DwNodeType::Namespace,
                                };

                                dw_node_tree.add_child(
                                    parent_dw_node_idx,
                                    DwNode {
                                        ty,
                                        name: new_symbol_name,
                                        size: 0,
                                    },
                                );
                                let new_dw_node_idx = dw_node_tree.len() - 1;

                                dw_node_name_lookup.insert(new_symbol_name, new_dw_node_idx);

                                new_dw_node_idx
                            }
                        };

                        dw_node_stack.push((0, dw_node_idx, new_symbol_name));
                    }
                    DW_TAG_structure_type if depth > 1 => {
                        let mut name_str = "";

                        for attr_spec in abbreviation.attributes() {
                            if let Ok(attr) = entries.read_attribute(*attr_spec) {
                                if attr.name() == DW_AT_name {
                                    name_str = unsafe {
                                        str::from_utf8_unchecked(
                                            attr.string_value(&dwarf.debug_str).unwrap().slice(),
                                        )
                                    };
                                }
                            }
                        }

                        let new_symbol_name =
                            SymbolName::new_with_parent(parent_symbol_name, name_str);

                        let dw_node_idx = match dw_node_name_lookup.get(&new_symbol_name).copied() {
                            Some(dw_node_idx) => dw_node_idx,
                            None => {
                                dw_node_tree.add_child(
                                    parent_dw_node_idx,
                                    DwNode {
                                        ty: DwNodeType::Struct,
                                        name: new_symbol_name,
                                        size: 0,
                                    },
                                );
                                let new_dw_node_idx = dw_node_tree.len() - 1;

                                dw_node_name_lookup.insert(new_symbol_name, new_dw_node_idx);

                                new_dw_node_idx
                            }
                        };

                        dw_node_stack.push((0, dw_node_idx, new_symbol_name));
                    }
                    DW_TAG_subprogram => {
                        let mut linkage_name = "";
                        let mut name = "";
                        let mut specification = None;
                        let mut inlined = false;
                        let mut low_pc = 0;
                        let mut high_pc = 0;

                        for attr_spec in abbreviation.attributes() {
                            let attr = entries.read_attribute(*attr_spec).unwrap();

                            #[allow(non_upper_case_globals)]
                            #[allow(non_snake_case)]
                            match attr.name() {
                                DW_AT_name => {
                                    if let Some(attr_value) = attr.string_value(&dwarf.debug_str) {
                                        name =
                                            unsafe { str::from_utf8_unchecked(attr_value.slice()) };
                                    }
                                }
                                DW_AT_linkage_name => {
                                    if let Some(attr_value) = attr.string_value(&dwarf.debug_str) {
                                        linkage_name =
                                            unsafe { str::from_utf8_unchecked(attr_value.slice()) };
                                    }
                                }
                                DW_AT_specification => {
                                    if let AttributeValue::UnitRef(unit_offset) = attr.raw_value() {
                                        specification = Some(unit_offset);
                                    }
                                }
                                DW_AT_inline => {
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
                                        panic!("Unable to parse 'low_pc' attribute: '{:?}'", attr);
                                    }
                                },
                                DW_AT_high_pc => match attr.raw_value() {
                                    AttributeValue::Addr(addr) => {
                                        high_pc = addr - low_pc;
                                    }
                                    AttributeValue::Data4(data) => high_pc = data as u64,
                                    _ => {
                                        panic!("Unable to parse 'high_pc' attribute: '{:?}'", attr);
                                    }
                                },
                                _ => {}
                            }
                        }

                        // When the name is empty, it's usually an inline DEI of a previously
                        // declared function. In those cases, we can get the original function
                        // info by looking at the symbol at the given specification location.
                        if name.is_empty() {
                            if let Some(specification) = specification {
                                let entry = unit.entry(specification).expect(&format!(
                                    "Failed to resolve specification offset: '{}'",
                                    offset.0
                                ));

                                let name = entry
                                    .attr(DW_AT_linkage_name)
                                    .unwrap()
                                    .unwrap()
                                    .string_value(&dwarf.debug_str)
                                    .unwrap();
                                let name = unsafe { str::from_utf8_unchecked(name.slice()) };
                                let index = *dw_node_name_lookup
                                    .get(&SymbolName::new_with_parent(SymbolName::root(), name))
                                    .unwrap();

                                debug_assert!(
                                    matches!(
                                        dw_node_tree.get(index).ty,
                                        DwNodeType::FunctionInstance
                                            | DwNodeType::FunctionInlinedInstance
                                    ),
                                    "Unexpected node type: '{:?}'",
                                    dw_node_tree.get(index).ty
                                );

                                dw_node_tree.get_mut(index).ty =
                                    DwNodeType::FunctionInlinedInstance;
                            }
                        } else {
                            let function_symbol_name =
                                SymbolName::new_with_parent(parent_symbol_name, name);

                            let function_linkage_name =
                                SymbolName::new_with_parent(SymbolName::root(), linkage_name);

                            if dw_node_name_lookup.get(&function_linkage_name).is_none() {
                                dw_node_tree.add_child(
                                    parent_dw_node_idx,
                                    DwNode {
                                        ty: if !inlined {
                                            DwNodeType::FunctionInstance
                                        } else {
                                            DwNodeType::FunctionInlinedInstance
                                        },
                                        name: function_symbol_name,
                                        size: high_pc as u32,
                                    },
                                );

                                let new_dw_node_idx = dw_node_tree.len() - 1;

                                dw_node_name_lookup.insert(function_linkage_name, new_dw_node_idx);
                            };
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

        dw_node_tree.shrink_to_fit();
        drop(dw_node_name_lookup);
        drop(dw_node_stack);
        drop(scratch);

        //////////////////////////////////////////////
        // Compute the final sizes of namespace nodes
        for idx in (0..dw_node_tree.len()).rev() {
            let size = dw_node_tree.get(idx).size;
            if let Some(parent_idx) = dw_node_tree.get_parent_index(idx) {
                dw_node_tree.get_mut(parent_idx).size += size;
            }
        }

        //////////////////////////////////////////////////////
        // Assign more appropriate names for Rust impl blocks
        // by extracting the struct and trait types from one
        // of the symbols' demangled name.
        let scratch = scratch_arena(&[arena]);
        for idx in (0..dw_node_tree.len()).rev() {
            if !matches!(dw_node_tree.get(idx).ty, DwNodeType::Namespace)
                && !dw_node_tree.get(idx).name.as_str().starts_with("{#impl")
            {
                continue;
            }

            let Some(child_idx) = dw_node_tree.get_children(idx).next() else {
                continue;
            };

            let demangled_name =
                demangled_name(&scratch, dw_node_tree.get(child_idx).name.as_str());

            if let Some((type_name, trait_name)) = extract_trait_from_demangled_name(demangled_name)
            {
                let mut trait_impl_name =
                    String::new(arena, type_name.len() + trait_name.len() + " for ".len());

                trait_impl_name.push_str(trait_name);
                trait_impl_name.push_str(" for ");
                trait_impl_name.push_str(type_name);

                dw_node_tree.get_mut(idx).name.name = trait_impl_name.to_str();
            }
        }

        println!("Dwarf parsing: {}s", (Instant::now() - start).as_secs_f32());

        Self {
            nodes: dw_node_tree,
        }
    }
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

fn parse_type_as_trait<'a>(demangled_name: &'a str) -> Option<(&'a str, &'a str)> {
    if demangled_name.is_empty() {
        return None;
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
