
#if !defined(AMAZEBUILDER_HPP)
#define AMAZEBUILDER_HPP

#include "Maze.hpp"

namespace builder::mazebuilder
{
    class AMazeBuilder
    {
        public:
        virtual void build_maze() = 0;
        virtual void build_room(int roomNumber) = 0;
        virtual void build_door(int room1, int room2) = 0;
        virtual const Maze* maze() const = 0;

        protected:
        AMazeBuilder() = default;

    };
}

#endif // AMAZEBUILDER_HPP
