pragma ComponentBehavior: Bound
import QtQuick
import Fluxion

FxTextField {
    id: root

    QtObject {
        id: _
        property real implicitHeight: root.private_.topPadding +
                                      root.private_.populatedLabelLineHeight + root.private_.inputTextLineHeight +
                                      root.private_.bottomPadding +
                                      (root.allowSupportingRow ? root.private_.supportingLineHeight : 0)
    }

    implicitHeight: _.implicitHeight

    container {
        containerSpecs.shapeToken: FxStyle.tokens.sys.shape.corner.extraSmall.top

        // Container specs (default values).
        containerSpecs.color.defaultValue: FxStyle.tokens.sys.color.surfaceContainerHighest
        containerSpecs.opacity.defaultValue: 1

        // Container specs (disabled).
        containerSpecs.color.disabled: FxStyle.tokens.sys.color.surfaceAccent
        containerSpecs.opacity.disabled: 0.04

        // State-layer specs (hovered).
        stateLayerSpecs.color.hovered: FxStyle.tokens.sys.color.surfaceAccent
        stateLayerSpecs.opacity.hovered: FxStyle.tokens.sys.state.hovered.stateLayerOpacity
    }

    // Child objects.

    FxIconSpecification {
        id: active_indicator_specs

        state: root.interactionState.state

        // Active indicator specs (default values).
        color.defaultValue: root.hasError ? FxStyle.tokens.sys.color.error : FxStyle.tokens.sys.color.surfaceAccentVariant
        opacity.defaultValue: 1.00

        // Active indicator specs (disabled).
        color.disabled: FxStyle.tokens.sys.color.surfaceAccent
        opacity.disabled: 0.38

        // Active indicator specs (focused).
        color.focused: root.hasError ? FxStyle.tokens.sys.color.error : FxStyle.tokens.sys.color.primary

        // Active indicator specs (hovered).
        color.hovered: root.activeFocus ? (root.hasError ? FxStyle.tokens.sys.color.error : FxStyle.tokens.sys.color.primary) :
                                          root.hasError ? FxStyle.tokens.sys.color.errorContainerAccent : FxStyle.tokens.sys.color.surfaceAccent

    }

    Rectangle {
        id: active_indicator
        parent: root.container

        color: root.labelTextSpecs.color.value

        z: 2
        height: 1
        anchors { left: parent.left; right: parent.right; bottom: parent.bottom }

        Rectangle {
            id: active_line
            color: active_indicator.color

            x: (parent.width - width) * 0.5
            width: root.activeFocus ? parent.width : 0
            height: 3
            anchors { bottom: parent.bottom }

            FxSpringBehavior on width { springToken: FxStyle.tokens.sys.motion.spring.fast.spatial }
        }
    }

    FxLabel {
        id: field_label
        text: root.labelText
        elide: Text.ElideRight
        typeScaleToken: root.labelTextSpecs.typeScaleToken
        color: root.labelTextSpecs.color.value

        x: root.private_.implicitLeftPadding
        y: root.isPopulated ? root.private_.topPadding :
                              (_.implicitHeight - (root.allowSupportingRow ? root.private_.supportingLineHeight : 0) - root.private_.emptyLabelLineHeight) * 0.5

        FxSpringBehavior on y { springToken: FxStyle.tokens.sys.motion.spring.fast.spatial }


        font { FxSpringBehavior on pixelSize { springToken: FxStyle.tokens.sys.motion.spring.fast.effects } }

    }
}
