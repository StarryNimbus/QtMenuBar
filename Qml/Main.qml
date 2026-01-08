import QtQuick
import QtQuick.Controls
import QtQml.Models

// import QtQuick.Layouts

Rectangle {
    id: root
    width: 1000
    height: 600
    color: isDarkMode ? "#3D3D3D" : "#F5F5F7"

    Footer {
        id: footer
        anchors {
            left: parent.left
            bottom: parent.bottom
        }

        height: 80
        width: parent.width
    }
}
