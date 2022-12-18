import QtQuick 2.7
import QtQuick.Controls 2.0

ApplicationWindow {
    id: window
    visible: true
    title: "Errors: "+numbersIncrease.countErrors

    width: 800
    height: 800
    //visibility: "FullScreen"
    NumbersIncrease{
        id: numbersIncrease
        anchors.fill: parent
    }
    Component.onCompleted:{
        //window.showMaximized();
    }
}
