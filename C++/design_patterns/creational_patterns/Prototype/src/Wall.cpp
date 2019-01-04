#include "Wall.hpp"

#include <iostream>

using namespace prototype::mazeprototype;

bool Wall::enter()
{
    std::cout << "you hit a wall" << '\n';
    return false;
}

Wall* Wall::clone() const
{
    return new Wall;
}
