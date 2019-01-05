import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.2

Rectangle {
    id: editCard
    width: 300
    height: 48
    color: "lightsteelblue"
    border.color: "gray"
    radius: 2

    property alias cardName: labelName.text
    property alias cardText: carInput.input

    RowLayout {
        anchors.fill: parent
        Layout.margins: 2



        Text {
            width: 120
            id: labelName
            font.pixelSize: 22
            font.italic: true
            font.bold: true
            color: "#68b3b7"
        }

        EditCardInput {
            id: carInput
            focus: true
        }
    }
}
