import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

Pane {
    id: root

    property string zoneName

    // temperatature conversion
    property int celsius: temperatureDial.value
    property int fahrenheit: (celsius * 1.8) + 32

    readonly property color temperatureColor: {
        // this color will change with the temperature
        if (celsius < 10)
            return Qt.color("lightblue")
        else if ( celsius >= 10 && celsius < 20)
            return Qt.color("cyan")
        else if (celsius >= 20 && celsius < 30)
            return Qt.color("orange")
        else
            return Qt.color("red")
    }

    palette {
        // use the temperature color for these palette properties rather than "white"
        windowText: root.temperatureColor
        dark: root.temperatureColor
    }

    background: Rectangle {
        color: "black"
        opacity: 0.5
    }

    RowLayout {
        anchors.fill: parent

        spacing: 10

        ColumnLayout {

            spacing: 10

            RowLayout {

                spacing: 10

                CheckBox {
                    id: zoneEnabledCheckBox

                    text: qsTr("Enable %1").arg(root.zoneName)
                    checked: true
                }

                Switch {
                    id: unitsSwitch

                    text: qsTr("ºC / ºF") // "\u00B0" // UTF-16 code for degree º symbol
                }
            }

            RowLayout {

                enabled: zoneEnabledCheckBox.checked

                spacing: 10

                Image {
                    // cool temperature image
                    source: Qt.resolvedUrl("assets/cool.svg")
                    Layout.alignment: Qt.AlignBottom
                }

                Dial {
                    id: temperatureDial

                    from: 0 // ºC
                    to: 40  // ºC

                    value: 21 // default value ºC

                    stepSize: 1 // whole degrees
                    snapMode: Dial.SnapAlways
                }

                Image {
                    // hot temperature image
                    source: Qt.resolvedUrl("assets/heat.svg")
                    Layout.alignment: Qt.AlignBottom
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

                Image {
                    // low fan speed image
                    source: fanSpeedSlider.value > 0 ? Qt.resolvedUrl("assets/fan_outline.svg") :
                                                       Qt.resolvedUrl("assets/fan_off.svg")
                    scale: 0.75 // slightly smaller
                }

                Slider {
                    id: fanSpeedSlider

                    // for the fan speed of each zone
                    from: 0 // fan off
                    to: 100 // fan max speed

                    Layout.fillWidth: true
                }

                Image {
                    // high fan speed image
                    source: Qt.resolvedUrl("assets/fan_fill.svg")
                    scale: 1.25 // slightly bigger
                }
            }
        }
    }
}
