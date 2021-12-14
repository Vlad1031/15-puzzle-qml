import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.4
import "function.js" as Func

Button{
    id: mix_button
    Rectangle{
        id: rect_but
        color: "#FFA500"
        border.color: Qt.lighter("#000000")
        border.width: 5
        anchors.fill: parent
        radius: 5
        Text{
            anchors.centerIn: rect_but
            text: "MIX"
            font.pixelSize: 35
            font.bold: true
        }
    }
    anchors.margins: 5
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.bottom: parent.bottom

    MouseArea{
        anchors.fill: parent
        onClicked: {
            Func.solvable()
        }
    }
}
