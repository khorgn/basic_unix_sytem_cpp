#pragma once
#include "Point.hpp"

namespace bridge
{
    class WindowImp
    {
        protected:
        WindowImp() = default;

        public:
        virtual void impTop() = 0;
        virtual void impBottom() = 0;
        virtual void impSetExtent(const Point&) = 0;
        virtual void impSetOrigin(const Point&) = 0;

        virtual void deviceRect(Coord, Coord, Coord, Coord) = 0;
        virtual void deviceText(const char* text, Coord, Coord) = 0;
        virtual void deviceBitmap(const char*, Coord, Coord) = 0;
        // lots more functions for drawing on windows
    };
}