// the root for a binary crate
// a package can have multiple binary crates
// the file is called "crate root" because all its content is in a module called "crate"
fn main() {
    // absolute path of the function
    crate::sound::instrument::guitar();
    // relative path of the function
    sound::instrument::guitar();

    use sound::voice::song;
    song();
}

// a module
mod sound
{
    pub mod instrument
    {
        pub fn guitar()
        {
            println!("*guitare sound*");
        }
    }
    // the module is available in the module "crate", but not oustide of it
    pub(crate) mod voice
    {
        pub fn song()
        {
            // go to the parent module
            super::breath_in();
            println!("hi lea!");
        }
    }

    fn breath_in()
    {
        println!("*breath in*");
    }
}


//===== Privacy rules =====//
// all items (functions, methods, structs, modules, constants) are private by default
// `pub` makes an item public
// can't use private item defined in children of the current module
// can use any private item defined in ancestors of the current module
// items in the same module can see each others, that's why sound doesn't need to be public

//=== Structures ===//
// a public structure still has its members private by default
// id can't be accessed directly from main()
mod plant
{
    pub struct Vegetable
    {
        pub name: String,
        id: i32,
    }
    impl Vegetable
    {
        pub fn new(name: &str) -> Vegetable
        {
            Vegetable
            {
                name: String::from(name),
                id: 1,
            }
        }
    }
}

//=== Enumerations ===//
// enum are completely public if they are public
mode menu
{
    pub enum Appetizer
    {
        Soup,
        Salade,
    }
}
