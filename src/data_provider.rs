pub struct FunctionProperty {
    pub raw_name: String,
    pub demangled_name: Option<String>,
    pub monomorphization_of: Option<String>,
    pub shallow_size_bytes: u32,
    pub shallow_size_percent: f32,
    pub retained_size_bytes: u32,
    pub retained_size_percent: f32,
}

pub struct FunctionPropertyDebugInfo {
    pub locals: Vec<String>,
    pub function_ops: Vec<FunctionOp>,
}

pub struct FunctionOp {
    pub address: u64,
    pub op: String,
}

impl FunctionOp {
    pub fn new(addr: u64, decoded_asm: String) -> FunctionOp {
        FunctionOp {
            address: addr,
            op: decoded_asm,
        }
    }
}

#[derive(Clone, Copy, Default, Debug, PartialEq, Eq)]
pub enum ViewMode {
    #[default]
    Tops,
    Dominators,
}

pub trait FunctionsView: TopsView + DominatorsView {
    fn set_view_mode(&mut self, view_mode: ViewMode);
    fn set_filter(&mut self, filter: Filter);
    fn get_total_size(&self) -> u32;
    fn get_total_percent(&self) -> f32;
}

#[derive(Clone, Debug, Default, Eq, PartialEq, serde::Serialize, serde::Deserialize)]
pub enum Filter {
    #[default]
    All,
    NameFilter {
        name: String,
    },
}

impl Filter {
    pub fn name_filter(name: impl Into<String>) -> Filter {
        Filter::NameFilter {
            name: name.into().to_lowercase(),
        }
    }
}

pub trait TopsView {
    fn get_tops_items_count(&self) -> usize;
    fn get_tops_item_at(&self, idx: usize) -> &FunctionProperty;

    fn get_locals_at(&self, idx: usize) -> &[String];
    fn get_ops_at(&self, idx: usize) -> &[FunctionOp];
    fn get_start_addr(&self, idx: usize) -> u64;
}

pub trait DominatorsView {
    fn get_roots(&self) -> &Vec<usize>;
    fn get_dominator_item_at(&self, idx: usize) -> &FunctionProperty;
    fn get_children_of(&self, idx: usize) -> &Vec<usize>;
    fn is_child_visible(&self, idx: usize) -> bool;
    fn set_child_open(&mut self, idx: usize, open: bool);
    fn is_child_open(&self, idx: usize) -> bool;
}

#[derive(Debug)]
pub struct DwarfLocationData {
    pub file: Option<String>,
    pub line: Option<u32>,
    pub column: Option<u32>,
}

#[derive(Debug, Eq, Clone, Hash, PartialEq)]
pub struct CodeLocation {
    pub file: String,
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
