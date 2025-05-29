import QtQml

QtObject {
    id: root

    enum ShapeRole {
        None,
        ExtraSmall,
        Small,
        Medium,
        Large,
        ExtraLarge,
        Full
    }

    enum DirectionalModifier {
        None,
        Top,
        Bottom,
        Start,
        End
    }

    property int directionalModifier: FxShapeToken.DirectionalModifier.None
    property int role: FxShapeToken.ShapeRole.None
    property real value: 0
    property var corners: {
        'topLeft': (directionalModifier == FxShapeToken.DirectionalModifier.Bottom || directionalModifier == FxShapeToken.DirectionalModifier.End) ? 0 : value,
        'topRight': (directionalModifier == FxShapeToken.DirectionalModifier.Bottom || directionalModifier == FxShapeToken.DirectionalModifier.Start) ? 0 : value,
        'bottomRight': (directionalModifier == FxShapeToken.DirectionalModifier.Top || directionalModifier == FxShapeToken.DirectionalModifier.Start) ? 0 : value,
        'bottomLeft': (directionalModifier == FxShapeToken.DirectionalModifier.Top || directionalModifier == FxShapeToken.DirectionalModifier.End) ? 0 : value
    }

    // readonly property QtObject corners: QtObject {
    //     readonly property real topLeft:
    //         (directionalModifier == FxShapeToken.DirectionalModifier.Bottom || directionalModifier == FxShapeToken.DirectionalModifier.End) ? 0 : value

    //     readonly property real topRight:
    //         (directionalModifier == FxShapeToken.DirectionalModifier.Bottom || directionalModifier == FxShapeToken.DirectionalModifier.Start) ? 0 : value

    //     readonly property real bottomRight:
    //         (directionalModifier == FxShapeToken.DirectionalModifier.Top || directionalModifier == FxShapeToken.DirectionalModifier.Start) ? 0 : value

    //     readonly property real bottomLeft:
    //         (directionalModifier == FxShapeToken.DirectionalModifier.Top || directionalModifier == FxShapeToken.DirectionalModifier.End) ? 0 : value
    // }
}
