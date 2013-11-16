import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    ListModel {
        id: pagesModel

        ListElement {
            pin : "PIN 1"
            col : "RED"
            title: "Red video"
        }
        ListElement {
            pin : "PIN 2"
            col : "GREEN"
            title: "Green video"
        }
        ListElement {
            pin : "PIN 3"
            col : "BLUE"
            title: "Blue video"
        }
        ListElement {
            pin : "PIN 4"
            col : "ID2/RES"
            title: "ID bit 2, reserved"
        }
    }

    Column {
        id : column
        anchors {
            fill: parent
            top: parent.top
        }

        width: parent.width
        height: parent.height
        PageHeader {
            title: "VGA pin assignments"
        }
        Item {
            id :sample
        }

        Image {
            id : img1
            anchors {
                horizontalCenter: parent.horizontalCenter
                topMargin: Theme.paddingSmall /4
                bottomMargin: Theme.paddingSmall / 4
            }
            fillMode: Image.PreserveAspectFit
            source: "../img/vga_male.png"
            width: 250
            height: 200
        }
        Image {
            id : img2
            anchors {
                horizontalCenter: parent.horizontalCenter
                topMargin: Theme.paddingSmall /4
                bottomMargin: Theme.paddingSmall / 4
            }
            fillMode: Image.PreserveAspectFit
            source: "../img/vga_female.png"
            width: 250
            height: 200
        }

        //        GlassItem {
        //            id: effect
        //            objectName: "menuitem"
        //            height: Theme.paddingLarge
        //            width: page.width
        //            color: Theme.highlightColor
        //            cache: false
        //        }
        SilicaListView {
            id : list
            anchors.top : img2.bottom
            height : 200
            ListView {
                model : pagesModel
                anchors.fill: parent
                delegate: ListItem {
                    id : listItem
                    Label {
                        anchors {
                            left : co.right
                            leftMargin: Theme.paddingLarge
                            rightMargin: Theme.paddingLarge
                        }
                        x: Theme.paddingMedium
                        text: model.title
                        color: highlighted ? Theme.highlightColor : Theme.primaryColor
                    }
                    Label {
                        id : co
                        anchors {
                            left : pin.right
                            leftMargin: Theme.paddingLarge*2
                            rightMargin: Theme.paddingLarge*2
                        }
                        x: Theme.paddingMedium
                        text: model.col
                        color: highlighted ? Theme.highlightColor : Theme.primaryColor
                    }
                    Label {
                        id : pin
                        anchors {
                            left : parent.left
                            leftMargin: Theme.paddingLarge
                            rightMargin: Theme.paddingLarge
                        }
                        x: Theme.paddingMedium
                        text: model.pin
                        color: highlighted ? Theme.highlightColor : Theme.primaryColor
                    }
                }
            }
        }
    }

}
