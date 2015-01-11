import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    SilicaFlickable {
        anchors.fill: parent
        contentWidth: parent.width
        contentHeight: col.height

        VerticalScrollDecorator {}

        Column {
            id: col
            spacing: Theme.paddingLarge
            width: parent.width
            PageHeader {
                title: "About"
            }
            SectionHeader {
                text: "Authors"
            }

            Label {
                text: "Philipp Wagner"
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Label {
                text: "Thomas Kolb"
                anchors.horizontalCenter: parent.horizontalCenter
            }

            SectionHeader {
                text: "Artwork"
            }

            Label {
                text: "Florian Neumüller"
                anchors.horizontalCenter: parent.horizontalCenter
            }
            GlassItem {
                id: effect
                objectName: "menuitem"
                height: Theme.paddingLarge
                width: page.width
                color: Theme.highlightColor
                cache: false
            }
            Label {
                id: body
                text: 'For feedback, bugreports, feature requests or donations please use the email-address below.'
                font.pixelSize: Theme.fontSizeExtraSmall
                wrapMode: Text.WordWrap
                maximumLineCount: 3
                truncationMode: TruncationMode.Fade
                anchors {
                    left: parent.left
                    right: parent.right
                    leftMargin: Theme.paddingMedium
                    rightMargin: Theme.paddingMedium
                }
                // Qt.openUrlExternally("mailto:someusername@servicename.com?subject=email editor opened & body=sometext")
            }
            Label {
                text: "wagner.philipp@gmail.com"
                font.pixelSize: Theme.fontSizeExtraSmall
                color: Theme.highlightColor
                anchors.horizontalCenter: parent.horizontalCenter
                MouseArea {
                    id : buttonMouseArea
                    anchors.fill : parent
                    onClicked: Qt.openUrlExternally("mailto:wagner.philipp@gmail.com?subject=Phil, about your Ohm application...")
                }

            }
        }
    }
}
