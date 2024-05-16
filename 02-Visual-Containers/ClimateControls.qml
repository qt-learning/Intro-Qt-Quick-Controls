import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

Page {
    padding: 10

    background: Rectangle {
        color: "red"
    }

    ColumnLayout {
        anchors.fill: parent

        spacing: 10

        ZoneControls {
            id: zone1

            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        ZoneControls {
            id: zone2

            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }
}
