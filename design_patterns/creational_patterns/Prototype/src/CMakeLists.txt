cmake_minimum_required(VERSION 3.12)

SET (MAZEPROTOTYPE_PROG_HEADERS
    )
LIST (TRANSFORM MAZEPROTOTYPE_PROG_HEADERS PREPEND include/)
SET (MAZEPROTOTYPE_PROG_SOURCES
    main.cpp
    )

add_executable(MazePrototype_prog ${MAZEPROTOTYPE_PROG_SOURCES} include/${MAZEPROTOTYPE_PROG_HEADERS})
target_link_libraries(MazePrototype_prog PRIVATE MazePrototype_lib)
target_include_directories(MazePrototype_prog PRIVATE include)

SET (MAZEPROTOTYPE_LIB_HEADERS
    Door.hpp
    IMapSite.hpp
    Maze.hpp
    MazeGame.hpp
    Room.hpp
    Wall.hpp

    MazeFactory.hpp
    MazePrototypeFactory.hpp

    BombedWall.hpp
    RoomWithABomb.hpp
    EnchantedRoom.hpp
    DoorNeedingSpell.hpp
    )
LIST (TRANSFORM MAZEPROTOTYPE_LIB_HEADERS PREPEND include/)
SET (MAZEPROTOTYPE_LIB_SOURCES
    Door.cpp
    IMapSite.cpp
    Maze.cpp
    MazeGame.cpp
    Room.cpp
    Wall.cpp

    MazeFactory.cpp
    MazePrototypeFactory.cpp

    BombedWall.cpp
    EnchantedRoom.cpp
    DoorNeedingSpell.cpp
    )

add_library(MazePrototype_lib SHARED ${MAZEPROTOTYPE_LIB_SOURCES} ${MAZEPROTOTYPE_LIB_HEADERS})
target_include_directories(MazePrototype_lib PRIVATE include)
