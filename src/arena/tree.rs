use std::ops::Index;

use crate::arena::Arena;
use crate::arena::vec::Vec;

pub struct TreeNode<T> {
    pub value: T,
    pub parent: Option<usize>,
    pub first_child: Option<usize>,
    pub next_sibiling: Option<usize>,
}

pub struct Tree<'a, T> {
    nodes: Vec<'a, TreeNode<T>>,
}

impl<'a, T> Tree<'a, T> {
    pub fn new(arena: &'a Arena, capacity: usize, root: T) -> Self {
        let mut nodes = Vec::new(arena, capacity);
        if capacity != 0 {
            nodes.push(TreeNode {
                value: root,
                parent: None,
                first_child: None,
                next_sibiling: None,
            });
        }

        Self { nodes }
    }

    pub fn add_child(&mut self, parent_index: usize, value: T) {
        let new_node = TreeNode {
            value,
            parent: Some(parent_index),
            first_child: None,
            next_sibiling: None,
        };

        let new_node_index = self.nodes.len();
        assert!(parent_index != new_node_index);
        self.nodes.push(new_node);

        if let Some(last_child_index) = self.nodes[parent_index].first_child {
            assert!(last_child_index != new_node_index);
            self.nodes[new_node_index].next_sibiling = Some(last_child_index);
            self.nodes[parent_index].first_child = Some(new_node_index);
        } else {
            self.nodes[parent_index].first_child = Some(new_node_index);
        }
    }

    pub fn pop(&mut self) {
        let Some(parent_index) = self.nodes.last().map(|last| last.parent).flatten() else {
            return;
        };
        let node_index = self.nodes.len() - 1;

        if self.nodes[parent_index].first_child == Some(node_index) {
            self.nodes[parent_index].first_child = self.nodes[node_index].next_sibiling;
        } else {
            let mut cur_child_index = self.nodes[parent_index].first_child;

            while let Some(cur_index) = cur_child_index {
                if self.nodes[cur_index].next_sibiling == Some(node_index) {
                    self.nodes[cur_index].next_sibiling = self.nodes[node_index].next_sibiling;
                    break;
                }
                cur_child_index = self.nodes[cur_index].next_sibiling;
            }
        }

        self.nodes.pop();
    }

    pub fn shrink_to_fit(&mut self) {
        self.nodes.shrink_to_fit();
    }

    #[inline(always)]
    pub fn root(&self) -> &T {
        &self.nodes[0].value
    }

    #[inline(always)]
    pub fn get(&self, index: usize) -> &T {
        &self.nodes[index].value
    }

    #[inline(always)]
    pub fn get_mut(&mut self, index: usize) -> &mut T {
        &mut self.nodes[index].value
    }

    pub fn get_parent_index(&self, index: usize) -> Option<usize> {
        self.nodes[index].parent
    }

    #[inline(always)]
    pub fn get_children(&self, index: usize) -> ChildrenIter<'_, T> {
        ChildrenIter {
            nodes: &self.nodes,
            current_index: self.nodes[index].first_child,
        }
    }

    #[inline(always)]
    pub fn has_children(&self, index: usize) -> bool {
        self.nodes[index].first_child.is_some()
    }

    #[inline(always)]
    pub fn is_empty(&self) -> bool {
        self.nodes.is_empty()
    }

    #[inline(always)]
    pub fn len(&self) -> usize {
        self.nodes.len()
    }
}

impl<'a, T> Index<usize> for Tree<'a, T> {
    type Output = TreeNode<T>;

    #[inline(always)]
    fn index(&self, index: usize) -> &Self::Output {
        &self.nodes[index]
    }
}

pub struct ChildrenIter<'a, T> {
    nodes: &'a Vec<'a, TreeNode<T>>,
    current_index: Option<usize>,
}

impl<'a, T> Iterator for ChildrenIter<'a, T> {
    type Item = usize;

    #[inline(always)]
    fn next(&mut self) -> Option<Self::Item> {
        if let Some(index) = self.current_index {
            self.current_index = self.nodes[index].next_sibiling;
            Some(index)
        } else {
            None
        }
    }
}
