/********************************************************************************
** Form generated from reading UI file 'mainwindow.ui'
**
** Created by: Qt User Interface Compiler version 5.9.5
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_MAINWINDOW_H
#define UI_MAINWINDOW_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QDateEdit>
#include <QtWidgets/QDateTimeEdit>
#include <QtWidgets/QDockWidget>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QKeySequenceEdit>
#include <QtWidgets/QLabel>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QMenu>
#include <QtWidgets/QMenuBar>
#include <QtWidgets/QOpenGLWidget>
#include <QtWidgets/QSpacerItem>
#include <QtWidgets/QStatusBar>
#include <QtWidgets/QTabWidget>
#include <QtWidgets/QTableView>
#include <QtWidgets/QTimeEdit>
#include <QtWidgets/QToolBar>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_MainWindow
{
public:
    QAction *actionLoad_XML;
    QAction *actionQuit;
    QAction *actionAbout;
    QWidget *centralWidget;
    QHBoxLayout *horizontalLayout;
    QTabWidget *tabWidget;
    QWidget *tab;
    QVBoxLayout *verticalLayout;
    QTableView *temperatureTableView;
    QLabel *temperatureLabel;
    QWidget *tab_3;
    QVBoxLayout *verticalLayout_4;
    QKeySequenceEdit *keySequenceEdit;
    QWidget *tab_4;
    QWidget *tab_2;
    QVBoxLayout *verticalLayout_3;
    QOpenGLWidget *openGLWidget;
    QMenuBar *menuBar;
    QMenu *menuFIle;
    QMenu *menuHelp;
    QToolBar *mainToolBar;
    QStatusBar *statusBar;
    QDockWidget *dockWidget;
    QWidget *dockWidgetContents_2;
    QVBoxLayout *verticalLayout_2;
    QTimeEdit *timeEdit;
    QDateEdit *dateEdit;
    QSpacerItem *verticalSpacer_2;
    QDateTimeEdit *dateTimeEdit;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName(QStringLiteral("MainWindow"));
        MainWindow->resize(800, 600);
        actionLoad_XML = new QAction(MainWindow);
        actionLoad_XML->setObjectName(QStringLiteral("actionLoad_XML"));
        actionQuit = new QAction(MainWindow);
        actionQuit->setObjectName(QStringLiteral("actionQuit"));
        actionAbout = new QAction(MainWindow);
        actionAbout->setObjectName(QStringLiteral("actionAbout"));
        centralWidget = new QWidget(MainWindow);
        centralWidget->setObjectName(QStringLiteral("centralWidget"));
        horizontalLayout = new QHBoxLayout(centralWidget);
        horizontalLayout->setSpacing(6);
        horizontalLayout->setContentsMargins(11, 11, 11, 11);
        horizontalLayout->setObjectName(QStringLiteral("horizontalLayout"));
        tabWidget = new QTabWidget(centralWidget);
        tabWidget->setObjectName(QStringLiteral("tabWidget"));
        tab = new QWidget();
        tab->setObjectName(QStringLiteral("tab"));
        verticalLayout = new QVBoxLayout(tab);
        verticalLayout->setSpacing(6);
        verticalLayout->setContentsMargins(11, 11, 11, 11);
        verticalLayout->setObjectName(QStringLiteral("verticalLayout"));
        temperatureTableView = new QTableView(tab);
        temperatureTableView->setObjectName(QStringLiteral("temperatureTableView"));
        temperatureTableView->setGridStyle(Qt::DotLine);
        temperatureTableView->setSortingEnabled(true);
        temperatureTableView->verticalHeader()->setVisible(false);

        verticalLayout->addWidget(temperatureTableView);

        temperatureLabel = new QLabel(tab);
        temperatureLabel->setObjectName(QStringLiteral("temperatureLabel"));
        temperatureLabel->setAlignment(Qt::AlignCenter);

        verticalLayout->addWidget(temperatureLabel);

        tabWidget->addTab(tab, QString());
        tab_3 = new QWidget();
        tab_3->setObjectName(QStringLiteral("tab_3"));
        verticalLayout_4 = new QVBoxLayout(tab_3);
        verticalLayout_4->setSpacing(6);
        verticalLayout_4->setContentsMargins(11, 11, 11, 11);
        verticalLayout_4->setObjectName(QStringLiteral("verticalLayout_4"));
        keySequenceEdit = new QKeySequenceEdit(tab_3);
        keySequenceEdit->setObjectName(QStringLiteral("keySequenceEdit"));

        verticalLayout_4->addWidget(keySequenceEdit);

        tabWidget->addTab(tab_3, QString());
        tab_4 = new QWidget();
        tab_4->setObjectName(QStringLiteral("tab_4"));
        tabWidget->addTab(tab_4, QString());
        tab_2 = new QWidget();
        tab_2->setObjectName(QStringLiteral("tab_2"));
        verticalLayout_3 = new QVBoxLayout(tab_2);
        verticalLayout_3->setSpacing(6);
        verticalLayout_3->setContentsMargins(11, 11, 11, 11);
        verticalLayout_3->setObjectName(QStringLiteral("verticalLayout_3"));
        openGLWidget = new QOpenGLWidget(tab_2);
        openGLWidget->setObjectName(QStringLiteral("openGLWidget"));

        verticalLayout_3->addWidget(openGLWidget);

        tabWidget->addTab(tab_2, QString());

        horizontalLayout->addWidget(tabWidget);

        MainWindow->setCentralWidget(centralWidget);
        menuBar = new QMenuBar(MainWindow);
        menuBar->setObjectName(QStringLiteral("menuBar"));
        menuBar->setGeometry(QRect(0, 0, 800, 30));
        menuFIle = new QMenu(menuBar);
        menuFIle->setObjectName(QStringLiteral("menuFIle"));
        menuHelp = new QMenu(menuBar);
        menuHelp->setObjectName(QStringLiteral("menuHelp"));
        MainWindow->setMenuBar(menuBar);
        mainToolBar = new QToolBar(MainWindow);
        mainToolBar->setObjectName(QStringLiteral("mainToolBar"));
        MainWindow->addToolBar(Qt::TopToolBarArea, mainToolBar);
        statusBar = new QStatusBar(MainWindow);
        statusBar->setObjectName(QStringLiteral("statusBar"));
        MainWindow->setStatusBar(statusBar);
        dockWidget = new QDockWidget(MainWindow);
        dockWidget->setObjectName(QStringLiteral("dockWidget"));
        dockWidgetContents_2 = new QWidget();
        dockWidgetContents_2->setObjectName(QStringLiteral("dockWidgetContents_2"));
        verticalLayout_2 = new QVBoxLayout(dockWidgetContents_2);
        verticalLayout_2->setSpacing(6);
        verticalLayout_2->setContentsMargins(11, 11, 11, 11);
        verticalLayout_2->setObjectName(QStringLiteral("verticalLayout_2"));
        timeEdit = new QTimeEdit(dockWidgetContents_2);
        timeEdit->setObjectName(QStringLiteral("timeEdit"));
        timeEdit->setCalendarPopup(false);

        verticalLayout_2->addWidget(timeEdit);

        dateEdit = new QDateEdit(dockWidgetContents_2);
        dateEdit->setObjectName(QStringLiteral("dateEdit"));
        dateEdit->setCalendarPopup(true);

        verticalLayout_2->addWidget(dateEdit);

        verticalSpacer_2 = new QSpacerItem(20, 40, QSizePolicy::Minimum, QSizePolicy::Expanding);

        verticalLayout_2->addItem(verticalSpacer_2);

        dateTimeEdit = new QDateTimeEdit(dockWidgetContents_2);
        dateTimeEdit->setObjectName(QStringLiteral("dateTimeEdit"));
        dateTimeEdit->setCalendarPopup(true);

        verticalLayout_2->addWidget(dateTimeEdit);

        dockWidget->setWidget(dockWidgetContents_2);
        MainWindow->addDockWidget(static_cast<Qt::DockWidgetArea>(2), dockWidget);

        menuBar->addAction(menuFIle->menuAction());
        menuBar->addAction(menuHelp->menuAction());
        menuFIle->addAction(actionLoad_XML);
        menuFIle->addAction(actionQuit);
        menuHelp->addAction(actionAbout);

        retranslateUi(MainWindow);
        QObject::connect(actionQuit, SIGNAL(triggered()), MainWindow, SLOT(close()));

        tabWidget->setCurrentIndex(0);


        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindow)
    {
        MainWindow->setWindowTitle(QApplication::translate("MainWindow", "MainWindow", Q_NULLPTR));
        actionLoad_XML->setText(QApplication::translate("MainWindow", "&Load XML", Q_NULLPTR));
        actionQuit->setText(QApplication::translate("MainWindow", "&Quit", Q_NULLPTR));
        actionAbout->setText(QApplication::translate("MainWindow", "&About", Q_NULLPTR));
        temperatureLabel->setText(QApplication::translate("MainWindow", "TextLabel", Q_NULLPTR));
        tabWidget->setTabText(tabWidget->indexOf(tab), QApplication::translate("MainWindow", "Tab 1", Q_NULLPTR));
        tabWidget->setTabText(tabWidget->indexOf(tab_3), QApplication::translate("MainWindow", "Page", Q_NULLPTR));
        tabWidget->setTabText(tabWidget->indexOf(tab_4), QApplication::translate("MainWindow", "Page", Q_NULLPTR));
        tabWidget->setTabText(tabWidget->indexOf(tab_2), QApplication::translate("MainWindow", "Tab 2", Q_NULLPTR));
        menuFIle->setTitle(QApplication::translate("MainWindow", "Fi&le", Q_NULLPTR));
        menuHelp->setTitle(QApplication::translate("MainWindow", "Hel&p", Q_NULLPTR));
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H
