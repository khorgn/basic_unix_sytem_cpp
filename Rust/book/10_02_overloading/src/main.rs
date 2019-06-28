trait MyBehaviour<T>
{
    fn print_with(&self, the_thing: T);
}

struct X;

impl MyBehaviour<&'static str> for X
{
    fn print_with(&self, string: &'static str)
    {
        println!("hello, string! {}", string);
    }
}

impl MyBehaviour<i32> for X
{
    fn print_with(&self, integer: i32)
    {
        println!("hello, integer! {}", integer);
    }
}


fn main()
{
    let x =X;
    x.print_with("hello world");
    x.print_with(42);
}
