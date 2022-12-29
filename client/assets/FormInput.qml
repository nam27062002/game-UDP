import QtQuick 2.14
import QtGraphicalEffects 1.1
Rectangle{
    anchors.top: reLogin.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    height: 50
    anchors.leftMargin: 30
    anchors.rightMargin: 30
    property bool isPassword: False
    property string txt: "Username"
    property string url: "../images/user.svg"
    Text {
        id: id1
        text: qsTr(txt)
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
                source: url
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
            focus: txt == "Username"
            echoMode: if (isPassword) return TextInput.Password; else return TextInput.Normal
        }
    }
}
