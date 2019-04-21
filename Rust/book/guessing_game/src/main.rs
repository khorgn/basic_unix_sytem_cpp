use std::io;
// needs to add `use rand;` to be able to use it
// `use rand::Rng;` is necessary to add in scope the trait Rng
use rand::Rng;
// enumeration
use std::cmp::Ordering;

// is comparable to a #define
// 1_000 is functionally the same as 1000, it just improve visibility
const MAX_RANGE: u32 = 1_000;

fn main() {
    println!("Guess the number");

    // ===== Generate number ===== //
    // gen an int [1, 101[
    let secret_number = rand::thread_rng().gen_range(1, 101);
    println!("secret number: {}", secret_number);

    // ===== Read line on stdout ===== //
    // let var: create a variable
    // let mut var: the variable created is mutable
    let mut guess = String::new();

    // std::io/stdin()

    // &arg: the argument is a reference
    // &mut arg: the argument is a mutable reference
    // read_line returns an io::Result type, a specialisation of the general Result enumeration
    // (two values: Ok and Err)
    // expect: if io::Result returns Err, crashes the program and, print the value, else it just
    // returns the value Ok is holding
    io::stdin().read_line(&mut guess).expect("Failed to read the line");

    loop
    {
        // we say the type of int given so parse() know into which number to parse
        let guess: u32 = match guess.trim().parse().expect("Please enter a number")
        {
            Ok(num) => num, // returns num
            // _: catchall value, we match all values or Err
            Err(_) => continue,
        };

        // ===== Compare ===== //
        println!("You guessed : {}", guess);
        
        // match: expression that matches a return value to a pattern (here an exact match)
        // cmp: compares to values, and returns an Ordering
        match guess.cmp(&secret_number)
        {
            Ordering::Less => println!("Too small!"),
            Ordering::Greater => println!("Too big!"),
            Ordering::Equal =>
            {
                println!("Found!");
                break;
            },
        }
    }

    // ===== Result ===== //
}

