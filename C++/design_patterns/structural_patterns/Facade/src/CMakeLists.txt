cmake_minimum_required(VERSION 3.10)

SET (COMPILERFACADE_PROG_HEADERS

)

SET (COMPILERFACADE_PROG_SOURCES
    main.cpp
)

add_executable(CompilerFacade_prog ${COMPILERFACADE_PROG_SOURCES} ${COMPILERFACADE_PROG_HEADERS})
target_link_libraries(CompilerFacade_prog PRIVATE CompilerFacade_lib)

SET (COMPILERFACADE_LIB_HEADERS
    Facade.hpp
)
LIST (TRANSFORM COMPILERFACADE_LIB_HEADERS PREPEND include/)

SET (COMPILERFACADE_LIB_SOURCES
    Facade.cpp
)

add_library(CompilerFacade_lib SHARED ${COMPILERFACADE_LIB_SOURCES} ${COMPILERFACADE_LIB_HEADERS})
target_include_directories(CompilerFacade_lib PRIVATE include)