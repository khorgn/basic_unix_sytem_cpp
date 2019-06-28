extern crate proc_macro;
use proc_macro::TokenStream;
use quote::quote;
use syn;

#[proc_macro]
pub fn sql(input: TokenStream) -> TokenStream {
    input
}

// we recover the tokens in the parentheses, and return the code to generate
// example use:
// let sql = sql!(SELECT * FROM posts WHERE id=1);
