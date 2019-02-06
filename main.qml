import QtQuick 2.9
import QtQuick.Window 2.2
import myextension 1.0
import QtQuick.Controls 1.6
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles.Desktop 1.0
import QtQuick.Dialogs.qml 1.0
import QtQuick.Layouts 1.0
Window {
    visible: true
    width: 1700
    height: 1000
    title: qsTr("Hello World")
    property real width_s: 55
    property real height_s: 55
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
                        width: width_s
                        height: height_s
                        x:1
                        y:1

                        ImageItem {
                            id:im
                            width: width_s-5
                            height: height_s-5
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
                                parent.color="#ff0000"
                                parent.radius=20
                                var str=center.get_image_name(obj_id)
                                center.set_plate_image(str)
                                image_path.text=str
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
            cellHeight: height_s+15
            cellWidth: width_s+5
        }

        Slider {
            id: widthslider
            x: 20
            y: 899
            width: 377
            height: 22
            stepSize: 1
            minimumValue: 20
            value: 55
            maximumValue: 140
            onValueChanged: {
                width_s=widthslider.value
                height_s=widthslider.value
            }
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
        height: 266
        x:1050
        y:20
        ImageItem {
            id:center
            anchors.fill: parent
            onImage_loaded: {
                numofimgs.text="تمام تصاویر در این رده:"+Number(center.return_number_of_imgs())
            }
            onWhole_image_uploaded:{
                var i
                for(i=0;i<center.get_total_img_size();i++)
                {
                    mymodel.append({txt:Number(i),oid:i,src_n:i})
                }
                numofimgs1.text="تصاویر پردازش شده:"+Number(center.get_total_image_passed())
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

    Label {
        id: label
        x: 1056
        y: 716
        width: 594
        height: 27
        z: 100
        font.pointSize: 15
        font.family: "Times New Roman"
    }

    Button {
        id: loadimg
        x: 1050
        y: 652
        width: 260
        height: 46
        Text {
            anchors.fill: parent
            text: "بارگزاری عدد"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "A Sogand"
            font.pixelSize: 19
        }
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
        Text {
            anchors.fill: parent
            text: "آپدیت تصاویر"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "A Sogand"
            font.pixelSize: 25
        }
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
        Text {
            anchors.fill: parent
            text: "مجموعه بعدی"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "A Sogand"
            font.pixelSize: 19
        }
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
        //
        antialiasing: true
        z: 100
        Text {
            anchors.fill: parent
            text: "مجموعه قبلی"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "A Sogand"
            font.pixelSize: 19
        }

        onClicked: {
            center.prevous_bunch()
        }
    }

    GridView {
        id: gridView1
        x: 1050
        y: 340
        width: 600
        height: 160
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
                    radius: 15
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

    ColumnLayout {
        x: 1046
        y: 704
        height: 260
        spacing: 18

        Text {
            width: 600
            text: "مسیر تصاویر"
            Layout.preferredHeight: 43
            Layout.preferredWidth: 604
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.family: "B Morvarid"
            font.pixelSize: 21
        }

        TextEdit {
            id: path
            text: "/home/nict/plate_finder_section/ocr/total_datasets/train/0"
            Layout.preferredHeight: 20
            Layout.preferredWidth: 600
            horizontalAlignment: Text.AlignHCenter
            font.family: "Times New Roman"
            z: 100
            font.pixelSize: 18
        }

        Label {
            id: label1
            width: 600
            text: qsTr("شماره مشخص شده")
            Layout.preferredHeight: 27
            Layout.preferredWidth: 600
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 15
            z: 100
            font.family: "B Morvarid"
        }

        TextEdit {
            id: labelnum
            text: "1"
            Layout.preferredHeight: 22
            Layout.preferredWidth: 600
            horizontalAlignment: Text.AlignHCenter
            font.weight: Font.Light
            font.capitalization: Font.AllUppercase
            font.family: "Times New Roman"
            z: 100
            font.pixelSize: 20
        }

        TextEdit {
            id: numofimgs1
            text: qsTr("تصاویر پردازش شده:")
            Layout.preferredHeight: 26
            Layout.preferredWidth: 600
            horizontalAlignment: Text.AlignHCenter
            z: 100
            font.pixelSize: 18
            font.family: "B Morvarid"
        }

        TextEdit {
            id: numofimgs
            text: qsTr("تمام تصاویر در این رده:")
            Layout.preferredHeight: 20
            Layout.preferredWidth: 600
            horizontalAlignment: Text.AlignHCenter
            z: 100
            font.family: "B Morvarid"
            font.pixelSize: 18
        }
    }

    Text {
        id: image_path
        x: 1050
        y: 301
        width: 600
        height: 22
        text: qsTr("image path")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 15
    }

}
//    Component.onCompleted: {
//        var i
//        for(i=0;i<330;i++)
//        {
//            mymodel.append({txt:Number(i),oid:i})
//        }
//    }

