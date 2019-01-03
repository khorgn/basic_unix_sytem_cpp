#pragma once

#include "WindowImp.hpp"

namespace bridge
{
    class XWindowImp : public WindowImp
    {
        public:
        XWindowImp() = default;

        virtual void deviceRect(Coord, Coord, Coord, Coord) override;
        // remainer of the public interface ...

        private:
        // lots of X window system-specific state, including:
        // Display* m_dpy;
        // Drawable m_winind;
        // GC m_gc;
    };
}