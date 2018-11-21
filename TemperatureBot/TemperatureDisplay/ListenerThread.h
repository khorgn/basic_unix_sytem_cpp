#ifndef LISTENERTHREAD_H
#define LISTENERTHREAD_H

#include <QThread>
#include "TemperatureReader.hpp"
#include "TemperatureData.hpp"

#include <QWaitCondition>
#include <QMutex>

extern QWaitCondition codeExiting;
extern QMutex mutex;

class ListenerThread : public QThread
{
    Q_OBJECT
public:
    ListenerThread(QObject* parent) : QThread(parent) {}
    void run() override;

signals:
    void newTemperatureData(std::vector<TemperatureBot::TemperatureData>* temperatureData);
};

#endif // LISTENERTHREAD_H
