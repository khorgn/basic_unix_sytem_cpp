#pragma once

#include "MazeFactory.hpp"
#include "Maze.hpp"
#include "Room.hpp"
#include "Wall.hpp"
#include "Door.hpp"

namespace prototype::mazegame
{
    class MazeGame
    {
        public:
        MazeGame() {}
        const prototype::mazeprototype::Maze* create_maze(mazeprototype::MazeFactory& factory);

        // factory methods:
        virtual mazeprototype::Maze* make_maze() const { return new mazeprototype::Maze; }
        virtual mazeprototype::Room* make_room(int roomNumber) const { return new mazeprototype::Room(roomNumber); }
        virtual mazeprototype::Wall* make_wall() const { return new mazeprototype::Wall; }
        virtual mazeprototype::Door* make_door(mazeprototype::Room* room1, mazeprototype::Room* room2) const { return new mazeprototype::Door(room1, room2); }
    };
} // prototype::mazegame
