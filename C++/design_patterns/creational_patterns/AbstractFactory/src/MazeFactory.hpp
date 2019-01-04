#if !defined(IMAZEFACTORY_HPP)
#define IMAZEFACTORY_HPP

/**
 * @brief 
 * 
 */
#include "Maze.hpp"
#include "Door.hpp"
#include "Wall.hpp"
#include "Room.hpp"

namespace abstractfactory::mazefactory
{

    /**
     * @brief An abstract builder of a maze
     * 
     */
    class MazeFactory
    {
        public:
        MazeFactory() = default;
        virtual ~MazeFactory() = default;
        
        virtual Maze* make_maze() const { return new Maze; }

        virtual Wall* make_wall() const { return new Wall; }

        virtual Room* make_room(int roomNumber) const { return new Room(roomNumber); }

        virtual Door* make_door(Room* room1, Room* room2) const { return new Door(room1, room2); }

    };
} // mazefactory

#endif // IMAZEFACTORY_HPP
