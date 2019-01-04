cmake_minimum_required(VERSION 3.10)

enable_testing()


add_executable(MazeFactory_test testmain.cpp)
target_link_libraries(MazeFactory_test PRIVATE
    MazeFactory_lib
    ${CMAKE_SOURCE_DIR}/thirdparty/googletest/libgtest.a
    ${CMAKE_SOURCE_DIR}/thirdparty/googletest/libgmock.a
    pthread)
target_include_directories(MazeFactory_test PRIVATE ${CMAKE_SOURCE_DIR}/src ${CMAKE_SOURCE_DIR}/thirdparty/googletest/include)

add_test(html-tests MazeFactory_test)