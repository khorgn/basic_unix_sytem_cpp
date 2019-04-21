use std::marker::{Sync, Send};


fn main() {
    println!("Hello, world!");
}

// the Send marker trait is implemented to allow ownership transfert between threads
// almost every type is Send, excepted a few Exceptions, among them Rc
// any type entirely composed of Send types is marked as Send
// almost all primitives are Send, one exception being raw pointers

// the Sync marker trait is implemented to allow access from multiple threads
// Any type is Sync if &T is Send
// any type entirely composed of Sync types is marked as Sync
// almost all primitives are Send, one exception being raw pointers

// In most cases, there is no need to manually implement these traits.
// The only exception being when some of the fields are not Send/Sync
// In that case they must be implemented manually, which requires `unsafe` blocks
// and ensuring manually that the type is thread-safe

