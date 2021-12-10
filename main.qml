import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.4
import QtQuick.Dialogs 1.2

ApplicationWindow{
    id: root
    width: 600
    height: 650
    visible: true
    title: "15 puzzle"
    color: "#808080"
    minimumWidth: 350
    minimumHeight: 350

    menuBar: MenuBar {
        Menu {
            title: "&File"
            Action { text: "&New"
                onTriggered: newdialog.open()
            }
            Action { text: "&About"
                onTriggered: aboutDialog.open()
            }
            MenuSeparator { }
            Action {
                text: "&Quit"
                onTriggered: Qt.quit()
            }
        }
        Menu {
            title: "&Edit"
            Menu{
                title: "&Backgrount"
                Action { text: "Dark" }
                Action { text: "White" }
                Action { text: "Red" }
                Action { text: "Green" }
            }
            Menu{
                title: "&Size"
                Action { text: "2x2" }
                Action { text: "3x3" }
                Action { text: "4x4" }
                Action { text: "5x5" }
            }
        }
    }

    Dialog {
        id: aboutDialog
        title: "About"
        Label {
            anchors.fill: parent
            text: "Пятнашка была придумана еще в конце 19 века.
                  Классическое игровое поле представляет собой матрицу 4х4 клеток,
                  на котором по порядку (слева - направо и сверху - вниз)
                  располагаются цифры от 1 до 15. Последняя клетка – пустая.
                  Клетки перемешиваются определенным образом,
                  и задача игрока состоит в том,
                  чтобы восстановить их первоначальное правильное расположение."
            horizontalAlignment: Text.AlignHCenter
        }
        standardButtons: StandardButton.Ok
    }

    Dialog {
        id: newdialog
        title: "New game"
        standardButtons: Dialog.Yes | Dialog.No
        Label {
            anchors.fill: parent
            text: "Just start a new game?"
            horizontalAlignment: Text.AlignHCenter
        }
    }

    ListModel{
        id: theModel

        ListElement { number: 1 }
        ListElement { number: 2 }
        ListElement { number: 3 }
        ListElement { number: 4 }
        ListElement { number: 5 }
        ListElement { number: 6 }
        ListElement { number: 7 }
        ListElement { number: 8 }
        ListElement { number: 9 }
        ListElement { number: 10 }
        ListElement { number: 11 }
        ListElement { number: 12 }
        ListElement { number: 13 }
        ListElement { number: 14 }
        ListElement { number: 15 }
        ListElement { number: 0 }
    }

    GridView{
        id: view
        model: theModel
        anchors.fill: parent
        anchors.margins: 50
        clip: true

        cellHeight: height / 4
        cellWidth: width / 4
        interactive: false

        delegate: Item{
            id: backgroundDelegate
            width: view.cellWidth
            height: view.cellHeight
            visible: number

            Rectangle{
                id: rect
                color: "#FFA500"
                border.color: Qt.lighter("#000000")
                border.width: 5
                radius: 10
                anchors.fill: backgroundDelegate
                anchors.margins: 3
                width: view.cellWidth
                height: view.cellHeight

                Text{
                    anchors.centerIn: rect
                    text: number
                    font.pointSize: Math.min(rect.width, rect.height) / 2
                    font.bold: true
                }
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    console.log(index)
                    var idx = 0
                    while(theModel.get(idx).number !== 0){
                        idx++
                    }

                    if(neighboring(index, idx)){
                        theModel.move(idx, index, 1)
                        theModel.move(index, idx, 1)
                    }
                    else{
                        return false
                    }
                }
            }
        }
        move: Transition {
            NumberAnimation{
                properties: "x, y"
                duration: 500
            }
        }

        displaced: Transition {
            NumberAnimation{
                properties: "x, y"
                duration: 500
            }
        }
    }

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
//                anchors.horizontalCenter: parent.horizontalCenter
//                anchors.verticalCenter: parent.verticalCenter
                font.bold: true
            }
        }
        anchors.margins: 5
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
    }

    function neighboring(index, idx){
        if (index % 4 < 3 && index + 1 === idx)
            return true;
        if (index % 4 > 0 && index - 1 === idx)
            return true;
        if (index < 12 && index + 4 === idx)
            return true;
        if (index >= 4 && index - 4 === idx)
            return true;

        return false;
    }
}
