import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 2.14
import 'assets'
Window {
    id: mainWindow
    width: 400
    height: 600
    visible: true
    flags: Qt.Window | Qt.FramelessWindowHint
    property string caption: "Log In"
    property color backgroundColor: "#2c313c"
    property color tagBarColor: "#1c1d20"
    property string  sourceIconApp: "images/icon.ico"
    // background
    Rectangle{
        id: background
        anchors.fill: parent
        color: backgroundColor
        // tagbar
        Rectangle{
            id: tagBar
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            height: 35
            color: tagBarColor
            // icon & caption
            Rectangle{
                id: title
                color: "#00000000"
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                anchors.rightMargin: 70
                anchors.leftMargin: 0
                // event move window
                DragHandler {
                    onActiveChanged: if(active){
                                         mainWindow.startSystemMove()
                                     }

                }
                // icon window
                    Image{
                        id: icon
                        source: sourceIconApp
                        width: 22
                        height: 22
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                    }
                    // text title
                    Label{
                        id: textTitle
                        text: caption
                        color: "#c3cbdd"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: icon.right
                        anchors.leftMargin: 10

                    }
            }
            // button close & minisize
            Rectangle{
                id: mutiButton
                color: "#00000000"
                anchors.left: title.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                // button minimize
                ImgButton{
                    id: buttonMinize
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    width: 35
                    onClicked: {
                        mainWindow.showMinimized()
                    }
                }
                // button close
                ImgButton{
                    id: buttonClose
                    anchors.left: buttonMinize.right
                    anchors.top: buttonMinize.top
                    anchors.bottom: buttonMinize.bottom
                    width: 35
                    btnIconSource: "images/close_icon.svg"
                    onClicked: {
                        backend.closeClient()
                        mainWindow.close()

                    }
                }
            }
        }
        Rectangle{
            id: content
            anchors.top: tagBar.bottom
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            color: "#00000000"
            StackView{
                id: view
                anchors.fill: parent
                initialItem: Qt.resolvedUrl("pages/PageLogin.qml")
            }
        }
    }
    Connections{
        target: backend
        function onCloseProgram(data){
            mainWindow.close()
        }
    }

}
