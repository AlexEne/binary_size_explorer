use std::ops::{Deref, DerefMut};

use crate::arena::Arena;

pub struct Vec<'a, T> {
    inner: std::vec::Vec<T, &'a Arena>,
}

impl<'a, T> Vec<'a, T> {
    pub fn new(arena: &'a Arena, capacity: usize) -> Self {
        Self {
            inner: std::vec::Vec::with_capacity_in(capacity, arena),
        }
    }
}

impl<'a, T> IntoIterator for Vec<'a, T> {
    type Item = <std::vec::Vec<T, &'a Arena> as IntoIterator>::Item;
    type IntoIter = <std::vec::Vec<T, &'a Arena> as IntoIterator>::IntoIter;

    #[inline(always)]
    fn into_iter(self) -> Self::IntoIter {
        self.inner.into_iter()
    }
}

impl<'a, T> Deref for Vec<'a, T> {
    type Target = std::vec::Vec<T, &'a Arena>;

    #[inline(always)]
    fn deref(&self) -> &Self::Target {
        &self.inner
    }
}

impl<'a, T> DerefMut for Vec<'a, T> {
    #[inline(always)]
    fn deref_mut(&mut self) -> &mut Self::Target {
        &mut self.inner
    }
}
