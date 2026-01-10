import QtQuick

Rectangle {
    id: root

    width: {
        let val = 40;
        if (menuButtonMouseArea.containsMouse) {
            val = val * 1.1;
        } else if (menuButtonMouseArea.pressed) {
            val = val * 1.1;
        }
        return val;
    }
    height: width
    radius: width / 2
    color: (menuButtonMouseArea.containsMouse || menuButtonMouseArea.pressed) ? "#BF3b3b3b" : "transparent"

    Image {
        id: menuImage
        anchors {
            horizontalCenter: root.horizontalCenter
            verticalCenter: root.verticalCenter
        }

        source: "qrc:/images/menu.svg"
        sourceSize.width: 24
        sourceSize.height: 24
        fillMode: Image.PreserveAspectFit
    }

    MouseArea {
        id: menuButtonMouseArea
        anchors {
            fill: parent
        }
        hoverEnabled: true
        onClicked: {
            console.log("Menu button clicked");
        }
    }
}
