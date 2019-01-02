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

namespace singleton::mazesingleton
{

    /**
     * @brief An abstract builder of a maze
     * 
     */
    class MazeFactory
    {
        public:
        static MazeFactory* instance();

        virtual ~MazeFactory() = default;
        
        virtual Maze* make_maze() const { return new Maze; }

        virtual Wall* make_wall() const { return new Wall; }

        virtual Room* make_room(int roomNumber) const { return new Room(roomNumber); }

        virtual Door* make_door(Room* room1, Room* room2) const { return new Door(room1, room2); }

        protected:
        MazeFactory() = default;

        private:
        static MazeFactory* ms_instance;
    };
} // mazesingleton

#endif // IMAZEFACTORY_HPP
