import QtQuick 2.0
import QtQuick.Controls 2.14
import QtGraphicalEffects 1.2
import '../assets'
Rectangle{
    id: rectanglexxx
    anchors.fill : parent
    property bool isLoading: false
    color: "#00000000"
    Rectangle{
        id: formLogin
        width: 300
        height: 400
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter

        radius: 20
        Rectangle{
            id:reLogin
            anchors.top:parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.topMargin: 20
            height: 70
            Text {
                id: textLogin
                anchors.fill: parent
                text: qsTr("Login")
                horizontalAlignment: Text.AlignHCenter
                font.family: "Arial"
                font.styleName: "Medium"
                font.pointSize: 27
                font.weight: Font.Bold
                font.bold: true
            }
        }
        Rectangle{
            id: formInputUsername
            anchors.top: reLogin.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            height: 50
            anchors.leftMargin: 30
            anchors.rightMargin: 30
            Text {
                id: id1
                text: qsTr("Username")
            }
            Rectangle{
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.topMargin: 20
                border.width: 2
                border.color: "#2bc80c"
                radius: 20

                Rectangle {
                    id: reIconUser
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.bottom: parent.bottom
                    anchors.topMargin: 4
                    anchors.leftMargin: 5
                    anchors.bottomMargin: 4
                    radius: 10
                    width: 30
                    Image {
                        id: iconUser
                        anchors.fill: parent
                        source: "../images/user.svg"
                        visible: false
                        fillMode: Image.PreserveAspectFit
                        antialiasing: false
                    }
                    ColorOverlay{
                        anchors.fill: iconUser
                        source: iconUser
                        color: "#97f2efef"
                        antialiasing: false
                    }
                }
                TextInput{
                    id : textInput1
                    anchors.left: reIconUser.right
                    anchors.bottom: reIconUser.bottom
                    verticalAlignment: Text.AlignVCenter
                    anchors.right: parent.right
                    anchors.top: reIconUser.top
                }
            }
        }
        Rectangle{
            anchors.top: formInputUsername.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            height: 50
            anchors.topMargin: 20
            anchors.leftMargin: 30
            anchors.rightMargin: 30
            Text {
                id: id11
                text: qsTr("Password")
            }
            Rectangle{
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.topMargin: 20
                border.width: 2
                border.color: "#2bc80c"
                radius: 20

                Rectangle {
                    id: reIconUser1
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.bottom: parent.bottom
                    anchors.topMargin: 4
                    anchors.leftMargin: 5
                    anchors.bottomMargin: 4
                    radius: 10
                    width: 30
                    Image {
                        id: iconUser1
                        anchors.fill: parent
                        source: "../images/password.svg"
                        visible: false
                        fillMode: Image.PreserveAspectFit
                        antialiasing: false
                    }
                    ColorOverlay{
                        anchors.fill: iconUser1
                        source: iconUser1
                        color: "#97f2efef"
                        antialiasing: false
                    }
                }
                TextInput{
                    id : textInput2
                    anchors.left: reIconUser1.right
                    anchors.bottom: reIconUser1.bottom
                    verticalAlignment: Text.AlignVCenter
                    anchors.right: parent.right
                    anchors.top: reIconUser1.top
                    echoMode:TextInput.Password
                }
            }
        }


        Text {
            id: text1
            x: 31
            y: 335
            width: 112
            height: 15
            color: "#1249d8"
            text: qsTr(" Fogot password?")
            font.pixelSize: 12
            horizontalAlignment: Text.AlignLeft
            MouseArea{
                anchors.fill: parent

                cursorShape: Qt.OpenHandCursor
                onClicked: {

                }
            }
        }

        Text {
            id: text2
            x: 30
            y: 216
            width: 138
            height: 15
            color: "#b80000"
            text: qsTr("The password is incorrect")
            font.pixelSize: 12
            visible: false
        }
        Btn{
            id: btnSubmit
            x: 30
            y: 243
            width: 240
            height: 41
        }

        Text {
            id: text3
            x: 30
            y: 360
            width: 181
            height: 22
            color: "#1249d8"
            text: qsTr("Don't have an account? Register")
            font.pixelSize: 12
            horizontalAlignment: Text.AlignHCenter
            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.OpenHandCursor
                onClicked: {
                    mainWindow.caption = "Register"
                    view.push(Qt.resolvedUrl("PageRegister.qml"))
                }
            }
        }

        BusyIndicator {
            id: busyIndicator
            x: 120
            y: 140
            visible: isLoading
            z: 10000
        }

    }
    Rectangle{
        id: full
        color: "#2d1d0f0f"
        anchors.fill: rectanglexxx
        visible: isLoading
    }
    Connections{
        target: backend
        function onStatusAccount(data){
            if (!data){
                isLoading = false
                full.visible = false
                busyIndicator.visible = false
                text2.visible = true
            }

        }
        function onGetNickname(data){
            if (data){
                mainWindow.width = 1200
                mainWindow.height = 800
                mainWindow.caption = "Home"
                view.push(Qt.resolvedUrl("PageHome1.qml"))
            }
            else{
                mainWindow.width = 400
                mainWindow.height = 400
                mainWindow.caption = "Set nickname"
                view.push(Qt.resolvedUrl("PageHome.qml"))
            }


        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:600;width:400}
}
##^##*/
