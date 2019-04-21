# When is it okay to panic rather than use result and propagate the error?

## Examples, Prototype code, Tests
When writing short examples and prototype code, using `unwrap` or `expect()` allows to quickly handle the error, and create real error handling later.  
For tests we want the program to panic! when it encounter an error so we know the test failed.  

## The developer has more information than the compiler
if the developer __knows__ that the action can't fail, but the compiler doesn't knows it, using an `unwrap()` is logical
```Rust
use std::net::IpAddr;
let home: IpAddr = "127.0.0.1".parse().unwrap();
```
here we know that the string address is correct and will parse correctly, but the compiler doesn't.  

# Guidelines for Error Handling
* panic! when the code ends up in a bad state not recoverable
* panic! when the developer has violated the contract of the function used, so it's known quickly
* panic! when the error is not expected to happen from time to time (is rare and anormal)

ex:
```Rust
pub struct Guess { value: i32, }

impl Guess
{
	pub fn new(value: i32) -> Guess
	{
		if value < 1 || value > 100 { panic!("[1, 100], got {}", value); }

		Guess { value }
	}

	pub fn value(&self) -> i32 { self.value }
}
```
If the developer violate the contract (enter a number outside [1, 100]), the program will panic!  
