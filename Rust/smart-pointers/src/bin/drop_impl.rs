fn main() {
    basic_drop();
    early_drop();
}


use std::ops::Drop;
struct MySmartPointer { data: String,}

impl Drop for MySmartPointer {
    fn drop(&mut self) {
        println!("Dropping CustomSmartPointer with data '{}'", self.data);
    }
}


fn basic_drop() {
    let c = MySmartPointer { data: String::from("foo") };
    let d = MySmartPointer { data: String::from("bar") };

    println!("MySmartPointer created");
}

fn early_drop() {
    let c = MySmartPointer { data: String::from("some data") };
    println!("MySmartPointer created");
    // can't call c.drop() directly because Rust would still try to drop it when out of scope
    // so we use std::mem::drop(), who is in the prelude
    drop(c);
    println!("dropped early");
}
