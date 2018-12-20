cmake_minimum_required(VERSION 3.12)

SET (MAZEFACTORYMETHOD_PROG_HEADERS
    )
LIST (TRANSFORM MAZEFACTORYMETHOD_PROG_HEADERS PREPEND include/)
SET (MAZEFACTORYMETHOD_PROG_SOURCES
    main.cpp
    )

add_executable(MazeFactoryMethod_prog ${MAZEFACTORYMETHOD_PROG_SOURCES} include/${MAZEFACTORYMETHOD_PROG_HEADERS})
target_link_libraries(MazeFactoryMethod_prog PRIVATE MazeFactoryMethod_lib)
target_include_directories(MazeFactoryMethod_prog PRIVATE include)

SET (MAZEFACTORYMETHOD_LIB_HEADERS
    Door.hpp
    IMapSite.hpp
    Maze.hpp
    MazeGame.hpp
    Room.hpp
    Wall.hpp

    BombedWall.hpp
    RoomWithABomb.hpp
    EnchantedRoom.hpp
    DoorNeedingSpell.hpp

    BombedMazeGame.hpp
    EnchantedMazeGame.hpp
    )
LIST (TRANSFORM MAZEFACTORYMETHOD_LIB_HEADERS PREPEND include/)
SET (MAZEFACTORYMETHOD_LIB_SOURCES
    Door.cpp
    IMapSite.cpp
    Maze.cpp
    MazeGame.cpp
    Room.cpp
    Wall.cpp

    BombedWall.cpp
    EnchantedRoom.cpp
    DoorNeedingSpell.cpp

    BombedMazeGame.cpp
    EnchantedMazeGame.cpp
    )

add_library(MazeFactoryMethod_lib SHARED ${MAZEFACTORYMETHOD_LIB_SOURCES} ${MAZEFACTORYMETHOD_LIB_HEADERS})
target_include_directories(MazeFactoryMethod_lib PRIVATE include)
