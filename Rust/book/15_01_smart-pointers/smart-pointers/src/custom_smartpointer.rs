use std::ops::{Deref, DerefMut};

struct MyBox<T>(T);

impl<T> MyBox<T> {
    fn new(x: T) -> MyBox<T> {
        MyBox(x)
    }
}

impl<T> Deref for MyBox<T> {
    type Target = T;
    fn deref(&self) -> &T {
        &self.0
    }
}

impl<T> DerefMut for MyBox<T> {
    fn deref_mut(&mut self) -> &mut T {
        &mut self.0
    }
}

// There is no need to explicitly deref (*expr) in a lot of situations, where there is Deref
// coercions
// Thanks to this, any code that works on &T will work on MyBox<T> (implicitly converted to &T)
fn str_deref_coercion(name: &str) {
    println!("Hello, {}", name); // no need to &name
}

// deref coercion rules:
// from &Type to &Underlining            with trait Deref
// from &mut Type to &mut Underlining    with trait DerefMut
// from &mut Type to &Underlining        with trait Deref
// from &Type to &mut underlining is impossible
