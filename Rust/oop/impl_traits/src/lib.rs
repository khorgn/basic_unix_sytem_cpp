pub trait Draw {
    fn draw(&self);
}

// Screen uses a trait object, whose size can't be known at runtime since it means any type that
// implements Draw
// it allows the Screen to have multiple types in its Vec
//
// NOTE: the trait must be object-safe to be made into a trait object
//       None of its methods can have the return type Self
//       None of the methods have generic type parameters
pub struct Screen {
    pub components: Vec<Box<dyn Draw>>,
}

impl Screen {
    pub fn run(&self) {
        for component in self.components.iter() {
            component.draw();
        }
    }
}

// we limit the Screen2 instances to only one type of Draw implementation at a time, however we can
// do different implementations depending on T by doing
// impl<i32> for example
// We also know the size of Screen2 at compile time
pub struct Screen2<T: Draw> {
    pub components: Vec<T>,
}

impl<T> Screen2<T> where T: Draw {
    pub fn run(&self) {
        for component in self.components.iter() {
            component.draw();
        }
    }
}


#[derive(Debug)]
pub struct Button {
    pub width: u32,
    pub height: u32,
    pub label: String,
}

impl Draw for Button {
    fn draw(&self) {
        println!("drawing Button: {:?}", self);
    }
}
