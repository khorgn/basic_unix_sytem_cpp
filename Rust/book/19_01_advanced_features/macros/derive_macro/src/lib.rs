//========== Procedural Macros ==========//
// TODO make it work, need to make a crate only with procedural macros

// has the form
/*
#[some_attribute]
pub fn some_name(input: TokenStream) -> TokenStream {}
*/

//========== Procedural Macros: custom #[derive] macros ==========//
// Allow to automatically implement a trait
// #[derive(Trait)]
pub trait HelloMacro {
    fn hello_macro();
}


//    #[derive(HelloMacro)]
//    struct Pancakes;
//
//    fn use_hello_macro() {
//        p = Pancake;
//
//        p.hello_macro();
//    }
