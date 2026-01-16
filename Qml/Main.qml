import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

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
        Navigation {
            implicitWidth: parent.width
            implicitHeight: parent.height
        }
        Rectangle {
            color: "#A6AAB4"
            implicitWidth: parent.width
            implicitHeight: parent.height
        }
    }

    Rectangle {
        id: pageIndicator
        anchors {
            left: parent.left
            leftMargin: 25
            top: parent.top
            topMargin: 25
        }
        height: 50
        width: 200
        Label {
            id: tabButtonLabel
            anchors {
                centerIn: parent
            }
            text: footer.currentString
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            color: "black"
            font.pixelSize: 25
            font.weight: Font.ExtraBold
            elide: Text.ElideRight
            wrapMode: Text.WordWrap
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
