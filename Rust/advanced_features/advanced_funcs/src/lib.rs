//========== Function Pointers ==========//
fn add_one(x: i32) -> i32 {
    x + 1
}

// takes a type fn (function pointer) as parameter
// NOTE different from the Fn closure trait
fn do_twice(f: fn(i32) -> i32, arg: i32) -> i32 {
    f(arg) + f(arg)
}

fn use_func_pointer() {
    let answer = do_twice(add_one, 5);
    assert_eq!(answer, 12);
}
// NOTE fn implements all three closure traits (Fn, FnMut, FnOnce)
// so we can always pass function pointers as closure parameters
// using the fn type is only usefull to prevent the use of closures

fn use_closure_or_fun() {
    let list_of_numbers = vec![1, 2, 3];
    // use a closure in map
    let list_of_strings: Vec<String> = list_of_numbers
        .iter()
        .map(|i| i.to_string())
        .collect();
    // directly use a function pointer
    let list_of_strings: Vec<String> = list_of_numbers
        .iter()
        .map(ToString::to_string)
        .collect();
}

// Can also be done with tuple structs and tuple-struct enum variants
// They are implemented as functions when being instanciated
enum Status {
    Value(u32),
    Stop,
}

fn use_struct() {
    let list_of_statuses: Vec<Status> = 
        (0u32..20)
        .map(Status::Value)
        .collect();
}
// This can also be done through closures if prefered


//========== Returning Closures ==========//
// closures are represented by traits, so to returns them trait objects must be used
fn returns_closure() -> Box<dyn Fn(i32) -> i32> {
    Box::new(|x| x + 1)
}
