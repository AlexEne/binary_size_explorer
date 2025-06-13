use std::{
    hash::Hash,
    ops::{Deref, DerefMut, Index, IndexMut},
    ptr::{NonNull, copy_nonoverlapping, slice_from_raw_parts_mut},
    slice::{self, SliceIndex},
};

use super::Arena;

/// A contiguous array type.
pub struct Array<'a, T> {
    #[allow(unused)]
    arena: &'a Arena,

    buf: NonNull<T>,
    len: usize,
    capacity: usize,
}

impl<'a, T> Array<'a, T> {
    #[track_caller]
    pub fn new(arena: &'a Arena, capacity: usize) -> Self {
        Self {
            arena,
            buf: arena
                .alloc_raw(
                    std::mem::size_of::<T>() * capacity,
                    std::mem::align_of::<T>(),
                )
                .cast(),
            len: 0,
            capacity,
        }
    }

    #[inline]
    pub fn shrink_to_fit(&mut self) {
        // The capacity is never less than the length, and there's nothing to do when
        // they are equal.
        if self.capacity > self.len {
            self.arena.shrink(self.buf.cast(), self.capacity, self.len);
            self.capacity = self.len();
        }
    }

    /// Appends an element to the back of the array.
    ///
    /// # Panics
    ///
    /// Panics if the new length exceeds the array's capacity.
    ///
    /// # Examples
    ///
    /// ```
    /// # use binary_size_explorer::arena::Arena;
    /// # use binary_size_explorer::arena::array::Array;
    ///
    /// let arena = Arena::new(1024);
    /// let mut arr = Array::new(&arena, 4);
    /// arr.push(1);
    /// arr.push(2);
    /// arr.push(3);
    /// assert_eq!(arr.as_slice(), [1, 2, 3]);
    /// ```
    ///
    /// # Time complexity
    ///
    /// Takes *O*(1) time.
    #[inline]
    #[track_caller]
    pub fn push(&mut self, item: T) {
        if self.len == self.capacity {
            panic!("Not enough capacity {}", self.capacity);
        }

        unsafe { self.buf.add(self.len).write(item) };
        self.len += 1;
    }

    /// Removes the last element from a array and returns it, or [`None`] if it
    /// is empty.
    ///
    /// # Examples
    ///
    /// ```
    /// # use binary_size_explorer::arena::Arena;
    /// # use binary_size_explorer::arena::array::Array;
    ///
    /// let arena = Arena::new(1024);
    /// let mut arr = Array::new(&arena, 4);
    /// arr.extend_from_slice(&[1, 2, 3]);
    /// assert_eq!(arr.pop(), Some(3));
    /// assert_eq!(arr.as_slice(), [1, 2]);
    /// ```
    ///
    /// # Time complexity
    ///
    /// Takes *O*(1) time.
    #[inline]
    pub fn pop(&mut self) -> Option<T> {
        if self.len == 0 {
            return None;
        }

        self.len -= 1;

        Some(unsafe { std::ptr::read(self.buf.add(self.len).as_ptr()) })
    }

    /// Clones and appends all elements in a slice to the `Array`.
    ///
    /// This will effectivelly memcopy the arrays from `slice`
    /// into the next available elements of this `Array`.
    ///
    /// # Panics
    ///
    /// This function will panic if there is not enough capacity
    /// left in this `Array` to copy the entire slice.
    ///
    /// # Examples
    ///
    /// ```
    /// # use binary_size_explorer::arena::Arena;
    /// # use binary_size_explorer::arena::array::Array;
    ///
    /// let arena = Arena::new(1024);
    /// let mut arr = Array::new(&arena, 4);
    /// arr.push(1);
    /// arr.extend_from_slice(&[2, 3, 4]);
    /// assert_eq!(arr.as_slice(), &[1, 2, 3, 4]);
    /// ```
    #[track_caller]
    pub fn extend_from_slice(&mut self, slice: &[T])
    where
        T: Copy,
    {
        if self.capacity - self.len < slice.len() {
            panic!(
                "Not enough capacity {}<{}",
                self.capacity,
                self.len + slice.len()
            );
        }

        unsafe { &mut *slice_from_raw_parts_mut(self.buf.add(self.len).as_ptr(), slice.len()) }
            .copy_from_slice(slice);

        self.len += slice.len();
    }

    #[track_caller]
    pub unsafe fn extend_from_slice_unchecked(&mut self, slice: &[T]) {
        if self.capacity - self.len < slice.len() {
            panic!(
                "Not enough capacity {}<{}",
                self.capacity,
                self.len + slice.len()
            );
        }

        unsafe {
            copy_nonoverlapping(slice.as_ptr(), self.buf.as_ptr(), slice.len());
        }
        // unsafe { &mut *slice_from_raw_parts_mut(self.buf.add(self.len).as_ptr(), slice.len()) }
        //     .cop(slice);

        self.len += slice.len();
    }

    /// Clears the array, removing all values.
    ///
    /// Note that this method has no effect on the allocated capacity
    /// of the array.
    ///
    /// # Examples
    ///
    /// ```
    /// # use binary_size_explorer::arena::Arena;
    /// # use binary_size_explorer::arena::array::Array;
    ///
    /// let arena = Arena::new(1024);
    /// let mut arr = Array::new(&arena, 4);
    /// arr.extend_from_slice(&[1, 2, 3]);
    ///
    /// arr.clear();
    ///
    /// assert!(arr.is_empty());
    /// ```
    #[inline]
    pub fn clear(&mut self) {
        self.len = 0;
    }

    /// Returns the number of elements in the array, also referred to
    /// as its 'length'.
    ///
    /// # Examples
    ///
    /// ```
    /// # use binary_size_explorer::arena::Arena;
    /// # use binary_size_explorer::arena::array::Array;
    ///
    /// let arena = Arena::new(1024);
    /// let mut arr = Array::new(&arena, 4);
    /// arr.extend_from_slice(&[1, 2, 3]);
    /// assert_eq!(arr.len(), 3);
    /// ```
    pub const fn len(&self) -> usize {
        self.len
    }

    /// Returns `true` if the array contains no elements.
    ///
    /// # Examples
    ///
    /// ```
    /// # use binary_size_explorer::arena::Arena;
    /// # use binary_size_explorer::arena::array::Array;
    ///
    /// let arena = Arena::new(1024);
    /// let mut arr = Array::new(&arena, 4);
    /// assert!(arr.is_empty());
    ///
    /// arr.push(1);
    /// assert!(!arr.is_empty());
    /// ```
    pub const fn is_empty(&self) -> bool {
        self.len() == 0
    }

    /// Extracts a slice containing the entire array.
    ///
    /// Equivalent to `&s[..]`.
    ///
    /// # Examples
    ///
    /// ```
    /// # use binary_size_explorer::arena::Arena;
    /// # use binary_size_explorer::arena::array::Array;
    ///
    /// use std::io::{self, Write};
    /// let arena = Arena::new(1024);
    /// let buffer = Array::new(&arena, 4);
    /// io::sink().write(buffer.as_slice()).unwrap();
    /// ```
    #[inline]
    pub const fn as_slice(&self) -> &[T] {
        // SAFETY: `slice::from_raw_parts` requires pointee is a contiguous, aligned buffer of size
        // `len` containing properly-initialized `T`s. Data must not be mutated for the returned
        // lifetime. Further, `len * mem::size_of::<T>` <= `ISIZE::MAX`, and allocation does not
        // "wrap" through overflowing memory addresses.
        //
        // * Array API guarantees that self.buf:
        //      * contains only properly-initialized items within 0..len
        //      * is aligned, contiguous, and valid for `len` reads
        //      * obeys size and address-wrapping constraints
        //
        // * We only construct `&mut` references to `self.buf` through `&mut self` methods; borrow-
        //   check ensures that it is not possible to mutably alias `self.buf` within the
        //   returned lifetime.
        unsafe { slice::from_raw_parts(self.as_ptr(), self.len) }
    }

    /// Extracts a mutable slice of the entire array.
    ///
    /// Equivalent to `&mut s[..]`.
    ///
    /// # Examples
    ///
    /// ```
    /// # use binary_size_explorer::arena::Arena;
    /// # use binary_size_explorer::arena::array::Array;
    ///
    /// use std::io::{self, Read};
    /// let arena = Arena::new(1024);
    /// let mut buffer = Array::new(&arena, 4);
    /// io::repeat(0b101).read_exact(buffer.as_mut_slice()).unwrap();
    /// ```
    #[inline]
    pub const fn as_mut_slice(&mut self) -> &mut [T] {
        // SAFETY: `slice::from_raw_parts_mut` requires pointee is a contiguous, aligned buffer of
        // size `len` containing properly-initialized `T`s. Data must not be accessed through any
        // other pointer for the returned lifetime. Further, `len * mem::size_of::<T>` <=
        // `ISIZE::MAX` and allocation does not "wrap" through overflowing memory addresses.
        //
        // * Array API guarantees that self.buf:
        //      * contains only properly-initialized items within 0..len
        //      * is aligned, contiguous, and valid for `len` reads
        //      * obeys size and address-wrapping constraints
        //
        // * We only construct references to `self.buf` through `&self` and `&mut self` methods;
        //   borrow-check ensures that it is not possible to construct a reference to `self.buf`
        //   within the returned lifetime.
        unsafe { slice::from_raw_parts_mut(self.as_mut_ptr(), self.len) }
    }

    /// Returns a raw pointer to the array's buffer.
    ///
    /// The caller must ensure that the array outlives the pointer this
    /// function returns, or else it will end up dangling.
    ///
    /// The caller must also ensure that the memory the pointer (non-transitively) points to
    /// is never written to (except inside an `UnsafeCell`) using this pointer or any pointer
    /// derived from it. If you need to mutate the contents of the slice, use [`as_mut_ptr`].
    ///
    /// This method guarantees that for the purpose of the aliasing model, this method
    /// does not materialize a reference to the underlying slice, and thus the returned pointer
    /// will remain valid when mixed with other calls to [`as_ptr`], [`as_mut_ptr`],
    /// and [`as_non_null`].
    ///
    /// [`as_mut_ptr`]: Array::as_mut_ptr
    /// [`as_ptr`]: Array::as_ptr
    /// [`as_non_null`]: Array::as_non_null
    #[inline]
    pub const fn as_ptr(&self) -> *const T {
        // We shadow the slice method of the same name to avoid going through
        // `deref`, which creates an intermediate reference.
        self.buf.as_ptr()
    }

    /// Returns a raw mutable pointer to the array's buffer.
    ///
    /// The caller must ensure that the array outlives the pointer this
    /// function returns, or else it will end up dangling.
    ///
    /// This method guarantees that for the purpose of the aliasing model, this method
    /// does not materialize a reference to the underlying slice, and thus the returned pointer
    /// will remain valid when mixed with other calls to [`as_ptr`], [`as_mut_ptr`],
    /// and [`as_non_null`].
    ///
    /// [`as_mut_ptr`]: Array::as_mut_ptr
    /// [`as_ptr`]: Array::as_ptr
    /// [`as_non_null`]: Array::as_non_null
    #[inline]
    pub const fn as_mut_ptr(&mut self) -> *mut T {
        // We shadow the slice method of the same name to avoid going through
        // `deref_mut`, which creates an intermediate reference.
        self.buf.as_ptr()
    }

    /// Returns a `NonNull` pointer to the array's buffer.
    ///
    /// The caller must ensure that the array outlives the pointer this
    /// function returns, or else it will end up dangling.
    ///
    /// This method guarantees that for the purpose of the aliasing model, this method
    /// does not materialize a reference to the underlying slice, and thus the returned pointer
    /// will remain valid when mixed with other calls to [`as_ptr`], [`as_mut_ptr`],
    /// and [`as_non_null`].
    ///
    /// [`as_mut_ptr`]: Array::as_mut_ptr
    /// [`as_ptr`]: Array::as_ptr
    /// [`as_non_null`]: Array::as_non_null
    #[inline]
    pub fn as_non_null(&mut self) -> NonNull<T> {
        self.buf
    }
}

impl<'a, Idx, T> Index<Idx> for Array<'a, T>
where
    Idx: SliceIndex<[T]>,
{
    type Output = Idx::Output;

    fn index(&self, index: Idx) -> &Self::Output {
        &self.as_slice()[index]
    }
}

impl<'a, Idx, T> IndexMut<Idx> for Array<'a, T>
where
    Idx: SliceIndex<[T]>,
{
    fn index_mut(&mut self, index: Idx) -> &mut Self::Output {
        &mut self.as_mut_slice()[index]
    }
}

impl<'a, T> Deref for Array<'a, T> {
    type Target = [T];

    fn deref(&self) -> &Self::Target {
        self.as_slice()
    }
}

impl<'a, T> DerefMut for Array<'a, T> {
    fn deref_mut(&mut self) -> &mut Self::Target {
        self.as_mut_slice()
    }
}

impl<'a, T: PartialEq> PartialEq for Array<'a, T> {
    fn eq(&self, other: &Self) -> bool {
        if self.len != other.len {
            return false;
        }

        for i in 0..self.len {
            if self[i] != other[i] {
                return false;
            }
        }
        true
    }
}
impl<'a, T: Eq> Eq for Array<'a, T> {}

impl<'a, T: Hash> Hash for Array<'a, T> {
    fn hash<H: std::hash::Hasher>(&self, state: &mut H) {
        for index in 0..self.len {
            self[index].hash(state);
        }
    }
}

impl<'a> std::fmt::Write for Array<'a, u8> {
    fn write_str(&mut self, s: &str) -> std::fmt::Result {
        if (self.capacity - self.len) < s.len() {
            return Err(std::fmt::Error);
        }

        self.extend_from_slice(s.as_bytes());
        Ok(())
    }
}
