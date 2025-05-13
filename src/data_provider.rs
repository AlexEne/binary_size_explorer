struct WasmObjectData {}

pub struct FunctionProperty {
    pub raw_name: String,
    pub size_bytes: u32,
    pub shallow_size_bytes: u32,
    pub shallow_size_percent: f32,
    pub retained_size_percent: f32,
}

pub trait DataProvider {
    fn get_functions_count(&self) -> usize;
    fn str_get_name_at(&self, idx: usize) -> &str;
    fn str_get_demangled_name_at(&self, idx: usize) -> Option<&str>;
    fn str_get_size_bytes_at(&self, idx: usize) -> &str;
    fn str_get_shallow_size_bytes_at(&self, idx: usize) -> &str;
    fn str_get_shallow_size_percent_at(&self, idx: usize) -> &str;
    fn str_get_retained_size_percent_at(&self, idx: usize) -> &str;
    fn get_property_at(&self, idx: usize) -> &FunctionProperty;
}
