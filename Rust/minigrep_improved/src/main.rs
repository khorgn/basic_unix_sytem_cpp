use std::env; // used to recover the cli args
use std::process; // use to exit the program

use minigrep_improved as minigrep;
use minigrep::Config;


fn main() {

    // if the Result is an Err, pass the inner value as argument and execute the anonymous function given
    let config = Config::from_args(env::args()).unwrap_or_else(|err| {
        eprintln!("Problem parsing arguments: {}", err); // print to standard error
        process::exit(1); // exit with a non-zero error code
    });


    if let Err(e) = minigrep::run(config) {
        eprintln!("Application error: {}", e); // print to standard error
        process::exit(1);
    }

}

