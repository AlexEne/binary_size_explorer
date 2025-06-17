#![warn(clippy::all, rust_2018_idioms)]
#![cfg_attr(not(debug_assertions), windows_subsystem = "windows")] // hide console window on Windows in release

use std::str::FromStr;

use binary_size_explorer::arena::{Arena, array::Array};
// struct Arena {}

// impl Arena {
//     pub fn new(capacity: usize) -> Self {
//         unimplemented!()
//     }

//     pub fn alloc_unint<T>(&self) -> &mut MaybeUninit<T> {
//         unimplemented!()
//     }

//     pub fn alloc_zeroed<T>(&self) -> &mut T {
//         unimplemented!()
//     }
// }

struct Test<'s> {
    count: &'s usize,
}

impl Allocatable for Test<'static> {
    type Item<'a>
        = Test<'a>
    where
        Self: 'a;

    fn new<'s>(arena: &'s Arena) -> Self::Item<'s> {
        Self::Item {
            count: unsafe { arena.alloc_unint::<usize>().assume_init_mut() },
        }
    }
}

trait Allocatable {
    type Item<'a>
    where
        Self: 'a;

    fn new<'s>(arena: &'s Arena) -> Self::Item<'s>;
}

struct ArenaAllocated<T: Allocatable + 'static> {
    arena: Arena,
    value: T::Item<'static>,
}

impl<T: Allocatable> ArenaAllocated<T> {
    pub fn new(arena: Arena) -> Self {
        let value = T::new(unsafe { std::mem::transmute::<&Arena, &Arena>(&arena) });
        Self { arena, value }
    }
}

impl<T: Allocatable> ArenaAllocated<T> {
    fn as_ref(&self) -> &T::Item<'_> {
        unsafe { std::mem::transmute(&self.value) }
    }

    fn as_mut(&mut self) -> &mut T::Item<'_> {
        unsafe { std::mem::transmute(&mut self.value) }
    }
}

struct State {
    // arena: Arena,
    // test: Test<'static>,
    allocate: ArenaAllocated<Test<'static>>,
}

// When compiling natively:
fn main() -> eframe::Result {
    // let mut v = Vec::new();
    // v.remove(index)
    // v.shrink_to_fit()
    //     String::from_str(s)
    // let mut s = String::new();
    // s.to_lowercase()
    // s.push_str(string);

    // let v = {
    //     let arena = Arena::new(1024);

    //     let mut vec = Vec::with_capacity(4);
    //     vec.push(0);
    //     // vec.as_slice(iter);
    //     vec.extend_from_slice(&[0, 1, 2, 3]);

    //     let mut array = Array::new(&arena, 4);
    //     array.push(0);
    //     array.extend_from_slice(&[0, 1, 2, 3]);

    //     let mut state = State {
    //         allocate: ArenaAllocated::new(arena),
    //     };

    //     let v = state.allocate.as_mut().count;
    //     println!("Count {}", *v);
    //     // v
    // };

    env_logger::init(); // Log to stderr (if you run with `RUST_LOG=debug`).

    let native_options = eframe::NativeOptions {
        viewport: egui::ViewportBuilder::default().with_inner_size([600.0, 400.0]),
        ..Default::default()
    };
    eframe::run_native(
        "Binary Size Explorer",
        native_options,
        Box::new(|cc| Ok(Box::new(binary_size_explorer::TemplateApp::new(cc)))),
    )
}
