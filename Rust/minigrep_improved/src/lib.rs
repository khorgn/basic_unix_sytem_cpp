//! # Crate: minigrep
//! contains the logic for implementing a grep function

use std::fs; // used to read the file
use std::error::Error; // used by run(config)
use std::env; // look for environment variables

/// # struct Config
/// contains the data structure to configure the program
/// # Fields
/// ## query
/// type: `String`  
/// the query to check for
/// ## filename
/// type: `String`  
/// the name of the file to check in
pub struct Config {
    pub query: String,
    pub filename: String,
    pub case_sensitive: bool,
}

impl Config {
    /// # Config.from_args
    /// create a new Config struct from the CL arguments
    /// # Note
    /// run with `CASE_INSENSITIVE=1 cargo run <query> <filename>` to have the search be case insensitive
    pub fn from_args(mut args: env::Args) -> Result<Config, &'static str> {
        let query = match args.next() {
            Some(q) => q,
            None => return Err("Didn't get a query string"),
        };
        let filename = match args.next() {
            Some(f) => f,
            None => return Err("Didn't get a filename string"),
        };
        // returns true if the Result is Err, false otherwise. Here we don't care about the value of CASE_INSENSITIVE, or it is set, or not
        let case_sensitive = env::var("CASE_INSENSITIVE").is_err();

        Ok(Config { query, filename, case_sensitive, })
    }
}

// Box<dyn Error>: a trait object, the object here will implement Error, dyn is for dynamic
pub fn run(config: Config) -> Result<(), Box<dyn Error>> {
    let content = fs::read_to_string(config.filename)?;

    let results = if config.case_sensitive {
        search_case_sensitive(&config.query, &content)
    } else {
        search_case_insensitive(&config.query, &content)
    };

    for line in results {
        println!("{}", line);
    }

    Ok(())
}

fn search_case_sensitive<'a>(query: &str, content: &'a str) -> Vec<&'a str> {
    content.lines()
        .filter(|line| line.contains(&query))
        .collect()
}

fn search_case_insensitive<'a>(query: &str, content: &'a str) -> Vec<&'a str> {
    let query = query.to_lowercase();
    content.lines()
        .filter(|line| line.to_lowercase().contains(&query))
        .collect()

//    let query = query.to_lowercase();
//    // lines() return an iterator on the lines in the string slice
//    let mut result = Vec::new();
//    for line in content.lines() {
//        if line.to_lowercase().contains(&query) {
//            result.push(line);
//        }
//    }
//
//    result
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn case_sensitive() {
        let query = "duct";
        let content = "\
Rust:
safe, fast, productive.
Pick three.
Duct tape.";

        assert_eq!(vec!["safe, fast, productive."], search_case_sensitive(query, content));
    }
    #[test]
    fn case_insensitive() {
        let query = "rUsT";
        let content = "\
Rust:
safe, fast, productive.
Pick three.
Trust me.";

        assert_eq!(vec!["Rust:", "Trust me."], search_case_insensitive(query, content));
    }
}
