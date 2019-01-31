// a smart pointer is a type owning data, and also having metadata and other capabilities and
// guarantees

fn main() {
    println!("Hello, world!");
    // a smart pointer
    let _s: String = "AA".to_owned();

    // another smart pointer
    let _v: Vec<i32> = vec![1, 2, 3];

    // custom smart-pointers:
    // implement Deref and Drop
    // Deref allows the type to dereference to the type it's holding:
    //     *expr
    // Drop allows to precise what to do when the smart pointer goes out of scope

    //===== Important smart-pointers =====//

    // unique pointer, allow to allocate data on the heap, and will handle deallocating once it
    // goes out of scope
    let _b: Box<i32> = Box::new(5);

    // reference counting pointer, allows multiple unmutable owners, only deallocating when all of
    // them are out of scope
    // [use std::sync::Arc in mutlithreaded environment]
    use std::rc::Rc;
    let _r: Rc<i32> = Rc::new(5);

    // Enforce the borrowing rules at runtime rather than compile time
    // Gives acces to Ref<T> and RefMut<T>, runtime equivalents to &T and &mut T
    // allows more complex use of borrow-rules that cannot be resolved at compile time
    use std::cell::RefCell;
    let _c: RefCell<i32> = RefCell::new(5);
}

mod custom_smartpointer;
