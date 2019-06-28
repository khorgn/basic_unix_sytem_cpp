use std::env;
use std::process;
use std::fs;

fn main() {
    let args: Vec<String> = env::args().collect();
    if args.len() != 2
    {
        return;
    }

    println!("arg: {}", args[1]);

    let paths = fs::read_dir("./").unwrap();

    for path in paths
    {
        println!("{}", path.unwrap().path().display());
    }
}
