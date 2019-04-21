fn main() {

    let four = IpAddrKind::V4;
    let six = IpAddrKind::V6;
}

enum IpAddrKind
{
    // variants of the enum
    V4,
    V6,
}

// an enum can also have its variants containing values
enum IpAddr
{
    V4(u8, u8, u8,u8),
    V6(String),
}

// the std library for IpAddr uses structs embedded in the variants:
/*
enum IpAddr
{
    V4(Ipv4Addr),
    V6(Ipv6Addr),
}
struct Ipv4Addr
{
    // ...
}
struct Ipv6Addr
{
    // ...
}
*/

// Another example
enum Message
{
    Quit,
    Move { x: i32, y: i32 }, // with named data
    Write(String),
    ChangeColor(i32, i32, i32),
}

impl Message
{
    fn call(&self)
    {
    }
}
