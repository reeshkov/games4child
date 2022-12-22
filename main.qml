import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.12
import "qrc:/modules/LoaderStack/LoaderStack"

ApplicationWindow {
    id: window
    visible: true
    title: qsTr("Choice game")
    width: 480
    height: 480


    header: ToolBar {
        RowLayout {
             anchors.fill: parent
             ToolButton {
                 text: qsTr("Random increase")
                 onClicked: {
                     loaderstack.unLoadAll(function(){
                         loaderstack.setSource("qrc:/numbers-increase/numbers-increase.qml");
                    });
                 }
             }
             ToolButton {
                 text: qsTr("Set && decrease")
                 onClicked: {
                     loaderstack.unLoadAll(function(){
                         loaderstack.setSource("qrc:/numbers-reverse/numbers-reverse.qml");
                    });
                 }
             }
         }
     }
    LoaderStack {
        id: loaderstack
        width: parent.width
        height: parent.height
    }
}
