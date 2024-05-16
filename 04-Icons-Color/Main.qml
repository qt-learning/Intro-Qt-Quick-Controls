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

        source: Qt.resolvedUrl("assets/BrushedMetal.jpg")
        fillMode: Image.PreserveAspectCrop
    }

    ClimateControls {
        anchors.fill: parent
    }
}
