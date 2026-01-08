import QtQuick
import QtQuick.Controls
import QtQml.Models

// import QtQuick.Layouts

Rectangle {
    id: root
    width: 1000
    height: 600
    color: isDarkMode ? "#3D3D3D" : "#F5F5F7"

    ListModel {
        id: infotainmentModel
        ListElement {
            name: "Home"
            icon: ""
        }
        ListElement {
            name: "Media"
            icon: ""
        }
        ListElement {
            name: "Navigation"
            icon: ""
        }
        ListElement {
            name: "My Car"
            icon: ""
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

        model: infotainmentModel
    }
}
