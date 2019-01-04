cmake_minimum_required(VERSION 3.10)

SET (EQUIPMENTCOMPOSITE_PROG_HEADERS

)

SET (EQUIPMENTCOMPOSITE_PROG_SOURCES
    main.cpp
)

add_executable(EquipmentComposite_prog ${EQUIPMENTCOMPOSITE_PROG_SOURCES} ${EQUIPMENTCOMPOSITE_PROG_HEADERS})
target_link_libraries(EquipmentComposite_prog PRIVATE EquipmentComposite_lib)

SET (EQUIPMENTCOMPOSITE_LIB_HEADERS
    Coord.hpp
    Point.hpp
    Window.hpp
    WindowImp.hpp
    ApplicationWindow.hpp
    IconWindow.hpp
)
LIST (TRANSFORM EQUIPMENTCOMPOSITE_LIB_HEADERS PREPEND include/)

SET (EQUIPMENTCOMPOSITE_LIB_SOURCES
    Coord.cpp
    Point.cpp
    Window.cpp
    WindowImp.cpp
    ApplicationWindow.cpp
    IconWindow.cpp
)

add_library(EquipmentComposite_lib SHARED ${EQUIPMENTCOMPOSITE_LIB_SOURCES} ${EQUIPMENTCOMPOSITE_LIB_HEADERS})
target_include_directories(EquipmentComposite_lib PRIVATE include)