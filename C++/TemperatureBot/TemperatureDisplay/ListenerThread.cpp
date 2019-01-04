#include "ListenerThread.h"

#include <fstream>
#include <QString>
#include <experimental/filesystem>
#include <set>
#include <algorithm>
#include <string>

namespace fs = std::experimental::filesystem;

QWaitCondition codeExiting;
QMutex mutex;

void ListenerThread::run()
{
    std::set<fs::path> fileListing;
    fs::path filepath(std::string(getenv("HOME"))+std::string("/Documents/TempDir"));

    TemperatureBot::TemperatureReader tpr;

    std::vector<TemperatureBot::TemperatureData>* dataToSend = new std::vector<TemperatureBot::TemperatureData>();

    for(const fs::directory_entry& dirEntry : fs::directory_iterator(filepath))
    {
        fileListing.insert(dirEntry.path());
        tpr.RecoverData(dirEntry.path().string());
        while(!tpr.empty())
        {
            auto newData = tpr.GetAll();
            dataToSend->insert(dataToSend->end(), newData.begin(), newData.end());
        }
    }
    emit newTemperatureData(dataToSend);
    dataToSend = nullptr;

    while (!this->isInterruptionRequested()) {
        dataToSend = new std::vector<TemperatureBot::TemperatureData>();

        emit StartWaiting(5000);
        mutex.lock();
        codeExiting.wait(&mutex, 5000);
        mutex.unlock();

        bool newFiles = false;

        for(const fs::directory_entry& dirEntry : fs::directory_iterator(filepath))
        {
            if(fileListing.find(dirEntry) == fileListing.end())
            {
                newFiles = true;
                fileListing.insert(dirEntry);
                tpr.RecoverData(dirEntry.path().string());
                auto newData = tpr.GetAll();
                dataToSend->insert(dataToSend->end(), newData.begin(), newData.end());
            }
        }
        if (newFiles)
        {
            emit newTemperatureData(dataToSend);
            dataToSend = nullptr;
        }
    }
    if(!dataToSend)
    {
        delete(dataToSend);
    }
}
