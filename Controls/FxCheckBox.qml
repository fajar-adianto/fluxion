pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Templates as T
import Fluxion

T.CheckBox {
    id: root

    // Property declarations.

    property bool isError: false

    property alias labelTextSpecs: label_text_specs
    property alias stateLayerSpecs: state_layer.stateLayerSpecs

    property alias interactionState: interaction_state

    // Private properties.

    QtObject {
        id: _

        readonly property real containerSize: 18
        readonly property real iconSize: 18
        readonly property real stateLayerSize: 40
        readonly property real targetSize: 40 + (root.padding * 2)

        readonly property real spacing: 8

        readonly property real indicatorPadding: (_.targetSize - _.containerSize) / 2
        readonly property real stateLayerPadding: (_.targetSize - _.stateLayerSize) / 2
        readonly property real textPadding: _.targetSize + _.spacing
    }

    // Object properties.

    hoverEnabled: true

    implicitHeight: _.targetSize
    implicitWidth: (root.text.length > 0) ? (_.textPadding + root.contentItem.width) : _.targetSize

    height: _.targetSize
    width: (root.text.length > 0) ? (_.textPadding + root.contentItem.width) : _.targetSize

    font: label_text_specs.typeScaleToken.font

    background: state_layer
    indicator: indicator_box

    FxInteractionState {
        id: interaction_state
        target: root
        isPressed: root.pressed
    }

    FxContainer {
        id: state_layer
        state: interaction_state.state
        containerSpecs.shapeToken: FxStyle.tokens.sys.shape.corner.full

        containerSpecs.color.defaultValue: "transparent"

        // State layer specs (hovered).
        containerSpecs.color.hovered: root.isError ? FxStyle.tokens.sys.color.error : (root.checked ? FxStyle.tokens.sys.color.primary : FxStyle.tokens.sys.color.surfaceAccent)
        containerSpecs.opacity.hovered: FxStyle.tokens.sys.state.hovered.stateLayerOpacity

        // State layer specs (focused).
        containerSpecs.color.focused: root.isError ? FxStyle.tokens.sys.color.error : (root.checked ? FxStyle.tokens.sys.color.primary : FxStyle.tokens.sys.color.surfaceAccent)
        containerSpecs.opacity.focused: FxStyle.tokens.sys.state.focused.stateLayerOpacity

        // State layer specs (pressed).
        containerSpecs.color.pressed: root.isError ? FxStyle.tokens.sys.color.error : (root.checked ? FxStyle.tokens.sys.color.primary : FxStyle.tokens.sys.color.surfaceAccent)
        containerSpecs.opacity.pressed: FxStyle.tokens.sys.state.pressed.stateLayerOpacity

        height: _.stateLayerSize
        width: _.stateLayerSize
        x: _.stateLayerPadding
        anchors.verticalCenter: root.verticalCenter
    }

    FxTextSpecification {
        id: label_text_specs
        state: interaction_state.state
        typeScaleToken: FxStyle.tokens.sys.typescale.label_medium

        // Label text specs (default values).
        opacity.defaultValue: 1.00

        // Label text specs (disabled).
        color.disabled: FxStyle.tokens.sys.color.surfaceAccent
        opacity.disabled: 0.38
    }

    FxTextSpecification {
        id: indicator_icon_specs
        state: interaction_state.state
        typeScaleToken: FxStyle.tokens.sys.typescale.title_small

        // Indicator icon specs (default values).
        color.defaultValue: "transparent"
        opacity.defaultValue: 1.00

        // Indicator icon  specs (enabled).
        color.enabled: root.isError ? FxStyle.tokens.sys.color.errorAccent : (root.checked ? FxStyle.tokens.sys.color.primaryAccent : "transparent")

        // Indicator icon  specs (disabled).
        color.disabled: root.checked ? FxStyle.tokens.sys.color.surface : "transparent"
        opacity.disabled: 0.38

        // Indicator icon  specs (hovered).
        color.hovered: root.isError ? FxStyle.tokens.sys.color.errorAccent : (root.checked ? FxStyle.tokens.sys.color.primaryAccent : "transparent")

        // Indicator icon  specs (pressed).
        color.pressed: root.isError ? FxStyle.tokens.sys.color.errorAccent : (root.checked ? FxStyle.tokens.sys.color.primaryAccent : "transparent")
    }

    FxContainer {
        id: indicator_box
        state: interaction_state.state

        containerSpecs.outlineWidth.defaultValue: root.checked ? 0 : 2
        containerSpecs.shapeToken: FxStyle.tokens.sys.shape.corner.extraSmall // TO BE CONSIDERED: MD3 specification actually mentions the corner should be 2px: smaller than extraSmall shape-token.

        // Indicator-box specs (enabled).
        containerSpecs.color.enabled: root.isError ? FxStyle.tokens.sys.color.error : (root.checked ? FxStyle.tokens.sys.color.primary : "transparent")
        containerSpecs.outlineColor.enabled: root.isError ? FxStyle.tokens.sys.color.error : (root.checked ? "transparent" : FxStyle.tokens.sys.color.surfaceAccentVariant)

        // Indicator-box specs (disabled).
        containerSpecs.color.disabled: FxStyle.tokens.sys.color.surfaceAccent
        containerSpecs.outlineColor.disabled: FxStyle.tokens.sys.color.surfaceAccent
        containerSpecs.opacity.disabled: 0.38

        // Indicator-box specs (hovered).
        containerSpecs.color.hovered: root.isError ? FxStyle.tokens.sys.color.error : (root.checked ? FxStyle.tokens.sys.color.primary : "transparent")
        containerSpecs.outlineColor.hovered: root.isError ? FxStyle.tokens.sys.color.error : (root.checked ? "transparent" : FxStyle.tokens.sys.color.surfaceAccent)

        // Indicator-box specs (focused).
        containerSpecs.color.focused: root.isError ? FxStyle.tokens.sys.color.error : (root.checked ? FxStyle.tokens.sys.color.primary : "transparent")
        containerSpecs.outlineColor.focused: root.isError ? FxStyle.tokens.sys.color.error : (root.checked ? "transparent" : FxStyle.tokens.sys.color.surfaceAccent)

        // Indicator-box specs (pressed).
        containerSpecs.color.pressed: root.isError ? FxStyle.tokens.sys.color.error : (root.checked ? FxStyle.tokens.sys.color.primary : "transparent")
        containerSpecs.outlineColor.pressed: root.isError ? FxStyle.tokens.sys.color.error : (root.checked ? "transparent" : FxStyle.tokens.sys.color.surfaceAccent)

        height: _.containerSize
        width: _.containerSize
        x: _.indicatorPadding
        anchors.verticalCenter: root.verticalCenter

        // Child objects.

        FxIconFont {
            id: indicator_icon
            name: "check"
            color: indicator_icon_specs.color.value
            opacity: indicator_icon_specs.opacity.value
            fontSize: _.iconSize

            width: fontSize
            height: fontSize
            anchors.centerIn: parent
        }
    }

    contentItem: Loader {
        id: checkbox_content
        active: root.text.length > 0
        visible: active

        x: _.textPadding
        anchors.verticalCenter: root.verticalCenter

        sourceComponent: Component {
            Text {
                id: checkbox_text
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
