#pragma once
#include "Point.hpp"
#include "WindowImp.hpp"

namespace bridge
{
    class Window;
    class View
    {
        public:
        void drawOn(Window* parent);
    };
    class Window
    {
        private:
        WindowImp* m_imp;
        View* m_contents; // the window's contents

        protected:
        WindowImp* getWindowImp();
        View* getView();

        public:
        Window(View* contents);

        // requests handled by window
        virtual void drawContents();

        virtual void open();
        virtual void close();
        virtual void iconify();
        virtual void deiconify();

        // requests forwarded to implementation
        virtual void setOrigin(const Point& at);
        virtual void setExtent(const Point& extent);
        virtual void raise();
        virtual void lower();

        virtual void drawLine(const Point& point1, const Point& point2);
        virtual void drawRect(const Point& bottomLeft, const Point& topRight);
        virtual void drawPolygon(const Point points[], int size);
        virtual void drawText(const char* text, const Point& origin);
    };
}