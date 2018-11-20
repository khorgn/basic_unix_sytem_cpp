> To do in build  
# Compile objects of the static library
`clang++ -c -fPIC ../TemperatureReader.cpp ../TemperatureData.cpp -isystem ../..`  
> Note: -isystem is used for system or third-party includes, the one where we have no control, it suppress warnings from the include  
> -I is used for first-party include, the one that can be corrected, it also include them first


# Link the static library
`ar rvs ../static/libTemperatureReader.a TemperatureData.o TemperatureReader.o`

# Compile and link the executable
`clang++ main.cpp ../static/libTemperatureReader.a -lstdc++fs`  
`clang++ main.cpp -L[ ]../static -l[ ]TemperatureReader -l[ ]stdc++fs`
