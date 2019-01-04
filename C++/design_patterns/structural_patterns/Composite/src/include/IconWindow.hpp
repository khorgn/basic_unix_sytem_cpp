#pragma once
#include "Window.hpp"

namespace bridge
{
    class IconWindow : Window
    {
        public:
        virtual void drawContents();

        private:
        const char* m_bitmapName;
    };
}