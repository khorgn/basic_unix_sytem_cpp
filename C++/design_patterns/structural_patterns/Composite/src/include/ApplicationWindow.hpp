#pragma once
#include "Window.hpp"

namespace bridge
{
    class ApplicationWindow : public Window
    {
        public:
        virtual void drawContents();
    };
}