cmake_minimum_required(VERSION 3.10)
project(TemperatureReader_lib VERSION 0.1.0)

add_executable(TemperatureReader_prog main.cpp)
target_link_libraries(TemperatureReader_prog PRIVATE TemperatureReader_lib stdc++fs)

# add_library(TemperatureReader STATIC TemperatureData.cpp TemperatureReader.cpp)
# target_include_directories(TemperatureReader PUBLIC ${CMAKE_SOURCE_DIR}/..)


add_library(TemperatureReader_lib SHARED TemperatureData.cpp TemperatureReader.cpp TemperatureData.hpp TemperatureReader.hpp EmptyContainerException.hpp)
target_include_directories(TemperatureReader_lib PUBLIC ${CMAKE_SOURCE_DIR}/..)
