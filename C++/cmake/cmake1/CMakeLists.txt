cmake_minimum_required(VERSION 3.10)
project(HelloCMake)

set (HelloCMake_VERSION_MAJOR 1)
set (HelloCMake_VERSION_MINOR 0)
set (HelloCMake_VERSION_PATCH 0)

set (HelloCMake_SOURCES hello.cpp hello.hpp)

add_executable(HelloCMake main.cpp ${HelloCMake_SOURCES})

add_executable(tests testmain.cpp ${HelloCMake_SOURCES})
