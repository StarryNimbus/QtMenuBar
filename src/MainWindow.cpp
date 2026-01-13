#include "MainWindow.h"
#include <QDir>
#include <QQmlContext>
#include <QQmlEngine>
#include <QSize>
#include <QSizePolicy>
#include <QStandardPaths>
#include <Qt>

MainWindow::MainWindow(bool isDarkMode)
    : QObject(nullptr), m_view(nullptr), m_isDarkMode(isDarkMode) {
  m_view = Build();

  // Context properties must be set before setSource()
  m_view->rootContext()->setContextProperty("isDarkMode", m_isDarkMode);

  // Set up cache directory for OSM plugin
  // Gets the standard writable location for the app.
  // On macOS, this is: ~/Library/Caches/QtMenuBar
  QString cacheDir =
      QStandardPaths::writableLocation(QStandardPaths::CacheLocation);
  QDir().mkpath(cacheDir); // Creates the cache directory and any needed parent
                           // directories.
  QString osmCacheDir = cacheDir + "/osm_cache";
  QDir().mkpath(
      osmCacheDir); // Builds the full path to the OSM cache subdirectory by
                    // appending /osm_cache to the base cache directory. Note
                    // QDir().mkpath() is idempotent: safe if it already exists.
  m_view->rootContext()->setContextProperty("osmCacheDirectory", osmCacheDir);

  m_view->loadFromModule("com.qtmenubar", "Main");
  m_view->setGeometry(0, 0, 1000, 600); // default size when launched

  // Allow width to expand but set the minimum and maximum height to 600.
  m_view->setMinimumSize(QSize(600, 600));
  m_view->setMaximumHeight(600);
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
