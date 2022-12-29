import QtQuick 2.0
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import QtQuick.Dialogs 1.3
import QtQml 2.0
import Qt.labs.qmlmodels 1.0
import '../assets'
Rectangle{
    id: home
    anchors.fill: parent
    color : "#2c313c"
    Timer {
        id: timer
    }
    function delay(delayTime,cb) {
        timer.interval = delayTime;
        timer.repeat = false;
        timer.triggered.connect(cb);
        timer.start();
    }
    Rectangle {
        id: rectangle
        x: 966
        y: 0
        width: 234
        height: 74
        color: "#00000000"

        Text {
            id: text1
            x: 77
            y: 21
            width: 156
            height: 45
            color: "#ffffff"
            text: qsTr("")
            font.pixelSize: 18
            font.bold: true
        }

        Online{
            x: 60
            y: 40
        }
        Rectangle{
            color: "#00000000"
            anchors.left: parent.left
            width: 70
            height: 70
            Icon{
                id: x37
            }
        }


    }

    Rectangle {
        id: rectangle1
        x: 958
        y: 80
        width: 242
        height: 1
        color: "#ffffff"
    }

    Rectangle {
        id: rectangle2
        x: 958
        y: 0
        width: 1
        height: 800
        color: "#ffffff"
    }


    Rectangle {
        id: rectangle3
        x: 958
        y: 80
        width: 242
        height: 600
        color: "#00000000"
        Rectangle{
            x: 1
            y: 105
            width: 241
            height: 56
            color: "#2c313c"
            anchors.leftMargin: 1
            z: 100000000000
            Text {
                id: bb
                anchors.fill : parent
                anchors.rightMargin: 0
                anchors.bottomMargin: -21
                anchors.topMargin: 21
                anchors.leftMargin: 8
                z: 100
                color: "#ffffff"
                text: qsTr("")
                font.pointSize: 16
                font.bold: true
            }
        }

        ListView {
            id: listView50
            anchors.fill: parent
            anchors.rightMargin: -1
            anchors.bottomMargin: -117
            anchors.leftMargin: 1
            anchors.topMargin: 187
            z: 10
            delegate: Item {
                x: 5
                width: 300
                height: 60
                z: 8
                Row {
                    id: row1
                    Friend{
                        z: 9
                        id: tttt
                        name: xx
                        width: 238
                        height: 50
                        isOnline: yy

                    }
                }
            }
            model: ListModel {
                id: list0
            }
        }
    }
    Rectangle {
        id: rectangle4
        anchors.top: rectangle3.bottom
        anchors.left: rectangle3.left
        anchors.right: rectangle3.right
        anchors.bottom: home.bottom
        anchors.rightMargin: 0
        anchors.bottomMargin: 562
        anchors.leftMargin: 0
        anchors.topMargin: -607
        color: "#2c313c"
        border.color: "white"
        border.width: 2
        Rectangle{
            id: rectangle6
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            width: 70
            color: "#00000000"
            Image{
                id: message
                source: "../images/message.svg"
                anchors.rightMargin: -14
                anchors.bottomMargin: 0
                anchors.leftMargin: 14
                anchors.topMargin: 0
                anchors.fill: parent
                visible: false
                fillMode: Image.PreserveAspectFit
                antialiasing: false
            }
            ColorOverlay{
                id: ccc
                anchors.margins: 10
                anchors.topMargin: 8
                anchors.leftMargin: 8
                anchors.rightMargin: 22
                anchors.fill: message
                source: message
                anchors.bottomMargin: 65
                color: "#e4e47d"
                antialiasing: false
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered:{
                        ccc.color = "#ffff00"
                    }
                    onExited: {
                        ccc.color = "#e4e47d"
                    }
                }
            }

            Rectangle {
                id: rectangle7
                x: 8
                y: 79
                width: 174
                height: 26
                color: "#00000000"
                radius: 10
                border.width: 2
                border.color: "#2fff06"
                visible: false
                Text{
                    y: -20
                    color: "#ececec"
                    text: "Nhập tên cần kết bạn"
                    rotation: 0
                }

                TextInput {
                    id: textInput
                    x: 14
                    y: 3
                    width: 152
                    height: 20
                    color: "#ffffff"
                    text: qsTr("")
                    font.pixelSize: 15
                    verticalAlignment: Text.AlignVCenter
                }
                Button{
                    x: 182
                    y: 2
                    width: 47
                    height: 20
                    text:"Add"
                    onClicked: {
                        backend.addFriend(textInput.text)
                    }
                }
                Text {
                    id: text2
                    x: 3
                    y: 28
                    width: 168
                    height: 15
                    color: "#fe4d4d"
                    visible: false
                    text: qsTr("Không tìm thấy người chơi")
                    font.pixelSize: 12
                }
            }

            Rectangle {
                id: rectangle9
                x: 0
                y: 79
                width: 242
                height: 225
                color: "#36393f"
                border.color: "red"
                border.width: 2
                visible: false
                z: 10000000000
                Text {
                    id: name
                    x: 0
                    y: 6
                    width: 242
                    height: 18
                    color: "#fbf8f8"
                    text: qsTr("Lời mời kết bạn")
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 13
                    font.bold: true
                }
                ListView {
                    id: listView51
                    anchors.fill: parent
                    anchors.topMargin: 30
                    z: 10
                    delegate: Item {
                        x: 5
                        width: 200
                        height: 30
                        z: 8
                        Row {
                            id: row11
                            FriendRequest{
                               txt: hehe
                               width: 200
                               height: 30
                            }

                        }
                    }
                    model: ListModel {
                        id: list01

                    }
                }
            }



        }
        Rectangle{
            id: rectangle5
            anchors.top: parent.top
            anchors.left: rectangle6.right
            anchors.bottom: parent.bottom
            width: 70
            color: "#00000000"
            Image{
                id: message1
                source: "../images/addFriend.svg"
                anchors.rightMargin: -19
                anchors.bottomMargin: 0
                anchors.leftMargin: 19
                anchors.topMargin: 0
                anchors.fill: parent
                visible: false
                fillMode: Image.PreserveAspectFit
                antialiasing: false
            }
            ColorOverlay{
                id: ccc1
                anchors.margins: 10
                anchors.topMargin: 8
                anchors.leftMargin: 7
                anchors.rightMargin: 23
                anchors.fill: message1
                source: message1
                anchors.bottomMargin: 62
                color: "#e4e47d"
                antialiasing: false
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        ccc1.color = "#ffff00"
                    }
                    onExited: {
                        ccc1.color = "#e4e47d"
                    }
                    onClicked: {
                        if (rectangle7.visible == true){
                            rectangle7.visible = false
                            text2.visible = false
                            textInput.text = ""
                        }
                        else{
                            rectangle7.visible = true
                        }
                    }
                }
            }
            Rectangle{
                id: rectangle8
                anchors.top: parent.top
                anchors.left: rectangle5.right
                anchors.bottom: parent.bottom
                width: 70
                color: "#00000000"
                Image{
                    id: message2
                    source: "../images/notice.svg"
                    anchors.rightMargin: -21
                    anchors.bottomMargin: 0
                    anchors.leftMargin: 21
                    anchors.topMargin: 0
                    anchors.fill: parent
                    visible: false
                    fillMode: Image.PreserveAspectFit
                    antialiasing: false
                }
                ColorOverlay{
                    id: ccc2
                    anchors.margins: 10
                    anchors.topMargin: 8
                    anchors.leftMargin: 15
                    anchors.rightMargin: 15
                    anchors.fill: message2
                    source: message2
                    anchors.bottomMargin: 62
                    color: "#e4e47d"
                    antialiasing: false
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            ccc2.color = "#ffff00"
                        }
                        onExited: {
                            ccc2.color = "#e4e47d"
                        }
                        onClicked: {
                            if (rectangle9.visible == true){
                                rectangle9.visible = false

                            }
                            else{
                                backend.getListFriendRequest()
                                rectangle9.visible = true
                            }
                        }
                    }
                }
            }
        }
        PropertyAnimation{
            id: s1
            target: rectangle7
            property: "visible"
            to: false
            duration: 3000
            easing.type: Easing.InOutQuint
        }
        PropertyAnimation{
            id: s2
            target: textInput
            property: "text"
            to: ""
            duration: 3000
            easing.type: Easing.InOutQuint
        }
        PropertyAnimation{
            id: s3
            target: text2
            property: "visible"
            to: false
            duration: 3000
            easing.type: Easing.InOutQuint
        }
        PropertyAnimation{
            id: notice
            target: rectangle10
            property: "x"
            to: if (rectangle10.x == 1205) return 861; else return 1205
            duration: 1000
            easing.type: Easing.InOutQuint
        }

    }
    Rectangle {
        id: rectangle10
        x: 1205
        y: 689
        width: 339
        height: 70
        color: "#2c313c"
        radius: 20
        border.color: 'red'
        border.width: 4
        Image {
            id: image
            x: 17
            y: 6
            width: 88
            height: 55
            source: "../images/notice.svg"
            visible: false
            fillMode: Image.PreserveAspectFit
            antialiasing: false
        }
        ColorOverlay{
            anchors.fill: image
            source: image
            anchors.rightMargin: 17
            anchors.bottomMargin: 0
            anchors.leftMargin: -17
            anchors.topMargin: 0
            color: "#e4e47d"
            antialiasing: false

            Text {
                id: text3
                x: 83
                y: 0
                width: 232
                height: 55
                color: "#04f62b"
                text: qsTr("hihi đã gửi yêu cầu kết bạn")
                font.pixelSize: 13
                verticalAlignment: Text.AlignVCenter
            }
        }
    }
    function notification(){
        notice.running = true
        delay(5000, function() {
            notice.running = true
        })
    }
    Component.onCompleted:{
        backend.infoUser();
        backend.getListFriend();
    }
    Connections{
        target: backend
        function onGetInfoUser(data){
            text1.text = data[3]
        }
        function onStatusAddfriend(data){
            if (data == -1){
                text2.visible = true
                text2.color = "#fe4d4d"
                text2.text = qsTr("Bạn bị điên à")
            }
            else if (data == 0){
                text2.visible = true
                text2.color = "#fe4d4d"
                text2.text = qsTr("Không tìm thấy người chơi")
            }
            else{
                text2.visible = true
                text2.color = "#fe4d4d"
                text2.text = qsTr("Đã gửi lời mời kết bạn")
                s1.running = true
                s2.running = true
                s3.running = true
            }
        }
        function onListNickname(data){
            list0.clear()
            let count = 0
            for (let i = 0;i < data.length;i ++){
                if (data[i][1]){
                    count ++
                }
                list0.append({"xx": data[i][0],"yy" : data[i][1]})
            }
            bb.text = "Bạn bè (" + count.toString() + "/" + data.length.toString() +")"

        }
        function onListFriendRequest(data){
            list01.clear()
            for (let i = 0; i < data.length;i++){
                list01.append({"hehe":data[i]})
            }
        }
        function onNoticeAddFriend(data){
            text3.text = data + " đã gửi yêu cầu kết bạn"
            notification()
        }
    }

}


/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.66;height:800;width:1200}
}
##^##*/
