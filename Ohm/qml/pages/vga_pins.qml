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
        ListElement {
            pin : "PIN 5"
            col : "GND"
            title: "Ground, Hsync"
        }
        ListElement {
            pin : "PIN 6"
            col : "RED_RTN"
            title: "Red return"
        }
        ListElement {
            pin : "PIN 7"
            col : "GREEN_RTN"
            title: "Green return"
        }
        ListElement {
            pin : "PIN 8"
            col : "BLUE_RTN"
            title: "Blue return"
        }
        ListElement {
            pin : "PIN 9"
            col : "KEY/PWR"
            title: "formerly Key, now +5V"
        }
        ListElement {
            pin : "PIN 10"
            col : "GND"
            title: "Ground, Vsync DDC"
        }
        ListElement {
            pin : "PIN 11"
            col : "ID0/RES"
            title: "formerly Monitor ID bit 0, reserved since E-DDC"
        }
        ListElement {
            pin : "PIN 12"
            col : "ID1/SDA"
            title: "formerly Monitor ID bit 1, I²C since DDC2"
        }
        ListElement {
            pin : "PIN 13"
            col : "HSYNC"
            title: "Horizontal sync"
        }
        ListElement {
            pin : "PIN 14"
            col : "VSYNC"
            title: "Vertical sync"
        }
        ListElement {
            pin : "PIN 15"
            col : "ID3/SCL"
            title: "formerly Monitor ID bit 3, I²C clock since DDC2"
        }
    }
    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height
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

            GlassItem {
                id: effect
                objectName: "menuitem"
                height: Theme.paddingLarge
                width: page.width
                color: Theme.highlightColor
                cache: false
            }
            VerticalScrollDecorator {}

            Repeater {
                id : list
                model : pagesModel

                ListItem {
                    id : listItem
                    anchors {
                        topMargin: Theme.paddingSmall / 2
                        bottomMargin: Theme.paddingSmall / 2
                    }
                    height : Theme.itemSizeSmall / 2
                    Label {
                        anchors {
                            left : parent.horizontalCenter
                            leftMargin: Theme.paddingLarge
                            rightMargin: Theme.paddingLarge
                            verticalCenter: parent.verticalCenter

                        }

                        text: model.title
                        font.pixelSize: Theme.fontSizeExtraSmall
                        color: Theme.primaryColor
                    }
                    Label {
                        id : co
                        anchors {
                            left : pin.right
                            leftMargin: Theme.paddingLarge*2
                            rightMargin: Theme.paddingLarge*2
                            verticalCenter: parent.verticalCenter
                        }

                        text: model.col
                        font.pixelSize: Theme.fontSizeExtraSmall
                        color: Theme.primaryColor
                    }
                    Label {
                        id : pin
                        anchors {
                            left : parent.left
                            leftMargin: Theme.paddingLarge
                            rightMargin: Theme.paddingLarge
                            verticalCenter: parent.verticalCenter
                        }

                        text: model.pin
                        font.pixelSize: Theme.fontSizeExtraSmall
                        color: Theme.primaryColor
                    }
                }


            }
            //        SilicaListView {
            //            id : list
            //            anchors.top : img2.bottom
            //            height : 200
            //            model : pagesModel
            //            anchors.fill: parent
            //            delegate: ListItem {
            //                id : listItem
            //                Label {
            //                    anchors {
            //                        left : co.right
            //                        leftMargin: Theme.paddingLarge
            //                        rightMargin: Theme.paddingLarge
            //                    }
            //                    x: Theme.paddingMedium
            //                    text: model.title
            //                    color: highlighted ? Theme.highlightColor : Theme.primaryColor
            //                }
            //                Label {
            //                    id : co
            //                    anchors {
            //                        left : pin.right
            //                        leftMargin: Theme.paddingLarge*2
            //                        rightMargin: Theme.paddingLarge*2
            //                    }
            //                    x: Theme.paddingMedium
            //                    text: model.col
            //                    color: highlighted ? Theme.highlightColor : Theme.primaryColor
            //                }
            //                Label {
            //                    id : pin
            //                    anchors {
            //                        left : parent.left
            //                        leftMargin: Theme.paddingLarge
            //                        rightMargin: Theme.paddingLarge
            //                    }
            //                    x: Theme.paddingMedium
            //                    text: model.pin
            //                    color: highlighted ? Theme.highlightColor : Theme.primaryColor
            //                }
            //            }

        }
    }
}


