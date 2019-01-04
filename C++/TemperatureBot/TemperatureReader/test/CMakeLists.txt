cmake_minimum_required(VERSION 3.10)

project(TemperatureReader_test)

# INCLUDE_DIRECTORIES(${CMAKE_SOURCE_DIR}/thirdparty/googletest/include)

message(${CMAKE_SOURCE_DIR}/thirdparty/googletest/include/)

add_executable(TemperatureReader_test testmain.cpp)
target_link_libraries(TemperatureReader_test PRIVATE TemperatureReader_lib ${CMAKE_SOURCE_DIR}/thirdparty/googletest/libgtest.a pthread)

# target_link_libraries(TemperatureReader_test PRIVATE "${GTEST_LIB}")


target_include_directories(TemperatureReader_test PRIVATE ${CMAKE_SOURCE_DIR}/thirdparty/googletest/include)