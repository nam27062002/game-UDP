import QtQuick 2.0
import QtGraphicalEffects 1.12
Rectangle{
    property string txt: "Hello"
    color : "#36393f"
    Text {
        id: name
        x: 17
        y: 0
        width: 66
        height: 30
        color: "#f4f3f3"
        text: txt
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 12
    }
    Image {
        id: iconBtn
        source: '../images/correct.svg'
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 32
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        height: 20
        width: 20
        visible: false
        fillMode: Image.PreserveAspectFit
        antialiasing: false
    }

    ColorOverlay{
        id: x1
        anchors.fill: iconBtn
        source: iconBtn
        anchors.rightMargin: -26
        anchors.bottomMargin: 0
        anchors.leftMargin: 26
        anchors.topMargin: 0
        color: "green"
        antialiasing: false
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                x1.color = "#73dc73"
            }
            onExited: {
                x1.color = "green"
            }
            onClicked: {
                backend.acceptAddFriend(txt)
                backend.getListFriend()
                rectangle9.visible = false
            }
        }
    }

    Image {
        id: iconBtn1
        source: '../images/close_icon.svg'

        height: 20
        width: 20
        visible: false
        fillMode: Image.PreserveAspectFit
        antialiasing: false
    }

    ColorOverlay{
        id: x2
        anchors.fill: iconBtn1
        source: iconBtn1
        anchors.rightMargin: -187
        anchors.bottomMargin: -5
        anchors.leftMargin: 187
        anchors.topMargin: 5
        color: "#ff7575"
        antialiasing: false
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                x2.color = "red"
            }
            onExited: {
                x2.color = "#ff7575"
            }
            onClicked: {
                backend.unFriendRequest(txt)

            }
        }
    }


}
/*##^##
Designer {
    D{i:0;autoSize:true;height:30;width:200}
}
##^##*/
