use weak_refs::List::{self, Cons, Nil};
use std::rc::Rc;
use std::cell::RefCell;

fn main() {
    println!("Hello, world!");
    ref_cycle();

    println!("Hello, world!");
    weak_ref();

    println!("Hello, world!");
    no_ref_cycle();
}

// demonstrate a reference cycle
// here we can't use Weak references because we can't reorganize our List data structure
// here we have to ensure through other means that there are no cycles
//     for example through automated tests, code reviews, and other software development practices
fn ref_cycle() {
    let a = Rc::new(Cons(5, RefCell::new(Rc::new(Nil))));
    println!("a initial rc count = {}", Rc::strong_count(&a));
    println!("a next item = {:?}", a.tail());

    let b = Rc::new(Cons(10, RefCell::new(Rc::clone(&a))));
    println!("a rc count after b creation = {}", Rc::strong_count(&a));
    println!("b initial rc count = {}", Rc::strong_count(&b));
    println!("b next item = {:?}", b.tail());

    if let Some(link) = a.tail() {
        *link.borrow_mut() = Rc::clone(&b);
    }
    println!("b rc count after changing a = {}", Rc::strong_count(&b));
    println!("a rc count after changing b = {}", Rc::strong_count(&a));

    // Uncomment the next line to see that we have a cycle ;
    // it will overflow the stack
    // println!("a next item = {:?}", a.tail());
    drop(a);
    drop(b);
}

use weak_refs::Node;
use std::rc::Weak;
fn weak_ref() {
    let leaf = Rc::new(Node {
        value: 3,
        parent: RefCell::new(Weak::new()),
        children: RefCell::new(vec![]),
    });

    // we borrow from RefCell the Weak data
    // We need to upgrade the Weak value, given a Option<T>
    println!("leaf parent = {:?}", leaf.parent.borrow().upgrade());

    let branch = Rc::new(Node {
        value: 5,
        parent: RefCell::new(Weak::new()),
        children: RefCell::new(vec![Rc::clone(&leaf)]),
    });

    // To link data from Rc, we must downgrade it rather than clone it
    *leaf.parent.borrow_mut() = Rc::downgrade(&branch);

    println!("leaf parent = {:#?}", leaf.parent.borrow().upgrade());
}


fn no_ref_cycle() {
    let leaf = Rc::new(Node {
        value: 3,
        parent: RefCell::new(Weak::new()),
        children: RefCell::new(vec![]),
    });

    println!(
        "leaf strong = {}, weak = {}",
        Rc::strong_count(&leaf),
        Rc::weak_count(&leaf),
    );

    println!("entering subscope");
    {
        let branch = Rc::new(Node {
            value: 5,
            parent: RefCell::new(Weak::new()),
            children: RefCell::new(vec![Rc::clone(&leaf)]),
        });

        *leaf.parent.borrow_mut() = Rc::downgrade(&branch);

        println!(
            "branch strong = {}, weak = {}",
            Rc::strong_count(&branch),
            Rc::weak_count(&branch),
        );

        println!(
            "leaf strong = {}, weak = {}",
            Rc::strong_count(&leaf),
            Rc::weak_count(&leaf),
        );
        println!("leaving subscope");
    }

    println!("leaf parent = {:?}", leaf.parent.borrow().upgrade());
    println!(
        "leaf strong = {}, weak = {}",
        Rc::strong_count(&leaf),
        Rc::weak_count(&leaf),
    );
}
