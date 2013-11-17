import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    ListModel {
        id: pagesModel

        ListElement {
            pin : "PIN 1"
            col : "RED"
            title: "Signal Ground"
            description : "Signal Ground"
        }
        ListElement {
            pin : "PIN 2"
            col : "GREEN"
            title: "Data Terminal Ready"
            description: "Data Terminal Ready"
        }
        ListElement {
            pin : "PIN 3"
            col : "BLUE"
            title: "Transmitted Data"
            description: "Transmitted Data"
        }
        ListElement {
            pin : "PIN 4"
            col : "ID2/RES"
            title: "Received Data"
            description : "Received Data"
        }
        ListElement {
            pin : "PIN 5"
            col : "GND"
            title: "Data Carrier Connect"
            description : "Data Carrier Connect"
        }
        ListElement {
            pin : "PIN 6"
            col : "RED_RTN"
            title: "Data Set Ready"
            description : "Data Set Ready"
        }
        ListElement {
            pin : "PIN 7"
            col : "GREEN_RTN"
            title: "Request to Send"
            description: "Request to Send"
        }
        ListElement {
            pin : "PIN 8"
            col : "BLUE_RTN"
            title: "Clear To Send"
            description: "Clear To Send"
        }
        ListElement {
            pin : "PIN 9"
            col : "KEY/PWR"
            title: "Ring Indicator"
            description: "Ring Indicator"
        }
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height + pagehead.height + list.height
        PageHeader {
            id : pagehead
            title: "RS232 pin assignments"
        }

        Column {
            id : column
            anchors {
                top : pagehead.bottom
            }

            Image {
                id : img1
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    topMargin: Theme.paddingSmall /4
                    bottomMargin: Theme.paddingSmall / 4
                }
                fillMode: Image.PreserveAspectFit
                source: "../img/serial.png"
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
                anchors.bottomMargin: Theme.paddingLarge

                ComboBox {
                    id : combx
                    height : Theme.itemSizeSmall / 1.5
                    width : parent.width
                    currentIndex: -1
                    menu: ContextMenu {
                        MenuItem {
                            text : pagesModel.get(index).description
                            font.pixelSize: Theme.fontSizeExtraSmall / 1.5
                            color : Theme.primaryColor
                            onClicked: combx.currentIndex = -1
                        }
                    }
                    Label {
                        anchors {
                            left : parent.horizontalCenter
                            leftMargin: Theme.paddingLarge
                            rightMargin: Theme.paddingLarge
                            verticalCenter: parent.verticalCenter
                        }
                        height: Theme.itemSizeSmall / 1.5
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
                        height: Theme.itemSizeSmall / 1.5
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
                        height: Theme.itemSizeSmall / 1.5
                        text: model.pin
                        font.pixelSize: Theme.fontSizeExtraSmall
                        color: Theme.primaryColor
                    }

                }

            }
        }
    }
}
