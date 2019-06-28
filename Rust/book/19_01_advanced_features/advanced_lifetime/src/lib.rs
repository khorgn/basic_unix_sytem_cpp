//========== Lifetime subtyping ==========//
// ensuring, a lifetime doesn't end before another

// a structure containing a reference to a string slice, it needs a lifetime
struct Context<'a>(&'a str);

// a structure containing a reference to a Context, it needs two lifetimes, one for the context,
// one for the lifetime annotation in the context
// If we only put the same lifetime annotation for both, parse-context doesn't work because the
// str referenced lives as long as the context it comes from, which dies at the end of the function
// We also need to express that the str lives longer than Context
struct Parser<'c, 's: 'c> {
    context: &'c Context<'s>,
}

impl<'c, 's: 'c> Parser<'c, 's> {
    fn parse(&self) -> Result<(), &'s str> {
        Err(&self.context.0[1..])
    }
}

fn parse_context(context: Context) -> Result<(), &str> {
    Parser { context: &context }.parse()
}


//========== Lifetime bounds ==========//
// ensure that every reference in a type will at least be of the given lifetime
// NOTE explicite notation T: 'a is infered in Rust2018, so its not necessary
struct Ref<'a, T: 'a>(&'a T);
struct Ref2018<'a, T>(&'a T);
struct RefStatic<T: 'static>(&'static T); // necessary here

struct RefRef2015<'a, 'b: 'a, T: 'b> {
    field: &'a &'b T,
}
struct RefRef2018<'a, 'b, T> {
    // lifetime bounds inferred
    field: &'a &'b T,
}


//========== Inference of trait objects Lifetime ==========//
// come into play when implementations of a trait object have lifetimes (structs with references)
// TODO needs to find explaination, can't understand the ones from the book
//     Default lifetime of a trait object is 'static
//     With &'a Trait or &'a mut Trait, the default lifetime of the trait object is 'a
//     With T: 'a, the default lifetime of the trait object is 'a
//     With multiple clauses like T: 'a, their is not default lifetime
trait Red { }

struct Ball<'a> {
    diameter: &'a i32,
}

impl<'a> Red for Ball<'a> { }

fn use_ball() {
    let num = 5;

    let obj = Box::new(Ball {diameter: &num}) as Box<dyn Red>;
}


//========== Anonymous Lifetime ==========//
// The compiler can elise lifetime notations under certain rules explained before
// a self reference parameter, only one reference parameter

// exemple struct needing lifetime notation
struct StrWrap<'a>(&'a str);

// we can anotate the function returning the object
fn foo_verbose<'a>(string: &'a str) -> StrWrap<'a> {
    StrWrap(string)
}

// or we can use the elided lifetime on string (every ref parameter get automatically a lifetime
// anotation, and if there is only one it can be elided
// '_ references the elided lifetime anotation
fn foo_elided(string: & str) -> StrWrap<'_> {
    StrWrap(string)
}

// Example with trait implementations
trait ATraitVerbose {}
trait ATraitElided {}
impl<'a> ATraitElided for StrWrap<'a> {}
impl ATraitVerbose for StrWrap<'_> {}
