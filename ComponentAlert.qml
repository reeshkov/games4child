import QtQuick 2.7
import QtQuick.Controls 2.0

Rectangle {
    id: componentAlert
    anchors.fill: parent
    anchors.centerIn: parent
    property alias text: alertText.text
    color: "darkgray"
    opacity: 0.8

    Text {
        id: alertText
        anchors.fill: parent
        anchors.centerIn: parent
        horizontalAlignment :Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        //wrapMode: Text.WordWrap
        fontSizeMode: Text.Fit
        minimumPointSize: 10
        font.pointSize: 1000
        color: "red"
        text : "Alert!"
    }

    MouseArea{
        anchors.fill: parent
        anchors.centerIn: parent
        onReleased: {
            componentAlert.destroy();
        }
    }

    signal confirmed();
    Component.onDestruction: {
        confirmed();
    }
}
