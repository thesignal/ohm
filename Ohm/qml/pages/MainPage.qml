import QtQuick 2.0
import Sailfish.Silica 1.0

ApplicationWindow {
    initialPage:  Page {
        SilicaFlickable {
            anchors.fill: parent

            ListModel {
                id: pagesModel

                ListElement {
                    page: "resistorcolor.qml"
                    title: "Resistor Colorcode"
                    section: "Codes"
                    icon: "../img/resistor.png"
                }
                ListElement {
                    page: "smdresistorcalc.qml"
                    title: "SMD Resistor Code"
                    section: "Codes"
                    icon: "../img/smdresistor.png"
                }
                ListElement {
                    page: "resistorcolor.qml"
                    title: "Inductor Colorcodes"
                    section: "Codes"
                    icon: "../img/induct.png"
                }
                ListElement {
                    page: "capacitorcodes.qml"
                    title: "Capacitor Codes"
                    section: "Codes"
                    icon: "../img/capacitor.png"
                }
                ListElement {
                    page: "resistorcolor.qml"
                    title: "Ohms Law"
                    section: "Equations"
                    icon: "ress/resistor.png"
                }
                ListElement {
                    page: "resistorcolor.qml"
                    title: "USB"
                    section: "Connector Pin Assignments"
                    icon: "ress/resistor.png"
                }
                ListElement {
                    page: "resistorcolor.qml"
                    title: "VGA"
                    section: "Connector Pin Assignments"
                    icon: "ress/resistor.png"
                }
                ListElement {
                    page: "resistorcolor.qml"
                    title: "Serial Connector"
                    section: "Connector Pin Assignments"
                    icon: "ress/resistor.png"
                }

            }
        }

        SilicaListView {
            id: listView
            anchors.fill: parent
            model: pagesModel
            header: PageHeader {
                title: "Ohm"
//                Image {
//                    anchors.right: parent.right
//                    anchors.rightMargin: 150
//                    anchors.verticalCenter: parent.verticalCenter
//                    fillMode: Image.PreserveAspectFit
//                    source: "../img/logo_ohm.png"
//                    width: 64
//                    height: 64
//                }
            }
            section {
                property: 'section'
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
//                MenuItem {
//                    text: "Settings"
//                    onClicked: pageStack.push(Qt.resolvedUrl("Settings.qml"))
//                }

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

                onClicked: pageStack.push(Qt.resolvedUrl(page))
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
}
