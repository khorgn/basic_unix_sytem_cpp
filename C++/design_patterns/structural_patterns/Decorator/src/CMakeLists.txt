cmake_minimum_required(VERSION 3.10)

SET (VISUALDECORATOR_PROG_HEADERS

)

SET (VISUALDECORATOR_PROG_SOURCES
    main.cpp
)

add_executable(VisualDecorator_prog ${VISUALDECORATOR_PROG_SOURCES} ${VISUALDECORATOR_PROG_HEADERS})
target_link_libraries(VisualDecorator_prog PRIVATE VisualDecorator_lib)

SET (VISUALDECORATOR_LIB_HEADERS
    TextView.hpp
    BorderDecorator.hpp
    Decorator.hpp
    VisualComponent.hpp
)
LIST (TRANSFORM VISUALDECORATOR_LIB_HEADERS PREPEND include/)

SET (VISUALDECORATOR_LIB_SOURCES
    TextView.cpp
    BorderDecorator.cpp
    Decorator.cpp
    VisualComponent.cpp
)

add_library(VisualDecorator_lib SHARED ${VISUALDECORATOR_LIB_SOURCES} ${VISUALDECORATOR_LIB_HEADERS})
target_include_directories(VisualDecorator_lib PRIVATE include)