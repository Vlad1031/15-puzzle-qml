import QtQuick 2.15
import "function.js" as Func

GridView{
    id: root
    cellHeight: height / 4
    cellWidth: width / 4
    anchors.margins: 5
    interactive: false

    delegate: Item{
        id: backgroundDelegate
        width: root.cellWidth
        height: root.cellHeight
        visible: number

        Tile{
            anchors.fill: backgroundDelegate
            anchors.margins: 3
            width: cellWidth
            height: cellHeight
        }

        MouseArea{
            anchors.fill: parent
            onClicked: {
                var idx = 0
                while(theModel.get(idx).number !== 0){
                    idx++
                }
                if(Func.neighboring(index, idx)){
                    theModel.move(idx, index, 1)
                    theModel.move(index, idx, 1)
                    if(Func.popup() === true){
                        mypopup.open()
                        Func.shuffle()
                    }
                }
                else{
                    return false
                }
            }
        }
    }

    move: transit
    displaced: transit

    Transition {
        id: transit
        NumberAnimation{
            properties: "x, y"
            duration: 200
        }
    }

    Component.onCompleted: { Func.shuffle() }
}
