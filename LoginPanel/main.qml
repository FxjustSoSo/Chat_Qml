import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id:main_Window
    width: 800
    height: 600
    visible: true
    //title: qsTr("Hello World")
    color: "transparent"
    flags: Qt.Window | Qt.FramelessWindowHint


    LoginPanel{}
}
