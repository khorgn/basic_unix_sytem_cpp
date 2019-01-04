#include "Wall.hpp"

#include <iostream>

using namespace abstractfactory::mazefactory;

bool Wall::enter()
{
    std::cout << "you hit a wall" << '\n';
    return false;
}