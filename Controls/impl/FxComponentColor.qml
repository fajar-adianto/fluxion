import QtQuick
import Fluxion

QtObject {
    id: component_color
    property color content: FxStyle.tokens.sys.color.surfaceAccent
    property color border: component_color.content
    property color background: FxStyle.tokens.sys.color.surface
}
