#ifndef LISTENERTHREAD_H
#define LISTENERTHREAD_H

#include <QThread>
#include "TemperatureReader.hpp"
#include "TemperatureData.hpp"

#include <QWaitCondition>
#include <QMutex>

extern QWaitCondition codeExiting;
extern QMutex mutex;

//!
//! \brief The thread used to check a directory for any new file containing temperature data, and signal it
//!
class ListenerThread : public QThread
{
    Q_OBJECT
public:
    ListenerThread(QObject* parent) : QThread(parent) {}
    void run() override;

signals:
    //! signal that new temperature data is available
    void newTemperatureData(std::vector<TemperatureBot::TemperatureData>* temperatureData);

    void StartWaiting(long milliseconds);
};

#endif // LISTENERTHREAD_H

//! \file ListenerThread.h The file containing the class ListenerThread

