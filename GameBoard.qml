import QtQuick 2.15
import "function.js" as Func

GridView{
    id: view

    cellHeight: height / 4
    cellWidth: width / 4
    anchors.margins: 5
    interactive: false

    Component.onCompleted: { Func.solvable() }

    delegate: Item{
        id: backgroundDelegate
        width: view.cellWidth
        height: view.cellHeight
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
                console.log(index)
                var idx = 0
                while(theModel.get(idx).number !== 0){
                    idx++
                }
                if(Func.neighboring(index, idx)){
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
        id: transit
        NumberAnimation{
            properties: "x, y"
            duration: 200
        }
    }
    displaced: transit
}
