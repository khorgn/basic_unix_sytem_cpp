use attribute_macro::*;

fn main() {
    dummy();
}

#[route(Get, "/")]
fn index() {

}
