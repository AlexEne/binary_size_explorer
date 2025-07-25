use wasmparser::{Operator, ValType};

use crate::{arena::array::Array, dwarf::DwLineInfo};

#[derive(Clone, Copy)]
pub struct FunctionProperty<'a> {
    pub raw_name: &'a str,
    pub monomorphization_of: Option<&'a str>,
    pub shallow_size_bytes: u32,
    pub shallow_size_percent: f32,
    pub retained_size_bytes: u32,
    pub retained_size_percent: f32,
}

pub struct FunctionPropertyDebugInfo<'a> {
    pub locals: Array<'a, (u32, ValType)>,
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

    fn get_locals_at(&self, idx: usize) -> &[(u32, ValType)];
    fn get_ops_at(&self, idx: usize) -> &[FunctionOp];
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

pub trait SourceCodeView {
    fn get_line_info_for_addr(&self, virtual_addr: u64) -> Option<&DwLineInfo>;
}
