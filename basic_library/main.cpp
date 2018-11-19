#include "DumbMath.hpp"
#include <iostream>

int main(int argc, char** argv)
{
    basicLib::DumbMath dm(4);

    std::cout << dm.multiplyBy(2) << '\n';

    return 0;
}