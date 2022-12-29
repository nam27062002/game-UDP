import QtQuick 2.0
import QtQuick.Controls 2.14
import QtGraphicalEffects 1.2
import '../assets'
Rectangle{
    id: home
    color: "#ffffff"
    Rectangle{
        y: 149
        anchors.top: reLogin.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: 50
        anchors.leftMargin: 42
        anchors.rightMargin: 18
        Text {
            id: id1
            x: 8
            y: -4
            text: qsTr("Đặt nickname đi bạn :D")
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
            TextInput{
                id : textInput1
                x: 8
                y: 4
                width: 332
                height: 22
                anchors.left: reIconUser.right
                anchors.bottom: reIconUser.bottom
                verticalAlignment: Text.AlignVCenter
                anchors.right: parent.right
                anchors.top: reIconUser.top
                focus: txt == "Username"
                echoMode: if (isPassword) return TextInput.Password; else return TextInput.Normal
            }
        }
    }


    Text {
        id: text1
        x: 250
        y: 149
        width: 188
        height: 15
        text: qsTr("6 <= len(nickname) <= 15")
        font.pixelSize: 12
    }

    Button {
        id: button
        x: 282
        y: 205
        width: 100
        height: 24
        text: qsTr("Kiểm tra")
        onClicked: {
            let input = textInput1.text
            if (input.length > 15 || input.length <6){
                text2.visible = true
                text2.text = "Mệt ghê từ 6 đến 15 kí tự"
                text2.color = "#ff0000"
            }
            else{
                backend.setNickname(input)
            }
        }
    }

    Text {
        id: text2
        x: 47
        y: 205
        width: 171
        height: 15
        enabled: false
        color: "#ff0000"
        text: qsTr("Người khác đặt tên đó rồi")
        font.pixelSize: 12
        visible: false
    }
    Btn{
        x: 108
        y: 302
        width: 184
        height: 41
        txt: "OK"
    }
    Connections{
        target: backend
        function onStatusNickname(data){
            if (!data){
                text2.visible = true
                text2.text = "Nickname được dùng rồi bạn ưi :D"
                text2.color = "#ff0000"
            }
            else{
                text2.visible = true
                text2.text = "Nickname hợp lệ"
                text2.color = "green"
            }
        }
        function onNickname(data){
            if (!data){
                text2.visible = true
                text2.text = "Nickname được dùng rồi bạn ưi :D"
                text2.color = "#ff0000"
            }
            else{
                mainWindow.width = 1200
                mainWindow.height = 800
                mainWindow.caption = "Home"
                view.push(Qt.resolvedUrl("PageHome1.qml"))
            }
        }
    }

    Rectangle {
        id: rectangle
        x: 112
        y: 20
        width: 63
        height: 64
        color: "#ffffff"
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:400;width:400}
}
##^##*/
