import QtQuick
import QtQuick.Shapes
import Fluxion

FxTextField {
    id: root

    QtObject {
        id: _
        property real topInset: root.private_.populatedLabelLineHeight - root.private_.topPadding
        property real implicitHeight: root.private_.populatedLabelLineHeight + root.private_.verticalSpacing +
                                      root.private_.inputTextLineHeight + root.private_.verticalSpacing + root.private_.bottomPadding +
                                      (root.allowSupportingRow ? root.private_.supportingLineHeight : 0)

        property real containerHeight: implicitHeight - topInset - root.bottomInset
    }

    topPadding: _.topInset + (_.containerHeight - root.private_.inputTextLineHeight) * 0.5

    topInset: _.topInset
    implicitHeight: _.implicitHeight

    container {
        containerSpecs.shapeToken: FxStyle.tokens.sys.shape.corner.extraSmall

        // Container specs (default values).
        containerSpecs.color.defaultValue: "transparent"
        containerSpecs.opacity.defaultValue: 0
    }

    // Child objects.

    FxIconSpecification {
        id: active_indicator_specs

        state: root.interactionState.state

        // Active indicator specs (default values).
        color.defaultValue: root.hasError ? FxStyle.tokens.sys.color.error : FxStyle.tokens.sys.color.outline
        opacity.defaultValue: 1.00

        // Active indicator specs (disabled).
        color.disabled: FxStyle.tokens.sys.color.surfaceAccent
        opacity.disabled: 0.12

        // Active indicator specs (focused).
        color.focused: root.hasError ? FxStyle.tokens.sys.color.error : FxStyle.tokens.sys.color.primary

        // Active indicator specs (hovered).
        color.hovered: root.activeFocus ? (root.hasError ? FxStyle.tokens.sys.color.error : FxStyle.tokens.sys.color.primary) :
                                          root.hasError ? FxStyle.tokens.sys.color.errorContainerAccent : FxStyle.tokens.sys.color.surfaceAccent

    }

    Shape {
        id: active_indicator
        parent: root.container
        anchors.fill: parent

        ShapePath {
            id: shape_path

            property FxShapeToken shapeToken: root.container.containerSpecs.shapeToken
            property real topLeftRadius: shapeToken.corners.topLeft
            property real topRightRadius: shapeToken.corners.topRight
            property real bottomRightRadius: shapeToken.corners.bottomRight
            property real bottomLeftRadius: shapeToken.corners.bottomLeft

            property real paddedLabelWidth: 4 + root.private_.populatedLabelWidth + 4

            fillColor: "transparent"
            strokeColor: active_indicator_specs.color.value
            strokeWidth: root.activeFocus ? 2 : 1

            startX: root.private_.containerLeftPadding + (root.isPopulated ? paddedLabelWidth : (paddedLabelWidth * 0.5))
            startY: 0

            PathLine { x: (active_indicator.width - shape_path.topRightRadius); y: 0 }
            PathArc { x: active_indicator.width; y: shape_path.topRightRadius; radiusX: shape_path.topRightRadius; radiusY: shape_path.topRightRadius }
            PathLine { x: active_indicator.width; y: (active_indicator.height - shape_path.bottomRightRadius) }
            PathArc { x: (active_indicator.width - shape_path.bottomRightRadius); y: active_indicator.height; radiusX: shape_path.bottomRightRadius; radiusY: shape_path.bottomRightRadius }
            PathLine { x: shape_path.bottomLeftRadius; y: active_indicator.height }
            PathArc { x: 0; y: (active_indicator.height - shape_path.bottomLeftRadius); radiusX: shape_path.bottomLeftRadius; radiusY: shape_path.bottomLeftRadius }
            PathLine { x: 0; y: shape_path.topLeftRadius }
            PathArc { x: shape_path.topLeftRadius; y: 0; radiusX: shape_path.topLeftRadius; radiusY: shape_path.topLeftRadius }

            PathLine { // Last line needs to be animated.
                x: root.private_.containerLeftPadding + (root.isPopulated ? 0 : (shape_path.paddedLabelWidth * 0.5))
                y: 0

                Behavior on x {
                    SmoothedAnimation {
                        velocity: -1;
                        easing.type: FxStyle.tokens.sys.motion.easing.emphasized;
                        duration: FxStyle.tokens.sys.motion.duration.short3
                    }
                }
            }

            Behavior on startX {
                SmoothedAnimation {
                    velocity: -1;
                    easing.type: FxStyle.tokens.sys.motion.easing.emphasized;
                    duration: FxStyle.tokens.sys.motion.duration.short3
                }
            }
        }
    }

    FxLabel {
        id: field_label
        text: root.labelText
        elide: Text.ElideRight
        typeScaleToken: root.labelTextSpecs.typeScaleToken
        color: root.labelTextSpecs.color.value

        x: root.isPopulated ? (root.private_.containerLeftPadding + 4) : root.private_.implicitLeftPadding
        y: root.isPopulated ? 0 : _.topInset + (_.containerHeight - root.private_.emptyLabelLineHeight) * 0.5

        Behavior on x {
            SmoothedAnimation {
                velocity: -1;
                easing.type: FxStyle.tokens.sys.motion.easing.emphasized;
                duration: FxStyle.tokens.sys.motion.duration.short3
            }
        }

        Behavior on y {
            SmoothedAnimation {
                velocity: -1;
                easing.type: FxStyle.tokens.sys.motion.easing.emphasized;
                duration: FxStyle.tokens.sys.motion.duration.short3
            }
        }

        font { Behavior on pixelSize { SmoothedAnimation {
                    velocity: -1;
                    easing.type: FxStyle.tokens.sys.motion.easing.emphasized;
                    duration: FxStyle.tokens.sys.motion.duration.short3
                } }
        }

    }

}
