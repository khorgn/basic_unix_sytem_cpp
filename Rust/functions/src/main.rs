mod loops;

fn main() {
    println!("Hello, world!");
    let x = 5;
    let y =
    {
        let x = 3;
        x+1 // the value the block evaluate to
    };
    if x == 5
    {
        another_function(4);
    }
    else
    {
        another_function(2);
    }

    let z = if y > 3
    {
        2*y
    }
    else
    {
        4*y
    };

    loops::loops();
}

fn another_function(x: i32) -> i32
{
    println!("Another function: {}", x);
    x+1 // a statement, the return value. no ;
    // can use the return keyword, but not necessary for the last expression of the function
}

// statements:
// doesn't return a value
// ex: let x = 3;
// expressions:
// returns a value
// ex: 3

