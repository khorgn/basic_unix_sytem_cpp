// Option allow nullable variables

fn main() {
    let some_number = Some(5); // same as Option<i32>::Some(5);
    let some_string = Some("a string");
    let absent_number: Option<i32> = None;

    let x: i8 = 5;
    let y: Option<i8> = Some(5);
    // let sum = x+y
    // doesn't work because different types
    
    match y
    {
        Option::Some(i) => println!("{}", x+i),
        Option::None => println!("Nothing"),
    };

}

// Option as the form
/*
enum Option<T>
{
    Some(T),
    None,
}
*/
