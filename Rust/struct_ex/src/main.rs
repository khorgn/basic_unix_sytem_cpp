//! Calculates area of a triangle
use std::env;

fn main() {
    let args: Vec<_> = env::args().collect();

    let mut w: u32 = 10;
    let mut h: u32 = 20;
    if args.len() >= 3
    {
        w = args[1].parse().expect("Give an integer over 0");
        h = args[2].parse().expect("Give an integer over 0");
    }
    let rect = RectangleTuple(w, h);
    let width: u32 = w;
    let height: u32 = h;
    let rectangle = Rectangle{width: w, height: h};

    println!("{}", area(width, height));
    println!("{}", area_rect_tuple(&rect));
    println!("{}", area_rect(&rectangle));


    // needs a trait to be douable
    // println!("rectangle is {}", rectangle);

    // use printable as long as #[derive(Debug)] is added or the train Debug is implemented
    println!("rectangle is {:?}", rectangle);
    println!("rectangle is {:#?}", rectangle);
}

fn area(width: u32, height: u32) -> u32
{
    width * height
}

fn area_rect_tuple(rect: &RectangleTuple) -> u32
{
    rect.0*rect.1
}

fn area_rect(rect: &Rectangle) -> u32
{
    rect.width*rect.height
}

struct RectangleTuple(u32, u32);

#[derive(Debug)] // allows to display Debug format ":?"
struct Rectangle
{
    width: u32,
    height: u32,
}
