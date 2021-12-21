import QtQuick 2.15

Rectangle {
    id: rect
//    color: "#FFA500"
//    border.color: Qt.lighter("#000000")
//    border.width: 5
    border.width: 1
    radius: 10

    Text{
        anchors.centerIn: rect
        text: number
        font.pointSize: Math.min(rect.width, rect.height) / 2
        font.bold: true
    }
    gradient: Gradient {
        GradientStop { position: 0.0; color: "lightsteelblue" }
        GradientStop { position: 1.0; color: "blue" }
    }
}
