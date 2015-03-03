import QtQuick 2.0
import Sailfish.Silica 1.0

import "lib/numbers.js" as Numbers

Page {
    id: page

    property int mode: 0;

    function calculate() {
        var u = voltage.text;
        var i = current.text;
        var r = resistance.text;

        voltage.color = Theme.primaryColor;
        current.color = Theme.primaryColor;
        resistance.color = Theme.primaryColor;

        if(u == "") {
            mode = 0;
        } else if(i == "") {
            mode = 1;
        } else if(r == "") {
            mode = 2;
        }

        switch(mode) {
        case 0:
            var fi = Numbers.parse(i);
            var fr = Numbers.parse(r);

            var fu = fi * fr;

            voltage.text = Numbers.format(fu);
            voltage.color = Theme.highlightColor;
            break;

        case 1:
            var fu = Numbers.parse(u);
            var fr = Numbers.parse(r);

            var fi = fu / fr;

            current.text = Numbers.format(fi);
            current.color = Theme.highlightColor;
            break;

        case 2:
            var fi = Numbers.parse(i);
            var fu = Numbers.parse(u);

            var fr = fu / fi;

            resistance.text = Numbers.format(fr);
            resistance.color = Theme.highlightColor;
            break;
        }
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height + Theme.paddingLarge

        VerticalScrollDecorator {}

        Column {
            id: column
            width: parent.width
            spacing: Theme.paddingLarge

            PageHeader { title: "Ohm's Law" }

            Image {
                id : img1
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    topMargin: Theme.paddingSmall/4
                    bottomMargin: Theme.paddingSmall/4
                }
                fillMode: Image.PreserveAspectFit
                source: "../img/ohmslaw.png"
                width: 190
                height: 95
            }

            TextField {
                id: voltage
                label: "Voltage (Volt)"
                width: parent.width
                placeholderText: "U/V"
                inputMethodHints: Qt.ImhPreferNumbers | Qt.ImhNoPredictiveText
                EnterKey.onClicked: calculate()
            }

            TextField {
                id: current
                label: "Current (Ampere)"
                width: parent.width
                placeholderText: "I/A"
                inputMethodHints: Qt.ImhPreferNumbers | Qt.ImhNoPredictiveText
                EnterKey.onClicked: calculate()
            }

            TextField {
                id: resistance
                label: "Resistance (Ohm)"
                width: parent.width
                placeholderText: "R/Ω"
                inputMethodHints: Qt.ImhPreferNumbers | Qt.ImhNoPredictiveText
                EnterKey.onClicked: calculate()
            }

            Button {
                text: "Calculate!"
                anchors.horizontalCenter: parent.horizontalCenter;
                onClicked: calculate();
            }

            Label {
                text: "Enter any two values and click the button to calculate the third. You can use SI prefixes like k, M, G, m, u, etc. by typing them as the last letter."
                wrapMode: Text.Wrap
                width: parent.width
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }
}
