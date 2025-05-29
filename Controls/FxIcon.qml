import QtQuick
import Fluxion

Item {
    id: root

    // Property declarations.

    required property string name

    property real diameter: 24
    property real padding: 0

    property alias backgroundOpacity: _background.opacity

    property bool filled: false
    property bool outlined: false

    property alias componentColor: component_color; FxComponentColor { id: component_color
        content: FxStyle.tokens.sys.color.surfaceAccent
        border: component_color.content
        background: FxStyle.tokens.sys.color.surface
    }

    QtObject {
        id: _
        property bool isBackgroundVisible: root.filled || root.outlined
    }

    // Object properties.

    width: root.diameter
    height: root.diameter

    FxIconFont {
        id: icon
        z: 1
        anchors.centerIn: parent

        color: root.componentColor.content
        fontSize: root.diameter - (root.padding * 2)
        name: root.name
    }

    Rectangle {
        id: _background
        visible: _.isBackgroundVisible
        z: 0
        anchors.fill: parent

        color: root.filled ? root.componentColor.background : "transparent"
        radius: root.diameter * 0.5
        border.width: root.outlined ? 1 : 0
        border.color: root.componentColor.border
        opacity: root.backgroundOpacity
    }
}
