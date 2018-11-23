#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "TemperatureData.hpp"
#include "TemperatureReader.hpp"
#include "TemperatureTableModel.h"
#include "StarDelegate.h"

#include <QSortFilterProxyModel>
#include <QString>
#include <QFileDialog>
#include <QDebug>
#include <QProgressBar>
#include <QTimer>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    mp_temperatureModel = new TemperatureTableModel(this);

    // ==setup table view==
    // setup proxy model
    QSortFilterProxyModel* proxyModel = new QSortFilterProxyModel;
    proxyModel->setSourceModel(mp_temperatureModel);
    ui->temperatureTableView->setModel(proxyModel);

    // setup star delegate
    StarDelegate* starDelegate = new StarDelegate(this);
    ui->temperatureTableView->setItemDelegate(starDelegate);

    // selection
    ui->temperatureTableView->setSelectionBehavior(QAbstractItemView::SelectRows);
    QItemSelectionModel * selectionModel = ui->temperatureTableView->selectionModel();
    QObject::connect(selectionModel, &QItemSelectionModel::selectionChanged, this, &MainWindow::slotTableSelectionChanged);
    // ==setup table view==

    // setup the status bar
    mp_progressBar = new QProgressBar(this);
    ui->statusBar->addWidget(mp_progressBar);
    mp_progressBar->setAlignment(Qt::AlignCenter);
    mp_progressBar->setInvertedAppearance(true);
    mp_progressBar->setFormat(QString("%vms-%mms"));
    // setup the timer
    mp_progressBarTimer = new QTimer(this);
    mp_progressBarTimer->setInterval(500);
    QObject::connect(mp_progressBarTimer, &QTimer::timeout, this, &MainWindow::slotUpdateProgressBar);

    // setup the menu bar
    QObject::connect(ui->actionLoad_XML, &QAction::triggered, this, &MainWindow::slotLoadXml);
    QObject::connect(ui->actionAbout, &QAction::triggered, this, &MainWindow::slotOpenAboutWindow);

    mp_listenerThread = new ListenerThread(this);
    QObject::connect(mp_listenerThread, &ListenerThread::newTemperatureData, this, &MainWindow::slotGetNewTemperatureData);
    mp_listenerThread->start();

    QObject::connect(mp_listenerThread, &ListenerThread::StartWaiting, this, &MainWindow::slotWorkerThreadStartedWaiting);
}

MainWindow::~MainWindow()
{
    delete ui;

    mp_listenerThread->requestInterruption();
    mutex.lock();
    codeExiting.wakeAll();
    mutex.unlock();
    mp_listenerThread->wait();

//    delete(mp_temperatureModel);
//    delete(mp_progressBarTimer);
}

void MainWindow::fillTemperatureView(std::vector<TemperatureBot::TemperatureData> xmlContent)
{
    mp_temperatureModel->addTemperatureData(xmlContent);
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
        QObject::connect(mp_newWindow, &AboutWidget::widgetClosed, this, &MainWindow::slotResetAboutWindow);
    }
}

void MainWindow::slotResetAboutWindow()
{
    mp_newWindow = nullptr;
}

void MainWindow::slotWorkerThreadStartedWaiting(long milliseconds)
{
    m_milliSecondsLeftUntilThreadCheck = milliseconds;
    mp_progressBar->setMaximum(milliseconds);
    mp_progressBarTimer->start();
}

void MainWindow::slotUpdateProgressBar()
{
    m_milliSecondsLeftUntilThreadCheck-=500;
    if(m_milliSecondsLeftUntilThreadCheck<0)
        m_milliSecondsLeftUntilThreadCheck = 0;
    mp_progressBar->setValue(m_milliSecondsLeftUntilThreadCheck);
    if(m_milliSecondsLeftUntilThreadCheck != 0)
        mp_progressBarTimer->start();
}

void MainWindow::slotTableSelectionChanged(const QItemSelection &newSelection, const QItemSelection &oldSelection)
{
    // get the index of the selected item
//    const QModelIndex index = ui->temperatureTableView->selectionModel()->currentIndex();
    int row = ui->temperatureTableView->selectionModel()->currentIndex().row();
//    QString labelText = index.data(Qt::DisplayRole).toString();
    QString labelText;

    labelText += ui->temperatureTableView->model()->index(row, 0).data().toString();
    (labelText += " ") += ui->temperatureTableView->model()->index(row, 1).data().toString();
    (labelText += " ") += ui->temperatureTableView->model()->index(row, 2).data().toString();
    (labelText += " ") += qvariant_cast<StarRating>(ui->temperatureTableView->model()->index(row, 3).data()).toString();

    ui->temperatureLabel->setText(labelText);
}
