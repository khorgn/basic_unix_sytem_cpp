//========== Newtype Pattern for safety and abstraction ==========//
use std::collections::HashMap;
// Type Safety
struct Millimeters(u32);
struct Metters(u32);
// Abstraction
struct People(HashMap<i32, String>);

//========== Type Aliases ==========//
// same as a typedef, no type safety
type Kilometers = i32;

fn use_alias() {
    let x: i32 =5;
    let y: Kilometers = 5;
    // x and y are still the same type
    println!("x + y = {}", x+y);
}

type Thunk = Box<dyn Fn() + Send + 'static>;
fn takes_long_type(f: Thunk) {}
fn returns_long_type() -> Thunk { Box::new(|| println!("hi")) }

// How the std::io::Result is defined
type NewResult<T> = Result<T, std::io::Error>;


//========== The Never Type that never returns ==========//
// Rust has a type named !
// It is used to express a function that will never return
// It is what "returns" continue, panic and loop (with no break), and why it can be used in matchs
fn a_match() {
    let x = Some(5);
    let y = match x {
        Some(val) => val,
        None => panic!("foobar"),
    };
}

fn bar() -> ! { loop {} }


//========== Dynamically Sized Types ==========//
// Rust has Dynamically Sized Types (DST), also called unsized types
// an example are what slices referenced to: str or [i32], another is traits
// these types can't be accessed directly, they must be through a reference: &str or Box<str> ...
// Or &dyn Trait, Box<dyn Trait>, Rc<dyn Trait> ...
// Types whose size are known at compile time automatically implements Sized

// Every generic function has a bound to Sized
fn genericImplicit<T> (t: T) {}
fn genericExplicit<T: Sized> (t: T) {}

// If the generic must be able to have an unknown size, it must express it
// It can't be directly used then, here we use it with a reference
fn generic_unsized<T: ?Sized> (t: &T) {}
fn use_str() {
    let x: Box<str>;
}
