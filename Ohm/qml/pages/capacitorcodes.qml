import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: textInputPage

    property int textAlignment: Text.AlignLeft
    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height + Theme.paddingLarge

        VerticalScrollDecorator {}
        Column {
            id: column
            width: parent.width
            spacing: Theme.paddingLarge
            PageHeader { title: "Capacitor Code" }
            Image {
                anchors {
                    horizontalCenter: parent.horizontalCenter
                }

                fillMode: Image.PreserveAspectFit
                source: "../img/capacitor.png"
                width: 128
                height: 128
            }
            Label {
                text : "Value"
                color: Theme.secondaryColor
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Label {
                text : "150 F"
                anchors.horizontalCenter: parent.horizontalCenter
            }


            TextField {
                width: parent.width
                focus: true
                inputMethodHints: Qt.ImhFormattedNumbersOnly
                label: "Capacitor Code"
                placeholderText: "Type Code here"
                horizontalAlignment: textAlignment
                EnterKey.onClicked: parent.focus = false
            }
        }
    }
}
