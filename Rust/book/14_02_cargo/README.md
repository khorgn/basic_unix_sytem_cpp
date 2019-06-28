# Documentation
run `cargo doc` to produce the documentation of the crate  
run `cargo doc --open` to open the index on the default browser  

# Publishing crates on `Crates.io`
1. setup Crates.io's account through GitHub
2. use `cargo login <api key>` with the api key for your account
3. add metadata to your Cargo.toml
4. use `cargo publish` __Warning__: no version can ever be removed after being published
  1. you can update a crate by changing the version number and publishing again,  
     but the previous versions will still be available
  2. if a broken version is published, it's possible to "yank" it, it doesn't remove it but prevent new projects from using it
    1. use `cargo yank --vers <version number>` to yank a version
    2. use `cargo yank --vers <version number> --undo` to cancel a yank and allow the version again

