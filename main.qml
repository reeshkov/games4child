import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.12

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
                 text: qsTr("‹")
                 onClicked: stack.pop()
             }
             Label {
                 text: "Menu"
                 elide: Label.ElideRight
                 horizontalAlignment: Qt.AlignHCenter
                 verticalAlignment: Qt.AlignVCenter
                 Layout.fillWidth: true
             }
         }
     }

     StackView {
         id: stack
         anchors.fill: parent
     }

}
