#pragma once

#include "MazeFactory.hpp"
#include "Maze.hpp"
#include "Wall.hpp"
#include "Room.hpp"

namespace prototype::mazeprototype
{
    class MazePrototypeFactory : public MazeFactory
    {
        public:
        MazePrototypeFactory(Maze* maze, Wall* wall, Room* room, Door* door) : m_prototypeMaze(maze), m_prototypeRoom(room), m_prototypeWall(wall), m_prototypeDoor(door) {}

        virtual Maze* make_maze() const override;
        virtual Room* make_room(int) const override;
        virtual Wall* make_wall() const override;
        virtual Door* make_door(Room* room1, Room* room2) const override;

        private:
        Maze* m_prototypeMaze;
        Room* m_prototypeRoom;
        Wall* m_prototypeWall;
        Door* m_prototypeDoor;
    };
}