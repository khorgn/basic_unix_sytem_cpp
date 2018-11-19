> To do in build  
# Compile shared library members
`clang++ -c -fPIC ../TemperatureReader.cpp ../TemperatureData.cpp -isystem ../..`
> Note: -isystem is used for system or third-party includes, the one where we have no control, it suppress warnings from the include  
> -I is used for first-party include, the one that can be corrected, it also include them first

# Link objects in shared library
`clang++ -shared TemperatureReader.o TemperatureData.o -c ../shared/libTemperatureReader.so`

# Add the path the library header in LD\_LIBRARY\_PATH
`export LD_LIBRARY_PATH=../shared`  
> Note: only works in build, if wants to execute from TemperatureReader/, needs to set it to `.`  

# Compile and link the executable
`clang++ ../main.cpp ../shared/libTemperatureReader.so -lstdc++fs -std=c++17`  
or  
`clang++ ../main.cpp -L[ ]../shared -l[ ]TemperatureReader -l[ ]stdc++fs -std=c++17`
