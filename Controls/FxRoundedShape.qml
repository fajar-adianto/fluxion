pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Shapes
import Fluxion

Item {
    id: root

    // Property declarations.

    property alias componentColor: component_color; FxComponentColor { id: component_color
        content: FxStyle.tokens.sys.color.primary
        border: FxStyle.tokens.sys.color.surfaceAccent
        background: FxStyle.tokens.sys.color.surface
    }

    property alias borderWidth: shape_path.strokeWidth

    property int elevation: 0
    property int animationDuration: FxStyle.tokens.sys.motion.duration.short4
    property FxShapeToken shapeToken: FxStyle.tokens.sys.shape.corner.noRounding

    QtObject {
        id: _

        property real fullCornerRadius: root.height * FxStyle.tokens.sys.shape.corner.full.value

        property bool isFullCorners: (root.shapeToken.role === FxShapeToken.Role.Full)
        property real topLeftRadius: isFullCorners ? fullCornerRadius : Math.min(root.shapeToken.corners.topLeft, fullCornerRadius)
        property real topRightRadius: isFullCorners ? fullCornerRadius : Math.min(root.shapeToken.corners.topRight, fullCornerRadius)
        property real bottomRightRadius: isFullCorners ? fullCornerRadius : Math.min(root.shapeToken.corners.bottomRight, fullCornerRadius)
        property real bottomLeftRadius: isFullCorners ? fullCornerRadius : Math.min(root.shapeToken.corners.bottomLeft, fullCornerRadius)

        property real topEffectiveRadius: Math.max(topLeftRadius, topRightRadius)
        property real bottomEffectiveRadius: Math.max(bottomLeftRadius, bottomRightRadius)
        property real leftEffectiveRadius: Math.max(topLeftRadius, bottomLeftRadius)
        property real rightEffectiveRadius: Math.max(topRightRadius, bottomRightRadius)

        property bool elevationActivated

        Behavior on topLeftRadius { SmoothedAnimation { velocity: -1; duration: root.animationDuration; easing.type: FxStyle.tokens.sys.motion.easing.emphasized } }
        Behavior on topRightRadius { SmoothedAnimation { velocity: -1; duration: root.animationDuration; easing.type: FxStyle.tokens.sys.motion.easing.emphasized } }
        Behavior on bottomRightRadius { SmoothedAnimation { velocity: -1; duration: root.animationDuration; easing.type: FxStyle.tokens.sys.motion.easing.emphasized } }
        Behavior on bottomLeftRadius { SmoothedAnimation { velocity: -1; duration: root.animationDuration; easing.type: FxStyle.tokens.sys.motion.easing.emphasized } }
    }

    // Event handlers.

    onElevationChanged: {
        if (!_.elevationActivated && (elevation > 0))
            _.elevationActivated = true;
    }

    // Child objects.

    Rectangle {
        id: top_left_elevation

        color: "transparent"
        radius: _.topLeftRadius

        z: -1
        width: parent.width - ((radius < _.rightEffectiveRadius) ? _.rightEffectiveRadius : 0)
        height: parent.height - ((radius < _.bottomEffectiveRadius) ? _.bottomEffectiveRadius : 0)
        anchors { left: parent.left; top: parent.top }

        layer.enabled: root.enabled && _.elevationActivated
        layer.effect: FxRoundedElevationEffect {
            shapeToken: root.shapeToken
            elevation: root.elevation
            animationDuration: root.animationDuration
            opacity: _.isFullCorners ? 0.5 : 1
        }
    }

    Rectangle {
        id: top_right_elevation

        color: "transparent"
        radius: _.topRightRadius

        z: -1
        width: parent.width - ((radius < _.leftEffectiveRadius) ? _.leftEffectiveRadius : 0)
        height: parent.height - ((radius < _.bottomEffectiveRadius) ? _.bottomEffectiveRadius : 0)
        anchors { right: parent.right; top: parent.top }

        layer.enabled: root.enabled && _.elevationActivated
        layer.effect: FxRoundedElevationEffect {
            shapeToken: root.shapeToken
            elevation: root.elevation
            animationDuration: root.animationDuration
            opacity: _.isFullCorners ? 0.5 : 1
        }
    }

    Rectangle {
        id: bottom_right_elevation

        color: "transparent"
        radius: _.bottomRightRadius

        z: -1
        width: parent.width - ((radius < _.leftEffectiveRadius) ? _.leftEffectiveRadius : 0)
        height: parent.height - ((radius < _.topEffectiveRadius) ? _.topEffectiveRadius : 0)
        anchors { right: parent.right; bottom: parent.bottom }

        layer.enabled: root.enabled && _.elevationActivated
        layer.effect: FxRoundedElevationEffect {
            shapeToken: root.shapeToken
            elevation: root.elevation
            animationDuration: root.animationDuration
            opacity: _.isFullCorners ? 0.5 : 1
        }
    }

    Rectangle {
        id: bottom_left_elevation

        color: "transparent"
        radius: _.bottomLeftRadius

        z: -1
        width: parent.width - ((radius < _.rightEffectiveRadius) ? _.rightEffectiveRadius : 0)
        height: parent.height - ((radius < _.topEffectiveRadius) ? _.topEffectiveRadius : 0)
        anchors { left: parent.left; bottom: parent.bottom }

        layer.enabled: root.enabled && _.elevationActivated
        layer.effect: FxRoundedElevationEffect {
            shapeToken: root.shapeToken
            elevation: root.elevation
            animationDuration: root.animationDuration
            opacity: _.isFullCorners ? 0.5 : 1
        }
    }

    Shape {
        id: shape

        z: 0
        anchors.fill: parent

        ShapePath {
            id: shape_path
            fillColor: root.componentColor.background
            strokeColor: root.componentColor.border
            strokeWidth: -1

            startX: 0; startY: _.topLeftRadius
            PathArc { x: _.topLeftRadius; y: 0; radiusX: _.topLeftRadius; radiusY: _.topLeftRadius }
            PathLine { x: (shape.width - _.topRightRadius); y: 0 }
            PathArc { x: shape.width; y: _.topRightRadius; radiusX: _.topRightRadius; radiusY: _.topRightRadius }
            PathLine { x: shape.width; y: (shape.height - _.bottomRightRadius) }
            PathArc { x: (shape.width - _.bottomRightRadius); y: shape.height; radiusX: _.bottomRightRadius; radiusY: _.bottomRightRadius }
            PathLine { x: _.bottomLeftRadius; y: shape.height }
            PathArc { x: 0; y: (shape.height - _.bottomLeftRadius); radiusX: _.bottomLeftRadius; radiusY: _.bottomLeftRadius }
            PathLine { x: shape_path.startX; y: shape_path.startY }
        }
    }
}
