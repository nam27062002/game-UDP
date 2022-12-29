import QtQuick 2.0

Rectangle{
    id: online
    color: "#00000000"
    Rectangle {
        id: rectangle
        x: 14
        y: 9
        width: 14
        height: 14
        color: "#2fec2f"
        radius: 20
    }

    Text {
        id: text1
        x: 34
        y: 9
        width: 116
        height: 15
        color: "#c0baba"
        text: qsTr("Trực tuyến")
        font.pixelSize: 12
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:30;width:200}
}
##^##*/
