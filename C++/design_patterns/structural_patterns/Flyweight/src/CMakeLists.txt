cmake_minimum_required(VERSION 3.10)

SET (DOCUMENTFLIGHTWEIGHT_PROG_HEADERS

)

SET (DOCUMENTFLIGHTWEIGHT_PROG_SOURCES
    main.cpp
)

add_executable(DocumentFlightweight_prog ${DOCUMENTFLIGHTWEIGHT_PROG_SOURCES} ${DOCUMENTFLIGHTWEIGHT_PROG_HEADERS})
target_link_libraries(DocumentFlightweight_prog PRIVATE DocumentFlightweight_lib)

SET (DOCUMENTFLIGHTWEIGHT_LIB_HEADERS
    Glyph.hpp
)
LIST (TRANSFORM DOCUMENTFLIGHTWEIGHT_LIB_HEADERS PREPEND include/)

SET (DOCUMENTFLIGHTWEIGHT_LIB_SOURCES
    Glyph.cpp
)

add_library(DocumentFlightweight_lib SHARED ${DOCUMENTFLIGHTWEIGHT_LIB_SOURCES} ${DOCUMENTFLIGHTWEIGHT_LIB_HEADERS})
target_include_directories(DocumentFlightweight_lib PRIVATE include)