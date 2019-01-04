#include "Wall.hpp"

#include <iostream>

using namespace builder::mazebuilder;

bool Wall::enter()
{
    std::cout << "you hit a wall" << '\n';
    return false;
}