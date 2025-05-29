import Fluxion

FxButton {
    id: root

    // Container specs (default values)

    containerSpecs.color.defaultValue: "transparent"
    containerSpecs.outlineColor.defaultValue: FxStyle.tokens.sys.color.outline
    containerSpecs.outlineWidth.defaultValue: 1

    // Container specs (disabled)
    containerSpecs.color.disabled: "transparent"    // Must be explicitly stated to override settings in QML type FxButton.
    containerSpecs.outlineColor.disabled: FxStyle.tokens.sys.color.surfaceAccent

    // Container specs (focused)
    containerSpecs.outlineColor.focused: FxStyle.tokens.sys.color.primary

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
