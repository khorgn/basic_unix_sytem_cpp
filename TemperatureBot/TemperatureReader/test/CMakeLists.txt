cmake_minimum_required(VERSION 3.10)

project(TemperatureReader_test)

add_executable(TemperatureReader_test testmain.cpp)
target_link_libraries(TemperatureReader_test PRIVATE TemperatureReader_lib ${CMAKE_CURRENT_SOURCE_DIR}/thirdparty/googletest/gtest_main.a)
target_include_directories(TemperatureReader_test PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/thirdparty/googletest/include)