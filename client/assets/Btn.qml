import QtQuick 2.14
import QtQuick.Controls 2.14
import QtGraphicalEffects 1.15

Button{
    id: btnTopBar
    property string txt: "LOGIN"
    background: Rectangle{
        id: bgBtn
        radius: 20
        gradient: Gradient {
            orientation: Gradient.Vertical
            GradientStop {
                id: xx
                position: 0
                color: "#b923f800"
            }

            GradientStop {
                id: yy
                position: 1
                color: "#23272E"
            }
        }
            PropertyAnimation{
                id: s1
                target: xx
                property: "color"
                to: "#b96dcc26"
                duration: 500
                easing.type: Easing.InOutQuint
            }
        PropertyAnimation{
            id: s2
            target: xx
            property: "color"
            to: "#b923f800"
            duration: 500
            easing.type: Easing.InOutQuint
        }
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.OpenHandCursor
            onEntered: {
                s1.running = true
            }
            onExited: {
                s2.running = true
            }
            onClicked: {
                if (txt == "LOGIN"){
                    let username = textInput1.text
                    let password = textInput2.text
                    backend.checkAccount(username,password)
                    backend.sendNickname()
                    rectanglexxx.isLoading = true
                }
                else if (txt == "REGISTER"){
                    let username = textInput1.text
                    let password = textInput2.text
                    let password2 = textInput4.text
                    if (password != password2){
                        text2.text = "The old and new passwords are not same."
                        text2.visible = true
                    }
                    else{
                        backend.createAccout(username,password)
                    }
                }
                else if (txt == "CONTINUE"){
                    mainWindow.caption = "Log In"
                    view.push(Qt.resolvedUrl("../pages/PageLogin.qml"))
                }
                else if (txt == "OK"){
                    let input = textInput1.text
                    if (input.length > 15 || input.length <6){
                        text2.visible = true
                        text2.text = "Mệt ghê từ 6 đến 15 kí tự"
                        text2.color = "#ff0000"
                    }
                    else{
                        backend.setNickname1(input)
                    }
                }

            }
        }

    }

    Text {
        id: name
        color: "#ffffff"
        anchors.fill: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.bold: true
        font.family: "Tahoma"
        text: qsTr(txt)
    }
}



