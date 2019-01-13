import QtQuick 2.0
import QtQuick.Layouts 1.2

Rectangle {

    height: 30

    property alias name: nameRight.text
    property alias circleColor: circleLeft.color
    radius: 4

    RowLayout {
        anchors.fill: parent

        Rectangle {
            id: circleLeft
            width: 20
            height: 20
            radius: 10
        }
        Text {
            Layout.fillWidth: true
            id: nameRight
        }
    }
}

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/

