cmake_minimum_required(VERSION 3.12)

enable_testing()


add_executable(EquipmentComposite_test
    testmain.cpp
)
target_link_libraries(EquipmentComposite_test PRIVATE
    EquipmentComposite_lib
    ${CMAKE_SOURCE_DIR}/thirdparty/googletest/libgtest.a
    ${CMAKE_SOURCE_DIR}/thirdparty/googletest/libgmock.a
    pthread
)
target_include_directories(EquipmentComposite_test PRIVATE
    ${CMAKE_SOURCE_DIR}/src/include
    ${CMAKE_SOURCE_DIR}/thirdparty/googletest/include
)

add_test(html-tests EquipmentComposite_test)
