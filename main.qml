import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.2
import wt.qt.CanFrameMaker 0.1

ApplicationWindow {

    visible: true
    width: 640
    title: qsTr("CarMsgCreate")
    height: rootLayout.height + 20
    maximumHeight: height
    maximumWidth: width
    minimumHeight: height
    minimumWidth: width


    ColumnLayout {
        spacing: 30
        id: rootLayout
        anchors.horizontalCenter: parent.horizontalCenter

        Rectangle {
            width: parent.width
            height: 1
        }

        GridLayout {
            Layout.fillWidth: true
            rows: 3
            columns: 2
            columnSpacing: 4

            EditCard {
                id: cardOffset
                cardName: qsTr("偏移")
            }

            EditCard {
                id: cardLen
                cardName: qsTr("长度")
            }
            EditCard {
                id: cardValue
                cardName: qsTr("数值")
            }

            EditCard {
                id: cardPrecision
                cardName: qsTr("精度")
            }
            EditCard {
                id: cardFormat
                cardName: qsTr("形式")
            }

            EditCard {
                id: cardType
                cardName: qsTr("类型")
            }
        }


        Rectangle {
            id: result
            Layout.fillWidth: true
            height: 40
            color: "#ffffff"
//            border.width: 1
            property alias result: output.text
            Row {

                anchors.fill: parent
                spacing: 27
                Rectangle {
                    height: output.height
                    radius: 5
                    border.width: 1
                    width: output.width
                TextArea {
                    id: output
                    width: 480
                    height: result.height - 2
                    font.pixelSize: 10
                    font.italic: true
                    font.bold: true
                    color: "#68b3b7"
                    text: "Bytes"
                    clip: true;
                    selectByMouse: true
                }
                }
                Button {
                    id: go
                    height: parent.height - 2
                    text: "Go !"
                    font.pixelSize: 22
                    font.italic: true
                    font.bold: true

                    CanFrameMaker {
                        id: canFrame
                    }

                    onClicked: function makeCanFrame() {
                        var input = {
                            offset: 0,
                            len: 0,
                            value: 0.0,
                            precision: 0,
                            format: true,
                            type: 0,
                        }

                        input.offset = parseInt(cardOffset.cardText.text)
                        input.len = parseInt(cardLen.cardText.text)
                        input.value = parseInt(cardValue.cardText.text)
                        input.precision = parseInt(cardPrecision.cardText.text)
                        input.format = Boolean(parseInt(cardFormat.cardText.text))
                        input.type = parseInt(cardType.cardText.text)
                        console.log(JSON.stringify(input));
                        //Note: you only can paste Qstring or const Qstring &
                        output.text = canFrame.makeFrame(JSON.stringify(input).toString())

                    }
                }
            }
        }
    }
    //    EditCardInput {

    //    }
}
