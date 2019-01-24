#[allow(unused_variables)]

fn main() {
    println!("Hello, world!");

    let mut u = User
    {
        email: String::from("foobar@abc.com"),
        username: String::from("foobar"),
        active: true,
        sign_in_count: 1,
    };

    u.email = String::from("foobar2@abc.com");


    let u2 = User
    {
        email: String::from("barfoo@abc.com"),
        username: String::from("barfoo"),
        ..u
        // ..u: same as
        // active: u.active,
        // sign_in_count: u.sign_in_count,
    };


    //=========== Tuple Struct ==========//
    // a struct looking like a tuple
    // useful to give tuples names without needing to name each element
    struct Color (i32, i32, i32);
    struct Point (i32, i32, i32);

    let black = Color(0, 0, 0);
    let origin = Point(0, 0, 0);


    //========== Unit-like structs and the unit type ==========//
    // rust contains a zero-size type, `()`, of value `()`.
    // It's what is returned in "void" functions
    // zero-size types can also be defined
    struct ZeroSizeType;
}

struct User
{
    username: String,
    email: String,
    sign_in_count: u64,
    active: bool,
}

fn build_user(email: String, username: String) -> User
{
    User
    {
        email, // same as `email: email`
        username, // same as `username: username`
        sign_in_count: 1,
        active: true,
    }
}
