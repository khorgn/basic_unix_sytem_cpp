project(hello_prog)

add_library(hello_lib STATIC hello.cpp hello.hpp)

target_include_directories(hello_lib PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

add_executable(prog main.cpp)

target_link_libraries(prog PRIVATE hello_lib)
