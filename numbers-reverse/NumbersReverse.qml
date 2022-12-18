import QtQuick 2.7
import QtQuick.Controls 2.0
import "qrc:/.."

TemplateGameInterface {
    id: numbersreverse
    property int size: Math.pow(gameDifficult,2)
    property int count: 0
    ListModel{
        id: listItems
    }
    GridView {
        id: mainGrid
        anchors.fill: parent
        model: listItems
        cellWidth: numbersreverse.width/numbersreverse.gameDifficult
        cellHeight: numbersreverse.height/numbersreverse.gameDifficult
        delegate: Rectangle {
                width: mainGrid.cellWidth
                height: mainGrid.cellHeight
                border.width: 1
                color: model.color
                //border.color: model.number === numbersreverse.count?"blue":"red"
                Text{
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    fontSizeMode: Text.Fit
                    minimumPointSize: 10
                    font.pixelSize: 72
                    text: 0 < model.number?model.number:""
                }
                MouseArea{
                    anchors.fill:parent
                    preventStealing: true
                    propagateComposedEvents: true
                    onPressed: {
                        if(0 < model.number && model.number !== numbersreverse.count){
                            parent.color=colorError;
                        }
                    }
                    onReleased:{
                        if( 0 < model.number ){
                            if(model.number === numbersreverse.count){
                                numbersreverse.count -=1;
                                model.number = 0
                                parent.color=colorOff;
                            }else{
                                parent.color=colorOn;
                            }
                        }else{
                            numbersreverse.count +=1;
                            model.number = numbersreverse.count
                            parent.color=colorOn;
                        }
                    }
                }
            }
    }
    function gameRestart(){

    }

    Component.onCompleted:{
        listItems.clear();
        var i = 0, size = numbersreverse.size;
        for (; i < size; i++) {
            listItems.append({"color": colorOff, "number": 0 });
        }
        alert("Click to fill field and then click reverse order numbers to clear");
    }
}
