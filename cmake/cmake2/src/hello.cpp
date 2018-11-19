#include "hello.hpp"
#include <string>
#include <iostream>

void hello(std::string const& str)
{
    std::cout << "Hello, " << str << '\n';
}