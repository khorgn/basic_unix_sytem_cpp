cmake_minimum_required(VERSION 3.10)

SET (MAZESINGLETON_PROG_HEADERS
    )

SET (MAZESINGLETON_PROG_SOURCES
    main.cpp
    )


add_executable(MazeSingleton_prog ${MAZESINGLETON_PROG_SOURCES} ${MAZESINGLETON_PROG_HEADERS})
target_link_libraries(MazeSingleton_prog PRIVATE MazeSingleton_lib)

SET (MAZESINGLETON_LIB_HEADERS
    MazeFactory.hpp
    Maze.hpp
    IMapSite.hpp
    Room.hpp
    Wall.hpp
    Door.hpp

    EnchantedMazeFactory.hpp
    EnchantedRoom.hpp
    DoorNeedingSpell.hpp
    Spell.hpp

    BombedMazeFactory.hpp
    BombedWall.hpp

    BombedMazeFactoryAttorneyMazeFactory.hpp
    EnchantedMazeFactoryAttorneyMazeFactory.hpp

    MazeGame.hpp
    )

SET (MAZESINGLETON_LIB_SOURCES
    MazeFactory.cpp
    Maze.cpp
    IMapSite.cpp
    Room.cpp
    Wall.cpp
    Door.cpp

    EnchantedMazeFactory.cpp
    EnchantedRoom.cpp
    DoorNeedingSpell.cpp
    Spell.cpp

    BombedMazeFactory.cpp
    BombedWall.cpp

    MazeGame.cpp
    )

add_library(MazeSingleton_lib SHARED ${MAZESINGLETON_LIB_SOURCES} ${MAZESINGLETON_LIB_HEADERS})