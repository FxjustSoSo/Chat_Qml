import QtQuick 2.0
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0
Item {
    id:root
    anchors.fill: parent
    property bool bRegister: false//是否注册成功
    property bool bLoginReadOnly: false//注册时登录界面输入框设置为只读
    property alias mLoginIDText: txIn_ID.text
    property alias mLoginPwText: txIn_Password.text
    property alias mRegIDText: txIn_ID_Register.text
    property alias mRegPwText: txIn_Password_Register.text
    property alias mRegAgaPwText: txIn_Password_Again_Register.text
    function initRegisterText(){
        root.mRegIDText = ""
        root.mRegPwText = ""
        root.mRegAgaPwText = ""
        root.mLoginIDText = ""
        root.mLoginPwText = ""
        root.bLoginReadOnly = true
    }

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
//        Rectangle{
//            id:rect_bg
//            anchors.centerIn: parent
//            width: 700
//            height: 350
//            border.color: "#3DAEEB"
//            border.width: 5
//            opacity: 0.3
//            radius: 20
//            color: "white"
//            visible: true
//            smooth:true
//        }

//        Image{
//            id:image_Bg
//            fillMode: Image.PreserveAspectCrop
//            //anchors.fill: parent
//            source: "Images/BG_白老板.jpg"
//            opacity: 0.3
//            clip: true

//            sourceSize: Qt.size(parent.width,parent.height)
//            visible: true
//            smooth:true
//        }
//        OpacityMask {
//            anchors.fill: rect_bg
//            source: image_Bg
//            maskSource: rect_bg
//        }

        //左半边 用户注册
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
            //注册面板中的用户名、密码、重复输入 输入框
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
                            height: parent.height + 0.5
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
                            height: parent.height + 0.5
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
                            height: parent.height + 0.5
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

                //警告
                Text {
                    id: text_warning
                    text: qsTr("")
                    opacity: 0
                    font{
                        bold: true
                        pixelSize: 14
                    }
                    color: "red"
                    x:(parent.width - width)/2
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
                        //如果账号、密码、重新输入不为空则可以进入检测,否则root.bRegister为假
                        if(root.mRegIDText == ""){
                            text_warning.text = "账号不能为空!"
                            paA_Warning_Forward.running = true//播放提示动画
                        }
                        else if(root.mRegPwText     == "" ||
                                root.mRegAgaPwText  == "" ||
                                root.mRegPwText     != root.mRegAgaPwText){
                            text_warning.text = "密码不一致,请重新输入!"
                            paA_Warning_Forward.running = true//播放提示动画
                        }
                        else{
                            root.bRegister = true
                        }

                        //注册成功
                        if(root.bRegister == true){
                            paA_Backwards.running = true//播放登录面板移回动画
                            rect_Register.visible = true//没有账号按钮设为显示
                            col_input.visible = true    //账号密码输入框设为显示
                            text_warning.text = ""      //警告内容设置为空
                            root.bRegister = false      //重置注册结果
                            root.bLoginReadOnly = false //允许登录界面输入框输入
                        }else{

                        }
                    }
                }
            }

            //警告动画
            SequentialAnimation{
                id:paA_Warning_Forward
                property var mX: text_warning.x
                NumberAnimation{
                    target: text_warning
                    property: "opacity"
                    to:1
                    duration: 1
                }
                SpringAnimation{
                    target: text_warning
                    property: "x"
                    spring: 5
                    from: text_warning.x
                    to: text_warning.x + 5
                    damping: 0.08
                    epsilon: 0.25
                }
                NumberAnimation{
                    target: text_warning
                    property: "opacity"
                    to:0
                    duration: 100
                }
                NumberAnimation{
                    target: text_warning
                    property: "x"
                    to:paA_Warning_Forward.mX
                    duration: 1
                }
            }
        }

        //右半边
        Item {
            id: item_Right
            width: parent.width / 2
            height: parent.height
            anchors.right: parent.right

            //登录按钮
            Rectangle{
                id:rect_Login_Btn
                width: parent.width * 0.2
                height: parent.width * 0.2
                radius: width / 2
                color: "#5b5b5b"
                anchors{
                    horizontalCenter: parent.horizontalCenter
                    bottom: parent.bottom
                    bottomMargin: 20
                }

                Rectangle{
                    width: parent.width * 0.8
                    height: parent.height * 0.8
                    border.color: "#F2A880"
                    border.width: 3
                    color: "transparent"
                    anchors.centerIn: parent
                    radius: width / 2
                }
                Text {
                    id: text_Login
                    text: qsTr("GO")
                    anchors.centerIn: parent
                    color: "white"
                    font{
                        pixelSize: 20
                        bold:true
                    }
                }

                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        text_Login.color = "light green"
                    }
                    onExited: {
                        text_Login.color = "white"
                    }
                    onClicked: {//有bug，登录面板的警告文字不居中
                        //console.log("登录")
                        $PD.init()
                        if(root.mLoginIDText == "" || root.mLoginPwText == ""){
                            text_Login_Warning.text = "账号或密码不正确，请重新输入!"
                            paA_Login_Warning_Forward.running = true
                        }


                    }
                }
            }
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
            x:(rect_TopPanel.width - width) / 2
            y:(rect_TopPanel.height - height) / 2 - 100
            visible: false
        }
        Image{
            id:image_Logo
            anchors.centerIn: rect_Logo
            source: "Images/白老板.jpg"
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
                        anchors.leftMargin: 50
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        height: parent.height + 1
                        anchors.verticalCenter: parent.verticalCenter
                        selectionColor: "sky blue"
                        selectByMouse: true
                        readOnly: root.bLoginReadOnly
                        font{
                            pointSize: 12
                            bold: true
                        }
                        verticalAlignment: Text.AlignVCenter
                        //horizontalAlignment: Text.AlignHCenter
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
                        anchors.leftMargin: 50
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        height: parent.height + 1
                        anchors.verticalCenter: parent.verticalCenter
                        selectionColor: "sky blue"
                        selectByMouse: true
                        readOnly: root.bLoginReadOnly
                        font{
                            pointSize: 12
                            bold: true
                        }
                        verticalAlignment: Text.AlignVCenter
                        //horizontalAlignment: Text.AlignHCenter

                        echoMode:TextInput.Password
                        clip: true
                        focus: true
                        KeyNavigation.tab: txIn_ID
                    }
                }
            }
            //警告
            Text {
                id: text_Login_Warning
                text: qsTr("")
                opacity: 0
                font{
                    bold: true
                    pixelSize: 14
                }
                color: "red"
                x:(parent.width - width)/2 - 5
            }
        }

        //警告动画
        SequentialAnimation{
            id:paA_Login_Warning_Forward
            property var mX: text_Login_Warning.x
            NumberAnimation{
                target: text_Login_Warning
                property: "opacity"
                to:1
                duration: 1
            }
            SpringAnimation{
                target: text_Login_Warning
                property: "x"
                spring: 5
                from: text_Login_Warning.x
                to: text_Login_Warning.x + 5
                damping: 0.08
                epsilon: 0.25
            }
            NumberAnimation{
                target: text_Login_Warning
                property: "opacity"
                to:0
                duration: 100
            }
            NumberAnimation{
                target: text_Login_Warning
                property: "x"
                to:paA_Login_Warning_Forward.mX
                duration: 1
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
                    paA_Forward.running = true
                    rect_Register.visible = false
                    col_input.visible = false
                    //初始化注册栏中所有内容
                    initRegisterText()
                }
            }
        }

        //登录界面面板移动动画
        //登陆界面账号密码输入消失动画
        ParallelAnimation{
            id:paA_Forward
            NumberAnimation{
                target: rect_Logo
                property: "y"
                to:(rect_TopPanel.height - rect_Logo.height) / 2
                duration: 300
            }
            NumberAnimation{
                target: rect_TopPanel
                property: "x"
                to:rect_BottomPanel.width - rect_TopPanel.width
                duration: 500
                easing.type: Easing.OutCubic
            }
        }

        ParallelAnimation{
            id:paA_Backwards
            NumberAnimation{
                target: rect_Logo
                property: "y"
                to:(rect_TopPanel.height - rect_Logo.height) / 2 - 100
                duration: 300
            }
            NumberAnimation{
                target: rect_TopPanel
                property: "x"
                to:100
                duration: 500
                easing.type: Easing.OutCubic
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:600;width:800}
}
##^##*/
