#pragma once

namespace adapter
{
    class Shape;
    class Manipulator
    {
        public:
        Manipulator(Shape* parent) : m_parent(parent) {}

        private:
        Shape* m_parent;
    };
}