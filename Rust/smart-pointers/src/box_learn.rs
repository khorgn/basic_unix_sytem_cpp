fn store_i32_on_heap() {
    let b = Box::new(5);
    println!("b = {}", b);
}

//========== uses of Box ==========//
//===== Recursive types =====//
// Rust needs to know the size of all the types at compile time, and recursive types will be of
// infinite size if stored directly.
// A solution would be to make them store references instead of direct type, but then the type
// wouldn't own its data. The solution is to use box, so it owns its data while having its size be
// a Box (metadata + usize)

// Ex: a Cons list (a type from lisp where you have a binary tuple containing a binary tuple and so
// on
enum List {
    Cons(i32, Box<List>),
    Nil,
}

use List::{Cons, Nil};
fn use_list() {
    let list = Cons(1,
                    Box::new(Cons(2,
                                  Box::new(Cons(3,
                                                Box::new(Nil)
                                           ))
                             ))
                    );
}

fn use_deref_box() {
    let x = 5;
    let y = Box::new(x); // remember int implements Copy

    assert_eq!(5, x);
    assert_eq!(5, *y);
}
