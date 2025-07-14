use core::{slice, str};
use std::{
    fmt::Debug,
    hash::Hash,
    mem::forget,
    ops::{Deref, DerefMut}, // ptr::{NonNull, slice_from_raw_parts, slice_from_raw_parts_mut},
};

use super::{Arena, array::Array};

pub struct String<'a> {
    inner: Array<'a, u8>,
}

impl<'a> String<'a> {
    pub fn new(arena: &'a Arena, capacity: usize) -> Self {
        Self {
            inner: Array::new(arena, capacity),
        }
    }

    pub fn from_str(arena: &'a Arena, string: &str) -> Self {
        let capacity = string.len();

        let mut inner = Array::new(arena, capacity);
        inner.extend_from_slice(string.as_bytes());
        Self { inner }
    }

    #[inline]
    pub fn shrink_to_fit(&mut self) {
        self.inner.shrink_to_fit();
    }

    #[inline]
    pub fn push_str(&mut self, string: &str) {
        self.inner.extend_from_slice(string.as_bytes());
    }

    #[inline]
    pub fn clear(&mut self) {
        self.inner.clear();
    }

    pub fn as_str(&self) -> &str {
        self
    }

    pub fn to_str(self) -> &'a str {
        let str = unsafe {
            str::from_utf8_unchecked(slice::from_raw_parts(self.inner.as_ptr(), self.inner.len()))
        };
        forget(self);
        str
    }
}

impl<'a> Deref for String<'a> {
    type Target = str;

    fn deref(&self) -> &Self::Target {
        unsafe { std::str::from_utf8_unchecked(self.inner.as_slice()) }
    }
}

impl<'a> DerefMut for String<'a> {
    fn deref_mut(&mut self) -> &mut Self::Target {
        unsafe { std::str::from_utf8_unchecked_mut(self.inner.as_mut_slice()) }
    }
}

impl std::fmt::Debug for String<'_> {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        Debug::fmt(self.as_str(), f)
    }
}

impl<'a> Hash for String<'a> {
    fn hash<H: std::hash::Hasher>(&self, state: &mut H) {
        self.inner.hash(state);
    }
}

impl std::fmt::Write for String<'_> {
    fn write_str(&mut self, s: &str) -> std::fmt::Result {
        self.inner.write_str(s)
    }
}

impl PartialEq for String<'_> {
    fn eq(&self, other: &Self) -> bool {
        self.as_str().eq(other.as_str())
    }
}
impl Eq for String<'_> {}
