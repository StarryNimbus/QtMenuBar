# QtMenuBar
A **Qt6 QML "Menu Bar" application** which demonstrates how to render a custom
menu bar using Qt Quick and a ListModel. It can be used as a reusable UI module.

This is not a full feature showcase but rather a foundation for a potential Car Infotainment system side project.

The application has 4 tabs; home, media, navigation, and "my car". Although
these tabs don't facilitate useful interactions, I used the OpenStreetMap (OSM)
plugin, Location, and Positioning libraries for the first time. It was
surprisingly easy to set up and the QT tutorials and documentations helped.

---

## What this project demonstrates

- Modern **Qt 6 + CMake** project structure
- Ability to build and run a Qt application from source
- Support for **QML UIs**
- Proper use of resources (icons, images)
- Clean, minimal code intended to be easy to read and extend

---

## Technologies used

- C++17
- CMake
- Qt 6
    - Qt Widgets
    - Qt Quick / QML
    - Qt Resource System (QRC)

---

## Screenshots

### Home
![Home](screenshots/home.png)

### Media
![Media](screenshots/media.png)

### Navigation
![Navigation](screenshots/navigation.png)

### My Car
![My Car](screenshots/myCar.png)
---

## Build requirements

- **Qt 6.x**
- **CMake 3.16+**
- A C++17-compatible compiler

Tested with:
- macOS
- Qt 6.x

---

## Building the project

```bash
# From the project root directory, run:
cmake -S . -B build -G "Ninja"
ninja -C build
```
