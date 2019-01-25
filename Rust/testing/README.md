# Cargo arguments
to launch: `cargo test`  

can give arguments to it, they go to `cargo test` or to the resulting test binary  

`cargo test --help` displays the options for `cargo test`  
`cargo test -- --help` display the options for the binary (that you can give after the separator --)

by default the tests are run in parallel, one thread for each.  
if we want to control the number of thread used:  
`cargo test -- --test-threads=1` make the tests runs consecutively  

by default tests will display their stdoutput only when they fail.  
if we to display all output:  
`cargo test -- --nocapture`  


by default all tests are run.  
if we only want to run one test:  
`cargo test <function name>`  
if we can to run multiple test:  
`cargo test <common part of functions name>` this can also be used with modules, to only run tests in a module


to ignore certain tests by default, add `#[ignore]`  
if we want to still run the ignored tests:  
`cargo test -- --ignored`  


to run a particular integration test file:  
`cargo test --test <integration test file name>`

# Test organization
* unit tests are small and focused on particular elements of the library, only one module at a time
  * they are organized as a test module in the same file they are testing, and able to access private interfaces
    * the test module is annoted with `cfg(test)` so it's only compiled with `cargo test`, not `cargo build`
* integration tests are external to the library and use it through the same interface as other libraries
  * since they go in different directories, they don't need `cfg(test)`
  * they are written in a tests directory
  * each file in tests is a new test section, and each file is treated as its own crate
  * to have a hierarchy and helper files, they must not be directly under "tests", or they will be treated as test crates
    * the solution is to place them in <module name>/mod.rs, it can still be used by other integration test files, and won't be seen as an integration test file itself. No file in subdirs of tests will be seen as such either.

