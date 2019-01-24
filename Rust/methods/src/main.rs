//! Calculates area of a triangle

fn main() {

    let w: u32 = 10;
    let h: u32 = 20;

    let r1 = Rectangle{width: w, height: h};
    let square = Rectangle::square(w+h);

    println!("{}", r1.area());


    println!("rectangle is {:#?}", r1);
    println!("can fit? {}", r1.can_fit_in(&square));
}


#[derive(Debug)]
struct Rectangle
{
    width: u32,
    height: u32,
}

// an implementation of Rectangle with a method
impl Rectangle
{
    // method
    fn area(&self) -> u32
    {
        self.width * self.height
    }

    // associated function
    fn square(size: u32) -> Rectangle
    {
        Rectangle { width: size, height: size }
    }
}

// A same structure can have multiple implementations
impl Rectangle
{
    fn can_fit_in(&self, rectangle: &Rectangle) -> bool
    {
        self.width < rectangle.width && self.height < rectangle.height
    }
}
