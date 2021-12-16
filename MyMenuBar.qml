import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.4

MenuBar {
    id: root
    signal openNewDialog()
    signal openAboutDialog()
    Menu {
        title: "&File"
        Action {
            text: "&New"
            onTriggered: openNewDialog()
        }
        Action {
            text: "&About"
            onTriggered: openAboutDialog()
        }
        MenuSeparator { }
        Action {
            text: "&Quit"
            onTriggered: Qt.quit()
        }
    }
}
