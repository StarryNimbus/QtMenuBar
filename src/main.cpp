#include "MainWindow.h"
#include <QApplication>
#include <QColor>
#include <QPalette>

bool isDarkMode(QApplication &app) {
  const QPalette palette = app.palette();
  QColor windowColor = palette.color(QPalette::Window);

  // Perceptual lightness (0–255)
  // Lightness is 0 (black) .. 255 (white)
  // Convention: <128 is dark mode, >=128 is light mode
  int lightness = windowColor.lightness();
  return lightness < 128;
}

int main(int argc, char *argv[]) {
  QApplication app(argc, argv);

  bool darkMode = isDarkMode(app) ? true : false;
  qDebug() << "Dark Mode: " << darkMode;

  MainWindow mainWindow(darkMode);
  mainWindow.show();

  return app.exec();
}
