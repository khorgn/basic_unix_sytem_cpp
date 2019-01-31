//! # A crate to learn Cargo
//! An inside documentation (documentation for the container, here the whole crate)
//! * allows you to document files (modules)
//! * if wanted can be used in blocks too

/// An outside documentation (documentation for the next element)  
/// allows you to document the _next_ element
///
/// Add one to the given number
///
/// # Examples
/// assertions in documentation are tested when running cargo test, to ensure the examples are
/// still up to date.  
/// __use assertions in the examples__
/// ```
/// let five = 5;
/// assert_eq!(5, cargo_learn::add_one(five));
/// ```
///
/// # Panics
/// The scenarios/situations where the function will panic, here useless
///
/// # Errors
/// If the function returns Result<_, _>, it describes the kind of errors encoutered and the
/// conditions to encounter them.  
///
/// # Safety
/// If the function is `unsafe`, it should explain why and cover what the callers must ensure
/// themselves to make it work correctly.
pub fn add_one(x: i32) -> i32 {
    x + 1
}

//===== use `pub use` to make shortcuts and more practical paths in the library =====//
// sometimes the architecture for a library that makes sense for development isn't practical for
// use
// We can in this case reexport items for more practical use
pub use kinds::{PrimaryColor, SecondaryColor};
pub use utils::mix;

pub mod kinds {
    pub enum PrimaryColor {
        Red,
        Yellow,
        Blue,
    }

    pub enum SecondaryColor {
        Orange,
        Green,
        Purple,
    }
}

pub mod utils {
    use crate::kinds::*; // crate refers to the current crate

    pub fn mix(c1: PrimaryColor, c2: PrimaryColor) -> SecondaryColor {
        // ...
        SecondaryColor::Green
    }
}

