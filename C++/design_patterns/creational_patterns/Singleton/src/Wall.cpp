#include "Wall.hpp"

#include <iostream>

using namespace singleton::mazesingleton;

bool Wall::enter()
{
    std::cout << "you hit a wall" << '\n';
    return false;
}