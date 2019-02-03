// Unsafe Rust gives access to four new tools not usable in Safe Rust
// these tools are not checked for memory safety, but the rest is still checked even in Unsafe
// Blocks
//     Dereference a raw pointer
//     Call an unsafe function
//     Access or modify a mutable static variable
//     Implement an Unsafe trait

//===== Dereferencing a Raw Pointer =====//
pub fn deref_raw_pointer() {
    let mut num = 5;
    // defines and fill the raw points
    // raw pointers don't follow borrow rules
    let r1 = &num as *const i32;
    let r2 = &mut num as *mut i32;
    // we created these pointers from references, so we know they are valid

    let address = 0x012345usize;
    let r = address as *const i32;
    // We don't know if the address this pointer points to has data, or if we are even allowed to
    // access it

    unsafe {
        println!("r1 is: {}", *r1);
        println!("r2 is: {}", *r2);
    }
}

//===== Calling Unsafe functions =====//

unsafe fn dangerous() {
}

fn call_unsafe() {
    unsafe {
        dangerous();
    }
}

//===== Create safe abstraction =====//
pub fn safe_abstraction() {
    let mut v = vec![1, 2, 3, 4, 5, 6];

    let r = &mut v[..];

    let (a, b) = r.split_at_mut(3);

    assert_eq!(a, &mut [1, 2, 3]);
    assert_eq!(b, &mut [4, 5, 6]);
}

use std::slice;
fn split_at_mut(slice: &mut [i32], mid: usize) -> (&mut [i32], &mut [i32]) {
    let len = slice.len();
    assert!(mid <= len);

    // can't just use safe rust, we try to access mutable references to the same slice
    // (&mut slice[..mid], &mut slice[mid..])
    
    // let us access the data as a *mut
    let ptr = slice.as_mut_ptr();
    unsafe {
        // from_raw_parts_mut is an unsafe function creating a new slice
        (slice::from_raw_parts_mut(ptr, mid),
        // offset() moves the pointed address by the given isize
        slice::from_raw_parts_mut(ptr.offset(mid as isize), len - mid))
    }
}

//===== using extern to call external code =====//

// gets the C function abs
extern "C" {
    fn abs(input: i32) -> i32;
}

pub fn call_c_func() {
    unsafe {
        println!("Abs of -3 according to C: {}", abs(-3));
    }
}

//===== Accessing or Modifying a Mutable Static variable =====//
// A const is usable in global and local scope, and must have compile-time calculated value
const MAX_VALUE: u32 = 100_000;
// static variables are always global scope, and have a fixed address
// Static variables can only store references that are statics, and are lifetime-annoted automatically
static HELLO_WORLD: &str = "Hello, world";
// A static mutable variable can only be accessed in Unsafe blocks
static mut COUNTER: u32 = 0;

fn add_to_count(inc: u32) {
    unsafe {
        COUNTER += inc;
    }
}

fn read_count() {
    unsafe {
        println!("COUNTER: {}", COUNTER);
    }
}


//===== Implementing an Unsafe Trait =====//
// When on of the method has invariants / contracts, that the compiler can't verify,
// The person implementing is responsible for upholding the invariant and ensuring
// that the contract is respected
unsafe trait Foo {
}

unsafe impl Foo for i32 {
}
// Ex: the Sync and Send traits, if not automatically implemented (if one of the fields doesn't
// have it), requires the manual implementation to be unsafe,
// This way the programmer must ensure and knows he must ensure the respect of the invariants

