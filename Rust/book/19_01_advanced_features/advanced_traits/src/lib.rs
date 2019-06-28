//========== Associated Types ==========//
// an advantage of associated types over generics is to reduce type annotation
// since the trait can only be implemented once, we don't need to annotate next() each type we want
// to use it

pub struct Counter {}

pub trait Iterator {
    // placeholder type with a trait bound
    type Item: std::fmt::Display;

    fn next(&mut self) -> Option<Self::Item>;
}

impl Iterator for Counter {
    type Item = u32;
    fn next(&mut self) -> Option<Self::Item> {
        None
    }
}

pub trait IteratorGeneric<T> {
    fn next(&mut self) -> Option<T>;
}


//========== Default Generic Type Parameters ==========//
trait TraitWithDefault<T=u32> {
    fn add(t1: T, t2: T) -> T;
}

struct BasicStruct {}

impl TraitWithDefault for BasicStruct {
    fn add(t1: u32, t2: u32) -> u32 {
        0
    }
}

//========== Operator Overloading ==========//
use std::ops::Add;

// Debug to display debug info, and PartialEq to be able to compare with assert_eq!
#[derive(Debug, PartialEq)]
struct Point {
    x: i32,
    y: i32,
}
struct SubPoint {
    x: i32,
    y: i32,
}

impl Add for Point {
    type Output = Point;

    fn add(self, other: Point) -> Point {
        Point {
            x: self.x + other.x,
            y: self.y + other.y,
        }
    }
}

impl Add<SubPoint> for Point {
    type Output = Point;

    fn add(self, other: SubPoint) -> Point {
        Point {
            x: self.x + other.x,
            y: self.y + other.y,
        }
    }
}

fn check_add() {
    assert_eq!(Point {x: 1, y: 0} + Point {x: 2, y: 3},
               Point {x: 3, y: 3});
}

//========== Fully Qualified Syntax ==========//
// We can call methods by their full name
// It allows to clarify which one is being called

// Full syntax:
// <Type as Trait>::function(receiver_if_method, next_arg, ...);

//===== Methods =====//
// methods contain Self as argument, so Rust can differenciate which implementation of a trait to
// call according to it
trait Pilot {
    fn fly(&self);
}

trait Wizard {
    fn fly(&self);
}

struct Human;

impl Pilot for Human {
    fn fly(&self) {
        println!("Pilot fly");
    }
}

impl Wizard for Human {
    fn fly(&self) {
        println!("Wizard fly");
    }
}

impl Human {
    fn fly(&self) {
        println!("human not fly");
    }
}

struct NotHuman;
impl Wizard for NotHuman { fn fly(&self) { println!("Not human wizard fly"); } }

fn call_fly() {
    let person = Human;
    person.fly(); // call Human::fly(&person);

    Pilot::fly(&person); // call <Human as Pilot>::fly(&person);

    Wizard::fly(&person); // call <Human as Wizard>::fly(&person);
}

//===== Associated Functions =====//
trait Animal {
    fn baby_name() -> String;
}

struct Dog;

impl Dog {
    fn baby_name() -> String {
        String::from("Spot")
    }
}

impl Animal for Dog {
    fn baby_name() -> String {
        String::from("puppy")
    }
}

fn call_animal() {
    println!("This baby dog is called {}", Dog::baby_name());
    // can't just write Animal::baby_name(); because we don't know which implementation to call
    println!("A baby dog is called a {}", <Dog as Animal>::baby_name());
}

//========== Supertraits ==========//
// requires a Trait being implemented
use std::fmt;
trait OutlinePrint: fmt::Display {
    fn outline_print(&self) {
        let output = self.to_string();
        let len = output.len();
        println!("{}", "*".repeat(len+4));
        println!("*{}*", " ".repeat(len+2));
        println!("* {} *", output);
        println!("*{}*", " ".repeat(len+2));
        println!("{}", "*".repeat(len+4));
    }
}


struct PointST {
    x: i32,
    y: i32,
}

impl fmt::Display for PointST {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "({}, {})", self.x, self.y) // returns as string
    }
}

impl OutlinePrint for PointST {}

pub fn call_supertrait() {
    let p = PointST {x: 3, y: 5 };
    p.outline_print();
}

//========== The Newtype Pattern ==========//
// The orphan rule prevent the implementation of trait from outside crates on types from outside
// crates, to ensure there is no conflicting implementation of one trait on one type

// The NewType pattern allows you to wrap a datatype in a type you own, allowing to implement
// outside traits
struct Wrapper(Vec<String>);

impl fmt::Display for Wrapper {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "[{}]", self.0.join(", "))
    }
}

pub fn call_newtype() {
    let w = Wrapper(vec![String::from("hello"), String::from("World")]);
    println!("w= {}", w);
}
