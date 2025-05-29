import Fluxion

FxButton {
    id: root

    // Property declarations.

    property bool isTonal: false

    // Object properties.

    // Container specs (default values).
    containerSpecs.color.defaultValue: isTonal ? FxStyle.tokens.sys.color.primary : FxStyle.tokens.sys.color.secondaryContainer

    // Container specs (hovered).
    containerSpecs.elevation.hovered: FxStyle.tokens.sys.elevation.level1

    // State-layer specs (hovered).
    stateLayerSpecs.color.hovered: isTonal ? FxStyle.tokens.sys.color.primaryAccent : FxStyle.tokens.sys.color.secondaryContainerAccent
    stateLayerSpecs.opacity.hovered: FxStyle.tokens.sys.state.hovered.stateLayerOpacity

    // State-layer specs (focused).
    stateLayerSpecs.color.focused: isTonal ? FxStyle.tokens.sys.color.primaryAccent : FxStyle.tokens.sys.color.secondaryContainerAccent
    stateLayerSpecs.opacity.focused: FxStyle.tokens.sys.state.focused.stateLayerOpacity

    // State-layer specs (pressed).
    stateLayerSpecs.color.pressed: isTonal ? FxStyle.tokens.sys.color.primaryAccent : FxStyle.tokens.sys.color.secondaryContainerAccent
    stateLayerSpecs.opacity.pressed: FxStyle.tokens.sys.state.pressed.stateLayerOpacity

    // Label text specs (default values).
    labelTextSpecs.color.defaultValue: isTonal ? FxStyle.tokens.sys.color.primaryAccent : FxStyle.tokens.sys.color.secondaryContainerAccent
}
