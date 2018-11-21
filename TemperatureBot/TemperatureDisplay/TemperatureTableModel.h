#ifndef TEMPERATURETABLEMODEL_H
#define TEMPERATURETABLEMODEL_H

#include <QAbstractItemModel>
#include "TemperatureData.hpp"
#include <vector>

class TemperatureTableModel : public QAbstractTableModel
{
    Q_OBJECT

public:
    explicit TemperatureTableModel(QObject *parent = nullptr);

    // Header:
    QVariant headerData(int section, Qt::Orientation orientation, int role = Qt::DisplayRole) const override;

    // Basic functionality:

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    int columnCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;


    // Add temperature data to the list
    void addTemperatureData(std::vector<TemperatureBot::TemperatureData> temperatureData);

private:
    std::vector<TemperatureBot::TemperatureData> m_temperatureData;
    int m_rowCount;
    int m_columnCount;
};

#endif // TEMPERATURETABLEMODEL_H
