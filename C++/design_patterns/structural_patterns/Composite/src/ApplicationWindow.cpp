#include "ApplicationWindow.hpp"

using namespace bridge;

void ApplicationWindow::drawContents()
{
    getView()->drawOn(this);
}