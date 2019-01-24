fn main() {
    println!("Hello, world!");
}

// we can also set the arg as string slice, so we can use it with slices, and for string we just do
// &s[..]
fn first_word(s: &string) -> &str // string slice
{
    // we need to access the string element by element, so we convert it to a byte array
    let bytes = s.as_bytes();

    // create an iterator with iter(), then enumerate() converts each iteration from a collection
    // to a tuple
    // enumerate() gives at each step the index and a reference to the item
    for (i, &item) in bytes.iter().enumerate()
    {
        if item == b' '
        {
            // a string slice of range [0, i[
            return &s[0..i];
        }
    }

    // a string slice of all the string, same as &s[0..s.len()] and &s[..s.len()] and &s[0..] and
    // &s[0..=(s.len()-1)]
    &s[..]

    // string literals are string slices
}


// an i32 slice
fn int_slices()
{
    let a = [1, 2, 3, 4, 5, 6];
    let a_slice = &a[1..3];
}

