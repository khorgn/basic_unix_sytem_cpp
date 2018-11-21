#include "TemperatureTableModel.h"

TemperatureTableModel::TemperatureTableModel(QObject *parent)
    : QAbstractTableModel(parent)
{
    m_rowCount = 0;
    m_columnCount = 3;
}

QVariant TemperatureTableModel::headerData(int section, Qt::Orientation orientation, int role) const
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

int TemperatureTableModel::rowCount(const QModelIndex &parent) const
{
    return m_columnCount;
}

int TemperatureTableModel::columnCount(const QModelIndex &parent) const
{
   return m_rowCount;
}

QVariant TemperatureTableModel::data(const QModelIndex &index, int role) const
{
    int row = index.row();
    int column = index.column();
    switch (role)
    {
    case Qt::DisplayRole:
        if(column == 0)
        {
            const tm* datetime = &m_temperatureData[row].datetime;
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
            return QString::fromStdString(m_temperatureData[row].location);
        }
        else if (column == 2)
        {
            return m_temperatureData[row].temperature;
        }
        break;
    default:
        break;
    }
    return QVariant();
}

void TemperatureTableModel::addTemperatureData(std::vector<TemperatureBot::TemperatureData> temperatureData)
{
    beginInsertRows(QModelIndex(), m_rowCount, m_rowCount + temperatureData.size() - 1);
    m_temperatureData.insert(m_temperatureData.end(), temperatureData.begin(), temperatureData.end());
    m_rowCount = m_temperatureData.size();

    endInsertRows();
}
