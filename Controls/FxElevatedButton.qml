import Fluxion

FxButton {
    id: root

    // Container specs (default values).
    containerSpecs.color.defaultValue: FxStyle.tokens.sys.color.surfaceContainerLow
    containerSpecs.elevation.defaultValue: FxStyle.tokens.sys.elevation.level1

    // Container specs (disabled).
    containerSpecs.elevation.disabled: FxStyle.tokens.sys.elevation.level0

    // Container specs (hovered).
    containerSpecs.elevation.hovered: FxStyle.tokens.sys.elevation.level2

    // State-layer specs (hovered).
    stateLayerSpecs.color.hovered: FxStyle.tokens.sys.color.primary
    stateLayerSpecs.opacity.hovered: FxStyle.tokens.sys.state.hovered.stateLayerOpacity

    // State-layer specs (focused).
    stateLayerSpecs.color.focused: FxStyle.tokens.sys.color.primary
    stateLayerSpecs.opacity.focused: FxStyle.tokens.sys.state.focused.stateLayerOpacity

    // State-layer specs (pressed).
    stateLayerSpecs.color.pressed: FxStyle.tokens.sys.color.primary
    stateLayerSpecs.opacity.pressed: FxStyle.tokens.sys.state.pressed.stateLayerOpacity

    // Label text specs (default values).
    labelTextSpecs.color.defaultValue: FxStyle.tokens.sys.color.primary
}
