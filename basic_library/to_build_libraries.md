# To build and use a static library

## To build

`clang++ fileToAdd.cpp -c [-o fileToAdd.o]`  
`ar rvs libraryToInsertIntoOrCreate.a fileToAdd.o`

## to use
`clang++ sourceFirst.cpp librarySecond.a`  
`clang++ sourceFirst.o librarySecond.a`

> note:
> if use `-l` it looks for a library with the form:
`clang++ source.o -l<libname>` looks for lib<libname>.a

# To build and use shared library

## To build
`clang++ -c -fPIC fileToAdd.cpp [-o fileToAdd.o]`  
`-fPIC` means it's compiled as position independant  
not necessaru with clang

`clang++ -shared fileToAdd.o -o libsharedLibrary.so`  
if no -o argument set, the library is named a.out

## To use

`clang++ -L<path/to/library> source.cpp -lsharedLibrary`  
the `-L` ensure the library is found by the linker, can be `-L.`
not necessary if the library is in /usr/lib ?

It's necessary to also link the library for the program execution  
`LD_LIBRARY_PATH=/path/to/library`  
or install the library in a standard location (like /usr/lib)

## To add the headers to the project

add to the system library: `/usr/local/include`, `/usr/include`, ...  

add the path to the standard path: `C_INCLUDE_PATH` for C/C++ or `CPLUS_INCLUDE_PATH` for C++  
`C_INCLUDE_PATH=$C_INCLUDE_PATH:/path/to/add`

add the library header mentionned during compilation: `-isystem path/to/header`
