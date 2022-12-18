import QtQuick 2.7
import QtQuick.Controls 2.0

Rectangle {
    id: gameinterface
    property string gameName: "A game"
    property int gameDifficult: 3
    onGameDifficultChanged: {
        if(0 >= gameDifficult){
            console.log("game difficult can't be less than 1, set to default value = 2");
            gameDifficult = 2;
        }
    }
    property string colorOn: "lightgreen"
    property string colorOff: "transparent"
    property string colorMark: "lightgray"
    property string colorError: "red"
    property int countErrors: 0
    function gameRestart(){
        console.log("interface virtual function!");
        countErrors = 0;
    }
    signal gameFinish();
    Component {
        id: alertComponent
        ComponentAlert{}
    }
    function alert(text, handler){
        var message = alertComponent.createObject(gameinterface,{"text":text, "color":"yellow"});
        if('function'===typeof handler) {
            message.confirmed.connect(handler);
        }
        message.visible=true;
    }
}
