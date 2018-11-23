#include "StarDelegate.h"
#include "StarEditor.h"

#include <QDebug>

void StarDelegate::paint(QPainter *painter, const QStyleOptionViewItem &option, const QModelIndex &index) const
{
    // if the item is a StarRating
    if(index.data().canConvert<StarRating>())
    {
        StarRating starRating = qvariant_cast<StarRating>(index.data());
        // if the item is selected
        if(option.state & QStyle::State_Selected)
            painter->fillRect(option.rect, option.palette.highlight()); // we manually draw the background as highlighted

        starRating.paint(painter, option.rect, option.palette, StarRating::ReadOnly); // we draw the item
    }
    else
    {
        // We let the ItemDelegate paint for us
        QStyledItemDelegate::paint(painter, option, index);
    }
}

QSize StarDelegate::sizeHint(const QStyleOptionViewItem &option, const QModelIndex &index) const
{
    if(index.data().canConvert<StarRating>())
    {
        // we forward the call to StarRating
        StarRating starRating = qvariant_cast<StarRating>(index.data());
        return starRating.sizeHint();
    }
    else
    {
        return QStyledItemDelegate::sizeHint(option, index);
    }
}

QWidget *StarDelegate::createEditor(QWidget *parent, const QStyleOptionViewItem &option, const QModelIndex &index) const
{
    // if the item is a StarRating
    if(index.data().canConvert<StarRating>())
    {
        // create and connect a new StarEditor
        StarEditor *starEditor = new StarEditor(parent);
        // when the editing is finished, we save it to the model and close the editor
        connect(starEditor, &StarEditor::editingFinished, this, &StarDelegate::slotCommitAndCloseEditor);
        return starEditor;
    }
    // else, return the standard editor
    else
    {
        return QStyledItemDelegate::createEditor(parent, option, index);
    }
}

void StarDelegate::setEditorData(QWidget *editor, const QModelIndex &index) const
{
    // if the item is a StarRating
    if(index.data().canConvert<StarRating>())
    {
        StarRating starRating = qvariant_cast<StarRating>(index.data()); // convert the data to the QVariant StarRating
        StarEditor *starEditor = qobject_cast<StarEditor *>(editor); // convert the editor to the QObject StarEditor
        starEditor->setStarRating(starRating);
    }
    else
    {
        QStyledItemDelegate::setEditorData(editor, index);
    }
}

void StarDelegate::setModelData(QWidget *editor, QAbstractItemModel *model, const QModelIndex &index) const
{
    // if the item is a StarRating
    if(index.data().canConvert<StarRating>())
    {
        StarEditor *starEditor = qobject_cast<StarEditor *>(editor);
        model->setData(index, QVariant::fromValue(starEditor->starRating()));

    }
    else
    {
        QStyledItemDelegate::setModelData(editor, model, index);
    }
}

void StarDelegate::slotCommitAndCloseEditor()
{
    // recover the one sending the signal (the editor)
    StarEditor *editor = qobject_cast<StarEditor *>(sender());
    // emit the signal to tell the model that there is edited data
    emit commitData(editor);
    // emit the signal to tell the view the editor is not needed anymore
    emit closeEditor(editor);
}
