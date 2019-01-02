#pragma once
#include "Manipulator.hpp"

namespace adapter
{
    class TextManipulator : public Manipulator
    {
        public:
        TextManipulator(Shape* parent) : Manipulator(parent) {}
    };
}