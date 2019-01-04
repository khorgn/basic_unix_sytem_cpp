#include "StarRating.h"

#include <QPointF>
#include <cmath>
#include <QSize>

const int c_paintingScaleFactor = 20;

StarRating::StarRating(int starCount, int maxStarCount) : m_starCount(starCount), m_maxStarCount(maxStarCount)
{
    // QPointF is a floating point, by giving it to QPolygonF lines are drawn between the serie of points
    m_starPolygon << QPointF(1.0, 0.5);
    for(int i=1; i<5; ++i)
    {
        m_starPolygon << QPointF(0.5 + 0.5 * std::cos(0.8 * i * 3.14),
                                 0.5 + 0.5 * std::sin(0.8 * i * 3.14));
    }
    m_diamondPolygon << QPointF(0.4, 0.5) << QPointF(0.5, 0.4)
                     << QPointF(0.6, 0.5) << QPointF(0.5, 0.6)
                     << QPointF(0.4, 0.5);
}

void StarRating::paint(QPainter *painter, const QRect &rect, const QPalette &palette, StarRating::EditMode mode) const
{
    painter->save();

    painter->setRenderHint(QPainter::Antialiasing, true);
    painter->setPen(Qt::NoPen);

    // set the color of the brush
    if (mode == Editable)
        painter->setBrush(palette.highlight());
    else
        painter->setBrush(palette.foreground());

    int yOffset = (rect.height() - c_paintingScaleFactor) / 2;
    painter->translate(rect.x(), rect.y() + yOffset);
    painter->scale(c_paintingScaleFactor, c_paintingScaleFactor);

    for (int i=0; i<m_maxStarCount; ++i)
    {
        if (i < m_starCount)
            painter->drawPolygon(m_starPolygon, Qt::WindingFill);
        // draws the rest of the unfilled stars as polygons if the mode is set as editable
        else if (mode == Editable)
            painter->drawPolygon(m_diamondPolygon, Qt::WindingFill);
        painter->translate(1.0, 0.0);
    }
    painter->restore();
}

QSize StarRating::sizeHint() const
{
    // the prefered size is just enough to paint the maximum number of stars
    return c_paintingScaleFactor * QSize(m_maxStarCount, 1);
}

QString StarRating::toString() const
{
    return QString::number(m_starCount)+QString("/")+QString::number(m_maxStarCount);
}
