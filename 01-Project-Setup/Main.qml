import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    id: window

    width: 1024
    height: 800
    visible: true
    title: qsTr("Home Controls")

    font.pixelSize: 24

    background: Image {
        fillMode: Image.PreserveAspectCrop
        source: Qt.resolvedUrl("assets/BrushedMetal.jpg")
    }
}
