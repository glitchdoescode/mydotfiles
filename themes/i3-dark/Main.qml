import QtQuick 2.0
import SddmComponents 2.0

Rectangle {
    width: 1920
    height: 1080
    
    LayoutMirroring.enabled: Qt.locale().textDirection == Qt.RightToLeft
    LayoutMirroring.childrenInherit: true

    property int sessionIndex: session.index

    TextConstants { id: textConstants }

    // Background
    Rectangle {
        anchors.fill: parent
        color: "#2f343f"
        
        Image {
            id: background
            anchors.fill: parent
            source: "background.jpg"
            fillMode: Image.PreserveAspectCrop
            visible: false
        }
    }

    Rectangle {
        anchors.fill: parent
        color: "#AA2f343f"
        
        Column {
            anchors.centerIn: parent
            spacing: 20
            
            // Login form
            Rectangle {
                width: 400
                height: 300
                color: "#3b4252"
                radius: 10
                border.color: "#81a1c1"
                border.width: 2
                
                Column {
                    anchors.centerIn: parent
                    spacing: 20
                    
                    Text {
                        text: "Welcome"
                        font.family: "Hack Nerd Font"
                        font.pointSize: 24
                        color: "#eceff4"
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    
                    Rectangle {
                        width: 300
                        height: 40
                        color: "#2f343f"
                        radius: 5
                        border.color: "#81a1c1"
                        border.width: 1
                        
                        TextInput {
                            id: name
                            height: parent.height
                            width: parent.width - 10
                            anchors.centerIn: parent
                            text: userModel.lastUser
                            font.family: "Hack Nerd Font"
                            font.pointSize: 12
                            color: "#eceff4"
                            clip: true
                            focus: true
                            
                            Text {
                                id: usernameText
                                text: textConstants.userName
                                font.family: "Hack Nerd Font" 
                                font.pointSize: 10
                                color: "#81a1c1"
                                anchors.left: parent.left
                                anchors.top: parent.top
                                anchors.leftMargin: 8
                                anchors.topMargin: -15
                                visible: name.text == ""
                            }
                        }
                    }
                    
                    Rectangle {
                        width: 300
                        height: 40
                        color: "#2f343f"
                        radius: 5
                        border.color: "#81a1c1"
                        border.width: 1
                        
                        TextInput {
                            id: password
                            height: parent.height
                            width: parent.width - 10
                            anchors.centerIn: parent
                            font.family: "Hack Nerd Font"
                            font.pointSize: 12
                            color: "#eceff4"
                            echoMode: TextInput.Password
                            clip: true
                            
                            Text {
                                id: passwordText
                                text: textConstants.password
                                font.family: "Hack Nerd Font"
                                font.pointSize: 10
                                color: "#81a1c1"
                                anchors.left: parent.left
                                anchors.top: parent.top
                                anchors.leftMargin: 8
                                anchors.topMargin: -15
                                visible: password.text == ""
                            }
                            
                            Keys.onPressed: {
                                if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                                    sddm.login(name.text, password.text, sessionIndex)
                                    event.accepted = true
                                }
                            }
                        }
                    }
                    
                    Rectangle {
                        width: 120
                        height: 35
                        color: "#81a1c1"
                        radius: 5
                        anchors.horizontalCenter: parent.horizontalCenter
                        
                        Text {
                            text: textConstants.login
                            font.family: "Hack Nerd Font"
                            font.pointSize: 12
                            color: "#2f343f"
                            anchors.centerIn: parent
                        }
                        
                        MouseArea {
                            anchors.fill: parent
                            onClicked: sddm.login(name.text, password.text, sessionIndex)
                        }
                    }
                }
            }
        }
        
        // Session selection
        ComboBox {
            id: session
            width: 200
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.margins: 20
            
            arrowIcon: "angle-down.png"
            model: sessionModel
            index: sessionModel.lastIndex
            
            font.family: "Hack Nerd Font"
            font.pointSize: 10
            color: "#eceff4"
        }
        
        // Power buttons
        Row {
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.margins: 20
            spacing: 10
            
            Rectangle {
                width: 40
                height: 40
                color: "#bf616a"
                radius: 20
                
                Text {
                    text: "⏻"
                    font.pointSize: 16
                    color: "#eceff4"
                    anchors.centerIn: parent
                }
                
                MouseArea {
                    anchors.fill: parent
                    onClicked: sddm.powerOff()
                }
            }
            
            Rectangle {
                width: 40
                height: 40
                color: "#d08770"
                radius: 20
                
                Text {
                    text: "↻"
                    font.pointSize: 16
                    color: "#eceff4"
                    anchors.centerIn: parent
                }
                
                MouseArea {
                    anchors.fill: parent
                    onClicked: sddm.reboot()
                }
            }
        }
    }
    
    Connections {
        target: sddm
        onLoginFailed: {
            password.text = ""
            password.focus = true
        }
    }
    
    Component.onCompleted: {
        if (name.text == "")
            name.focus = true
        else
            password.focus = true
    }
}
