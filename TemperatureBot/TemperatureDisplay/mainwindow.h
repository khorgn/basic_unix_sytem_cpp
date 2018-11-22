#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include "TemperatureData.hpp"
#include "TemperatureTableModel.h"
#include "ListenerThread.h"
#include "AboutWidget.h"
#include <QTimer>
#include <QProgressBar>

namespace Ui {
class MainWindow;
}

//!
//! \brief The main window of the application
//!
class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

private:
    void fillTemperatureView(std::vector<TemperatureBot::TemperatureData> xmlContent);
    TemperatureTableModel* mp_temperatureModel;
    ListenerThread* mp_listenerThread;
    AboutWidget* mp_newWindow = nullptr;
    QTimer* mp_progressBarTimer = nullptr;
    long m_milliSecondsLeftUntilThreadCheck = 0;
    QProgressBar* mp_progressBar = nullptr;

private slots:
    //! Load the XML file and recover the content
    void slotLoadXml();
    void slotGetNewTemperatureData (std::vector<TemperatureBot::TemperatureData>* temperatureData);
    void slotOpenAboutWindow();
    void slotResetAboutWindow();
    void slotWorkerThreadStartedWaiting(long milliseconds);
    void slotUpdateProgressBar();

private:
    Ui::MainWindow *ui;
};

#endif // MAINWINDOW_H
