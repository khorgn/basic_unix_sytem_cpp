extern crate proc_macro;
use proc_macro::TokenStream;
use quote::quote;
use syn;
//========== Procedural Macros: attribute-like macros ==========//

// #[route(GET, "/")]
#[proc_macro_attribute]
// attr: the content of the attribute, here GET and "/"
// item: the body of the function attached to this attribute
pub fn route(attr: TokenStream, item: TokenStream) -> TokenStream {
    // let item_parsed = syn::parse(item).unwrap();
    
    let x = format!(r#"
        fn dummy() {{
            println!("entering");
            println!("attr token: {{}}", {attr});
            println!("item token: {{}}", {item});
            println!("exiting");
        }}
    "#,
        attr = attr.into_iter().count(),
        item = item.into_iter().count(),
    );
    

    /*
    let mut x = format!(r#"
        fn dummy() {{
            println!("entering");
            println!("attr tokens:");
            println!("{{}}", {a});
    "#,
    a = attr
    );

    x += format!(r#"}}"#).as_str();
    */

    x.parse().expect("Generated invalid token")
}


//========== Procedural Macros: function-like macros ==========//

