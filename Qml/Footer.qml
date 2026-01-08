import QtQuick
import QtQuick.Controls
import QtQml.Models

Rectangle {
    id: root

    property var model: null

    color: "black"

    TabBar {
        id: tabBar
        anchors {
            left: parent.left
            bottom: parent.bottom
        }

        // width/height define the actual on-screen size assigned to the TabBar by its parent.
        // contentWidth/contentHeight represent the natural size required by the tabs themselves
        // (sum of each TabButton’s implicit size + spacing).
        //
        // If width/height are NOT set, TabBar’s implicit size is derived from contentWidth/Height.
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
            model: infotainmentModel
            TabButton {
                id: tabButton
                property bool isSelected: TabBar.index == tabBar.currentIndex

                height: 80
                width: (tabBar.width / 2) / infotainmentModel.count
                // width: 125

                contentItem: Label {
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
                    id: squareRect
                    color: "transparent"
                    anchors {
                        fill: parent
                    }
                }
            }
        }
    }
}
