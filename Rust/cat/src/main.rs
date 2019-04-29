use std::env;
use std::process;
use std::fs;

fn main() {
    let args = configuration::parse().unwrap();


    file_manipulation::print_files(args.file_paths).expect("couldn't get all files");

}

mod file_manipulation {
    use std::fs;

    pub fn print_files(file_list: Vec<String>) -> Result<(), ()> {
        for file in file_list {
            if let Ok(content) = fs::read_to_string(file) {
                print!("{}", content);
            }
        }
        Ok(())
    }
}

/// # Configuration
/// module containing all the configurations for the program
mod configuration {
    use std::env;
    /// # CatArgs
    /// Structure organizing the arguments used for the program
    pub struct CatArgs {
        pub file_paths: Vec<String>,
    }

    /// Parse the command-line arguments to fill the structure CatArgs
    pub fn parse() -> Result<CatArgs, String> {
        let args: Vec<String> = env::args().collect();

        Ok(CatArgs {file_paths: args,})
    }
}