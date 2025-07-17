use std::hash::{DefaultHasher, Hash, Hasher};

#[derive(Clone, Copy)]
pub struct DwNode<'a> {
    pub ty: DwNodeType,
    pub name: SymbolName<'a>,
    pub size: u32,
    pub fn_index: u32,
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
    hash: u64,
    name: &'a str,
}

impl<'a> SymbolName<'a> {
    pub fn root() -> Self {
        const NAME: &'static str = "<root>";
        let mut hasher = DefaultHasher::new();
        NAME.hash(&mut hasher);
        let hash = hasher.finish();

        Self { hash, name: NAME }
    }

    pub fn new_with_parent(parent: SymbolName<'a>, name: &'a str) -> Self {
        let mut hasher = DefaultHasher::new();
        parent.hash.hash(&mut hasher);
        name.hash(&mut hasher);
        let hash = hasher.finish();

        Self { hash, name }
    }

    pub fn as_str(&self) -> &'a str {
        self.name
    }
}
