import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.4
import QtQuick.Dialogs 1.2
import "function.js" as Func

ApplicationWindow{
    id: root
    width: 600
    height: 650
    visible: true
    title: "15 puzzle"
    color: "#808080"
    minimumWidth: 350
    minimumHeight: 350

    menuBar: MyMenuBar{
        onOpenNewDialog: newdialog.open()
        onOpenAboutDialog: aboutDialog.open()
    }

    Dialog {
        id: aboutDialog
        title: "About"
        Label {
            anchors.fill: parent
            text: "Pyatnashka was invented in the late 19th century.
    The classic playing field is a matrix of 4x4 cells,
    on which in order (from left to right and from top to bottom)
    there are numbers from 1 to 15. The last cell is empty.
    The cells are mixed in a certain way,
    and the player's task is to
    to restore their original correct location."
            horizontalAlignment: Text.AlignHCenter
        }
        standardButtons: StandardButton.Ok
    }
    Dialog {
        id: newdialog
        title: "New game"
        standardButtons: Dialog.Yes | Dialog.No
        onYes: { Func.shuffle() }
        Label {
            anchors.fill: parent
            text: "Just start a new game?"
            horizontalAlignment: Text.AlignHCenter
        }
    }

    GameBoard{
        anchors.fill: parent
        anchors.margins: 50
        clip: true

        model: TileModel{
            id: theModel
        }
    }

    ButtonMix{
        onPressed: {
            rectColor = "#FF0000"
            Func.shuffle()
        }
        onReleased: { rectColor = "#FFA500" }
    }
}
