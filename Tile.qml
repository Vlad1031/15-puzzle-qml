import QtQuick 2.15

Rectangle {
    id: rect
    color: "#FFA500"
    border.color: Qt.lighter("#000000")
    border.width: 5
    radius: 10

    Text{
        anchors.centerIn: rect
        text: number
        font.pointSize: Math.min(rect.width, rect.height) / 2
        font.bold: true
    }
}
