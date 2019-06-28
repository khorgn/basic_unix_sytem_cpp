use std::rc::Rc;
use std::cell::RefCell;
use List::{Cons, Nil};

//========== Reference cycles ==========//
#[derive(Debug)]
pub enum List {
    // We give the ability to change the tail of the list by using RefCell
    // We don't try to change the value in Rc, but the ref_counter itself
    Cons(i32, RefCell<Rc<List>>),
    Nil,
}

impl List {
    pub fn tail(&self) -> Option<&RefCell<Rc<List>>> {
        match self {
            Cons(_, item) => Some(item),
            Nil => None,
        }
    }
}

//========== Weak references ==========//
// If Strong and Weak references can be defined in the data structure, it helps avoiding reference
// cycles
use std::rc::Weak;
#[derive(Debug)]
pub struct Node {
    pub value: i32,
    // RefCell because we want to be able to modify the list of children
    // Rc because we want to be able to directly access nodes in the program
    pub children: RefCell<Vec<Rc<Node>>>,

    // a Node knows its parent, but doesn't owns it
    // RefCell so that the parent can be added later
    pub parent: RefCell<Weak<Node>>,
}
