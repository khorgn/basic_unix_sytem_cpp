#include "Window.hpp"

using namespace bridge;

void Window::drawRect(const Point& bottomLeft, const Point& topRight)
{
    WindowImp* imp = getWindowImp();
    imp->deviceRect(bottomLeft.x(), bottomLeft.y(), topRight.x(), topRight.y());
}