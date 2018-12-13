cmake_minimum_required(VERSION 3.10)

SET (MAZEFACTORY_PROG_HEADERS
    MazeGame.hpp
    )

SET (MAZEFACTORY_PROG_SOURCES
    main.cpp
    MazeGame.cpp
    )


add_executable(MazeFactory_prog ${MAZEFACTORY_PROG_SOURCES} ${MAZEFACTORY_PROG_HEADERS})
target_link_libraries(MazeFactory_prog PRIVATE MazeFactory_lib)

SET (MAZEFACTORY_LIB_HEADERS
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

    )

SET (MAZEFACTORY_LIB_SOURCES
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
    )

add_library(MazeFactory_lib SHARED ${MAZEFACTORY_LIB_SOURCES} ${MAZEFACTORY_LIB_HEADERS})