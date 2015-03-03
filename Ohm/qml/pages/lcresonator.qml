import QtQuick 2.0
import Sailfish.Silica 1.0

import "lib/numbers.js" as Numbers

Page {
    id: page

    property int mode: 0;

    function calculate() {
        var l = inductance.text;
        var c = capacity.text;
        var f = frequency.text;

        inductance.color = Theme.primaryColor;
        capacity.color = Theme.primaryColor;
        frequency.color = Theme.primaryColor;

        if(l == "") {
            mode = 0;
        } else if(c == "") {
            mode = 1;
        } else if(f == "") {
            mode = 2;
        }

        switch(mode) {
        case 0:
            var ff = Numbers.parse(f);
            var fc = Numbers.parse(c);

            var fl = 1 / (fc * Math.pow(ff * 2 * Math.PI, 2));

            inductance.text = Numbers.format(fl);
            inductance.color = Theme.highlightColor;
            break;

        case 1:
            var fl = Numbers.parse(l);
            var ff = Numbers.parse(f);

            var fc = 1 / (fl * Math.pow(ff * 2 * Math.PI, 2));

            capacity.text = Numbers.format(fc);
            capacity.color = Theme.highlightColor;
            break;

        case 2:
            var fl = Numbers.parse(l);
            var fc = Numbers.parse(c);

            var ff = 1 / (2 * Math.PI * Math.sqrt(fl*fc));

            frequency.text = Numbers.format(ff);
            frequency.color = Theme.highlightColor;
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

            PageHeader { title: "LC Resonator" }

            Image {
                id : img1
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    topMargin: Theme.paddingSmall/4
                    bottomMargin: Theme.paddingSmall/4
                }
                fillMode: Image.PreserveAspectFit
                source: "../img/lcresonator.png"
                width: 220
                height: 130
            }

            TextField {
                id: inductance
                label: "Inductance (Henry)"
                width: parent.width
                placeholderText: "L/H"
                inputMethodHints: Qt.ImhPreferNumbers | Qt.ImhNoPredictiveText
                EnterKey.onClicked: calculate()
            }

            TextField {
                id: capacity
                label: "Capacity (Farad)"
                width: parent.width
                placeholderText: "C/F"
                inputMethodHints: Qt.ImhPreferNumbers | Qt.ImhNoPredictiveText
                EnterKey.onClicked: calculate()
            }

            TextField {
                id: frequency
                label: "Frequency (Hertz)"
                width: parent.width
                placeholderText: "f/Hz"
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
