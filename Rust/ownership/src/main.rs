#[allow(unused_variables)]
fn main() {
    println!("Hello, world!");

    let mut s = String::from("hello");
    s.push_str(", world");

    let s2 = s; // transfer ownership of the heap data (the string char array)
    // the stack data is copied (like length of the string)
    // s can't be used anymore

    let s3 = s2.clone(); // a deep copy

    let tup: (i32, bool) = (4, false); // is copied

    let tup2: (i32, String) = (5, String::from("AAA")); // is moved

    //===== All types that can be copied implements the trait Copy =====//
    //===== All types that use heap data needs to implement the trait Drop, which implement a
    //destructor. A type implementing Drop can't implement Copy =====//


    //========== Ownership ==========//
    let s = String::from("AAA");
    let s = takes_and_gives_back(s);
}

// by passing the object as parameter, it transfers the ownership of the heap data to the function
fn takes_and_gives_back(a_string: String) -> String
{
    a_string // returns the object, transfering the ownership
}
