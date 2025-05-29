pragma ComponentBehavior: Bound
import QtQuick
import Fluxion

Item {
    id: root

    property alias color: shape.color
    property int elevation: FxStyle.tokens.sys.elevation.level0
    property int elevationChangeDuration: FxStyle.tokens.sys.motion.duration.short4
    property int roundingChangeDuration: FxStyle.tokens.sys.motion.duration.short4
    property FxShapeToken shapeToken: FxStyle.tokens.sys.shape.corner.noRounding

    property color borderColor: "transparent"
    property int borderWidth: 0

    QtObject {
        id: _
        property bool activeElevation: false
        property bool isFullCorners: (root.shapeToken.role === FxShapeToken.Role.Full)
        property real fullCornerRadius: Math.abs(Math.min(root.height, root.width) * FxStyle.tokens.sys.shape.corner.full.value)

        property real topLeftRadius: isFullCorners ? fullCornerRadius : root.shapeToken.corners.topLeft
        property real topRightRadius: isFullCorners ? fullCornerRadius : root.shapeToken.corners.topRight
        property real bottomRightRadius: isFullCorners ? fullCornerRadius : root.shapeToken.corners.bottomRight
        property real bottomLeftRadius: isFullCorners ? fullCornerRadius : root.shapeToken.corners.bottomLeft

        property real topEffectiveRadius: Math.max(topLeftRadius, topRightRadius)
        property real bottomEffectiveRadius: Math.max(bottomLeftRadius, bottomRightRadius)
        property real leftEffectiveRadius: Math.max(topLeftRadius, bottomLeftRadius)
        property real rightEffectiveRadius: Math.max(topRightRadius, bottomRightRadius)

        Behavior on topLeftRadius { SmoothedAnimation { velocity: -1; duration: root.roundingChangeDuration; easing.type: FxStyle.tokens.sys.motion.easing.emphasized } }
        Behavior on topRightRadius { SmoothedAnimation { velocity: -1; duration: root.roundingChangeDuration; easing.type: FxStyle.tokens.sys.motion.easing.emphasized } }
        Behavior on bottomRightRadius { SmoothedAnimation { velocity: -1; duration: root.roundingChangeDuration; easing.type: FxStyle.tokens.sys.motion.easing.emphasized } }
        Behavior on bottomLeftRadius { SmoothedAnimation { velocity: -1; duration: root.roundingChangeDuration; easing.type: FxStyle.tokens.sys.motion.easing.emphasized } }
    }

    // Event handlers.

    onElevationChanged: {
        if (!_.activeElevation && (elevation > 0))
            _.activeElevation = true;
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

        layer.enabled: root.enabled && _.activeElevation
        layer.samples: 8
        layer.effect: FxRoundedElevationEffect {
            shapeToken: root.shapeToken
            elevation: root.elevation
            animationDuration: root.elevationChangeDuration
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

        layer.enabled: root.enabled && _.activeElevation
        layer.samples: 8
        layer.effect: FxRoundedElevationEffect {
            shapeToken: root.shapeToken
            elevation: root.elevation
            animationDuration: root.elevationChangeDuration
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

        layer.enabled: root.enabled && _.activeElevation
        layer.samples: 8
        layer.effect: FxRoundedElevationEffect {
            shapeToken: root.shapeToken
            elevation: root.elevation
            animationDuration: root.elevationChangeDuration
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

        layer.enabled: root.enabled && _.activeElevation
        layer.samples: 8
        layer.effect: FxRoundedElevationEffect {
            shapeToken: root.shapeToken
            elevation: root.elevation
            animationDuration: root.elevationChangeDuration
        }
    }

    Rectangle {
        id: shape

        property bool fullCorner: root.shapeToken === FxStyle.tokens.sys.shape.corner.full

        z: 0
        anchors.fill: parent

        color: FxStyle.tokens.sys.color.surface
        border.color: root.borderColor
        border.width: root.borderWidth

        radius: height/2
        topLeftRadius: fullCorner ? undefined : _.topLeftRadius
        topRightRadius: fullCorner ? undefined : _.topRightRadius
        bottomRightRadius: fullCorner ? undefined : _.bottomRightRadius
        bottomLeftRadius: fullCorner ? undefined : _.bottomLeftRadius
    }
}
