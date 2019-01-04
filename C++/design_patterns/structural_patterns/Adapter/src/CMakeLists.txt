cmake_minimum_required(VERSION 3.10)

SET (SHAPEADAPTER_PROG_HEADERS

)

SET (SHAPEADAPTER_PROG_SOURCES
    main.cpp
)

add_executable(ShapeAdapter_prog ${SHAPEADAPTER_PROG_SOURCES} ${SHAPEADAPTER_PROG_HEADERS})
target_link_libraries(ShapeAdapter_prog PRIVATE ShapeAdapter_lib)

SET (SHAPEADAPTER_LIB_HEADERS
    Shape.hpp
    TextView.hpp
    TextShape.hpp
    Coord.hpp
    Point.hpp
    Manipulator.hpp
    TextManipulator.hpp
)
LIST (TRANSFORM SHAPEADAPTER_LIB_HEADERS PREPEND include/)

SET (SHAPEADAPTER_LIB_SOURCES
    Shape.cpp
    TextView.cpp
    TextShape.cpp
)

add_library(ShapeAdapter_lib SHARED ${SHAPEADAPTER_LIB_SOURCES} ${SHAPEADAPTER_LIB_HEADERS})
target_include_directories(ShapeAdapter_lib PRIVATE include)