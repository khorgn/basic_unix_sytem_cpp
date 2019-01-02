#include "MazeGame.hpp"

#include "MazeFactory.hpp"
#include "IMapSite.hpp"

using namespace prototype::mazegame;
using namespace prototype::mazeprototype;

const prototype::mazeprototype::Maze* MazeGame::create_maze(MazeFactory& factory)
{
    Maze* aMaze = factory.make_maze();
    Room* r1 = factory.make_room(1);
    Room* r2 = factory.make_room(2);
    Door* aDoor = factory.make_door(r1, r2);


    r1->set_side(Room::ERoomSide::North, factory.make_wall());
    r1->set_side(Room::ERoomSide::South, factory.make_wall());
    r1->set_side(Room::ERoomSide::West, factory.make_wall());
    r1->set_side(Room::ERoomSide::East, aDoor);

    r2->set_side(Room::ERoomSide::North, factory.make_wall());
    r2->set_side(Room::ERoomSide::South, factory.make_wall());
    r2->set_side(Room::ERoomSide::West, aDoor);
    r2->set_side(Room::ERoomSide::East, factory.make_wall());

    aMaze->add_room(r1);
    aMaze->add_room(r2);

    return aMaze;
}
