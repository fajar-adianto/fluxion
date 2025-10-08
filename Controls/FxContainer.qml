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
        springToken: container_specs.springToken

        borderColor: container_specs.outlineColor.value
        borderWidth: container_specs.outlineWidth.value
    }

    Rectangle {
        id: state_layer

        property bool fullCorner: surface.shapeToken === FxStyle.tokens.sys.shape.corner.full

        z:1
        anchors.fill: root

        color: state_layer_specs.color.value
        opacity: state_layer_specs.opacity.value

        radius: height/2
        topLeftRadius: fullCorner ? undefined : surface.shapeToken.corners.topLeft
        topRightRadius: fullCorner ? undefined : surface.shapeToken.corners.topRight
        bottomLeftRadius: fullCorner ? undefined : surface.shapeToken.corners.bottomLeft
        bottomRightRadius: fullCorner ? undefined : surface.shapeToken.corners.bottomRight
    }
}
