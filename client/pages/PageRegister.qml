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
                text: qsTr("Register")
                horizontalAlignment: Text.AlignHCenter
                anchors.bottomMargin: 70
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
            id: form3
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
            id: text2
            x: 31
            y: 286
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
            y: 311
            width: 240
            height: 41
            txt: "REGISTER"
        }

        Text {
            id: text3
            x: 31
            y: 378
            width: 181
            height: 22
            color: "#1249d8"
            text: qsTr("Log In")
            font.pixelSize: 12
            MouseArea {
                anchors.fill: parent
                anchors.rightMargin: 1
                anchors.bottomMargin: 0
                anchors.leftMargin: -1
                anchors.topMargin: 0
                cursorShape: Qt.OpenHandCursor
                onClicked: {
                    mainWindow.caption = "Log In"
                    view.push(Qt.resolvedUrl("PageLogin.qml"))
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


        Rectangle {
            y: 231
            height: 50
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: form3.bottom
            Text {
                id: id13
                text: qsTr("Password (Again)")
            }

            Rectangle {
                radius: 20
                border.color: "#2bc80c"
                border.width: 2
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                Rectangle {
                    id: reIconUser3
                    width: 30
                    radius: 10
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    Image {
                        id: iconUser3
                        visible: false
                        anchors.fill: parent
                        source: "../images/password.svg"
                        fillMode: Image.PreserveAspectFit
                        antialiasing: false
                    }

                    ColorOverlay {
                        color: "#97f2efef"
                        anchors.fill: iconUser3
                        source: iconUser3
                        antialiasing: false
                    }
                    anchors.topMargin: 4
                    anchors.bottomMargin: 4
                    anchors.leftMargin: 5
                }

                TextInput {
                    id: textInput4
                    anchors.left: reIconUser3.right
                    anchors.right: parent.right
                    anchors.top: reIconUser3.top
                    anchors.bottom: reIconUser3.bottom
                    verticalAlignment: Text.AlignVCenter
                    echoMode: TextInput.Password
                }
                anchors.topMargin: 20
            }
            anchors.rightMargin: 30
            anchors.topMargin: 20
            anchors.leftMargin: 30
        }

    }
    Rectangle{
        id: full
        color: "#2d1d0f0f"
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        visible: isLoading
    }
    Rectangle{
        id: full1
        color: "#2d1d0f0f"
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        visible: false
        z: 100
        Rectangle {
            id: rectangle
            x: 51
            y: 82
            width: 300
            height: 417
            color: "#ffffff"
            radius: 20


            Image {
                id: image
                x: 100
                y: 58
                width: 100
                height: 100
                source: "../images/correct.webp"
                fillMode: Image.PreserveAspectFit
            }

            Text {
                id: text1
                x: 8
                y: 181
                width: 284
                height: 36
                color: "#0a6bdb"
                text: qsTr("Your Account Has Been Create!")
                font.pixelSize: 16
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
            }
            Btn{
                x: 48
                y: 252
                width: 205
                height: 49
                txt: "CONTINUE"
                z: 100000
            }

        }

    }
    Connections{
        target: backend
        function onCreateAcc(data){
            print(data)
            if (!data){
                isLoading = false
                full.visible = false
                busyIndicator.visible = false
                text2.visible = true
                text2.text = "Username already exists"
            }
            else{
                full1.visible = true
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:600;width:400}
}
##^##*/
