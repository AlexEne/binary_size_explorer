use wasmparser::Operator;

use crate::arena::{array::Array, string::String};

#[derive(Clone, Copy)]
pub struct FunctionProperty<'a> {
    pub raw_name: &'a str,
    pub demangled_name: Option<&'a str>,
    pub monomorphization_of: Option<&'a str>,
    pub shallow_size_bytes: u32,
    pub shallow_size_percent: f32,
    pub retained_size_bytes: u32,
    pub retained_size_percent: f32,
}

impl FunctionProperty<'_> {
    pub fn name(&self) -> &str {
        if let Some(demangled_name) = self.demangled_name.as_ref() {
            demangled_name
        } else {
            &self.raw_name
        }
    }
}

pub struct FunctionPropertyDebugInfo<'a> {
    pub locals: Array<'a, &'a str>,
    pub function_ops: Array<'a, FunctionOp<'a>>,
}

pub struct FunctionOp<'a> {
    pub address: u64,
    pub op: Operator<'a>,
}

impl<'a> FunctionOp<'a> {
    pub fn new(addr: u64, op: Operator<'a>) -> FunctionOp<'a> {
        FunctionOp { address: addr, op }
    }
}

#[derive(Clone, Copy, Default, Debug, PartialEq, Eq)]
pub enum ViewMode {
    #[default]
    Tops,
    Dominators,
}

pub trait FunctionsView {
    fn set_view_mode(&mut self, view_mode: ViewMode);
    fn set_filter(&mut self, filter: Filter);
    fn get_total_size(&self) -> u32;
    fn get_total_percent(&self) -> f32;

    fn get_locals_at(&self, idx: usize) -> &[&str];
    fn get_ops_at(&self, idx: usize) -> &[FunctionOp];
    fn get_start_addr(&self, idx: usize) -> u64;
}

#[derive(Debug, Eq, PartialEq)]
pub enum Filter<'a> {
    All,
    NameFilter { name: &'a str },
}

impl<'a> Filter<'a> {
    pub fn name_filter(name: &'a str) -> Self {
        Filter::NameFilter { name }
    }
}

#[derive(Debug)]
pub struct DwarfLocationData<'a> {
    pub file: Option<String<'a>>,
    pub line: Option<u32>,
    pub column: Option<u32>,
}

#[derive(Debug, Eq, Hash, PartialEq)]
pub struct CodeLocation<'a> {
    pub file: String<'a>,
    pub line: u32,
    pub column: u32,
}

pub trait SourceCodeView {
    fn get_location_for_addr(&self, virtual_addr: u64) -> Option<&CodeLocation>;
    fn get_locations_for_line_of_code(
        &self,
        file: &str,
        line: u32,
        column: u32,
    ) -> Option<&Vec<u64>>;
}
