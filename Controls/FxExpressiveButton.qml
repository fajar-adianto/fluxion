pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Templates as T
import Fluxion

T.Button {
    id: root

    // Enumerations.

    enum Size {
        ExtraSmall,
        Small,
        Medium,
        Large,
        ExtraLarge
    }

    enum Color {
        Elevated,
        Filled,
        Tonal,
        Outlined,
        Text
    }

    enum Shape {
        Round,
        Square
    }

    // Property declarations.

    property alias containerSpecs: container.containerSpecs
    property alias labelTextSpecs: label_text_specs
    property alias stateLayerSpecs: container.stateLayerSpecs

    property alias interactionState: interaction_state

    property string iconName

    property int buttonColor: FxExpressiveButton.Color.Tonal
    property int buttonShape: FxExpressiveButton.Shape.Round
    property int buttonSize: FxExpressiveButton.Size.Small

    readonly property bool hasIcon: iconName.length > 0
    readonly property bool iconOnly: hasIcon && (root.text.length <= 0)

    QtObject {
        id: _

        readonly property FxButtonMeasurementToken measurementToken: {
            switch (root.buttonSize) {
                case FxExpressiveButton.Size.ExtraSmall:
                    return FxStyle.tokens.comp.button.size.extraSmall;
                case FxExpressiveButton.Size.Small:
                    return FxStyle.tokens.comp.button.size.small;
                case FxExpressiveButton.Size.Medium:
                    return FxStyle.tokens.comp.button.size.medium;
                case FxExpressiveButton.Size.Large:
                    return FxStyle.tokens.comp.button.size.large;
                case FxExpressiveButton.Size.ExtraLarge:
                    return FxStyle.tokens.comp.button.size.extraLarge;
                default:
                    return FxStyle.tokens.comp.button.size.small;
            }
        }

        readonly property FxButtonVariantToken variantToken: {
            switch (root.buttonColor) {
                case FxExpressiveButton.Color.Elevated:
                    return FxStyle.tokens.comp.button.color.elevated;
                case FxExpressiveButton.Color.Filled:
                    return FxStyle.tokens.comp.button.color.filled;
                case FxExpressiveButton.Color.Tonal:
                    return FxStyle.tokens.comp.button.color.tonal;
                case FxExpressiveButton.Color.Outlined:
                    return FxStyle.tokens.comp.button.color.outlined;
                case FxExpressiveButton.Color.Text:
                    return FxStyle.tokens.comp.button.color.text;
                default:
                    return FxStyle.tokens.comp.button.color.tonal;
            }
        }

        readonly property FxShapeToken containerPressedMorph: _.measurementToken.shape.pressedMorph
        readonly property FxShapeToken containerShape: (root.buttonShape == FxExpressiveButton.Shape.Square) ?
                                                           _.measurementToken.shape.square :
                                                           _.measurementToken.shape.round

        readonly property real containerHeigth: measurementToken.height
        readonly property real leadingPadding: root.iconOnly ? 0 : measurementToken.space.leading
        readonly property real trailingPadding: root.iconOnly ? 0 : measurementToken.space.trailing

        readonly property color containerColor_enabled: root.checkable ? (root.checked ?
                                                                              _.variantToken.enabled.container.color_toggle_selected :
                                                                              _.variantToken.enabled.container.color_toggle_unselected):
                                                                         _.variantToken.enabled.container.color

        readonly property color containerOutlineColor_enabled: root.checkable ? (root.checked ?
                                                                                     _.variantToken.enabled.outline.color_toggle_selected :
                                                                                     _.variantToken.enabled.outline.color_toggle_unselected):
                                                                                _.variantToken.enabled.outline.color

        readonly property color containerColor_disabled: root.checkable ? (root.checked ?
                                                                               _.variantToken.disabled.container.color_toggle_selected :
                                                                               _.variantToken.disabled.container.color_toggle_unselected):
                                                                          _.variantToken.disabled.container.color

        readonly property color containerOutlineColor_disabled: root.checkable ? (root.checked ?
                                                                                      _.variantToken.disabled.outline.color_toggle_selected :
                                                                                      _.variantToken.disabled.outline.color_toggle_unselected):
                                                                                 _.variantToken.disabled.outline.color

        readonly property color containerColor_hovered: root.checkable ? (root.checked ?
                                                                              _.variantToken.hovered.container.color_toggle_selected :
                                                                              _.variantToken.hovered.container.color_toggle_unselected):
                                                                         _.variantToken.hovered.container.color

        readonly property color containerOutlineColor_hovered: root.checkable ? (root.checked ?
                                                                                     _.variantToken.hovered.outline.color_toggle_selected :
                                                                                     _.variantToken.hovered.outline.color_toggle_unselected):
                                                                                _.variantToken.hovered.outline.color

        readonly property color containerColor_focused: root.checkable ? (root.checked ?
                                                                              _.variantToken.focused.container.color_toggle_selected :
                                                                              _.variantToken.focused.container.color_toggle_unselected):
                                                                         _.variantToken.focused.container.color

        readonly property color containerOutlineColor_focused: root.checkable ? (root.checked ?
                                                                                     _.variantToken.focused.outline.color_toggle_selected :
                                                                                     _.variantToken.focused.outline.color_toggle_unselected):
                                                                                _.variantToken.focused.outline.color

        readonly property color containerColor_pressed: root.checkable ? (root.checked ?
                                                                              _.variantToken.pressed.container.color_toggle_selected :
                                                                              _.variantToken.pressed.container.color_toggle_unselected):
                                                                         _.variantToken.pressed.container.color

        readonly property color containerOutlineColor_pressed: root.checkable ? (root.checked ?
                                                                                     _.variantToken.pressed.outline.color_toggle_selected :
                                                                                     _.variantToken.pressed.outline.color_toggle_unselected):
                                                                                _.variantToken.pressed.outline.color

        // Label colors.

        readonly property color labelColor_enabled: root.checkable ? (root.checked ?
                                                                          _.variantToken.enabled.label.color_toggle_selected :
                                                                          _.variantToken.enabled.label.color_toggle_unselected):
                                                                     _.variantToken.enabled.label.color
        readonly property color labelColor_disabled: root.checkable ? (root.checked ?
                                                                           _.variantToken.disabled.label.color_toggle_selected :
                                                                           _.variantToken.disabled.label.color_toggle_unselected):
                                                                      _.variantToken.disabled.label.color
        readonly property color labelColor_hovered: root.checkable ? (root.checked ?
                                                                          _.variantToken.hovered.label.color_toggle_selected :
                                                                          _.variantToken.hovered.label.color_toggle_unselected):
                                                                     _.variantToken.hovered.label.color
        readonly property color labelColor_focused: root.checkable ? (root.checked ?
                                                                          _.variantToken.focused.label.color_toggle_selected :
                                                                          _.variantToken.focused.label.color_toggle_unselected):
                                                                     _.variantToken.focused.label.color
        readonly property color labelColor_pressed: root.checkable ? (root.checked ?
                                                                          _.variantToken.pressed.label.color_toggle_selected :
                                                                          _.variantToken.pressed.label.color_toggle_unselected):
                                                                     _.variantToken.pressed.label.color

        // Icon colors.

        readonly property color iconColor_enabled: root.checkable ? (root.checked ?
                                                                         _.variantToken.enabled.icon.color_toggle_selected :
                                                                         _.variantToken.enabled.icon.color_toggle_unselected):
                                                                    _.variantToken.enabled.icon.color
        readonly property color iconColor_disabled: root.checkable ? (root.checked ?
                                                                          _.variantToken.disabled.icon.color_toggle_selected :
                                                                          _.variantToken.disabled.icon.color_toggle_unselected):
                                                                     _.variantToken.disabled.icon.color
        readonly property color iconColor_hovered: root.checkable ? (root.checked ?
                                                                         _.variantToken.hovered.icon.color_toggle_selected :
                                                                         _.variantToken.hovered.icon.color_toggle_unselected):
                                                                    _.variantToken.hovered.icon.color
        readonly property color iconColor_focused: root.checkable ? (root.checked ?
                                                                         _.variantToken.focused.icon.color_toggle_selected :
                                                                         _.variantToken.focused.icon.color_toggle_unselected):
                                                                    _.variantToken.focused.icon.color
        readonly property color iconColor_pressed: root.checkable ? (root.checked ?
                                                                         _.variantToken.pressed.icon.color_toggle_selected :
                                                                         _.variantToken.pressed.icon.color_toggle_unselected):
                                                                    _.variantToken.pressed.icon.color

        // State layer colors.

        readonly property color stateLayerColor_enabled: root.checkable ? (root.checked ?
                                                                               _.variantToken.enabled.container.stateLayer.color_toggle_selected :
                                                                               _.variantToken.enabled.container.stateLayer.color_toggle_unselected):
                                                                          _.variantToken.enabled.container.stateLayer.color
        readonly property color stateLayerColor_disabled: root.checkable ? (root.checked ?
                                                                                _.variantToken.disabled.container.stateLayer.color_toggle_selected :
                                                                                _.variantToken.disabled.container.stateLayer.color_toggle_unselected):
                                                                           _.variantToken.disabled.container.stateLayer.color
        readonly property color stateLayerColor_hovered: root.checkable ? (root.checked ?
                                                                               _.variantToken.hovered.container.stateLayer.color_toggle_selected :
                                                                               _.variantToken.hovered.container.stateLayer.color_toggle_unselected):
                                                                          _.variantToken.hovered.container.stateLayer.color
        readonly property color stateLayerColor_focused: root.checkable ? (root.checked ?
                                                                               _.variantToken.focused.container.stateLayer.color_toggle_selected :
                                                                               _.variantToken.focused.container.stateLayer.color_toggle_unselected):
                                                                          _.variantToken.focused.container.stateLayer.color
        readonly property color stateLayerColor_pressed: root.checkable ? (root.checked ?
                                                                               _.variantToken.pressed.container.stateLayer.color_toggle_selected :
                                                                               _.variantToken.pressed.container.stateLayer.color_toggle_unselected):
                                                                          _.variantToken.pressed.container.stateLayer.color
    }

    // Object properties.

    hoverEnabled: true

    leftPadding: _.leadingPadding
    rightPadding: _.trailingPadding

    height: _.containerHeigth
    width: _.leadingPadding + contentItem.implicitWidth + _.trailingPadding

    font: label_text_specs.typeScaleToken.font

    background: container

    FxInteractionState {
        id: interaction_state
        target: root
        isPressed: root.pressed
    }

    FxContainer {
        id: container
        state: interaction_state.state
        containerSpecs.shapeToken: interaction_state.isPressed ? _.containerPressedMorph : _.containerShape

        containerSpecs.elevation.enabled: _.variantToken.enabled.container.elevation
        containerSpecs.opacity.enabled: _.variantToken.enabled.container.opacity
        containerSpecs.color.enabled: _.containerColor_enabled
        containerSpecs.outlineColor.enabled: _.containerOutlineColor_enabled

        containerSpecs.elevation.disabled: _.variantToken.disabled.container.elevation
        containerSpecs.opacity.disabled: _.variantToken.disabled.container.opacity
        containerSpecs.color.disabled: _.containerColor_disabled
        containerSpecs.outlineColor.disabled: _.containerOutlineColor_disabled

        containerSpecs.elevation.hovered: _.variantToken.hovered.container.elevation
        containerSpecs.opacity.hovered: _.variantToken.hovered.container.opacity
        containerSpecs.color.hovered: _.containerColor_hovered
        containerSpecs.outlineColor.hovered: _.containerOutlineColor_hovered

        containerSpecs.elevation.focused: _.variantToken.focused.container.elevation
        containerSpecs.opacity.focused: _.variantToken.focused.container.opacity
        containerSpecs.color.focused: _.containerColor_focused
        containerSpecs.outlineColor.focused: _.containerOutlineColor_focused

        containerSpecs.elevation.pressed: _.variantToken.pressed.container.elevation
        containerSpecs.opacity.pressed: _.variantToken.pressed.container.opacity
        containerSpecs.color.pressed: _.containerColor_pressed
        containerSpecs.outlineColor.pressed: _.containerOutlineColor_pressed

        stateLayerSpecs.opacity.enabled: _.variantToken.enabled.container.stateLayer.opacity
        stateLayerSpecs.color.enabled: _.stateLayerColor_enabled

        stateLayerSpecs.opacity.disabled: _.variantToken.disabled.container.stateLayer.opacity
        stateLayerSpecs.color.disabled: _.stateLayerColor_disabled

        stateLayerSpecs.opacity.hovered: _.variantToken.hovered.container.stateLayer.opacity
        stateLayerSpecs.color.hovered: _.stateLayerColor_hovered

        stateLayerSpecs.opacity.focused: _.variantToken.focused.container.stateLayer.opacity
        stateLayerSpecs.color.focused: _.stateLayerColor_focused

        stateLayerSpecs.opacity.pressed: _.variantToken.pressed.container.stateLayer.opacity
        stateLayerSpecs.color.pressed: _.stateLayerColor_pressed
    }

    FxTextSpecification {
        id: label_text_specs
        state: interaction_state.state
        typeScaleToken: _.measurementToken.typeScaleToken

        opacity.enabled: _.variantToken.enabled.label.opacity
        color.enabled: _.labelColor_enabled

        opacity.disabled: _.variantToken.disabled.label.opacity
        color.disabled: _.labelColor_disabled

        opacity.hovered: _.variantToken.hovered.label.opacity
        color.hovered: _.labelColor_hovered

        opacity.focused: _.variantToken.focused.label.opacity
        color.focused: _.labelColor_focused

        opacity.pressed: _.variantToken.pressed.label.opacity
        color.pressed: _.labelColor_pressed
    }

    FxTextSpecification {
        id: icon_text_specs
        state: interaction_state.state
        typeScaleToken: _.measurementToken.typeScaleToken

        opacity.enabled: _.variantToken.enabled.icon.opacity
        color.enabled: _.iconColor_enabled

        opacity.disabled: _.variantToken.disabled.icon.opacity
        color.disabled: _.iconColor_disabled

        opacity.hovered: _.variantToken.hovered.icon.opacity
        color.hovered: _.iconColor_hovered

        opacity.focused: _.variantToken.focused.icon.opacity
        color.focused: _.iconColor_focused

        opacity.pressed: _.variantToken.pressed.icon.opacity
        color.pressed: _.iconColor_pressed
    }

    contentItem: Item {

        implicitHeight: _.containerHeigth
        implicitWidth: root.iconOnly ? _.containerHeigth : button_content.implicitWidth
        anchors.centerIn: root

        Row {
            id: button_content
            spacing: _.measurementToken.space.inner

            height: parent.implicitHeight

            anchors.centerIn: parent

            Loader {
                id: button_icon_loader
                active: root.hasIcon
                visible: active

                anchors.verticalCenter: parent.verticalCenter

                sourceComponent: Component {
                    FxIconFont {
                        name: root.iconName
                        color: icon_text_specs.color.value
                        opacity: icon_text_specs.opacity.value
                        fontSize: _.measurementToken.iconSize

                        width: fontSize
                        height: fontSize
                    }
                }
            }

            Loader {
                id: button_text_loader
                active: root.text.length > 0
                visible: active

                anchors.verticalCenter: parent.verticalCenter

                sourceComponent: Component {
                    Text {
                        id: button_text
                        text: root.text
                        font: root.font
                        color: label_text_specs.color.value
                        opacity: label_text_specs.opacity.value
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }
            }
        }
    }
}
