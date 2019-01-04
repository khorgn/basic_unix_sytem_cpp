> To do in build  
# Compile objects of the static library
`clang++ -c -fPIC ../TemperatureReader.cpp ../TemperatureData.cpp -isystem ../..`

# Link the static library
`ar rvs ../static/libTemperatureReader.a TemperatureData.o TemperatureReader.o`

# Compile and link the executable
`clang++ main.cpp ../static/libTemperatureReader.a -lstdc++fs`  
`clang++ main.cpp -L[ ]../static -l[ ]TemperatureReader -l[ ]stdc++fs`
