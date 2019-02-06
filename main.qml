import QtQuick 2.9
import QtQuick.Window 2.2
import myextension 1.0
import QtQuick.Controls 1.6
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles.Desktop 1.0
import QtQuick.Dialogs.qml 1.0
import QtQuick.Layouts 1.0
import QtCharts 2.3
Window {
    visible: true
    width: 1700
    height: 1000
    title: qsTr("Hello World")
    property real width_s: 55
    property real height_s: 55
    property var anArray: [0,300513,124072,130443,112682,131888,135032,78314,111953,109180,8527,21980,4252,8681,6802,79,5425,3827,5244,9715,2718,1868,13849,832,25006,6460,159,2329,48046,26,33,3817,3977]
    property var arrayO:[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

    Rectangle{
        x: 20
        y: 316
        width: 955
        height: 643
        border.color: "#000000"
        radius: 25
        GridView {
            id: gridView
            x: 20
            y: 34
            width: 919
            height: 591
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
            x: 986
            y: 421
            width: 590
            height: 22
            stepSize: 1
            minimumValue: 10
            value: 55
            maximumValue: 180
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
        width: 541
        height: 181
        x:1057
        y:528
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
                anArray[alphabet_model.count]=i
                console.log(anArray)
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

    Button {
        id: loadimg
        x: 1002
        y: 828
        width: 281
        height: 46
        Text {
            anchors.fill: parent
            text: "بارگزاری عدد"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "EntezareZohoor C3"
            font.pixelSize: 19
        }
        z: 100
        onClicked: {
            alphabet_model.clear()
            center.get_path(path.text,labelnum.text)
            center.load_image()
            arrayO=anArray
            console.log("salam")
            console.log(arrayO)
            var min=10000
            var max=-1000
            for(var i=0;i<33;i++)
            {
                if(arrayO[i]<min)
                {
                    min=arrayO[i]
                }
                if(arrayO[i]>max)
                {
                    max=arrayO[i]
                }
            }

            bar.axisY().min=min
            bar.axisY().max=max
//            bar.setAxisY()
            bar.update()
        }
    }

    Button {
        id: update_information
        x: 1362
        y: 828
        width: 278
        height: 46
        Text {
            anchors.fill: parent
            text: "آپدیت تصاویر"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "EntezareZohoor C3"
            font.pixelSize: 19
        }
        z: 100
        onClicked: {
            center.get_path(path.text,labelnum.text)
            center.update_information()
        }
    }

    Button {
        id: next
        x: 1362
        y: 765
        width: 278
        height: 46
        Text {
            anchors.fill: parent
            text: "مجموعه بعدی"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "EntezareZohoor C3"
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
        x: 1006
        y: 765
        width: 277
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
            font.family: "EntezareZohoor C3"
            font.pixelSize: 19
        }

        onClicked: {
            center.prevous_bunch()
        }
    }

    GridView {
        id: gridView1
        x: 1006
        y: 316
        width: 671
        height: 131
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

    Text {
        id: image_path
        x: 1006
        y: 715
        width: 629
        height: 22
        text: qsTr("image path")
        renderType: Text.NativeRendering
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 15
    }

    Text {
        x: 1006
        y: 885
        width: 171
        height: 31
        text: "مسیر تصاویر"
        Layout.preferredHeight: 43
        Layout.preferredWidth: 604
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.family: "EntezareZohoor C3"
        font.pixelSize: 21
    }

    TextEdit {
        id: path
        x: 1122
        y: 890
        width: 513
        height: 20
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
        x: 1002
        y: 933
        width: 159
        height: 26
        text: qsTr("شماره مشخص شده")
        Layout.preferredHeight: 27
        Layout.preferredWidth: 600
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pointSize: 15
        z: 100
        font.family: "EntezareZohoor C3"
    }

    TextEdit {
        id: labelnum
        x: 1142
        y: 935
        width: 85
        height: 22
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
        x: 1207
        y: 936
        width: 259
        height: 26
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
        x: 1435
        y: 934
        width: 200
        height: 23
        text: qsTr("تمام تصاویر در این رده:")
        Layout.preferredHeight: 20
        Layout.preferredWidth: 600
        horizontalAlignment: Text.AlignHCenter
        z: 100
        font.family: "B Morvarid"
        font.pixelSize: 18

    }

    ChartView {

        id: bar
        x: 20
        y: 8
        width: 1601
        height: 279
        plotAreaColor: "#fdfefd"
        dropShadowEnabled: true
        BarSeries {
            name: "تعداد حروف"
            BarSet {
                values: arrayO
                label: "دیتاست پلاک"

            }
        }

    }

}
//    Component.onCompleted: {
//        var i
//        for(i=0;i<330;i++)
//        {
//            mymodel.append({txt:Number(i),oid:i})
//        }
//    }

