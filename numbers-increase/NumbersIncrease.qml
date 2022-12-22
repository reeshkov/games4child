import QtQuick 2.7
import QtQuick.Controls 2.0
import "qrc:/.."

TemplateGameInterface{
    id: numbersincrease
    property int size: Math.pow(gameDifficult,2)
    property int count: 3
    ListModel{
        id: listItems
    }
    GridView {
        id: mainGrid
        anchors.fill: parent
        model: listItems
        cellWidth: numbersincrease.width/numbersincrease.gameDifficult
        cellHeight: numbersincrease.height/numbersincrease.gameDifficult
        delegate: Rectangle {
                width: mainGrid.cellWidth
                height: mainGrid.cellHeight
                border.width: 1
                color: model.color
                //border.color: model.number === numbersincrease.count?"blue":"red"
                Text{
                    id: number
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    fontSizeMode: Text.Fit
                    minimumPointSize: 10
                    font.pointSize: 10000
                    text: model.number
                }
                MouseArea{
                    anchors.fill:parent
                    preventStealing: true
                    propagateComposedEvents: true
                    onPressed: {
                        if(0 < model.number && model.number > numbersincrease.count){
                            parent.color=colorError;
                        }
                    }
                    onReleased:{
                        if( 0 < model.number ){
                            if(model.number === numbersincrease.count){
                                //parent.visible = false;
                                parent.color=colorOff;
                                number.color=colorMark;
                                //listItems.remove(model.index, 1);
                                if(numbersincrease.size === numbersincrease.count){
                                    alert("Done!"+(0<countErrors?" Errors: "+countErrors:"")+"\n Click to start.", gameRestart);
                                }
                                numbersincrease.count +=1;
                            }else if(model.number > numbersincrease.count){
                                parent.color=colorOn;
                                countErrors += 1;
                            }
                        }
                    }
                }
            }
    }

    function gameRestart(){
        listItems.clear();
        numbersincrease.countErrors = 0;
        numbersincrease.count = 1;
        var size = numbersincrease.size, numbers = [], r = 0;
        while(numbers.length < size){
            r = Math.floor(Math.random() * size) + 1;
            if(numbers.indexOf(r) === -1) {
                numbers.push(r);
                listItems.append({"color": colorOn, "number": r });
            }
        }
    }
    Component.onCompleted:{
        gameRestart();
        alert("Click to numbers order");
    }
}
