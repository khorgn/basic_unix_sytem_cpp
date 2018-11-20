cmake_minimum_required(VERSION 3.0.0)
project(Test1 VERSION 0.1.0)

include(CTest)
enable_testing()

add_executable(Test1 main.cpp)
target_link_libraries(Test1 PRIVATE TemperatureReader stdc++fs)

# add_library(TemperatureReader STATIC TemperatureData.cpp TemperatureReader.cpp)
# target_include_directories(TemperatureReader PUBLIC ${CMAKE_SOURCE_DIR}/..)

add_library(TemperatureReader SHARED TemperatureData.cpp TemperatureReader.cpp)
target_include_directories(TemperatureReader PUBLIC ${CMAKE_SOURCE_DIR}/..)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
