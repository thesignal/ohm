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
            var fi = parseNumber(i);
            var fr = parseNumber(r);

            var fu = fi * fr;

            voltage.text = formatNumber(fu);
            voltage.color = Theme.highlightColor;
            break;

        case 1:
            var fu = parseNumber(u);
            var fr = parseNumber(r);

            var fi = fu / fr;

            current.text = formatNumber(fi);
            current.color = Theme.highlightColor;
            break;

        case 2:
            var fi = parseNumber(i);
            var fu = parseNumber(u);

            var fr = fu / fi;

            resistance.text = formatNumber(fr);
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
                inputMethodHints: Qt.ImhPreferNumbers
            }

            TextField {
                id: current
                label: "Current (Ampere)"
                width: parent.width
                placeholderText: "I/A"
                inputMethodHints: Qt.ImhPreferNumbers
            }

            TextField {
                id: resistance
                label: "Resistance (Ohm)"
                width: parent.width
                placeholderText: "R/Ω"
                inputMethodHints: Qt.ImhPreferNumbers
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
