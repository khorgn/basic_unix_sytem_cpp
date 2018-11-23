#ifndef STARRATING_H
#define STARRATING_H

#include <QPainter>
#include <QRect>
#include <QSize>
#include <QPolygonF>
#include <QPalette>

//!
//! \brief The StarRating class represent a rating as a number of stars
//! holds the stars and paint them through a QPaintDevice (either a view or an editor)
//!
class StarRating
{
public:
    enum EditMode { Editable, ReadOnly };

    explicit StarRating(int starCount = 1, int maxStarCount = 5);

    void paint(QPainter *painter, const QRect &rect, const QPalette &palette, EditMode mode) const;

    QSize sizeHint() const;
    int starCount() const { return m_starCount;}
    int maxStarCount() const { return m_maxStarCount; }
    void setStarCount(int starCount) { m_starCount = starCount; }
    void setMaxStarCount(int maxStarCount) { m_maxStarCount = maxStarCount; }

private:
    QPolygonF m_starPolygon;
    QPolygonF m_diamondPolygon;
    int m_starCount;
    int m_maxStarCount;
};

// makes the class StarRating known to QVariant, making it possible to store the values in a QVariant
Q_DECLARE_METATYPE(StarRating)

#endif // STARRATING_H
