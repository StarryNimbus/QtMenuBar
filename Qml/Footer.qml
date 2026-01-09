import QtQuick
import QtQuick.Controls
import QtQml.Models
import com.qtmenubar 1.0

Rectangle {
    id: root
    property alias currentIndex: tabBar.currentIndex

    color: "black"

    Rectangle {
        id: menuButtonHitBox
        anchors {
            left: parent.left
            leftMargin: 25
            verticalCenter: root.verticalCenter
        }

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
                horizontalCenter: menuButtonHitBox.horizontalCenter
                verticalCenter: menuButtonHitBox.verticalCenter
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

    TabBar {
        id: tabBar
        anchors {
            left: menuButtonHitBox.left
            leftMargin: 40
            bottom: parent.bottom
        }

        // width/height define the actual on-screen size assigned to the TabBar by its parent.
        // contentWidth/contentHeight represent the natural size required by the tabs themselves
        // (sum of each TabButton's implicit size + spacing).
        //
        // If width/height are NOT set, TabBar's implicit size is derived from contentWidth/Height.
        // If width/height ARE set, the content may be stretched, clipped, or scrolled to fit.
        //
        // Rule of thumb:
        // - Inside layouts: do NOT set width/height; let implicit sizing or Layout.* decide.
        // - Fixed UI regions (headers, toolbars): set width/height explicitly.
        // - For overflow/scrolling: use contentWidth/Height on the container (e.g. Flickable),
        //   not on the TabBar itself.
        contentWidth: parent.width
        contentHeight: 80
        spacing: 0

        currentIndex: 0

        Repeater {
            id: tabButtonRepeater
            model: InfotainmentModel.model
            TabButton {
                id: tabButton
                property bool isSelected: index == tabBar.currentIndex

                height: 80
                width: (tabBar.width / 2) / InfotainmentModel.model.count

                contentItem: Label {
                    id: tabButtonLabel
                    anchors {
                        centerIn: parent
                    }
                    text: model.name

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter

                    color: tabButton.isSelected ? "white" : "white" // TODO
                    font.pixelSize: 15 * (isSelected ? 1.2 : 1)
                    font.weight: isSelected ? Font.ExtraBold : Font.Normal

                    maximumLineCount: 2
                    elide: Text.ElideRight

                    wrapMode: Text.WordWrap
                }

                background: Rectangle {
                    id: background
                    color: "transparent"
                    anchors {
                        fill: parent
                    }

                    Rectangle {
                        id: underline
                        anchors {
                            bottom: background.bottom
                            bottomMargin: tabButtonLabel.lineCount > 1 ? 10 : 20
                            horizontalCenter: background.horizontalCenter
                        }

                        height: 2
                        width: tabButton.width / 3
                        color: "white"
                        visible: isSelected
                    }
                }

                MouseArea {
                    id: tabButtonMouseArea
                    anchors {
                        fill: parent
                    }
                    onClicked: {
                        tabBar.currentIndex = index;
                        console.log(model.name + " tab button clicked");
                    }
                }
            }
        }
    }
}
