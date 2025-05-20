pub struct FunctionProperty {
    pub raw_name: String,
    pub shallow_size_bytes: u32,
    pub shallow_size_percent: f32,
    pub retained_size_bytes: u32,
    pub retained_size_percent: f32,
}

pub struct FunctionPropertyDebugInfo {
    pub raw_name: String,
    pub demangled_name: Option<String>,
    pub monomorphization_of: Option<String>,
    pub shallow_size_bytes: String,
    pub shallow_size_percent: String,
    pub retained_size_bytes: String,
    pub retained_size_percent: String,
    pub locals: Vec<String>,
    pub function_ops: Vec<String>,
}

pub trait DataProvider {
    fn get_functions_count(&self) -> usize;
    fn str_get_name_at(&self, idx: usize) -> &str;
    fn str_get_monomorphization_of_at(&self, idx: usize) -> Option<&str>;
    fn str_get_shallow_size_bytes_at(&self, idx: usize) -> &str;
    fn str_get_shallow_size_percent_at(&self, idx: usize) -> &str;
    fn str_get_retained_size_bytes_at(&self, idx: usize) -> &str;
    fn str_get_retained_size_percent_at(&self, idx: usize) -> &str;
    fn get_property_at(&self, idx: usize) -> &FunctionProperty;
}

#[derive(Debug, Default, Eq, PartialEq, serde::Serialize, serde::Deserialize)]
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

pub trait FilterView {
    fn get_filtered_items_count(&self) -> usize;
    fn get_item_at(&self, idx: usize) -> &FunctionPropertyDebugInfo;
    fn set_filter(&mut self, filter: Filter);
    fn get_total_size(&self) -> u32;
    fn get_total_percent(&self) -> f32;
    fn get_locals_at(&self, idx: usize) -> &[String];
    fn get_ops_at(&self, idx: usize) -> &[String];
}
