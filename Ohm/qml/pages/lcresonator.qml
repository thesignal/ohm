import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    property int mode: 0;

    function parseNumber(str) {
        var n = parseFloat(str);
        var factor = 1;

        switch(str[str.length-1]) {
            // positive prefixes
            case 'k': factor = 1e3;  break;
            case 'M': factor = 1e6;  break;
            case 'G': factor = 1e9;  break;
            case 'T': factor = 1e12; break;
            case 'P': factor = 1e15; break;
            case 'E': factor = 1e18; break;
            case 'Z': factor = 1e21; break;
            case 'Y': factor = 1e24; break;

            // negative prefixes
            case 'm': factor = 1e-3;  break;
            case 'u': factor = 1e-6;  break;
            case 'n': factor = 1e-9;  break;
            case 'p': factor = 1e-12; break;
            case 'f': factor = 1e-15; break;
            case 'a': factor = 1e-18; break;
            case 'z': factor = 1e-21; break;
            case 'y': factor = 1e-24; break;
        }

        return n * factor;
    }

    function formatNumber(f) {
        var n = 0;
        var prePos = "kMGTPEZY";
        var preNeg = "munpfazy";

        var prefix = "";

        if(Math.abs(f) > 1) {
            while(Math.abs(f) > 1000) {
                f /= 1000;
                n++;
            }

            if(n != 0) {
                prefix = prePos[n-1];
            }
        } else {
            while(Math.abs(f) < 0.001) {
                f *= 1000;
                n++;
            }

            if(n != 0) {
                prefix = preNeg[n-1];
            }
        }

        return f.toFixed(3) + prefix;
    }

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
            var ff = parseNumber(f);
            var fc = parseNumber(c);

            var fl = 1 / (fc * Math.pow(ff * 2 * Math.PI, 2));

            inductance.text = formatNumber(fl);
            inductance.color = Theme.highlightColor;
            break;

        case 1:
            var fl = parseNumber(l);
            var ff = parseNumber(f);

            var fc = 1 / (fl * Math.pow(ff * 2 * Math.PI, 2));

            capacity.text = formatNumber(fc);
            capacity.color = Theme.highlightColor;
            break;

        case 2:
            var fl = parseNumber(l);
            var fc = parseNumber(c);

            var ff = 1 / (2 * Math.PI * Math.sqrt(fl*fc));

            frequency.text = formatNumber(ff);
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
                inputMethodHints: Qt.ImhPreferNumbers
            }

            TextField {
                id: capacity
                label: "Capacity (Farad)"
                width: parent.width
                placeholderText: "C/F"
                inputMethodHints: Qt.ImhPreferNumbers
            }

            TextField {
                id: frequency
                label: "Frequency (Hertz)"
                width: parent.width
                placeholderText: "f/Hz"
                inputMethodHints: Qt.ImhPreferNumbers
                labelVisible: true
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
