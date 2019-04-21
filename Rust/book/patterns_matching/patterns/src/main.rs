fn main() {
    patterns::match_arms();
    println!("==========");
    patterns::if_let();
    println!("==========");
    patterns::while_let();
    println!("==========");
    patterns::for_loops();
    println!("==========");
    patterns::let_statements();
    println!("==========");
    patterns::fnc_params(&(2, 3));
    println!("==========");
    patterns();
    println!("==========");
    patterns::destructuring_struct();
    println!("==========");
    patterns::destructuring_enum();
    println!("==========");
    patterns::destructuring_reference();
}

// There are two kinds of patterns: refutable patterns and irrefutable patterns
// The refutables patterns can only be used in let statements
// The irrefutables patterns cannot be used in let statements
fn patterns() {
    // x will always match with any value of type Option<i32>
    let _x = Some(3);
    let _x = match Some(3) {
        Some(_x) => Some(_x),
        None => None,
    };

    // Some(x) can fail with some value of type Option<i32> (None)
    if let Some(_x) = Some(3) {

    }
}
