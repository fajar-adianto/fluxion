import QtQuick
import Fluxion

Item {
    id: root

    property alias containerSpecs: container_specs
    FxContainerSpecification {
        id: container_specs
        state: root.state
    }

    property alias stateLayerSpecs: state_layer_specs
    FxStateLayerSpecification {
        id: state_layer_specs
        state: root.state
    }

    FxSurface {
        id: surface
        anchors.fill: root

        color: container_specs.color.value
        elevation: container_specs.elevation.value
        opacity: container_specs.opacity.value
        shapeToken: container_specs.shapeToken
        roundingSpringToken: container_specs.springToken ?? FxStyle.tokens.sys.motion.spring.fast.spatial

        borderColor: container_specs.outlineColor.value
        borderWidth: container_specs.outlineWidth.value
    }

    Rectangle {
        id: state_layer

        property bool fullCorner: surface.shapeToken === FxStyle.tokens.sys.shape.corner.full
        property real fullCornerRadius: Math.abs(Math.min(root.height, root.width) * FxStyle.tokens.sys.shape.corner.full.value)

        property real top_left_radius: fullCorner ? fullCornerRadius : surface.shapeToken.corners.topLeft
        property real top_right_radius: fullCorner ? fullCornerRadius : surface.shapeToken.corners.topRight
        property real bottom_left_radius: fullCorner ? fullCornerRadius : surface.shapeToken.corners.bottomLeft
        property real bottom_right_radius: fullCorner ? fullCornerRadius : surface.shapeToken.corners.bottomRight

        z:1
        anchors.fill: root

        color: state_layer_specs.color.value
        opacity: state_layer_specs.opacity.value

        radius: height/2
        topLeftRadius: Math.max(0.0, top_left_radius)
        topRightRadius: Math.max(0.0, top_right_radius)
        bottomLeftRadius: Math.max(0.0, bottom_left_radius)
        bottomRightRadius: Math.max(0.0, bottom_right_radius)

        FxSpringBehavior on top_left_radius { springToken: container_specs.springToken ?? FxStyle.tokens.sys.motion.spring.fast.spatial }
        FxSpringBehavior on top_right_radius { springToken: container_specs.springToken ?? FxStyle.tokens.sys.motion.spring.fast.spatial }
        FxSpringBehavior on bottom_left_radius { springToken: container_specs.springToken ?? FxStyle.tokens.sys.motion.spring.fast.spatial }
        FxSpringBehavior on bottom_right_radius { springToken: container_specs.springToken ?? FxStyle.tokens.sys.motion.spring.fast.spatial }
    }
}
