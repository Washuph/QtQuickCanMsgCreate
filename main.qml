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
                id: cardId
                cardName: qsTr("编号")
            }

            EditCard {
                id: cardIdEx
                cardName: qsTr("扩展")
            }
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
                spacing: 12
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
                        clip: true
                        selectByMouse: true
                    }
                }
                Button {

                    width: 48
                    id: go
                    height: parent.height - 2
                    text: "Add"
                    font.pixelSize: 12

                    CanFrameMaker {
                        id: canFrame
                    }

                    onClicked: function makeCanFrame() {
                        var input = {
                            "offset": 0,
                            "len": 0,
                            "value": 0.0,
                            "precision": 0,
                            "format": true,
                            "type"//intel or motorola
                            : 'bool',
                            "id": '0x0000000',
                            "ex": false
                        }

                        input.offset = parseInt(cardOffset.cardText.text)
                        input.len = parseInt(cardLen.cardText.text)
                        input.value = parseInt(cardValue.cardText.text)
                        input.precision = parseInt(cardPrecision.cardText.text)
                        input.format = Boolean(parseInt(
                                                   cardFormat.cardText.text))
                        input.type = cardType.cardText.text
                        input.id = cardId.cardName.text
                        input.ex = Boolean(cardIdEx.cardName.text)

                        console.log(JSON.stringify(input))
                        //Note: you only can paste Qstring or const Qstring &
                        output.text = canFrame.makeFrame(JSON.stringify(
                                                             input).toString())

                        resultList.model.append({
                                                    "result": output.text,
                                                    "id":  (resultList.count + 1).toString()
                                                })
                    }
                }
                Button {
                    width: 48
                    id: deleteListItem
                    height: parent.height - 2
                    text: "Del"
                    font.pixelSize: 12


                    onDoubleClicked: resultList.model.remove(
                                         resultList.currentIndex, 1)
                    onPressAndHold: { console.log(resultList.currentIndex)
                        resultList.model.remove(
                                   resultList.currentIndex,  resultList.count) }
                }
            }
        }
        Component {
            id: resultView
            Item {
                height: 40
                width: parent.width
                Rectangle {
                    color: '#f0fffe'
                    anchors.fill: parent
                    RowLayout {
                        anchors.verticalCenter: parent.verticalCenter
                        ColorBox {
                            width: 40
                            circleColor: '#' + Math.round(
                                             (Math.random(
                                                  ) * 65526 * 256)).toString(16)
                            name: id
                        }

                        TextArea {
                            Layout.fillWidth: true
                            id: resultListItem
                            text: result
                            font.pixelSize: 10
                            selectByMouse: true
                        }
                    }
                }
            }
        }

        Rectangle {
            height: 480
            Layout.fillWidth: true
            color: '#f9fcfe'
            ListView {
                anchors.fill: parent
                id: resultList
                model: ListModel {
                    dynamicRoles: true
                }
                clip: true

                delegate: resultView
            }
        }
    }
}
