#pragma once

#include "Maze.hpp"
#include "Room.hpp"
#include "Wall.hpp"
#include "Door.hpp"

namespace factorymethod::mazegame
{
    class MazeGame
    {
        public:
        MazeGame() {}
        const factorymethod::mazefactorymethod::Maze* create_maze();

        // factory methods:
        virtual mazefactorymethod::Maze* make_maze() const { return new mazefactorymethod::Maze; }
        virtual mazefactorymethod::Room* make_room(int roomNumber) const { return new mazefactorymethod::Room(roomNumber); }
        virtual mazefactorymethod::Wall* make_wall() const { return new mazefactorymethod::Wall; }
        virtual mazefactorymethod::Door* make_door(mazefactorymethod::Room* room1, mazefactorymethod::Room* room2) const { return new mazefactorymethod::Door(room1, room2); }
    };
} // factorymethod::mazegame
