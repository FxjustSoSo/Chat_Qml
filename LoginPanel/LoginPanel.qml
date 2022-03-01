import QtQuick 2.0
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0
Item {
    id:root
    anchors.fill: parent
    property bool bRegister: false//是否注册成功

    //背景版
    Rectangle{
        id:rect_BottomPanel
        anchors.centerIn: parent
        width: 700
        height: 350
        border.color: "#3DAEEB"
        border.width: 5
        radius: 20
        color: "white"

        //用户注册
        Item {
            id: item_Left
            width: parent.width / 2
            height: parent.height
            //标题
            Text {
                id: text_RegisterTitle
                text: qsTr("用 户 注 册")
                font{
                    pixelSize: 18
                    bold:true
                }
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 20
            }
            Column{
                id:col_input_Register
                spacing: 10
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: text_RegisterTitle.bottom
                anchors.topMargin: 30
                property var mRadius: 15
                property color mColor: "#22222222"
                property var mFontSize: 12
                Row{
                    spacing: 5

                    Rectangle{
                        id:rect_ID_Register
                        width: rect_TopPanel.width * 0.6
                        height: rect_TopPanel.height * 0.1
                        color: "transparent"
                        radius: col_input_Register.mRadius
                        TextInput {
                            id: txIn_ID_Register
                            anchors.left: parent.left
                            anchors.leftMargin: 20
                            anchors.right: parent.right
                            anchors.rightMargin: 5
                            anchors.verticalCenter: parent.verticalCenter
                            selectionColor: "sky blue"
                            selectByMouse: true
                            font{
                                pointSize: col_input_Register.mFontSize
                                bold: true
                            }
                            verticalAlignment: Text.AlignVCenter

                            validator: IntValidator{bottom: 1;top: 999999999}
                            clip: true
                            focus: true
                            KeyNavigation.tab: txIn_Password_Register
                        }
                        Image{
                            source: "Images/账号.png"
                            width: 15
                            height: 15
                            sourceSize: Qt.size(15,15)
                            anchors.verticalCenter: parent.verticalCenter
                            opacity: 0.6
                        }

                        Rectangle{
                            width: parent.width
                            height: 1
                            anchors.bottom: parent.bottom
                            color: col_input_Register.mColor
                        }
                    }
                }
                Row{
                    spacing: 5
                    Rectangle{
                        id:rect_Password_Register
                        width: rect_TopPanel.width * 0.6
                        height: rect_TopPanel.height * 0.1
                        color: "transparent"
                        radius: col_input_Register.mRadius
                        TextInput {
                            id: txIn_Password_Register
                            anchors.left: parent.left
                            anchors.leftMargin: 20
                            anchors.right: parent.right
                            anchors.rightMargin: 5
                            anchors.verticalCenter: parent.verticalCenter
                            selectionColor: "sky blue"
                            selectByMouse: true
                            font{
                                pointSize: col_input_Register.mFontSize
                                bold: true
                            }
                            verticalAlignment: Text.AlignVCenter

                            echoMode:TextInput.Password
                            clip: true
                            focus: true
                            KeyNavigation.tab: txIn_Password_Again_Register
                        }
                        Image{
                            source: "Images/锁.png"
                            width: 15
                            height: 15
                            sourceSize: Qt.size(15,15)
                            anchors.verticalCenter: parent.verticalCenter
                            opacity: 0.6
                        }
                        Rectangle{
                            width: parent.width
                            height: 1
                            anchors.bottom: parent.bottom
                            color: col_input_Register.mColor
                        }
                    }
                }
                Row{
                    spacing: 5
                    Rectangle{
                        id:rect_Password_Again_Register
                        width: rect_TopPanel.width * 0.6
                        height: rect_TopPanel.height * 0.1
                        color: "transparent"
                        radius: col_input_Register.mRadius
                        TextInput {
                            id: txIn_Password_Again_Register
                            anchors.left: parent.left
                            anchors.leftMargin: 20
                            anchors.right: parent.right
                            anchors.rightMargin: 5
                            anchors.verticalCenter: parent.verticalCenter
                            selectionColor: "sky blue"
                            selectByMouse: true
                            font{
                                pointSize: col_input_Register.mFontSize
                                bold: true
                            }
                            verticalAlignment: Text.AlignVCenter
                            //horizontalAlignment: Text.AlignHCenter

                            echoMode:TextInput.Password
                            clip: true
                            focus: true
                            KeyNavigation.tab: txIn_ID_Register
                        }
                        Image{
                            source: "Images/锁.png"
                            width: 15
                            height: 15
                            sourceSize: Qt.size(15,15)
                            anchors.verticalCenter: parent.verticalCenter
                            opacity: 0.6
                        }
                        Rectangle{
                            width: parent.width
                            height: 1
                            anchors.bottom: parent.bottom
                            color: col_input_Register.mColor
                        }
                    }
                }
            }

            //完成注册
            Rectangle{
                id:rect_Register_OK
                width:parent.width * 0.5
                height: 50
                radius: 5
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20
                color: "pink"
                Text {
                    id: text_Register_OK
                    text: qsTr("注 册")
                    color: "white"
                    font{
                        pixelSize: 16
                        bold: true
                    }
                    anchors.centerIn: parent
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        //如果注册成功则播放动画
                        if(root.bRegister == true){
                            nbA_Backwards.running = true
                            root.bRegister = false//重置注册结果
                        }else{

                        }
                    }
                }
            }

        }


        Item {
            id: item_Right
            width: parent.width / 2
            height: parent.height
            anchors.right: parent.right
        }

    }

    //主登陆面板
    Rectangle{
        id:rect_TopPanel
        visible: true
        width: rect_BottomPanel.width * 0.45
        height: rect_BottomPanel.height + 50
        x:100
        anchors.verticalCenter: rect_BottomPanel.verticalCenter
        radius: 15
        color: "#EAEAEA"

        MouseArea{
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton//只检测鼠标左键
            property var _X: 0
            property var _Y: 0
            onPressed: {
                _X = mouseX
                _Y = mouseY
            }
            onPositionChanged: {
                main_Window.x += mouseX - _X
                main_Window.y += mouseY - _Y
            }
        }

        //左上角标题
        Text {
            id: text_Title
            text: qsTr("老年活动中心")
            font{
               pointSize: 10
               //bold: true
            }
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 10

        }

        //右上角功能按钮
        Row{
            spacing: 5
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 10
            Rectangle{//缩小
                width: 15
                height: 15
                radius: width/2
                color: "#1382D2"
                MouseArea{
                    anchors.fill: parent
                    onClicked: main_Window.showMinimized()
                }
            }
            Rectangle{//关闭
                width: 15
                height: 15
                radius: width/2
                color: "#FE958F"
                MouseArea{
                    anchors.fill: parent
                    onClicked: Qt.quit()
                }
            }
        }

        //Logo
        Rectangle{
            id:rect_Logo
            width: parent.width * 0.3
            height: parent.width * 0.3
            radius: width / 2
            color: "#FE958F"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: -100
            visible: false
        }
        Image{
            id:image_Logo
            anchors.centerIn: rect_Logo
            source: "Images/OIP-C.jpg"
            sourceSize: Qt.size(rect_Logo.width,rect_Logo.height)
            visible: false
            smooth:true
        }
        OpacityMask {
            anchors.fill: rect_Logo
            source: image_Logo
            maskSource: rect_Logo
        }

        //账号密码
        Column{
            id:col_input
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: rect_Logo.bottom
            anchors.topMargin: 30
            property var mRadius: 15
            property color mColor: "light gray"
            property var mFontSize: 16
            Row{
                spacing: 5
                Rectangle{
                    id:rect_ID
                    width: rect_TopPanel.width * 0.8
                    height: rect_TopPanel.height * 0.1
                    color: col_input.mColor
                    radius: col_input.mRadius
                    Image{
                        id:image_ID
                        source: "Images/账号.png"
                        width: 15
                        height: 15
                        sourceSize: Qt.size(15,15)
                        anchors.left: parent.left
                        anchors.leftMargin: 15
                        anchors.verticalCenter: parent.verticalCenter
                        opacity: 0.6
                    }
                    Rectangle{
                        width: 1
                        height: parent.height * 0.4
                        opacity: 0.3
                        radius: 5
                        color: "black"
                        anchors.left: image_ID.right
                        anchors.leftMargin: 8
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    TextInput {
                        id: txIn_ID
                        anchors.left: parent.left
                        anchors.leftMargin: 20
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        anchors.verticalCenter: parent.verticalCenter
                        selectionColor: "sky blue"
                        selectByMouse: true
                        font{
                            pointSize: 12
                            bold: true
                        }
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        validator: IntValidator{bottom: 1;top: 999999999}
                        clip: true
                        focus: true
                        KeyNavigation.tab: txIn_Password
                    }
                }
            }
            Row{
                spacing: 5
                Rectangle{
                    id:rect_Password
                    width: rect_TopPanel.width * 0.8
                    height: rect_TopPanel.height * 0.1
                    color: col_input.mColor
                    radius: col_input.mRadius
                    Image{
                        id:image_Password
                        source: "Images/锁.png"
                        width: 15
                        height: 15
                        sourceSize: Qt.size(15,15)
                        anchors.left: parent.left
                        anchors.leftMargin: 15
                        anchors.verticalCenter: parent.verticalCenter
                        opacity: 0.6
                    }
                    Rectangle{
                        width: 1
                        height: parent.height * 0.4
                        opacity: 0.3
                        radius: 5
                        color: "black"
                        anchors.left: image_Password.right
                        anchors.leftMargin: 8
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    TextInput {
                        id: txIn_Password
                        anchors.left: parent.left
                        anchors.leftMargin: 20
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        anchors.verticalCenter: parent.verticalCenter
                        selectionColor: "sky blue"
                        selectByMouse: true
                        font{
                            pointSize: 12
                            bold: true
                        }
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter

                        echoMode:TextInput.Password
                        clip: true
                        focus: true
                        KeyNavigation.tab: txIn_ID
                    }
                }
            }

        }

        //没有账号
        Rectangle{
            id:rect_Register
            width: parent.width * 0.3
            height: 30
            radius: 5
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent .bottom
            anchors.bottomMargin: 14
            color: "#F2A880"
            Text {
                id: text_Register
                text: qsTr("没有账号")
                anchors.centerIn: parent
                color: "white"
                font{
                    pixelSize: 14
                    bold: true
                }
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    nbA_Forward.running = true
                }
            }
        }

        //动画
        NumberAnimation{
            id:nbA_Forward
            target: rect_TopPanel
            property: "x"
            to:rect_BottomPanel.width - rect_TopPanel.width
            duration: 300
            easing.type: Easing.OutBack
        }
        NumberAnimation{
            id:nbA_Backwards
            target: rect_TopPanel
            property: "x"
            to:100
            duration: 300
            easing.type: Easing.OutBack
        }


    }
}
