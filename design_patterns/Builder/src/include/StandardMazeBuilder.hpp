
#if !defined(STANDARDMAZEBUILDER_HPP)
#define STANDARDMAZEBUILDER_HPP

#include "AMazeBuilder.hpp"
#include "Maze.hpp"
#include "Room.hpp"

namespace builder::mazebuilder
{
    class StandardMazeBuilder : public AMazeBuilder
    {
        public:
        virtual void build_maze() override;
        virtual void build_room(int roomNumber) override;
        virtual void build_door(int room1, int room2) override;
        virtual const Maze* maze() const override { return m_maze; }
        ~StandardMazeBuilder();
        private:
        Room::ERoomSide common_wall(Room* room1, Room* room2) const;
        Maze* m_maze;
    };
}

#endif // STANDARDMAZEBUILDER_HPP
