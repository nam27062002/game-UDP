import QtQuick 2.0

Rectangle{
    id: hello
    property bool isOnline: false
    property string name: "Lam Tung Vu"
    color: "#2c313c"
    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            color = "#262a34"
        }
        onExited: {
            color = "#2c313c"
        }
    }
    Rectangle {
        id: icon312
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.margins: 2
        width: 48
        color: "#00000000"
        radius: 30
        border.color: "#efdd8e"

        Image {
            id:img3123
            source: "../images/kitty.png"
            anchors.fill : parent
            anchors.margins: 7
        }
    }

    Rectangle {
        id: rectangle
        x: 37
        y: 31
        width: 15
        height: 15
        color: if (isOnline) return "#2fec2f"; else return "#2c313c"
        radius: 40
        border.color: "#efdd8e"
        border.width: 2
    }

    Text {
        id: text1
        anchors.left: icon312.right
        anchors.top: icon312.top
        anchors.bottom: icon312.bottom
        anchors.leftMargin: 20
        color: if (isOnline) return "#ffffff"; else return "#b1b1b1"

        text: qsTr(name)
        font.pixelSize: 12
        verticalAlignment: Text.AlignVCenter
    }

}
/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:1.1;height:50;width:200}
}
##^##*/
