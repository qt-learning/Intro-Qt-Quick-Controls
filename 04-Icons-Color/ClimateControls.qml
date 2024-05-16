import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

Page {

    padding: 10

    header: Label {
        text: qsTr("Climate Control")
        color: "white"
        font.pixelSize: 48
        padding: 10
    }

    background: null

    ColumnLayout {

        anchors.fill: parent

        spacing: 10

        ZoneControls {
            id: zone1

            zoneName: qsTr("Zone 1")

            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        ZoneControls {
            id: zone2

            zoneName: qsTr("Zone 2")

            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }
}
