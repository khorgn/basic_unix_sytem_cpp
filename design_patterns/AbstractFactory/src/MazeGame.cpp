#include "MazeGame.hpp"

#include "IMapSite.hpp"

using namespace abstractfactory::mazegame;


abstractfactory::mazefactory::Maze* MazeGame::create_maze(mazefactory::MazeFactory& factory)
{
    mazefactory::Maze* aMaze = factory.make_maze();
    mazefactory::Room* r1 = factory.make_room(1);
    mazefactory::Room* r2 = factory.make_room(2);
    mazefactory::Door* aDoor = factory.make_door(r1, r2);

    aMaze->add_room(r1);
    aMaze->add_room(r2);

    r1->set_side(mazefactory::Room::ERoomSide::North, factory.make_wall());
    r1->set_side(mazefactory::Room::ERoomSide::South, factory.make_wall());
    r1->set_side(mazefactory::Room::ERoomSide::West, factory.make_wall());
    r1->set_side(mazefactory::Room::ERoomSide::East, aDoor);

    r2->set_side(mazefactory::Room::ERoomSide::North, factory.make_wall());
    r2->set_side(mazefactory::Room::ERoomSide::South, factory.make_wall());
    r2->set_side(mazefactory::Room::ERoomSide::West, aDoor);
    r2->set_side(mazefactory::Room::ERoomSide::East, factory.make_wall());

    return aMaze;
}
