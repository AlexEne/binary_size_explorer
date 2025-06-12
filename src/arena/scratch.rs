use std::{ops::Deref, ptr::NonNull};

use super::Arena;

static mut SCRATCH_ARENAS: [Arena; 2] = [Arena::empty(), Arena::empty()];

pub struct ScratchArena<'s> {
    arena: &'s Arena,
    offset: usize,
}

impl Drop for ScratchArena<'_> {
    fn drop(&mut self) {
        unsafe {
            self.arena.reset(self.offset);
        }
    }
}

impl Deref for ScratchArena<'_> {
    type Target = Arena;

    fn deref(&self) -> &Self::Target {
        &self.arena
    }
}

pub fn scratch_arena(arenas: &[Arena]) -> ScratchArena<'_> {
    unsafe {
        for sa in &mut SCRATCH_ARENAS[..] {
            if sa.buffer == NonNull::dangling() {
                *sa = Arena::new(2 * 1024 * 1024);
            }

            for arena in arenas {
                if sa.buffer == arena.buffer {
                    break;
                }
            }

            return ScratchArena {
                arena: sa,
                offset: sa.offset(),
            };
        }
    }

    panic!("Not possible to allocated scratch arena")
}
