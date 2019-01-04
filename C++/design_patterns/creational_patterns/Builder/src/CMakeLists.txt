cmake_minimum_required(VERSION 3.12)

SET (MAZEBUILDER_PROG_HEADERS
    )
LIST (TRANSFORM MAZEBUILDER_PROG_HEADERS PREPEND include/)
SET (MAZEBUILDER_PROG_SOURCES
    main.cpp
    )

add_executable(MazeBuilder_prog ${MAZEBUILDER_PROG_SOURCES} include/${MAZEBUILDER_PROG_HEADERS})
target_link_libraries(MazeBuilder_prog PRIVATE MazeBuilder_lib)
target_include_directories(MazeBuilder_prog PRIVATE include)

SET (MAZEBUILDER_LIB_HEADERS
    AMazeBuilder.hpp
    Maze.hpp
    IMapSite.hpp
    Room.hpp
    Wall.hpp
    Door.hpp

    StandardMazeBuilder.hpp

    MazeGame.hpp
    )
LIST (TRANSFORM MAZEBUILDER_LIB_HEADERS PREPEND include/)
SET (MAZEBUILDER_LIB_SOURCES
    AMazeBuilder.cpp
    Maze.cpp
    IMapSite.cpp
    Room.cpp
    Wall.cpp
    Door.cpp

    StandardMazeBuilder.cpp
    MazeGame.cpp
    )

add_library(MazeBuilder_lib SHARED ${MAZEBUILDER_LIB_SOURCES} ${MAZEBUILDER_LIB_HEADERS})
target_include_directories(MazeBuilder_lib PRIVATE include)
