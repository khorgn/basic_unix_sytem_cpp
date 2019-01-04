cmake_minimum_required(VERSION 3.10)

SET (EQUIPMENTCOMPOSITE_PROG_HEADERS

)

SET (EQUIPMENTCOMPOSITE_PROG_SOURCES
    main.cpp
)

add_executable(EquipmentComposite_prog ${EQUIPMENTCOMPOSITE_PROG_SOURCES} ${EQUIPMENTCOMPOSITE_PROG_HEADERS})
target_link_libraries(EquipmentComposite_prog PRIVATE EquipmentComposite_lib)

SET (EQUIPMENTCOMPOSITE_LIB_HEADERS
    Iterator.hpp
    Equipment.hpp
    FloppyDisk.hpp
    CompositeEquipment.hpp
    Chassis.hpp
)
LIST (TRANSFORM EQUIPMENTCOMPOSITE_LIB_HEADERS PREPEND include/)

SET (EQUIPMENTCOMPOSITE_LIB_SOURCES
    Iterator.cpp
    Equipment.cpp
    FloppyDisk.cpp
    CompositeEquipment.cpp
    Chassis.cpp
)

add_library(EquipmentComposite_lib SHARED ${EQUIPMENTCOMPOSITE_LIB_SOURCES} ${EQUIPMENTCOMPOSITE_LIB_HEADERS})
target_include_directories(EquipmentComposite_lib PRIVATE include)
