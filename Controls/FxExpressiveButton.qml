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

    // Functions.

    // This function is necessary and will be overridden in derived QML types to adjust the type of the token.
    function getMeasurementToken() : FxButtonMeasurementToken {
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

    // This function is necessary and will be overridden in derived QML types to adjust the type of the token.
    function getVariantToken() : FxButtonVariantToken {
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

    // Property type of var is used to allow derived QML types to adjust its measurement token type.
    //  e.g., FxExpressiveButton uses measurement token type of FxButtonMeasurementToken,
    //  while FxExpressiveIconButton uses measurement token type of FxIconButtonMeasurementToken
    readonly property var measurementToken: root.getMeasurementToken();

    // Property type of var is used to allow derived QML types to adjust its variant token type.
    readonly property var variantToken: root.getVariantToken();

    // Private properties.

    QtObject {
        id: _

        readonly property FxShapeToken containerShape: (root.buttonShape == FxExpressiveButton.Shape.Square) ?
                                                           root.measurementToken.shape.square :
                                                           root.measurementToken.shape.round

        readonly property FxShapeToken selectedContainerShape: (root.buttonShape == FxExpressiveButton.Shape.Square) ?
                                                                   root.measurementToken.selectedContainerShape.square :
                                                                   root.measurementToken.selectedContainerShape.round

        readonly property FxShapeToken containerNormalShape: root.checkable && root.checked
                                     ? _.selectedContainerShape
                                     : _.containerShape

        readonly property FxShapeToken containerPressedMorph: root.checkable
                                     ? root.measurementToken.selectedContainerShape.pressedMorph
                                     : root.measurementToken.shape.pressedMorph

        readonly property real containerHeigth: root.measurementToken.height
        readonly property real leadingPadding: root.measurementToken.space.leading
        readonly property real trailingPadding: root.measurementToken.space.trailing

        readonly property color containerColor_enabled: root.checkable ? (root.checked ?
                                                                              root.variantToken.enabled.container.color_toggle_selected :
                                                                              root.variantToken.enabled.container.color_toggle_unselected):
                                                                         root.variantToken.enabled.container.color

        readonly property color containerOutlineColor_enabled: root.checkable ? (root.checked ?
                                                                                     root.variantToken.enabled.outline.color_toggle_selected :
                                                                                     root.variantToken.enabled.outline.color_toggle_unselected):
                                                                                root.variantToken.enabled.outline.color

        readonly property color containerColor_disabled: root.checkable ? (root.checked ?
                                                                               root.variantToken.disabled.container.color_toggle_selected :
                                                                               root.variantToken.disabled.container.color_toggle_unselected):
                                                                          root.variantToken.disabled.container.color

        readonly property color containerOutlineColor_disabled: root.checkable ? (root.checked ?
                                                                                      root.variantToken.disabled.outline.color_toggle_selected :
                                                                                      root.variantToken.disabled.outline.color_toggle_unselected):
                                                                                 root.variantToken.disabled.outline.color

        readonly property color containerColor_hovered: root.checkable ? (root.checked ?
                                                                              root.variantToken.hovered.container.color_toggle_selected :
                                                                              root.variantToken.hovered.container.color_toggle_unselected):
                                                                         root.variantToken.hovered.container.color

        readonly property color containerOutlineColor_hovered: root.checkable ? (root.checked ?
                                                                                     root.variantToken.hovered.outline.color_toggle_selected :
                                                                                     root.variantToken.hovered.outline.color_toggle_unselected):
                                                                                root.variantToken.hovered.outline.color

        readonly property color containerColor_focused: root.checkable ? (root.checked ?
                                                                              root.variantToken.focused.container.color_toggle_selected :
                                                                              root.variantToken.focused.container.color_toggle_unselected):
                                                                         root.variantToken.focused.container.color

        readonly property color containerOutlineColor_focused: root.checkable ? (root.checked ?
                                                                                     root.variantToken.focused.outline.color_toggle_selected :
                                                                                     root.variantToken.focused.outline.color_toggle_unselected):
                                                                                root.variantToken.focused.outline.color

        readonly property color containerColor_pressed: root.checkable ? (root.checked ?
                                                                              root.variantToken.pressed.container.color_toggle_selected :
                                                                              root.variantToken.pressed.container.color_toggle_unselected):
                                                                         root.variantToken.pressed.container.color

        readonly property color containerOutlineColor_pressed: root.checkable ? (root.checked ?
                                                                                     root.variantToken.pressed.outline.color_toggle_selected :
                                                                                     root.variantToken.pressed.outline.color_toggle_unselected):
                                                                                root.variantToken.pressed.outline.color

        // Label colors.

        readonly property color labelColor_enabled: root.checkable ? (root.checked ?
                                                                          root.variantToken.enabled.label.color_toggle_selected :
                                                                          root.variantToken.enabled.label.color_toggle_unselected):
                                                                     root.variantToken.enabled.label.color
        readonly property color labelColor_disabled: root.checkable ? (root.checked ?
                                                                           root.variantToken.disabled.label.color_toggle_selected :
                                                                           root.variantToken.disabled.label.color_toggle_unselected):
                                                                      root.variantToken.disabled.label.color
        readonly property color labelColor_hovered: root.checkable ? (root.checked ?
                                                                          root.variantToken.hovered.label.color_toggle_selected :
                                                                          root.variantToken.hovered.label.color_toggle_unselected):
                                                                     root.variantToken.hovered.label.color
        readonly property color labelColor_focused: root.checkable ? (root.checked ?
                                                                          root.variantToken.focused.label.color_toggle_selected :
                                                                          root.variantToken.focused.label.color_toggle_unselected):
                                                                     root.variantToken.focused.label.color
        readonly property color labelColor_pressed: root.checkable ? (root.checked ?
                                                                          root.variantToken.pressed.label.color_toggle_selected :
                                                                          root.variantToken.pressed.label.color_toggle_unselected):
                                                                     root.variantToken.pressed.label.color

        // Icon colors.

        readonly property color iconColor_enabled: root.checkable ? (root.checked ?
                                                                         root.variantToken.enabled.icon.color_toggle_selected :
                                                                         root.variantToken.enabled.icon.color_toggle_unselected):
                                                                    root.variantToken.enabled.icon.color
        readonly property color iconColor_disabled: root.checkable ? (root.checked ?
                                                                          root.variantToken.disabled.icon.color_toggle_selected :
                                                                          root.variantToken.disabled.icon.color_toggle_unselected):
                                                                     root.variantToken.disabled.icon.color
        readonly property color iconColor_hovered: root.checkable ? (root.checked ?
                                                                         root.variantToken.hovered.icon.color_toggle_selected :
                                                                         root.variantToken.hovered.icon.color_toggle_unselected):
                                                                    root.variantToken.hovered.icon.color
        readonly property color iconColor_focused: root.checkable ? (root.checked ?
                                                                         root.variantToken.focused.icon.color_toggle_selected :
                                                                         root.variantToken.focused.icon.color_toggle_unselected):
                                                                    root.variantToken.focused.icon.color
        readonly property color iconColor_pressed: root.checkable ? (root.checked ?
                                                                         root.variantToken.pressed.icon.color_toggle_selected :
                                                                         root.variantToken.pressed.icon.color_toggle_unselected):
                                                                    root.variantToken.pressed.icon.color

        // State layer colors.

        readonly property color stateLayerColor_enabled: root.checkable ? (root.checked ?
                                                                               root.variantToken.enabled.container.stateLayer.color_toggle_selected :
                                                                               root.variantToken.enabled.container.stateLayer.color_toggle_unselected):
                                                                          root.variantToken.enabled.container.stateLayer.color
        readonly property color stateLayerColor_disabled: root.checkable ? (root.checked ?
                                                                                root.variantToken.disabled.container.stateLayer.color_toggle_selected :
                                                                                root.variantToken.disabled.container.stateLayer.color_toggle_unselected):
                                                                           root.variantToken.disabled.container.stateLayer.color
        readonly property color stateLayerColor_hovered: root.checkable ? (root.checked ?
                                                                               root.variantToken.hovered.container.stateLayer.color_toggle_selected :
                                                                               root.variantToken.hovered.container.stateLayer.color_toggle_unselected):
                                                                          root.variantToken.hovered.container.stateLayer.color
        readonly property color stateLayerColor_focused: root.checkable ? (root.checked ?
                                                                               root.variantToken.focused.container.stateLayer.color_toggle_selected :
                                                                               root.variantToken.focused.container.stateLayer.color_toggle_unselected):
                                                                          root.variantToken.focused.container.stateLayer.color
        readonly property color stateLayerColor_pressed: root.checkable ? (root.checked ?
                                                                               root.variantToken.pressed.container.stateLayer.color_toggle_selected :
                                                                               root.variantToken.pressed.container.stateLayer.color_toggle_unselected):
                                                                          root.variantToken.pressed.container.stateLayer.color
    }

    // Object properties.

    hoverEnabled: true

    leftPadding: _.leadingPadding
    rightPadding: _.trailingPadding

    height: _.containerHeigth
    width: root.leftPadding + contentItem.implicitWidth + root.rightPadding

    font: label_text_specs.typeScaleToken.font

    background: container

    // Child objects.

    FxInteractionState {
        id: interaction_state
        target: root
        isPressed: root.pressed
    }

    FxContainer {
        id: container
        state: interaction_state.state
        containerSpecs.springToken: FxStyle.tokens.sys.motion.spring.fast.spatial
        containerSpecs.shapeToken: interaction_state.isPressed ? _.containerPressedMorph : _.containerNormalShape
        containerSpecs.outlineWidth.defaultValue: root.measurementToken.outlineWidth

        containerSpecs.elevation.enabled: root.variantToken.enabled.container.elevation
        containerSpecs.opacity.enabled: root.variantToken.enabled.container.opacity
        containerSpecs.color.enabled: _.containerColor_enabled
        containerSpecs.outlineColor.enabled: _.containerOutlineColor_enabled

        containerSpecs.elevation.disabled: root.variantToken.disabled.container.elevation
        containerSpecs.opacity.disabled: root.variantToken.disabled.container.opacity
        containerSpecs.color.disabled: _.containerColor_disabled
        containerSpecs.outlineColor.disabled: _.containerOutlineColor_disabled

        containerSpecs.elevation.hovered: root.variantToken.hovered.container.elevation
        containerSpecs.opacity.hovered: root.variantToken.hovered.container.opacity
        containerSpecs.color.hovered: _.containerColor_hovered
        containerSpecs.outlineColor.hovered: _.containerOutlineColor_hovered

        containerSpecs.elevation.focused: root.variantToken.focused.container.elevation
        containerSpecs.opacity.focused: root.variantToken.focused.container.opacity
        containerSpecs.color.focused: _.containerColor_focused
        containerSpecs.outlineColor.focused: _.containerOutlineColor_focused

        containerSpecs.elevation.pressed: root.variantToken.pressed.container.elevation
        containerSpecs.opacity.pressed: root.variantToken.pressed.container.opacity
        containerSpecs.color.pressed: _.containerColor_pressed
        containerSpecs.outlineColor.pressed: _.containerOutlineColor_pressed

        stateLayerSpecs.opacity.enabled: root.variantToken.enabled.container.stateLayer.opacity
        stateLayerSpecs.color.enabled: _.stateLayerColor_enabled

        stateLayerSpecs.opacity.disabled: root.variantToken.disabled.container.stateLayer.opacity
        stateLayerSpecs.color.disabled: _.stateLayerColor_disabled

        stateLayerSpecs.opacity.hovered: root.variantToken.hovered.container.stateLayer.opacity
        stateLayerSpecs.color.hovered: _.stateLayerColor_hovered

        stateLayerSpecs.opacity.focused: root.variantToken.focused.container.stateLayer.opacity
        stateLayerSpecs.color.focused: _.stateLayerColor_focused

        stateLayerSpecs.opacity.pressed: root.variantToken.pressed.container.stateLayer.opacity
        stateLayerSpecs.color.pressed: _.stateLayerColor_pressed
    }

    FxTextSpecification {
        id: label_text_specs
        state: interaction_state.state
        typeScaleToken: root.measurementToken.typeScaleToken

        opacity.enabled: root.variantToken.enabled.label.opacity
        color.enabled: _.labelColor_enabled

        opacity.disabled: root.variantToken.disabled.label.opacity
        color.disabled: _.labelColor_disabled

        opacity.hovered: root.variantToken.hovered.label.opacity
        color.hovered: _.labelColor_hovered

        opacity.focused: root.variantToken.focused.label.opacity
        color.focused: _.labelColor_focused

        opacity.pressed: root.variantToken.pressed.label.opacity
        color.pressed: _.labelColor_pressed
    }

    FxTextSpecification {
        id: icon_text_specs
        state: interaction_state.state
        typeScaleToken: root.measurementToken.typeScaleToken

        opacity.enabled: root.variantToken.enabled.icon.opacity
        color.enabled: _.iconColor_enabled

        opacity.disabled: root.variantToken.disabled.icon.opacity
        color.disabled: _.iconColor_disabled

        opacity.hovered: root.variantToken.hovered.icon.opacity
        color.hovered: _.iconColor_hovered

        opacity.focused: root.variantToken.focused.icon.opacity
        color.focused: _.iconColor_focused

        opacity.pressed: root.variantToken.pressed.icon.opacity
        color.pressed: _.iconColor_pressed
    }

    contentItem: Item {

        implicitHeight: _.containerHeigth
        implicitWidth: button_content.implicitWidth
        anchors.centerIn: root

        Row {
            id: button_content
            spacing: root.measurementToken.space.inner

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
                        fontSize: root.measurementToken.iconSize

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
