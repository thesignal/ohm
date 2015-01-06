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
        var d = diameter.text;
        var h = length.text;
        var n = windings.text;
        var l = inductance.text;

        diameter.color = Theme.primaryColor;
        length.color = Theme.primaryColor;
        windings.color = Theme.primaryColor;
        inductance.color = Theme.primaryColor;

        if(d == "") {
            mode = 0;
        } else if(h == "") {
            mode = 1;
        } else if(n == "") {
            mode = 2;
        } else if(l == "") {
            mode = 3;
        }

        // base formulae
        // L = μ_0 * N^2 * A / h;
        // A = π/4 * d^2

        var u0 = 4 * Math.PI * 1e-7;

        switch(mode) {
        case 0: // calculate d
            var fn = parseNumber(n);
            var fh = parseNumber(h);
            var fl = parseNumber(l);

            var A = fl * fh / (u0 * Math.pow(fn, 2));
            var fd = Math.sqrt(A / (Math.PI/4));

            diameter.text = formatNumber(fd);
            diameter.color = Theme.highlightColor;
            break;

        case 1: // calculate h
            var fn = parseNumber(n);
            var fl = parseNumber(l);
            var fd = parseNumber(d);

            var A = Math.PI/4 * Math.pow(fd, 2);
            var fh = u0 * Math.pow(fn, 2) * A / fl;

            length.text = formatNumber(fh);
            length.color = Theme.highlightColor;
            break;

        case 2: // calculate n
            var fl = parseNumber(l);
            var fd = parseNumber(d);
            var fh = parseNumber(h);

            var A = Math.PI/4 * Math.pow(fd, 2);
            var fn = Math.sqrt(fl * fh / (u0 * A));

            windings.text = formatNumber(fn);
            windings.color = Theme.highlightColor;
            break;

        case 3: // calculate l
            var fd = parseNumber(d);
            var fn = parseNumber(n);
            var fh = parseNumber(h);

            var A = Math.PI/4 * Math.pow(fd, 2);
            var fl = u0 * Math.pow(fn, 2) * A / fh;

            inductance.text = formatNumber(fl);
            inductance.color = Theme.highlightColor;
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

            PageHeader { title: "Air-Core Coil" }

            Image {
                id : img1
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    topMargin: Theme.paddingSmall/4
                    bottomMargin: Theme.paddingSmall/4
                }
                fillMode: Image.PreserveAspectFit
                source: "../img/coil.png"
                width: 225
                height: 145
            }

            TextField {
                id: diameter
                label: "Medium diameter (meter)"
                width: parent.width
                placeholderText: "d/m"
                inputMethodHints: Qt.ImhPreferNumbers
            }

            TextField {
                id: length
                label: "Length (meter)"
                width: parent.width
                placeholderText: "l/m"
                inputMethodHints: Qt.ImhPreferNumbers
            }

            TextField {
                id: windings
                label: "Number of windings"
                width: parent.width
                placeholderText: "N"
                inputMethodHints: Qt.ImhPreferNumbers
            }

            TextField {
                id: inductance
                label: "Inductance"
                width: parent.width
                placeholderText: "L/H"
                inputMethodHints: Qt.ImhPreferNumbers
            }

            Button {
                text: "Calculate!"
                anchors.horizontalCenter: parent.horizontalCenter;
                onClicked: calculate();
            }

            Label {
                text: "Enter any three values and click the button to calculate the fourth. You can use SI prefixes like k, M, G, m, u, etc. by typing them as the last letter."
                wrapMode: Text.Wrap
                width: parent.width
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }
}
