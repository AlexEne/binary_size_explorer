pub struct FunctionProperty {
    pub raw_name: String,
    pub demangled_name: Option<String>,
    pub monomorphization_of: Option<String>,
    pub shallow_size_bytes: u32,
    pub shallow_size_percent: f32,
    pub retained_size_bytes: u32,
    pub retained_size_percent: f32,
}

impl FunctionProperty {
    pub fn name(&self) -> &str {
        if let Some(demangled_name) = self.demangled_name.as_ref() {
            demangled_name
        } else {
            &self.raw_name
        }
    }
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

pub trait FunctionsView {
    fn set_view_mode(&mut self, view_mode: ViewMode);
    fn set_filter(&mut self, filter: Filter);
    fn get_total_size(&self) -> u32;
    fn get_total_percent(&self) -> f32;

    fn get_locals_at(&self, idx: usize) -> &[String];
    fn get_ops_at(&self, idx: usize) -> &[FunctionOp];
    fn get_start_addr(&self, idx: usize) -> u64;
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
