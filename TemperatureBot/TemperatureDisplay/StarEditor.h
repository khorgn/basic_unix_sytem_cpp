#ifndef STAREDITOR_H
#define STAREDITOR_H

#include <QWidget>
#include <QPaintEvent>
#include <QMouseEvent>
#include <QSize>

#include "StarRating.h"

//!
//! \brief The StarEditor class allowing edition of a StarRating
//! The class lets the user edit a StarRating by moving the mouse over the editor.
//! It emits the editingFinished() signal when the user clicks on the editor.
//!
class StarEditor : public QWidget
{
    Q_OBJECT
public:
    explicit StarEditor(QWidget *parent = nullptr);

    QSize sizeHint() const override;
    StarRating starRating() const { return m_starRating; }
    void setStarRating(const StarRating &starRating) { m_starRating = starRating; }

signals:
    void editingFinished();
public slots:

protected:
    void paintEvent(QPaintEvent *event) override;
    void mouseMoveEvent(QMouseEvent *event) override;
    void mouseReleaseEvent(QMouseEvent *event) override;

private:
    int StarAtPosition(int x);
    StarRating m_starRating;
};

#endif // STAREDITOR_H
