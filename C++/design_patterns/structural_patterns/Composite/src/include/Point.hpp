#pragma once
#include "Coord.hpp"

namespace bridge
{
    class Point
    {
        private:
        Coord m_x, m_y;
        public:
        Point(Coord x, Coord y) : m_x(x), m_y(y) {}
        Coord x() const { return m_x; }
        Coord y() const { return m_y; }
    };
}