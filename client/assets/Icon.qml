import QtQuick 2.0

Rectangle{
    radius: 40
    border.color: "#efdd8e"
    color: "#00000000"
    border.width: 3
    anchors.fill: parent
    Image {
        id: image
        x: 8
        y: 14
        width: 51
        height: 48
        source: "../images/kitty.png"
        fillMode: Image.PreserveAspectFit
    }

}
/*##^##
Designer {
    D{i:0;autoSize:true;height:70;width:70}
}
##^##*/
