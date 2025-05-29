import QtQuick.Templates as T
import Fluxion

T.Label {
    id: root

    // Property declarations.

    required property FxTypeScaleToken typeScaleToken

    // Object properties.

    font: typeScaleToken.font

    onTypeScaleTokenChanged: { font = typeScaleToken.font; }
}
