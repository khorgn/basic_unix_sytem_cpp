use derive_macro::HelloMacro;

fn main() {
    println!("Hello, world!");

    Pancake::hello_macro();
}

#[derive(derive_macro_derive::HelloMacro)]
struct Pancake;
