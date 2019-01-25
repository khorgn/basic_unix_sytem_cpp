// lifetimes tells the compilers what the lifetimes of references are supposed to be, and refuse to
// compile when the lifetimes don't follow the given rules

fn main() {
    let s1 = String::from("abcd");
    let s2 = "xyz";
    
    let result = longest(s1.as_str(), s2);
    println!("The longuest string is {}", result);

    // This variable's lifetime is for the duration of the full program
    let s: &'static str = "I have a static lifetime.";
}
/* types
&i32 reference
&'a i32 reference with explicit lifetime
&'a mut i32 mutable reference with explicit lifetime
*/
// fn longest (x: &str, y: &str) -> &str
// doesn't work because the compiler doesn't know how long the return is supposed to live, since it
// doesn't know if it will be a ref to x or y
fn longest<'a> (x: &'a str, y: &'a str) -> &'a str
{
    if x.len() > y.len()
    {
        x
    }
    else
    {
        y
    }
}
// the compiler will enforce that all lifetimes are at least long enough for the returned reference
// to end


// if structures hold references, they need lifetime annotations
// this annotation means that the instance of ImportantExcerpt can't outlive the reference it holds
// in "part"
struct ImportantExcerpt<'a>
{
    part: &'a str,
}

// impl<'a> because it depends on the lifetime of the struct (similar to generics)
impl<'a> ImportantExcerpt<'a>
{
    fn level(&self) -> i32 { 3 }

    // we don't need to annotate here because of the lifetime elisions
    fn announce_and_return_part(&self, announcement: &str) -> &str
    {
        println!("Attention please: {}", announcement);
        self.part
    }
}

//===== LifeTime Elision =====//
// Three rules allows the compiler to implicitly annotate lifetimes:
// 1: Each ref parameter get its own lifetime
// 2: If there is only one input ref parameter, it's lifetime is assigned to all output lifetime
//    parameters
// 3: If there is multiple input ref parameters, but one of them is &self or &mut self, the ouput
//    ref parameters get its lifetime



//===== Lifetime with generic parameters and trait bounds =====//

use std::fmt::Display;

fn longest_with_an_announcement<'a, T>(x: &'a str, y: &'a str, ann: T) -> &'a str
    where T: Display
{
    println!("Announcement! {}", ann);
    if x.len() > y.len() {
        x
    } else {
        y
    }
}
