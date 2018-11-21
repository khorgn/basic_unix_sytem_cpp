#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "TemperatureData.hpp"
#include "TemperatureReader.hpp"
#include "TemperatureTableModel.h"

#include <QSortFilterProxyModel>
#include <QString>
#include <QFileDialog>
#include <QDebug>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    m_temperatureModel = new TemperatureTableModel(0);

    QSortFilterProxyModel* proxyModel = new QSortFilterProxyModel;
    proxyModel->setSourceModel(m_temperatureModel);

    ui->temperatureTableView->setModel(proxyModel);

    // setup the menu bar
    QObject::connect(ui->actionLoad_XML, &QAction::triggered, this, &MainWindow::slotLoadXml);
    QObject::connect(ui->actionAbout, &QAction::triggered, this, &MainWindow::slotOpenAboutWindow);

    mp_listenerThread = new ListenerThread(this);
    QObject::connect(mp_listenerThread, &ListenerThread::newTemperatureData, this, &MainWindow::slotGetNewTemperatureData);
    mp_listenerThread->start();
}

MainWindow::~MainWindow()
{
    delete ui;

    mp_listenerThread->requestInterruption();
    mutex.lock();
    codeExiting.wakeAll();
    mutex.unlock();
    mp_listenerThread->wait();
}

void MainWindow::fillTemperatureView(std::vector<TemperatureBot::TemperatureData> xmlContent)
{
    m_temperatureModel->addTemperatureData(xmlContent);
}

void MainWindow::slotLoadXml()
{
    // Get the path of the file
    QString path = QFileDialog::getOpenFileName(this, tr("Open Directory"), tr("."), tr("XML Files (*.xml)"));
    TemperatureBot::TemperatureReader tpr;
    tpr.RecoverData(path.toStdString());
    int temperatureSize = tpr.GetSize();
    std::vector<TemperatureBot::TemperatureData> xmlContent;
    for(int iElement = 0; iElement < temperatureSize; iElement++)
    {
        xmlContent.push_back(tpr.GetNext());
    }

    fillTemperatureView(xmlContent);
}

void MainWindow::slotGetNewTemperatureData(std::vector<TemperatureBot::TemperatureData> *temperatureData)
{
    if(!temperatureData->empty())
    {
        fillTemperatureView(*temperatureData);
    }
    delete temperatureData;
}

void MainWindow::slotOpenAboutWindow()
{
    if(!mp_newWindow)
    {
        mp_newWindow = new AboutWidget;
        mp_newWindow->show();
        QObject::connect(mp_newWindow, &AboutWidget::widgetClosed, this, &MainWindow::slotResetAvoutWindow);
    }
}

void MainWindow::slotResetAvoutWindow()
{
    mp_newWindow = nullptr;
}
