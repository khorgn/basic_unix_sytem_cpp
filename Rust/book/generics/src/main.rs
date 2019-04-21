use std::cmp::PartialOrd;

fn main() {
    println!("Hello, world!");
}

// same, but doesn't enforce that the argument and return are the same type, just that they both
// implement the same traits
// fn largest(list: &[impl PartialOrd + Copy]) -> impl PartialOrd + Copy

// same, useful when there is a lot of generics and traits, to make it more readable
// fn largest<T>(list: &[T]) -> T where T: PartialOrd + Copy
fn largest<T: PartialOrd + Copy>(list: &[T]) -> T
{
    let mut largest = list[0];

    for &item in list.iter()
    {
        if item > largest { largest = item; }
    }

    largest
}

struct Point<T>
{
    x: T,
    y: T,
}

// impl<T> is here to precise we implement for Point<T>
// if some generics were in the function, we wouldn't add them here
impl<T> Point<T>
{
    fn x(&self) -> &T { &self.x }
}

impl Point<f32>
{
    fn distance_from_origin (&self) -> f32
    {
        (self.x.powi(2) + self.y.powi(2)).sqrt()
    }
}

use std::fmt::Display;
// Conditional implementation using traits
impl<T: Display + PartialOrd> Point<T>
{
    fn cmp_display(&self)
    {
        if self.x >= self.y
        {
            println!("The largest member is x = {}", self.x);
        } else {
            println!("The largest member is y = {}", self.y);
        }
    }
}

// implementation of the trait ToString for every type having the trait Display
/*
impl<T: Display> ToString for T
{

}
*/


// default implementations
trait MyTrait
{
    fn default()
    {
        println!("a default implementation");
    }
}
