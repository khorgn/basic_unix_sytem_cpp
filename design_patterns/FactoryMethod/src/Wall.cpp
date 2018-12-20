#include "Wall.hpp"

#include <iostream>

using namespace factorymethod::mazefactorymethod;

bool Wall::enter()
{
    std::cout << "you hit a wall" << '\n';
    return false;
}