use std::{
    fmt::Debug,
    hash::Hash,
    ops::{Deref, DerefMut}, // ptr::{NonNull, slice_from_raw_parts, slice_from_raw_parts_mut},
};

use super::{Arena, array::Array};

pub struct String<'a> {
    // arena: &'a Arena,
    innner: Array<'a, u8>, // ptr: NonNull<u8>,
                           // len: usize,
                           // capacity: usize,
}

impl<'a> String<'a> {
    pub fn new(arena: &'a Arena, capacity: usize) -> Self {
        // let ptr = arena.alloc_raw(std::mem::size_of::<u8>(), std::mem::align_of::<u8>());

        Self {
            innner: Array::new(arena, capacity), // arena,
                                                 // ptr,
                                                 // len: 0,
                                                 // capacity,
        }
    }

    pub fn from_str(arena: &'a Arena, string: &str) -> Self {
        let capacity = string.len();

        let mut inner = Array::new(arena, capacity);
        inner.extend_from_slice(string.as_bytes());
        Self { innner: inner }
    }

    #[inline]
    pub fn shrink_to_fit(&mut self) {
        self.innner.shrink_to_fit();
    }

    #[inline]
    pub fn push_str(&mut self, string: &str) {
        self.innner.extend_from_slice(string.as_bytes());
    }

    pub fn as_str(&self) -> &str {
        self
    }
}

impl<'a> Deref for String<'a> {
    type Target = str;

    fn deref(&self) -> &Self::Target {
        unsafe {
            std::str::from_utf8_unchecked(self.innner.as_slice())
            // std::str::from_utf8_unchecked(&*slice_from_raw_parts(self.ptr.as_ptr(), self.len))
        }
    }
}

impl<'a> DerefMut for String<'a> {
    fn deref_mut(&mut self) -> &mut Self::Target {
        unsafe {
            std::str::from_utf8_unchecked_mut(self.innner.as_mut_slice())
            // std::str::from_utf8_unchecked_mut(&mut *slice_from_raw_parts_mut(
            //     self.ptr.as_ptr(),
            //     self.len,
            // ))
        }
    }
}

impl std::fmt::Debug for String<'_> {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        Debug::fmt(self.as_str(), f)
    }
}

impl<'a> Hash for String<'a> {
    fn hash<H: std::hash::Hasher>(&self, state: &mut H) {
        self.innner.hash(state);
    }
}

impl std::fmt::Write for String<'_> {
    fn write_str(&mut self, s: &str) -> std::fmt::Result {
        self.innner.write_str(s)
    }
}

impl PartialEq for String<'_> {
    fn eq(&self, other: &Self) -> bool {
        self.as_str().eq(other.as_str())
    }
}
impl Eq for String<'_> {}
