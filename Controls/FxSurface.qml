pragma ComponentBehavior: Bound
import QtQuick
import Fluxion

Item {
    id: root

    property alias color: shape.color
    property int elevation: FxStyle.tokens.sys.elevation.level0
    property FxMotionSpringToken elevationSpringToken: FxStyle.tokens.sys.motion.spring.fast.effects
    property FxMotionSpringToken roundingSpringToken: FxStyle.tokens.sys.motion.spring.fast.spatial
    property FxShapeToken shapeToken: FxStyle.tokens.sys.shape.corner.noRounding

    property color borderColor: "transparent"
    property int borderWidth: 0

    QtObject {
        id: _
        // Internal elevation value as float-type.
        //      Workaround to prevent <layer> of elevation components to be abruptly disabled when elevation is set to 0.
        property real elevation: root.elevation
        FxSpringBehavior on elevation { id: elevation_effect; springToken: root.elevationSpringToken }

        property bool activeElevation: _.elevation > 0 || !elevation_effect.steady
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

        FxSpringBehavior on topLeftRadius { springToken: root.roundingSpringToken }
        FxSpringBehavior on topRightRadius { springToken: root.roundingSpringToken }
        FxSpringBehavior on bottomRightRadius { springToken: root.roundingSpringToken }
        FxSpringBehavior on bottomLeftRadius { springToken: root.roundingSpringToken }
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
            springToken: root.elevationSpringToken
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
            springToken: root.elevationSpringToken
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
            springToken: root.elevationSpringToken
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
            springToken: root.elevationSpringToken
        }
    }

    Rectangle {
        id: shape

        z: 0
        anchors.fill: parent

        color: FxStyle.tokens.sys.color.surface
        border.color: root.borderColor
        border.width: root.borderWidth

        topLeftRadius: Math.max(0.0, _.topLeftRadius)
        topRightRadius: Math.max(0.0, _.topRightRadius)
        bottomRightRadius: Math.max(0.0, _.bottomRightRadius)
        bottomLeftRadius: Math.max(0.0, _.bottomLeftRadius)
    }
}
