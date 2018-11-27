#ifndef TEMPERATURETABLEMODEL_H
#define TEMPERATURETABLEMODEL_H

#include <QAbstractItemModel>
#include "TemperatureData.hpp"
#include <vector>
#include "StarRating.h"

//!
//! \brief The representation of a group of temperatures for use in a widget
//!
class TemperatureTableModel : public QAbstractTableModel
{
    Q_OBJECT

public:
    explicit TemperatureTableModel(QObject *parent = nullptr): QAbstractTableModel(parent), m_rowCount(0), m_columnCount(4) {}

    // Header:
    QVariant headerData(int section, Qt::Orientation orientation, int role = Qt::DisplayRole) const override;

    // Basic functionality:

    int rowCount(const QModelIndex &parent = QModelIndex()) const override
    {
        if(parent.isValid()) return 0;
        return m_rowCount;
    }
    int columnCount(const QModelIndex &parent = QModelIndex()) const override
    {
        // check if the parent index is valid (belongs to a model and doesn't have negative row & column number)
        // if it is valid, the current modelindex shouldn't exist since it's not a tree (the index don't have children)
        if(parent.isValid()) return 0;
       return m_columnCount;
    }

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    bool setData(const QModelIndex & index, const QVariant & value, int role = Qt::EditRole) override;

    Qt::ItemFlags flags(const QModelIndex & index) const override
    {
        return Qt::ItemIsEditable | Qt::ItemIsDropEnabled | QAbstractTableModel::flags(index);
    }

    //! Add temperature data to the list
    void addTemperatureData(std::vector<TemperatureBot::TemperatureData> temperatureData);

private:
    std::vector<TemperatureBot::TemperatureData> m_temperatureData;
    int m_rowCount;
    int m_columnCount;
    std::vector<StarRating> m_starRatings;
};

#endif // TEMPERATURETABLEMODEL_H
