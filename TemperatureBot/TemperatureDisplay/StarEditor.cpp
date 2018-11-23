#include "StarEditor.h"

#include <QPainter>

StarEditor::StarEditor(QWidget *parent) : QWidget(parent)
{
    setMouseTracking(true);  // allows us to follow the cursor even when the user doesn't press a mouse button
    setAutoFillBackground(true); // gives us an opaque background so we don't see the view through the editor
}

QSize StarEditor::sizeHint() const
{
    return m_starRating.sizeHint();
}

void StarEditor::paintEvent(QPaintEvent *event)
{
    QPainter painter(this);
    m_starRating.paint(&painter, rect(), this->palette(), StarRating::Editable); // we call StarRating's paint to draw the stars
}

void StarEditor::mouseMoveEvent(QMouseEvent *event)
{
    // the x is relative to the item, not the general widget
    int star = StarAtPosition(event->x()); // we recover the star corresponding to the current position

    if(star != m_starRating.starCount() && star != -1) // if the mouse is on a star that is different from the current star
    {
        m_starRating.setStarCount(star); // we update the star count
        update(); // we force a repaint of the view
    }
}

void StarEditor::mouseReleaseEvent(QMouseEvent *event)
{
    emit editingFinished(); // finish the editing to save in the model once the user use mouseclick
}

int StarEditor::StarAtPosition(int x)
{
    int star = ( x / ( m_starRating.sizeHint().width()
            / m_starRating.maxStarCount() ) ) + 1;
    if( star <= 0 || star > m_starRating.maxStarCount() )
        return -1;
    return star;
}
