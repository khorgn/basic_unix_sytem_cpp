> To do in build  
# Compile shared library members
`clang++ -c -fPIC ../TemperatureReader.cpp ../TemperatureData.cpp -isystem ../..`
> Note: -isystem is used for system or third-party includes, the one where we have no control, it suppress warnings from the include  
> -I is used for first-party include, the one that can be corrected, it also include them first

# Link objects in shared library
`clang++ -shared TemperatureReader.o TemperatureData.o -c ../shared/libTemperatureReader.so`

# allow the executable to find the library at runtime
## Add the path the library header in LD\_LIBRARY\_PATH
`export LD_LIBRARY_PATH=../shared`  
> Note: only works in build, if wants to execute from TemperatureReader/, needs to set it to `.`  

## Move the library to a standard path
`/usr/include`  
`/usr/local/include`

## Setup the referencing at linktime
> see compile

# Compile and link the executable
## If referencing to the library for execution is already done
`clang++ ../main.cpp ../shared/libTemperatureReader.so -lstdc++fs -std=c++17`  
or  
`clang++ ../main.cpp -L[ ]../shared -l[ ]TemperatureReader -l[ ]stdc++fs -std=c++17`

## If referencing needs to be done at linktime
`clang++ ../main.cpp -L../shared -lTemperatureReader -lstdc++fs -std=c++17 -Wl,rpath=/path/to/library`  
> Note: if the path is relative, the executable can't be moved

