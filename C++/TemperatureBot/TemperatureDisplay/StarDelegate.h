#ifndef STARDELEGATE_H
#define STARDELEGATE_H

#include <QStyledItemDelegate>

#include "StarRating.h"

class StarDelegate : public QStyledItemDelegate
{
    Q_OBJECT
public:
    StarDelegate(QWidget* parent = nullptr) : QStyledItemDelegate(parent) {}
    void paint(QPainter *painter, const QStyleOptionViewItem &option, const QModelIndex &index) const override; //!< called when the view needs to repaint the item
    QSize sizeHint(const QStyleOptionViewItem &option, const QModelIndex &index) const override; //!< return the item's prefered size
    QWidget* createEditor(QWidget *parent, const QStyleOptionViewItem &option, const QModelIndex &index) const override; //!< called when the user starts editing the item

    void setEditorData(QWidget* editor, const QModelIndex& index) const override; //!< called when the editor is created to initialize it with data from the model
    void setModelData(QWidget* editor, QAbstractItemModel *model, const QModelIndex& index) const override; //!< called to commit data from the editor to the model when editing is finished

private slots:
    void slotCommitAndCloseEditor();
};

#endif // STARDELEGATE_H
