#include "MazeFactory.hpp"
#include "Maze.hpp"

namespace abstractfactory::mazegame
{
    class MazeGame
    {
        public:
        MazeGame() {}
        mazefactory::Maze* create_maze(mazefactory::MazeFactory& factory);
    };
} // mazegame
