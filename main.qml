import QtQuick 2.9
import QtQuick.Window 2.2
import myextension 1.0
import QtQuick.Controls 1.6
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles.Desktop 1.0
import QtQuick.Dialogs.qml 1.0
Window {
    visible: true
    width: 1500
    height: 1000
    title: qsTr("Hello World")
    Rectangle{
        x: 20
        y: 22
        width: 997
        height: 937
        border.color: "#000000"
        GridView {
            id: gridView
            x: 20
            y: 100
            width: 980
            height: 700
            model: mymodel

            delegate: Item {
                property int obj_id:oid
                x: 5
                height: 50
                Column {
                    spacing: 0
                    Rectangle{
                        id:rect
                        radius: 5
                        border.color: "#000000"
                        color: "#EEFFEE"
                        antialiasing: true
                        opacity: 1
                        width: 70
                        height: 70
                        x:1
                        y:1

                        ImageItem {
                            id:im
                            width: 60
                            height: 60
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            src_number: src_n
                        }
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                console.log(obj_id)
                                rect.state = "pressed"
                                stateTimer2.start()
                            }
                        }

                        states: State {
                            name: "pressed"
                            PropertyChanges { target: rect; scale: 0.9 }
                        }

                        Timer {
                            id: stateTimer2
                            interval: 120;
                            repeat: false
                            onTriggered: rect.state = 'State0'
                        }

                        transitions: Transition {
                            NumberAnimation { properties: "scale"; duration: 120; easing.type: Easing.InOutQuad }
                        }
                    }


                    Text {
                        x: 20
                        text: txt
                        font.bold: true
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.family: "times"
                        font.pixelSize: 13
                    }
                }
            }
            cellHeight: 85
            cellWidth: 80
        }
    }
    ListModel {
        id:mymodel
    }
    ImageItem {
        id:center
        width: 400
        height: 300
        x:1050
        y:100

        Rectangle{
            anchors.fill: parent
            radius: 5
            border.color: "#000000"
            antialiasing: true
            opacity: 0.1
        }
        onImage_loaded: {
            numofimgs.text="total image has been loaded:"+Number(center.return_number_of_imgs())
        }
        onWhole_image_uploaded:{
            var i
            for(i=0;i<center.get_total_img_size();i++)
            {
                console.log("qml trying")
                mymodel.append({txt:Number(i),oid:i,src_n:i})
            }
            numofimgs1.text="total image passed="+Number(center.get_total_image_passed())
        }
    }

    TextEdit {
        id: path
        x: 1096
        y: 445
        width: 342
        height: 20
        text: "/home/nict/plate_finder_section/ocr/total_datasets/train/0"
        font.family: "Times New Roman"
        z: 100
        font.pixelSize: 15
    }

    Label {
        id: label
        x: 1038
        y: 438
        width: 61
        height: 27
        text: qsTr("path")
        z: 100
        font.pointSize: 15
        font.family: "Times New Roman"
    }

    Column {
        x: 1038
        y: 556
        width: 217
        height: 162
        z: 1
        spacing: 12

        Button {
            id: prevois
            width: 181
            height: 46
            text: qsTr("previous")
            z: 100
            onClicked: {
                center.prevous_bunch()
            }
        }

        Button {
            id: next
            width: 181
            height: 46
            text: qsTr("next")
            z: 100
            onClicked: {
                mymodel.clear()
                center.load_next()
            }
        }

        Button {
            id: loadimg
            width: 181
            height: 46
            text: qsTr("load  image")
            z: 100
            onClicked: {
                center.get_path(path.text,labelnum.text)
                center.load_image()
            }
        }
    }

    Label {
        id: label1
        x: 1038
        y: 490
        width: 61
        height: 27
        text: qsTr("label number")
        font.pointSize: 15
        z: 100
        font.family: "Times New Roman"
    }

    TextEdit {
        id: labelnum
        x: 1198
        y: 492
        width: 138
        height: 16
        text: "1"
        font.family: "Times New Roman"
        z: 100
        font.pixelSize: 15
    }

    TextEdit {
        id: numofimgs
        x: 1038
        y: 773
        width: 342
        height: 20
        text: qsTr("total image has been loaded:0")
        z: 100
        font.family: "Times New Roman"
        font.pixelSize: 15
    }

    TextEdit {
        id: numofimgs1
        x: 1038
        y: 804
        width: 342
        height: 20
        text: qsTr("total image passed:0")
        z: 100
        font.pixelSize: 15
        font.family: "Times New Roman"
    }

    //    Component.onCompleted: {
    //        var i
    //        for(i=0;i<330;i++)
    //        {
    //            mymodel.append({txt:Number(i),oid:i})
    //        }
    //    }
}
