#include "MazeFactory.hpp"
#include "Maze.hpp"

namespace singleton::mazegame
{
    class MazeGame
    {
        public:
        MazeGame() {}
        mazesingleton::Maze* create_maze(mazesingleton::MazeFactory& factory);
    };
} // mazegame
