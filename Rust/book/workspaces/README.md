# create a workspace
`mkdir <workspace name> && cd $_`  
create a new Cargo.toml  
fill it with the members, then `cargo new` them

# Run binary target
If only one exists, `cargo run` is enough  
Else, `cargo run -p <binary package name>` is necessary.  


# Tools
install with `cargo install <binary package> [v<version>]`  
list cargo subcommands installed with `cargo --list`  
* cargo-edit (to add/remove/upgrade (not update)) packages from CLI
* ripgrep

