import QtQuick
import QtQuick.Controls
import QtQml.Models
import QtQuick.Layouts

Rectangle {
    id: root
    width: 1000
    height: 600
    color: isDarkMode ? "#3D3D3D" : "#F5F5F7"

    StackLayout {
        id: layout
        anchors {
            top: parent.top
            left: parent.left
        }

        height: 520
        width: parent.width

        currentIndex: footer.currentIndex
        Rectangle {
            color: "#008080"
            implicitWidth: parent.width
            implicitHeight: parent.height
        }
        Rectangle {
            color: "#673147"
            implicitWidth: parent.width
            implicitHeight: parent.height
        }
        Rectangle {
            color: "#E0B44C"
            implicitWidth: parent.width
            implicitHeight: parent.height
        }
        Rectangle {
            color: "#A6AAB4"
            implicitWidth: parent.width
            implicitHeight: parent.height
        }
    }

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
