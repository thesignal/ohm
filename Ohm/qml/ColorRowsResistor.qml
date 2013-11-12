import QtQuick 2.0

Column {
    id: columnview
    height: Theme.itemSizeMedium
    anchors.horizontalCenter: parent.horizontalCenter
    GlassItem {
        color: "red"
        falloffRadius: Math.exp(fpixw.value)
        radius: Math.exp(pixw.value)
        cache: false
        dimmed: true
    }
    GlassItem {
        color: "green"
        falloffRadius: Math.exp(fpixw.value)
        radius: Math.exp(pixw.value)
        cache: false
    }
    GlassItem {
        color: "blue"
        falloffRadius: Math.exp(fpixw.value)
        radius: Math.exp(pixw.value)
        cache: false
    }
    GlassItem {
        color: "white"
        falloffRadius: Math.exp(fpixw.value)
        radius: Math.exp(pixw.value)
        cache: false
    }
    GlassItem {
        color: Theme.highlightColor
        falloffRadius: Math.exp(fpixw.value)
        radius: Math.exp(pixw.value)
        cache: false
    }
}
