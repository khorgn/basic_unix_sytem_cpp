use std::fs::File;
use std::io::{self, Read, ErrorKind};

fn main() {
    let f = File::open("hello.txt");
    let f = match f
    {
        Ok(file) => file,
        Err(error) => match error.kind()
        {
            ErrorKind::NotFound => match File::create("hello.txt")
            {
                Ok(fc) => fc,
                Err(e) => panic!("Tried to create file but there was a problem: {:?}", e),
            },
            other_error => panic!("There was a problem opening the file: {:?}", other_error),
        }
    };

    let f = File::open("hello.txt").unwrap(); // will panic! if Result is Err
    let f = File::open("hello.txt").expect("Error, not expected"); // will panic! giving the message if Result is Err
}

// Propagate the Result, if there is an error the caller will handle it
fn read_username_from_file() -> Result<String, io::Error>
{
    let mut f = match File::open("hello.txt")
    {
        Ok(file) => file,
        Err(e) => return Err(e),
    };

    let mut s = String::new();
    // Returns Ok with the result, or Err with the error
    match f.read_to_string(&mut s)
    {
        Ok(_) => Ok(s),
        Err(e) => Err(e),
    }
}

// the ? operator takes a Result, if it's an Err it returns it early from the whole function, else it it
// returns the result unwrapped to the instruction
// ? can only be used in functions returning Result
fn read_username_from_file_shorter() -> Result<String, io::Error>
{
    let mut f = File::open("hello.txt")?;
    let mut s = String::new();
    f.read_to_string(&mut s)?;
    Ok(s)
}

// the ? operator can be chained
fn read_username_from_file_even_shorter() -> Result<String, io::Error>
{
    let mut s = String::new();
    File::open("hello.txt")?.read_to_string(&mut s)?;
    Ok(s)
}

use std::fs;

// because reading a file and writing it into a string is frequent, std::fs has a convenience
// function, it open, read the file and returns a Result with the string if successful
fn read_username_from_file_even_even_shorter() -> Result<String, io::Error>
{
    fs::read_to_string("hello.txt")
}
