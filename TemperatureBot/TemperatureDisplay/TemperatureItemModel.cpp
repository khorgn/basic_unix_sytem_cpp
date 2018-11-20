#include "TemperatureItemModel.h"

TemperatureItemModel::TemperatureItemModel(QObject *parent)
    : QAbstractItemModel(parent)
{
}

QVariant TemperatureItemModel::headerData(int section, Qt::Orientation orientation, int role) const
{
    if (Qt::DisplayRole == role)
    {
        if (Qt::Horizontal == orientation)
        {
            switch (section)
            {
            case 0:
                return QString("datetime");
                break;
            case 1:
                return QString("location");
                break;
            case 2:
                return QString("temperature");
                break;
            default:
                break;
            }
        }
    }
    return QVariant();
}

QModelIndex TemperatureItemModel::index(int row, int column, const QModelIndex &parent) const
{
    // FIXME: Implement me!
}

QModelIndex TemperatureItemModel::parent(const QModelIndex &index) const
{
    // FIXME: Implement me!
}

int TemperatureItemModel::rowCount(const QModelIndex &parent) const
{
    if (!parent.isValid())
        return 0;

    // FIXME: Implement me!
}

int TemperatureItemModel::columnCount(const QModelIndex &parent) const
{
    if (!parent.isValid())
        return 0;

    // FIXME: Implement me!
}

QVariant TemperatureItemModel::data(const QModelIndex &index, int role) const
{
    int row = index.row();
    int column = index.column();
    switch (role)
    {
    case Qt::DisplayRole:
        if(column == 0)
        {
            const tm* datetime = &m_temperatureData[row].Datetime;
            return QString("%1-%2-%3T%4:%5:%6")
                .arg(datetime->tm_year)
                .arg(datetime->tm_mon, /* fieldWith */ 2, /* base */ 10, /* fillChar */ QChar('0'))
                .arg(datetime->tm_mday, /* fieldWith */ 2, /* base */ 10, /* fillChar */ QChar('0'))
                .arg(datetime->tm_hour, /* fieldWith */ 2, /* base */ 10, /* fillChar */ QChar('0'))
                .arg(datetime->tm_min, /* fieldWith */ 2, /* base */ 10, /* fillChar */ QChar('0'))
                .arg(datetime->tm_sec, /* fieldWith */ 2, /* base */ 10, /* fillChar */ QChar('0'));
        }
        else if (column == 1)
        {
            return QString::fromStdString(m_temperatureData[row].Location);
        }
        else if (column == 2)
        {
            return m_temperatureData[row].Temperature;
        }
        break;
    default:
        break;
    }
    return QVariant();
}
