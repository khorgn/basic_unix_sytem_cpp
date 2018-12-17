#include "AMazeBuilder.hpp"
#include "Maze.hpp"

namespace builder::mazegame
{
    class MazeGame
    {
        public:
        MazeGame() {}
        const builder::mazebuilder::Maze* create_maze(builder::mazebuilder::AMazeBuilder& builder);
    };
} // mazegame
