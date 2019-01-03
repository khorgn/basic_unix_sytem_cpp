cmake_minimum_required(VERSION 3.10)

SET (WINDOWBRIDGE_PROG_HEADERS

)

SET (WINDOWBRIDGE_PROG_SOURCES
    main.cpp
)

add_executable(WindowBridge_prog ${WINDOWBRIDGE_PROG_SOURCES} ${WINDOWBRIDGE_PROG_HEADERS})
target_link_libraries(WindowBridge_prog PRIVATE WindowBridge_lib)

SET (WINDOWBRIDGE_LIB_HEADERS
    Coord.hpp
    Point.hpp
    Window.hpp
    WindowImp.hpp
    ApplicationWindow.hpp
    IconWindow.hpp
)
LIST (TRANSFORM WINDOWBRIDGE_LIB_HEADERS PREPEND include/)

SET (WINDOWBRIDGE_LIB_SOURCES
    Coord.cpp
    Point.cpp
    Window.cpp
    WindowImp.cpp
    ApplicationWindow.cpp
    IconWindow.cpp
)

add_library(WindowBridge_lib SHARED ${WINDOWBRIDGE_LIB_SOURCES} ${WINDOWBRIDGE_LIB_HEADERS})
target_include_directories(WindowBridge_lib PRIVATE include)