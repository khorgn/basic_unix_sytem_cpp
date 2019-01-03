cmake_minimum_required(VERSION 3.10)

project(EquipmentComposite VERSION 0.1.0)

SET (CMAKE_CXX_FLAGS "-Wall -Wextra -pedantic -std=c++17")
SET (CMAKE_CC_FLAGS "-Wall -Wextra -pedantic")

add_subdirectory(src)
add_subdirectory(test)