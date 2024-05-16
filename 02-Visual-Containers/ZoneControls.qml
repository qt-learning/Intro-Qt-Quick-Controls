import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

Pane {
    padding: 20

    background: Rectangle {
        color: "green"
    }

    RowLayout {
        anchors.fill: parent

        spacing: 10

        ColumnLayout {
            id: leftColumn

            spacing: 10

            Rectangle {
                color: "blue"

                Layout.fillWidth: true
                Layout.fillHeight: true
            }
        }

        ColumnLayout {
            id: rightColumn

            spacing: 10

            Rectangle {
                color: "blue"

                Layout.fillWidth: true
                Layout.fillHeight: true
            }
        }
    }
}
