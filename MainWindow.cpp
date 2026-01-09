#include "MainWindow.h"
#include <QQmlContext>
#include <QQmlEngine>
#include <Qt>

MainWindow::MainWindow(bool isDarkMode)
    : QObject(nullptr), m_view(nullptr), m_isDarkMode(isDarkMode) {
  m_view = Build();

  // Context properties must be set before setSource()
  m_view->rootContext()->setContextProperty("isDarkMode", m_isDarkMode);

  m_view->loadFromModule("com.qtmenubar", "Main");
  m_view->setGeometry(0, 0, 1000, 600);
}

void MainWindow::show() const { m_view->show(); }

QQuickView *MainWindow::Build() const {
  QQuickView *view = new QQuickView(nullptr, nullptr);
  QQmlEngine *engine = view->engine();

  // For importing QML modules directly from QRC
  // see https://stackoverflow.com/a/49326965
  engine->addImportPath(QString("qrc:///"));

  view->setColor(Qt::transparent);
  view->setFlags(Qt::Widget);
  view->setResizeMode(QQuickView::SizeRootObjectToView);
  view->setPosition(0, 0);

  return view;
}
