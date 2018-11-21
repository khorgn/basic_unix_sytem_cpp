#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include "TemperatureData.hpp"
#include "TemperatureTableModel.h"
#include "ListenerThread.h"
#include "AboutWidget.h"

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

private:
    void fillTemperatureView(std::vector<TemperatureBot::TemperatureData> xmlContent);
    TemperatureTableModel* m_temperatureModel;
    ListenerThread* mp_listenerThread;
    AboutWidget* mp_newWindow;
//    QMetaObject::Connection* mp_connectionToAboutWindow;

private slots:
    //! Load the XML file and recover the content
    void slotLoadXml();
    void slotGetNewTemperatureData (std::vector<TemperatureBot::TemperatureData>* temperatureData);
    void slotOpenAboutWindow();
    void slotResetAvoutWindow();

private:
    Ui::MainWindow *ui;
};

#endif // MAINWINDOW_H
