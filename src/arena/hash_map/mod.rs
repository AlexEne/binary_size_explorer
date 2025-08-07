use core::slice;
use core::{
    hash::{BuildHasher, Hash},
    marker::PhantomData,
    mem::MaybeUninit,
    ptr::NonNull,
};

use crate::arena::Arena;

struct HashedKey<T> {
    key: T,
    hash: u64,
}

#[derive(PartialEq, Eq)]
#[repr(u8)]
enum SlotState {
    Free = 0,
    Occupied = 1,
    Tomstone = 2,
}

struct HashEntry<K, V> {
    value: MaybeUninit<(K, V)>,
    occupied: SlotState,
}

pub type DefaultHashBuilder = foldhash::fast::RandomState;

pub struct HashMap<'a, K, V, S> {
    hash_builder: S,
    // values: Vec<'a, HashEntry<HashedKey<K>, V>>,
    values: Option<NonNull<HashEntry<HashedKey<K>, V>>>,
    len: usize,
    capacity: usize,
    allocator: &'a Arena,
    _mark: PhantomData<crate::arena::vec::Vec<'a, HashEntry<HashedKey<K>, V>>>,
}

impl<'a, K, V, S> HashMap<'a, K, V, S>
where
    K: Eq + Hash,
    S: BuildHasher,
{
    pub fn with_hasher(arena: &'a Arena, capacity: usize, hash_builder: S) -> Self {
        Self {
            hash_builder,
            values: Some(
                arena
                    .alloc_raw(
                        std::mem::size_of::<HashEntry<HashedKey<K>, V>>() * capacity,
                        std::mem::align_of::<HashEntry<HashedKey<K>, V>>(),
                    )
                    .cast(),
            ),
            len: 0,
            capacity,
            allocator: arena,
            _mark: PhantomData,
        }
    }

    #[track_caller]
    pub fn insert(&mut self, key: K, value: V) {
        let key_hash = self.hash_builder.hash_one(&key);

        let len = self.len;
        let capacity = self.capacity;

        if len == capacity {
            self.grow();
        }

        let len = self.len;
        let capacity = self.capacity;

        let Some(values) = self.values else {
            panic!("Failed to insert into the map: no buffer allocated");
        };
        let values = unsafe { slice::from_raw_parts_mut(values.as_ptr(), capacity) };

        let idx = key_hash as usize % capacity;
        let mut cur_idx = idx;
        loop {
            if values[cur_idx].occupied != SlotState::Occupied {
                values[cur_idx].value.write((
                    HashedKey {
                        key,
                        hash: key_hash,
                    },
                    value,
                ));
                values[cur_idx].occupied = SlotState::Occupied;
                self.len += 1;
                break;
            } else {
                let item = unsafe { values[cur_idx].value.assume_init_mut() };
                if item.0.hash == key_hash && item.0.key == key {
                    item.1 = value;
                    break;
                }
            }

            cur_idx = (cur_idx + 1) % capacity;
        }
    }

    fn grow(&mut self) {
        let old_capacity = self.capacity;
        let Some(old_buffer) = self.values else {
            panic!("Attempting to grow an empty map")
        };

        let new_capacity = old_capacity * 2;
        let new_buffer: NonNull<HashEntry<HashedKey<K>, V>> = self
            .allocator
            .alloc_raw_zeroed(
                std::mem::size_of::<HashEntry<HashedKey<K>, V>>() * new_capacity,
                std::mem::align_of::<HashEntry<HashedKey<K>, V>>(),
            )
            .cast();

        {
            let old_items = unsafe { slice::from_raw_parts_mut(old_buffer.as_ptr(), old_capacity) };
            let new_items = unsafe { slice::from_raw_parts_mut(new_buffer.as_ptr(), new_capacity) };
            for idx in 0..old_items.len() {
                // Do we really need this? We should only call grow if all items are occupied
                if old_items[idx].occupied != SlotState::Occupied {
                    continue;
                }

                let entry = unsafe { old_items[idx].value.assume_init_read() };
                HashMap::<K, V, S>::probe_insert(new_items, entry.0.hash, entry.0.key, entry.1);
                // let new_idx = value.0.hash as usize % new_capacity;
                // new_items[new_idx].value = MaybeUninit::new(value);
                // new_items[new_idx].occupied = SlotState::Occupied;
            }
        }

        self.capacity = new_capacity;
        self.values = Some(new_buffer);
        self.allocator.dealloc(
            old_buffer.cast(),
            std::mem::size_of::<HashEntry<HashedKey<K>, V>>() * old_capacity,
        );
    }

    fn probe_insert(
        slots: &mut [HashEntry<HashedKey<K>, V>],
        key_hash: u64,
        key: K,
        value: V,
    ) -> bool {
        let capacity = slots.len();
        let idx = key_hash as usize % capacity;
        let mut cur_idx = idx;
        loop {
            if slots[cur_idx].occupied != SlotState::Occupied {
                slots[cur_idx].value.write((
                    HashedKey {
                        key,
                        hash: key_hash,
                    },
                    value,
                ));
                slots[cur_idx].occupied = SlotState::Occupied;
                return true;
            } else {
                let item = unsafe { slots[cur_idx].value.assume_init_mut() };
                if item.0.hash == key_hash && item.0.key == key {
                    item.1 = value;
                    break;
                }
            }

            cur_idx = (cur_idx + 1) % capacity;
        }
        return false;
    }

    pub fn remove(&mut self, key: &K) {
        let Some(slots) = self.values else { return };
        let slots = unsafe { slice::from_raw_parts_mut(slots.as_ptr(), self.capacity) };

        let key_hash = self.hash_builder.hash_one(key);

        let idx = key_hash as usize % self.capacity;
        let mut cur_idx = idx;
        loop {
            if slots[cur_idx].occupied == SlotState::Occupied {
                let item = unsafe { slots[cur_idx].value.assume_init_ref() };

                if item.0.hash == key_hash && item.0.key == *key {
                    unsafe {
                        slots[cur_idx].value.assume_init_drop();
                    }
                    slots[cur_idx].occupied = SlotState::Tomstone;
                    self.len -= 1;
                    return;
                }
            } else if slots[cur_idx].occupied == SlotState::Free {
                return;
            }

            cur_idx = (cur_idx + 1) % self.capacity;
            if cur_idx == idx {
                break;
            }
        }
    }

    pub fn get(&self, key: &K) -> Option<&V> {
        let Some(slots) = self.values else {
            return None;
        };
        let slots = unsafe { slice::from_raw_parts_mut(slots.as_ptr(), self.capacity) };

        let key_hash = self.hash_builder.hash_one(key);
        let idx = key_hash as usize % self.capacity;
        let mut cur_idx = idx;
        loop {
            match slots[cur_idx].occupied {
                SlotState::Free => return None,
                SlotState::Occupied => {
                    let (k, v) = unsafe { slots[cur_idx].value.assume_init_ref() };

                    if k.hash == key_hash && k.key == *key {
                        return Some(v);
                    }
                }
                SlotState::Tomstone => {}
            }

            cur_idx = (cur_idx + 1) % self.capacity;
            if cur_idx == idx {
                return None;
            }
        }
    }
}
