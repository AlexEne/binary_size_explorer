use std::{
    alloc::Allocator,
    cell::Cell,
    mem::MaybeUninit,
    ptr::{NonNull, slice_from_raw_parts_mut},
};

pub mod array;
pub mod scratch;
pub mod string;

#[cfg(unix)]
mod memory {
    use libc;
    use std::ptr::NonNull;

    pub unsafe fn virtual_reserve(len: usize) -> NonNull<u8> {
        unsafe {
            let ptr = libc::mmap(
                std::ptr::null_mut(),
                len,
                libc::PROT_NONE,
                libc::MAP_ANONYMOUS | libc::MAP_PRIVATE,
                -1,
                0,
            );

            if !ptr.is_null() && !std::ptr::eq(ptr, libc::MAP_FAILED) {
                NonNull::new_unchecked(ptr.cast())
            } else {
                panic!("Failed to reserve virtual memory");
            }
        }
    }

    pub unsafe fn virtual_commit(ptr: NonNull<u8>, len: usize) {
        unsafe {
            if libc::mprotect(ptr.as_ptr().cast(), len, libc::PROT_READ | libc::PROT_WRITE) != 0 {
                panic!("Failed to commit virtual memory");
            }
        }
    }

    pub unsafe fn virtual_release(ptr: NonNull<u8>, len: usize) {
        unsafe {
            if libc::munmap(ptr.as_ptr().cast(), len) == -1 {
                panic!("Failed to release virtual memory");
            }
        }
    }
}

#[cfg(windows)]
mod memory {
    use std::ptr::NonNull;
    use windows_sys::Win32::System::Memory::{
        MEM_COMMIT, MEM_RELEASE, MEM_RESERVE, PAGE_READWRITE, VirtualAlloc, VirtualFree,
    };

    pub unsafe fn virtual_reserve(size: usize) -> NonNull<u8> {
        unsafe {
            let ptr = VirtualAlloc(std::ptr::null(), size, MEM_RESERVE, PAGE_READWRITE);

            if !ptr.is_null() {
                NonNull::new_unchecked(ptr.cast())
            } else {
                panic!("Failed to reserve virtual memory");
            }
        }
    }

    pub unsafe fn virtual_commit(ptr: NonNull<u8>, size: usize) {
        unsafe {
            VirtualAlloc(ptr.as_ptr().cast(), size, MEM_COMMIT, PAGE_READWRITE);
        }
    }

    pub unsafe fn virtual_release(ptr: NonNull<u8>, _: usize) {
        unsafe {
            if VirtualFree(ptr.as_ptr().cast(), 0, MEM_RELEASE) == 0 {
                panic!("Failed to release virtual memory");
            }
        }
    }
}

const ALLOCATION_CHUNCK_SIZE: usize = 64 * 1024;

macro_rules! assert_pow_of_2 {
    ($len:expr) => {
        assert!(($len & ($len - 1)) == 0)
    };
}

/// Trait that can be implemented by any type `T` to signal
/// that given a block of memory with aligment `std::mem::align_of::<T>`
/// and size `std::mem::align_of::<T>`, that memory represents
/// a valid object of type `T` regardless of which bytes
/// are in there.
pub unsafe trait AnyBits {}

/// Trait that can be implemented by any type `T` to signal
/// that given a block of zero bytes of memory with aligment
/// `std::mem::align_of::<T>` and size `std::mem::align_of::<T>`,
/// that memory represents a valid object of type `T`.
pub unsafe trait ZeroBits {}

/// An arena allocator.
pub struct Arena {
    buffer: NonNull<u8>,
    capacity: usize,
    offset: Cell<usize>,
    commited: Cell<usize>,
}

impl Arena {
    pub const fn empty() -> Self {
        Self {
            buffer: NonNull::dangling(),
            capacity: 0,
            offset: Cell::new(0),
            commited: Cell::new(0),
        }
    }

    pub fn new(capacity: usize) -> Self {
        // debug_assert!(capacity != 0);

        let capacity = unsafe { usize::unchecked_add(capacity, ALLOCATION_CHUNCK_SIZE - 1) }
            & !(ALLOCATION_CHUNCK_SIZE - 1);

        let buffer = unsafe { memory::virtual_reserve(capacity) };

        Self {
            buffer,
            capacity,
            commited: Cell::new(0),
            offset: Cell::new(0),
        }
    }

    /// Allocates a region of memory with the alignment and size
    /// of type `T`.
    ///
    /// The memory is not initialised and it's up
    /// to the caller to initialise the returned block of memory
    /// before using it.
    pub fn alloc_unint<T>(&self) -> &mut MaybeUninit<T> {
        let size = std::mem::size_of::<MaybeUninit<T>>();
        let align = std::mem::align_of::<MaybeUninit<T>>();

        let ptr = self.alloc_raw(size, align).as_ptr();

        unsafe { &mut *ptr.cast() }
    }

    /// Allocates a region of memory with the alignment and size
    /// of type `T`.
    ///
    /// The memory is not initialised and it's up
    /// to the caller to initialise the returned block of memory
    /// before using it.
    pub fn alloc_new<T: AnyBits>(&self) -> &mut T {
        let size = std::mem::size_of::<T>();
        let align = std::mem::align_of::<T>();

        let ptr = self.alloc_raw(size, align).as_ptr();

        unsafe { &mut *ptr.cast() }
    }

    /// Allocates a region of memory with the alignment and size
    /// of type `T`.
    ///
    /// The memory is guaranteed to contain only zero bytes.
    pub fn alloc_zeroed<T: ZeroBits>(&self) -> &mut T {
        let size = std::mem::size_of::<T>();
        let align = std::mem::align_of::<T>();

        let ptr = self.alloc_raw(size, align).cast::<u8>().as_ptr();
        unsafe {
            std::ptr::write_bytes(ptr, 0, size);
        }

        unsafe { &mut *ptr.cast() }
    }

    pub fn alloc_slice_zeroed<T: ZeroBits>(&self, len: usize) -> &mut [T] {
        let size = std::mem::size_of::<T>();
        let align = std::mem::align_of::<T>();

        let ptr = self.alloc_raw(size * len, align).cast::<u8>().as_ptr();
        unsafe {
            std::ptr::write_bytes(ptr, 0, size * len);
        }

        unsafe { &mut *slice_from_raw_parts_mut::<T>(ptr.cast(), len) }
    }

    #[track_caller]
    pub fn alloc_raw(&self, size: usize, align: usize) -> NonNull<[u8]> {
        assert_pow_of_2!(align);

        let mut start = self.offset.get();
        let module = start & (align - 1);
        if module > 0 {
            start += align - module;
        }
        let end = start + size;

        if end > self.commited.get() {
            let new_commited = (end + ALLOCATION_CHUNCK_SIZE - 1) & !(ALLOCATION_CHUNCK_SIZE - 1);

            if new_commited > self.capacity {
                panic!("Failed to allocate from Arena: not enough capacity");
            }

            unsafe {
                memory::virtual_commit(
                    self.buffer.add(self.commited.get()),
                    new_commited - self.commited.get(),
                );
            }
            self.commited.set(new_commited);
        }

        self.offset.set(end);
        unsafe { NonNull::slice_from_raw_parts(self.buffer.add(start), end - start) }
    }

    pub fn shrink(&self, ptr: NonNull<u8>, old_size: usize, new_size: usize) {
        debug_assert!(old_size >= new_size);

        // It only makes sense to shrink the last allocation.
        // The arena doesn't handle deallocation and it will
        // not re-allocate any released memory in between two allocations
        if unsafe { ptr.add(old_size) == self.buffer.add(self.offset.get()) } {
            self.offset.set(self.offset.get() - (old_size - new_size));
        } else {
            debug_assert!(
                false,
                "Attempting to shrink memory that was not the last allocated"
            );
        }
    }

    pub fn grow(&self, ptr: NonNull<u8>, old_size: usize, new_size: usize) {
        debug_assert!(old_size <= new_size);

        // If it's
        if unsafe { ptr.add(old_size) == self.buffer.add(self.offset.get()) } {
            self.offset.set(self.offset.get() - (old_size - new_size));
        } else {
            debug_assert!(
                false,
                "Attempting to shrink memory that was not the last allocated"
            );
        }
    }

    /// The offset of the arena represents the number of bytes
    /// reserved by allocations so far.
    pub(super) fn offset(&self) -> usize {
        self.offset.get()
    }

    /// Resets the `offset` of the arena, effectivelly "freeing"
    /// all previous allocations.
    ///
    /// It's the callee responsability to ensure that no allocations
    /// (i.e., mutable references) returned by this arena still exists.
    ///
    /// This call will not actually free memory. So dangling pointers
    /// can still point to accessible memory, so be careful!!.
    pub(super) unsafe fn reset(&self, offset: usize) {
        self.offset.set(offset);
    }
}

unsafe impl Allocator for Arena {
    fn allocate(
        &self,
        layout: std::alloc::Layout,
    ) -> Result<NonNull<[u8]>, std::alloc::AllocError> {
        Ok(self.alloc_raw(layout.size(), layout.align()))
    }

    unsafe fn deallocate(&self, ptr: NonNull<u8>, layout: std::alloc::Layout) {
        // No-op
    }

    fn allocate_zeroed(
        &self,
        layout: std::alloc::Layout,
    ) -> Result<NonNull<[u8]>, std::alloc::AllocError> {
        let ptr = self.allocate(layout)?;
        // SAFETY: `alloc` returns a valid memory block
        unsafe { ptr.cast::<u8>().as_ptr().write_bytes(0, layout.size()) }
        Ok(ptr)
    }

    unsafe fn grow(
        &self,
        ptr: NonNull<u8>,
        old_layout: std::alloc::Layout,
        new_layout: std::alloc::Layout,
    ) -> Result<NonNull<[u8]>, std::alloc::AllocError> {
        std::debug_assert!(
            new_layout.size() >= old_layout.size(),
            "`new_layout.size()` must be greater than or equal to `old_layout.size()`"
        );

        // Handle the case where we are growing the last allocation.
        if unsafe { ptr.add(old_layout.size()) == self.buffer.add(self.offset.get()) } {
            self.offset
                .set(self.offset.get() + (new_layout.size() - old_layout.size()));
            return Ok(NonNull::slice_from_raw_parts(ptr, new_layout.size()));
        } else {
            // We want to completely descourage this from happening
            debug_assert!(
                false,
                "Attempting to grow memory that was not the last allocated"
            );

            let new_ptr = self.allocate(new_layout)?.cast::<u8>();

            // SAFETY: because `new_layout.size()` must be greater than or equal to
            // `old_layout.size()`, both the old and new memory allocation are valid for reads and
            // writes for `old_layout.size()` bytes. Also, because the old allocation wasn't yet
            // deallocated, it cannot overlap `new_ptr`. Thus, the call to `copy_nonoverlapping` is
            // safe. The safety contract for `dealloc` must be upheld by the caller.
            unsafe {
                std::ptr::copy_nonoverlapping(ptr.as_ptr(), new_ptr.as_ptr(), old_layout.size());
                self.deallocate(ptr, old_layout);
            }

            Ok(NonNull::slice_from_raw_parts(new_ptr, new_layout.size()))
        }
    }

    unsafe fn grow_zeroed(
        &self,
        ptr: NonNull<u8>,
        old_layout: std::alloc::Layout,
        new_layout: std::alloc::Layout,
    ) -> Result<NonNull<[u8]>, std::alloc::AllocError> {
        std::debug_assert!(
            new_layout.size() >= old_layout.size(),
            "`new_layout.size()` must be greater than or equal to `old_layout.size()`"
        );

        // Handle the case where we are growing the last allocation.
        if unsafe { ptr.add(old_layout.size()) == self.buffer.add(self.offset.get()) } {
            self.offset
                .set(self.offset.get() + (new_layout.size() - old_layout.size()));

            unsafe {
                ptr.add(old_layout.size())
                    .write_bytes(0, new_layout.size() - old_layout.size());
            }

            return Ok(NonNull::slice_from_raw_parts(ptr, new_layout.size()));
        } else {
            // We want to completely descourage this from happening
            debug_assert!(
                false,
                "Attempting to grow memory that was not the last allocated"
            );

            let new_ptr = self.allocate_zeroed(new_layout)?.cast::<u8>();

            // SAFETY: because `new_layout.size()` must be greater than or equal to
            // `old_layout.size()`, both the old and new memory allocation are valid for reads and
            // writes for `old_layout.size()` bytes. Also, because the old allocation wasn't yet
            // deallocated, it cannot overlap `new_ptr`. Thus, the call to `copy_nonoverlapping` is
            // safe. The safety contract for `dealloc` must be upheld by the caller.
            unsafe {
                std::ptr::copy_nonoverlapping(ptr.as_ptr(), new_ptr.as_ptr(), old_layout.size());
                self.deallocate(ptr, old_layout);
            }

            return Ok(NonNull::slice_from_raw_parts(new_ptr, new_layout.size()));
        }
    }

    unsafe fn shrink(
        &self,
        ptr: NonNull<u8>,
        old_layout: std::alloc::Layout,
        new_layout: std::alloc::Layout,
    ) -> Result<NonNull<[u8]>, std::alloc::AllocError> {
        std::debug_assert!(
            new_layout.size() <= old_layout.size(),
            "`new_layout.size()` must be smaller than or equal to `old_layout.size()`"
        );

        self.shrink(ptr, old_layout.size(), new_layout.size());

        Ok(NonNull::slice_from_raw_parts(ptr, new_layout.size()))
    }

    fn by_ref(&self) -> &Self
    where
        Self: Sized,
    {
        self
    }
}

impl Drop for Arena {
    fn drop(&mut self) {
        unsafe {
            if self.buffer != NonNull::dangling() {
                memory::virtual_release(self.buffer, self.capacity);
            }
        }
    }
}
