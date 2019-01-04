cmake_minimum_required(VERSION 3.0.0)
project(Fibonacci_template VERSION 0.1.0)

include(GoogleTest)
include(CTest) # necessary for running the google tests together through `make test`
enable_testing()

# tests args
message("args before")
foreach(ARG ${CMAKE_CC_FLAGS})
message(${ARG})
endforeach(ARG ${CMAKE_CC_FLAGS})
foreach(ARG ${CMAKE_CXX_FLAGS})
message(${ARG})
endforeach(ARG ${CMAKE_CXX_FLAGS})

SET(CMAKE_CXX_FLAGS "-Wall -Wextra -pedantic")
SET(CMAKE_CC_FLAGS "-Wall -Wextra -pedantic")

message("args after")
foreach(ARG ${CMAKE_CC_FLAGS})
message(${ARG})
endforeach(ARG ${CMAKE_CC_FLAGS})
foreach(ARG ${CMAKE_CXX_FLAGS})
message(${ARG})
endforeach(ARG ${CMAKE_CXX_FLAGS})
# test args

add_executable(Fibonacci_template main.cpp Fibonacci.cpp Fibonacci.hpp Fibonacci_template.hpp)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)

include_directories(/home/hugo/include/)

add_executable(FirstTest Fibonacci_test.cpp Fibonacci.cpp)
target_link_libraries(FirstTest PRIVATE pthread ${CMAKE_SOURCE_DIR}/thirdparty/googletest/gtest_main.a)

add_test(NAME test COMMAND FirstTest)
# gtest_add_tests(TARGET FirstTest
#                 TEST_SUFFIX .noArgs
#                 TEST_LIST noArgsTest
# )
# set_tests_properties(${noArgsTests}   PROPERTIES TIMEOUT 10)