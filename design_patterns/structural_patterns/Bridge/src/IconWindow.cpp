#include "IconWindow.hpp"
#include "WindowImp.hpp"

using namespace bridge;

void IconWindow::drawContents()
{
    WindowImp* imp = getWindowImp();
    if(imp != 0)
    {
        imp->deviceBitmap(m_bitmapName, Coord(0.0), Coord(0.0));
    }
}