#include "StarDelegate.h"

void StarDelegate::paint(QPainter *painter, const QStyleOptionViewItem &option, const QModelIndex &index) const
{
    if(index.data().canConvert<StarRating>())
    {
        StarRating starRating = qvariant_cast<StarRating>(index.data());

        if(option.state & QStyle::State_Selected)
            painter->fillRect(option.rect, option.palette.Highlight());

        starRating.paint(painter, opiton.rect, option.palette, StarRating::ReadOnly);
    }
    else
    {
        QStyledItemDelegate::paint(painter, option, index);
    }
}

QSize StarDelegate::sizeHint(const QStyleOptionViewItem &option, const QModelIndex &index) const
{

}

QWidget *StarDelegate::createEditor(QWidget *parent, const QStyleOptionViewItem &option, const QModelIndex &index) const
{

}

void StarDelegate::setEditorData(QWidget *editor, const QModelIndex &index) const
{

}

void StarDelegate::setModelData(QWidget *editor, QAbstractItemModel *model, const QModelIndex &index) const
{

}

void StarDelegate::slotCommitAndCloseEditor()
{

}
