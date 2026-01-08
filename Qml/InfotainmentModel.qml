pragma Singleton
import QtQuick
import QtQml.Models

QtObject {
    id: root

    property ListModel model: ListModel {
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
}
