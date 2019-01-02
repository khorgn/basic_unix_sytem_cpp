#pragma once
#include "Coord.hpp"

namespace adapter
{
    class Point
    {
        private:
        Coord m_x, m_y;
        public:
        Point(Coord x, Coord y) : m_x(x), m_y(y) {}
        Coord x() { return m_x; }
        Coord y() { return m_y; }
    };
}