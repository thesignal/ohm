import QtQuick 2.0
import Sailfish.Silica 1.0


Page {
    SilicaFlickable {
        anchors.fill: parent

        ListModel {
            id: pagesModel

            ListElement {
                page: "resistorcolor.qml"
                title: "Resistor Colorcode"
                section: "Codes"
                icon: "../img/resistor_big_4rings.png"
            }
            ListElement {
                page: "smdresistorcalc.qml"
                title: "SMD Resistor Code"
                section: "Codes"
                icon: "../img/smdresistor.png"
            }
            ListElement {
                page: "induction.qml"
                title: "Inductor Colorcodes"
                section: "Codes"
                icon: "../img/spiral.png"
            }
            ListElement {
                page: "capacitorcodes.qml"
                title: "Capacitor Codes"
                section: "Codes"
                icon: "../img/capacitor.png"
            }

            ListElement {
                page: "ohmslaw.qml"
                title: "Ohm's Law"
                section: "Equations"
                icon: "../img/ohmslaw.png"
            }
            ListElement {
                page: "coil.qml"
                title: "Coil inductance"
                section: "Equations"
                icon: "../img/coil.png"
            }
            ListElement {
                page: "lcresonator.qml"
                title: "LC Resonator"
                section: "Equations"
                icon: "../img/lcresonator.png"
            }

            ListElement {
                page: "usb_pins.qml"
                title: "USB"
                section: "Connector Pin Assignments"
                icon: "../img/usb_icon.png"
            }
            ListElement {
                page: "vga_pins.qml"
                title: "VGA"
                section: "Connector Pin Assignments"
                icon: "../img/vga_icon.png"
            }
            ListElement {
                page: "serial_pins.qml"
                title: "RS232"
                section: "Connector Pin Assignments"
                icon: "../img/seriell_icon.png"
            }

        }
    }

    SilicaListView {
        id: listView
        anchors.fill: parent
        model: pagesModel
        header: PageHeader {
            title: "Ohm"
        }
        section {
            property: "section"
            delegate: SectionHeader {
                text: section
            }
        }

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: "About"
                onClicked: pageStack.push(Qt.resolvedUrl("About.qml"))
            }
        }

        delegate: ListItem {
            id : listItem
            Label {
                anchors.verticalCenter: parent.verticalCenter
                x: Theme.paddingLarge
                text: model.title
                color: highlighted ? Theme.highlightColor : Theme.primaryColor
            }
            Image {
                anchors.right: parent.right
                anchors.rightMargin: Theme.paddingLarge
                anchors.verticalCenter: parent.verticalCenter
                fillMode: Image.PreserveAspectFit
                source: model.icon
                width: 64
                height: 64
            }

            onClicked: pageStack.push(Qt.resolvedUrl(model.page))
        }

        /*            delegate: BackgroundItem {
                width: listView.width
                Label {
                    id: firstName
                    text: model.title
                    color: highlighted ? Theme.highlightColor : Theme.primaryColor
                    anchors.verticalCenter: parent.verticalCenter
                    x: Theme.paddingLarge
                }
                onClicked: pageStack.push(Qt.resolvedUrl(page))
            }
            Image { source: model.icon }
*/

        VerticalScrollDecorator {}
    }

}

