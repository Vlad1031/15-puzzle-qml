import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.4

MenuBar {
    Menu {
        title: "&File"
        Action {
            text: "&New"
            onTriggered: newdialog.open()
        }
        Action {
            text: "&About"
            onTriggered: aboutDialog.open()
        }
        MenuSeparator { }
        Action {
            text: "&Quit"
            onTriggered: Qt.quit()
        }
    }
}
