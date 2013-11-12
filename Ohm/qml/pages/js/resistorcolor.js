var Component;
function createRows(rows,id) {
    Component = Qt.createComponent("ColorRowsResistor.qml")
    var i = 0;
    for (i = 0; i < rows; i++) {
        var tElement = Qt.createQmlObject('GlassItem {'
                                          + 'color: "red";'
                                          + 'falloffRadius: Math.exp(fpixw.value);'
                                          + 'radius: Math.exp(pixw.value);'
                                          + 'cache: false;'
                                          + 'dimmed: true;'
                                          + '}',id)
        id.add(tElement);
    }
}
