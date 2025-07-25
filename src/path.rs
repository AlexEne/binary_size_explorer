use std::{ffi::OsStr, io::Write, os::unix::ffi::OsStrExt, path::Path};

use crate::arena::Arena;

pub struct PathExt;

impl PathExt {
    /// Join the given paths into a single contiguous path.
    pub fn join_all<'a>(arena: &'a Arena, paths: &[&Path]) -> &'a Path {
        let mut len = paths.len();
        for path in paths {
            len += path.as_os_str().as_bytes().len();
        }

        let buff = arena.alloc_slice_zeroed::<u8>(len);

        let mut idx = 0;
        for path in paths {
            if idx != 0 {
                buff[idx] = b'/';
                idx += 1;
            }

            let path_len = path.as_os_str().as_bytes().len();
            let mut slice = &mut buff[idx..(idx + path_len)];
            slice
                .write_all(path.as_os_str().as_bytes())
                .expect("Failed to write path into buffer");
            idx += path_len;
        }

        Path::new(OsStr::from_bytes(&buff[0..idx]))
    }
}
