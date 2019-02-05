import QtQuick 2.9
import QtQuick.Window 2.2
import myextension 1.0
import QtQuick.Controls 1.6
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles.Desktop 1.0
import QtQuick.Dialogs.qml 1.0
Window {
    visible: true
    width: 1700
    height: 1000
    title: qsTr("Hello World")
    Rectangle{
        x: 20
        y: 22
        width: 997
        height: 937
        border.color: "#000000"
        radius: 25
        GridView {
            id: gridView
            x: 20
            y: 100
            width: 950
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
    Rectangle{
        radius: 25
        border.color: "#000000"
        antialiasing: true
        width: 600
        height: 300
        x:1050
        y:20
        ImageItem {
            id:center
            width: 600
            height: 300
            x:1050
            y:20
            onImage_loaded: {
                numofimgs.text="total image has been loaded:"+Number(center.return_number_of_imgs())
            }
            onWhole_image_uploaded:{
                var i
                for(i=0;i<center.get_total_img_size();i++)
                {
                    mymodel.append({txt:Number(i),oid:i,src_n:i})
                }
                numofimgs1.text="total image passed="+Number(center.get_total_image_passed())
            }
            onCounting_end: {
                var i
                i=center.get_count()
                if(i===0)
                {
                    alphabet_model.append({txt:center.get_name(),num:i,r_color:"#EE0000",t_color:"#FFFFFF",id_num:Number(alphabet_model.count)})
                }
                else
                {
                    alphabet_model.append({txt:center.get_name(),num:i,r_color:"#00EE00",t_color:"#000000",id_num:Number(alphabet_model.count)})
                }
            }
        }
    }

    TextEdit {
        id: path
        x: 1073
        y: 749
        width: 442
        height: 20
        text: "/home/nict/plate_finder_section/ocr/total_datasets/train/0"
        horizontalAlignment: Text.AlignHCenter
        font.family: "Times New Roman"
        z: 100
        font.pixelSize: 15
    }

    Label {
        id: label
        x: 1038
        y: 716
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
        height: 211
        z: 1
        spacing: 12
    }

    Label {
        id: label1
        x: 1038
        y: 788
        width: 115
        height: 27
        text: qsTr("label number")
        font.pointSize: 15
        z: 100
        font.family: "Times New Roman"
    }

    TextEdit {
        id: labelnum
        x: 1105
        y: 821
        width: 120
        height: 16
        text: "1"
        horizontalAlignment: Text.AlignHCenter
        font.weight: Font.Light
        font.capitalization: Font.AllUppercase
        font.family: "Times New Roman"
        z: 100
        font.pixelSize: 15
    }

    TextEdit {
        id: numofimgs
        x: 1038
        y: 939
        width: 342
        height: 20
        text: qsTr("total image has been loaded:0")
        z: 100
        font.family: "Times New Roman"
        font.pixelSize: 18
    }

    TextEdit {
        id: numofimgs1
        x: 1038
        y: 874
        width: 342
        height: 26
        text: qsTr("total image passed:0")
        z: 100
        font.pixelSize: 18
        font.family: "Times New Roman"
    }

    Button {
        id: loadimg
        x: 1050
        y: 652
        width: 260
        height: 46
        text: qsTr("update path and label")
        z: 100
        onClicked: {
            alphabet_model.clear()
            center.get_path(path.text,labelnum.text)
            center.load_image()
        }
    }

    Button {
        id: update_information
        x: 1390
        y: 652
        width: 260
        height: 46
        text: qsTr("update infromation")
        z: 100
        onClicked: {
            center.get_path(path.text,labelnum.text)
            center.update_information()
        }
    }

    Row {
        x: 1038
        y: 592
        width: 612
        height: 46
        spacing: 12
    }

    Button {
        id: next
        x: 1390
        y: 592
        width: 260
        height: 46
        text: qsTr("next")
        z: 100
        onClicked: {
            mymodel.clear()
            center.load_next()
        }
    }

    Button {
        id: prevois
        x: 1050
        y: 592
        width: 260
        height: 46
        text: qsTr("previous")
        antialiasing: true
        z: 100
        onClicked: {
            center.prevous_bunch()
        }
    }

    GridView {
        id: gridView1
        x: 1050
        y: 331
        width: 600
        height: 245
        cellWidth: 70
        model:alphabet_model
        delegate: Item {
            x: 5
            height: 50
            Column {
                Text {
                    x: 5
                    text:id_num
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.bold: true
                    font.family: "Times"
                }
                Rectangle {
                    width: 60
                    height: 40
                    anchors.horizontalCenter: parent.horizontalCenter
                    border.color: "#000000"
                    color: r_color
                    radius: 5
                    Text {
                        text: txt
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter:parent.verticalCenter
                        font.family: "B Nazanin"
                        font.pointSize: 16
                        color: t_color
                        font.bold: true
                    }
                }

                Text {
                    x: 5
                    text: num
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.bold: true
                }
                spacing: 5
            }
        }
        cellHeight: 110
    }
    ListModel {
        id: alphabet_model
    }

}
//    Component.onCompleted: {
//        var i
//        for(i=0;i<330;i++)
//        {
//            mymodel.append({txt:Number(i),oid:i})
//        }
//    }

