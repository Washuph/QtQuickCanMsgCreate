import QtQuick 2.0

Rectangle {

    width: 180
    height: 48
    color: "#ffffff"
    radius: 4
    clip: true
    border.color: "gray"
    property alias input: input
    property alias text: input.text

    TextInput {
        anchors.verticalCenter: parent.verticalCenter
        id: input
        anchors.margins: 4
        anchors.fill: parent
        focus: true
        font.pixelSize: 18
        font.bold: true

    }
}
