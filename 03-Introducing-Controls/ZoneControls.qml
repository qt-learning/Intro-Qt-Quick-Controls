import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

Pane {

    id: root

    property string zoneName

    palette {
        windowText: "white"
        dark: "white"
    }

    background: Rectangle {
        color: "black"
        opacity: 0.5
    }

    // temperatature conversion
    property int celsius: temperatureDial.value
    property int fahrenheit: (celsius * 1.8) + 32

    RowLayout {
        anchors.fill: parent

        spacing: 10

        ColumnLayout {
            spacing: 10

            RowLayout {

                spacing: 10

                CheckBox {
                    id: zoneEnabledCheckBox

                    checked: true
                    text: qsTr("Enable %1").arg(root.zoneName)
                }

                Switch {
                    id: unitsSwitch

                    text: qsTr("ºC / ºF") // "\u00B0" // UTF-16 code for degree º symbol
                }
            }

            RowLayout {

                enabled: zoneEnabledCheckBox.checked

                spacing: 10

                Dial {
                    id: temperatureDial

                    from: 0 // ºC
                    to: 40  // ºC

                    value: 21 // default value ºC

                    stepSize: 1 // whole degrees
                    snapMode: Dial.SnapAlways
                }
            }
        }

        ColumnLayout {

            enabled: zoneEnabledCheckBox.checked

            spacing: 10

            Label {

                // the Label can show the temperature in Celsius or Fahrenheit
                // "\u00B0" // UTF-16 code for degree º symbol
                text: unitsSwitch.checked ? root.fahrenheit + "ºF" :
                                            root.celsius + "ºC"

                font {
                    weight: Font.ExtraLight
                    pixelSize: 200
                }

                Layout.fillWidth: true
                horizontalAlignment: Qt.AlignRight

                //renderTypeQuality: Text.HighRenderTypeQuality
                renderType: Text.CurveRendering
            }

            RowLayout {
                spacing: 10

                Slider {
                    id: fanSpeedSlider

                    // for the fan speed of each zone
                    from: 0 // fan off
                    to: 100 // fan max speed

                    Layout.fillWidth: true
                }
            }
        }
    }
}
