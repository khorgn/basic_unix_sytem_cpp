fn main() {
    println!("In ref_counter.rs");
    basic_ref_count();
    check_ref_count();
}

use std::rc::Rc;
enum List {
    Cons(i32, Rc<List>),
    Nil,
}
use List::{Cons, Nil};

fn basic_ref_count() {
    let a = Rc::new(Cons(5,
                 Rc::new(Cons(10,
                              Rc::new(Nil)
                              ))
                 ));

    // We clone the reference counter, who add a new reference to take into account
    // The three variable all own the data in a
    // we can do a.clone(), but it could be mistaken for a deep copy, when its a completely
    // different kind of cloning
    let b = Cons(3, Rc::clone(&a));
    let c = Cons(4, Rc::clone(&a));
}

fn check_ref_count() {
    let a = Rc::new(Cons(5, Rc::new(Cons(10, Rc::new(Nil)))));
    println!("count after creating a = {}", Rc::strong_count(&a));
    let b = Cons(3, Rc::clone(&a));
    println!("count after creating b = {}", Rc::strong_count(&a));
    {
    let c = Cons(4, Rc::clone(&a));
    println!("count after creating c = {}", Rc::strong_count(&a));
    }
    println!("count after c goes out of scope = {}", Rc::strong_count(&a));
}
