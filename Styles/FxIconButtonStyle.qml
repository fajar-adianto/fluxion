import QtQuick
import QuixFlux
import Fluxion

QxStore {
    id: root

// Functions.

    function getMeasurementToken(button_size: int) : var {
        switch (button_size) {
          case FxButtonMeasurementToken.ExtraSmall:
            return extra_small;
          case FxButtonMeasurementToken.Small:
            return small;
          case FxButtonMeasurementToken.Medium:
            return medium;
          case FxButtonMeasurementToken.Large:
            return large;
          case FxButtonMeasurementToken.ExtraLarge:
            return extra_large;
          default:
            return small;
        }
    }

    function getVariantToken(variant: int) : var {
        switch (variant) {
          case FxIconButtonVariantToken.Elevated: // MD3 Expressive update doesn't include Elevated Icon Button. Fluxion still allows it.
            return elevated_variant;
          case FxIconButtonVariantToken.Filled:
            return filled_variant;
          case FxIconButtonVariantToken.Tonal:
            return tonal_variant;
          case FxIconButtonVariantToken.Outlined:
            return outlined_variant;
          case FxIconButtonVariantToken.Standard:
            return standard_variant;
          default:
            return tonal_variant;
        }
    }

// Component Tokens.

    readonly property alias componentTokens: component_tokens
    QtObject {
        id: component_tokens

        readonly property alias size: size_variant
        readonly property alias color: color_variant
    }

// Private objects.

    QtObject {
        id: size_variant

        readonly property alias extraSmall: extra_small
        readonly property alias small: small
        readonly property alias medium: medium
        readonly property alias large: large
        readonly property alias extraLarge: extra_large
    }

    QtObject {
        id: color_variant

        readonly property alias elevated: elevated_variant // MD3 Expressive update doesn't include Elevated Icon Button. Fluxion still allows
        readonly property alias filled: filled_variant
        readonly property alias tonal: tonal_variant
        readonly property alias outlined: outlined_variant
        readonly property alias standard: standard_variant
    }

    // Button measurement tokens.

    FxIconButtonMeasurementToken {
        id: extra_small
        sizeConfig: FxButtonMeasurementToken.ExtraSmall
        height: 32
        iconSize: 20
        outlineWidth: 1
        selectedContainerShape.pressedMorph: shape.pressedMorph
        selectedContainerShape.round: shape.square
        selectedContainerShape.square: shape.round
        shape.pressedMorph: FxStyle.tokens.sys.shape.corner.small
        shape.round: FxStyle.tokens.sys.shape.corner.full
        shape.square: FxStyle.tokens.sys.shape.corner.medium
        space_narrow.inner: 0
        space_narrow.leading: 4
        space_narrow.trailing: 4
        space_default.inner: 0
        space_default.leading: 6
        space_default.trailing: 6
        space_wide.inner: 0
        space_wide.leading: 10
        space_wide.trailing: 10
        typeScaleToken: FxStyle.tokens.sys.typescale.title_small
    }

    FxIconButtonMeasurementToken {
        id: small
        sizeConfig: FxButtonMeasurementToken.Small
        height: 40
        iconSize: 24
        outlineWidth: 1
        selectedContainerShape.pressedMorph: shape.pressedMorph
        selectedContainerShape.round: shape.square
        selectedContainerShape.square: shape.round
        shape.pressedMorph: FxStyle.tokens.sys.shape.corner.small
        shape.round: FxStyle.tokens.sys.shape.corner.full
        shape.square: FxStyle.tokens.sys.shape.corner.medium
        space_narrow.inner: 0
        space_narrow.leading: 4
        space_narrow.trailing: 4
        space_default.inner: 0
        space_default.leading: 8
        space_default.trailing: 8
        space_wide.inner: 0
        space_wide.leading: 14
        space_wide.trailing: 14
        typeScaleToken: FxStyle.tokens.sys.typescale.title_small
    }

    FxIconButtonMeasurementToken {
        id: medium
        sizeConfig: FxButtonMeasurementToken.Medium
        height: 56
        iconSize: 24
        outlineWidth: 1
        selectedContainerShape.pressedMorph: shape.pressedMorph
        selectedContainerShape.round: shape.square
        selectedContainerShape.square: shape.round
        shape.pressedMorph: FxStyle.tokens.sys.shape.corner.medium
        shape.round: FxStyle.tokens.sys.shape.corner.full
        shape.square: FxStyle.tokens.sys.shape.corner.large
        space_narrow.inner: 0
        space_narrow.leading: 12
        space_narrow.trailing: 12
        space_default.inner: 0
        space_default.leading: 16
        space_default.trailing: 16
        space_wide.inner: 0
        space_wide.leading: 24
        space_wide.trailing: 24
        typeScaleToken: FxStyle.tokens.sys.typescale.title_medium
    }

    FxIconButtonMeasurementToken {
        id: large
        sizeConfig: FxButtonMeasurementToken.Large
        height: 96
        iconSize: 32
        outlineWidth: 2
        selectedContainerShape.pressedMorph: shape.pressedMorph
        selectedContainerShape.round: shape.square
        selectedContainerShape.square: shape.round
        shape.pressedMorph: FxStyle.tokens.sys.shape.corner.large
        shape.round: FxStyle.tokens.sys.shape.corner.full
        shape.square: FxStyle.tokens.sys.shape.corner.extraLarge
        space_narrow.inner: 0
        space_narrow.leading: 16
        space_narrow.trailing: 16
        space_default.inner: 0
        space_default.leading: 32
        space_default.trailing: 32
        space_wide.inner: 0
        space_wide.leading: 48
        space_wide.trailing: 48
        typeScaleToken: FxStyle.tokens.sys.typescale.headline_small
    }

    FxIconButtonMeasurementToken {
        id: extra_large
        sizeConfig: FxButtonMeasurementToken.ExtraLarge
        height: 136
        iconSize: 40
        outlineWidth: 3
        selectedContainerShape.pressedMorph: shape.pressedMorph
        selectedContainerShape.round: shape.square
        selectedContainerShape.square: shape.round
        shape.pressedMorph: FxStyle.tokens.sys.shape.corner.large
        shape.round: FxStyle.tokens.sys.shape.corner.full
        shape.square: FxStyle.tokens.sys.shape.corner.extraLarge
        space_narrow.inner: 0
        space_narrow.leading: 32
        space_narrow.trailing: 32
        space_default.inner: 0
        space_default.leading: 48
        space_default.trailing: 48
        space_wide.inner: 0
        space_wide.leading: 72
        space_wide.trailing: 72
        typeScaleToken: FxStyle.tokens.sys.typescale.headline_large
    }

    // Button variant tokens.

    FxButtonVariantToken { // MD3 Expressive update doesn't include Elevated Icon Button. Fluxion still allows
        id: elevated_variant
        colorConfig: FxButtonVariantToken.Elevated
        shadowColor: FxStyle.tokens.sys.color.shadow
        enabled {
            container.color: FxStyle.tokens.sys.color.surfaceContainerLow
            container.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceContainerLow
            container.color_toggle_selected: FxStyle.tokens.sys.color.primary
            container.opacity: 1.0

            container.elevation: FxStyle.tokens.sys.elevation.level1

            container.stateLayer.color: "transparent"
            container.stateLayer.color_toggle_unselected: "transparent"
            container.stateLayer.color_toggle_selected: "transparent"
            container.stateLayer.opacity: 0.0

            label.color: "transparent"
            label.color_toggle_unselected: "transparent"
            label.color_toggle_selected: "transparent"
            label.opacity: 0.0

            icon.color: FxStyle.tokens.sys.color.primary
            icon.color_toggle_unselected: FxStyle.tokens.sys.color.primary
            icon.color_toggle_selected: FxStyle.tokens.sys.color.primaryAccent
            icon.opacity: 1.0

            outline.color: "transparent"
            outline.color_toggle_unselected: "transparent"
            outline.color_toggle_selected: "transparent"
            outline.opacity: 0.0
        }
        disabled {
            container.color: FxStyle.tokens.sys.color.surfaceAccent
            container.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceAccent
            container.color_toggle_selected: FxStyle.tokens.sys.color.surfaceAccent
            container.opacity: 0.1

            container.elevation: FxStyle.tokens.sys.elevation.level0

            container.stateLayer.color: "transparent"
            container.stateLayer.color_toggle_unselected: "transparent"
            container.stateLayer.color_toggle_selected: "transparent"
            container.stateLayer.opacity: 0.0

            label.color: "transparent"
            label.color_toggle_unselected: "transparent"
            label.color_toggle_selected: "transparent"
            label.opacity: 0.0

            icon.color: FxStyle.tokens.sys.color.surfaceAccent
            icon.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceAccent
            icon.color_toggle_selected: FxStyle.tokens.sys.color.surfaceAccent
            icon.opacity: 0.38

            outline.color: "transparent"
            outline.color_toggle_unselected: "transparent"
            outline.color_toggle_selected: "transparent"
            outline.opacity: 0.0
        }
        hovered {
            container.color: FxStyle.tokens.sys.color.surfaceContainerLow
            container.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceContainerLow
            container.color_toggle_selected: FxStyle.tokens.sys.color.primary
            container.opacity: 1.0

            container.elevation: FxStyle.tokens.sys.elevation.level2

            container.stateLayer.color: FxStyle.tokens.sys.color.primary
            container.stateLayer.color_toggle_unselected: FxStyle.tokens.sys.color.primary
            container.stateLayer.color_toggle_selected: FxStyle.tokens.sys.color.primaryAccent
            container.stateLayer.opacity: FxStyle.tokens.sys.state.hovered.stateLayerOpacity

            label.color: "transparent"
            label.color_toggle_unselected: "transparent"
            label.color_toggle_selected: "transparent"
            label.opacity: 0.0

            icon.color: FxStyle.tokens.sys.color.primary
            icon.color_toggle_unselected: FxStyle.tokens.sys.color.primary
            icon.color_toggle_selected: FxStyle.tokens.sys.color.primaryAccent
            icon.opacity: 1.0

            outline.color: "transparent"
            outline.color_toggle_unselected: "transparent"
            outline.color_toggle_selected: "transparent"
            outline.opacity: 0.0
        }
        focused {
            container.color: FxStyle.tokens.sys.color.surfaceContainerLow
            container.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceContainerLow
            container.color_toggle_selected: FxStyle.tokens.sys.color.primary
            container.opacity: 1.0

            container.elevation: FxStyle.tokens.sys.elevation.level1

            container.stateLayer.color: FxStyle.tokens.sys.color.primary
            container.stateLayer.color_toggle_unselected: FxStyle.tokens.sys.color.primary
            container.stateLayer.color_toggle_selected: FxStyle.tokens.sys.color.primaryAccent
            container.stateLayer.opacity: FxStyle.tokens.sys.state.focused.stateLayerOpacity

            label.color: "transparent"
            label.color_toggle_unselected: "transparent"
            label.color_toggle_selected: "transparent"
            label.opacity: 0.0

            icon.color: FxStyle.tokens.sys.color.primary
            icon.color_toggle_unselected: FxStyle.tokens.sys.color.primary
            icon.color_toggle_selected: FxStyle.tokens.sys.color.primaryAccent
            icon.opacity: 1.0

            outline.color: "transparent"
            outline.color_toggle_unselected: "transparent"
            outline.color_toggle_selected: "transparent"
            outline.opacity: 0.0
        }
        pressed {
            container.color: FxStyle.tokens.sys.color.surfaceContainerLow
            container.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceContainerLow
            container.color_toggle_selected: FxStyle.tokens.sys.color.primary
            container.opacity: 1.0

            container.elevation: FxStyle.tokens.sys.elevation.level1

            container.stateLayer.color: FxStyle.tokens.sys.color.primary
            container.stateLayer.color_toggle_unselected: FxStyle.tokens.sys.color.primary
            container.stateLayer.color_toggle_selected: FxStyle.tokens.sys.color.primaryAccent
            container.stateLayer.opacity: FxStyle.tokens.sys.state.pressed.stateLayerOpacity

            label.color: "transparent"
            label.color_toggle_unselected: "transparent"
            label.color_toggle_selected: "transparent"
            label.opacity: 0.0

            icon.color: FxStyle.tokens.sys.color.primary
            icon.color_toggle_unselected: FxStyle.tokens.sys.color.primary
            icon.color_toggle_selected: FxStyle.tokens.sys.color.primaryAccent
            icon.opacity: 1.0

            outline.color: "transparent"
            outline.color_toggle_unselected: "transparent"
            outline.color_toggle_selected: "transparent"
            outline.opacity: 0.0
        }
    }

    FxButtonVariantToken {
        id: filled_variant
        colorConfig: FxButtonVariantToken.Filled
        shadowColor: FxStyle.tokens.sys.color.shadow
        enabled {
            container.color: FxStyle.tokens.sys.color.primary
            container.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceContainer
            container.color_toggle_selected: FxStyle.tokens.sys.color.primary
            container.opacity: 1.0

            container.elevation: FxStyle.tokens.sys.elevation.level0

            container.stateLayer.color: "transparent"
            container.stateLayer.color_toggle_unselected: "transparent"
            container.stateLayer.color_toggle_selected: "transparent"
            container.stateLayer.opacity: 0.0

            label.color: "transparent"
            label.color_toggle_unselected: "transparent"
            label.color_toggle_selected: "transparent"
            label.opacity: 0.0

            icon.color: FxStyle.tokens.sys.color.primaryAccent
            icon.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceAccentVariant
            icon.color_toggle_selected: FxStyle.tokens.sys.color.primaryAccent
            icon.opacity: 1.0

            outline.color: "transparent"
            outline.color_toggle_unselected: "transparent"
            outline.color_toggle_selected: "transparent"
            outline.opacity: 0.0
        }
        disabled {
            container.color: FxStyle.tokens.sys.color.surfaceAccent
            container.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceAccent
            container.color_toggle_selected: FxStyle.tokens.sys.color.surfaceAccent
            container.opacity: 0.1

            container.elevation: FxStyle.tokens.sys.elevation.level0

            container.stateLayer.color: "transparent"
            container.stateLayer.color_toggle_unselected: "transparent"
            container.stateLayer.color_toggle_selected: "transparent"
            container.stateLayer.opacity: 0.0

            label.color: "transparent"
            label.color_toggle_unselected: "transparent"
            label.color_toggle_selected: "transparent"
            label.opacity: 0.0

            icon.color: FxStyle.tokens.sys.color.surfaceAccent
            icon.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceAccent
            icon.color_toggle_selected: FxStyle.tokens.sys.color.surfaceAccent
            icon.opacity: 0.38

            outline.color: "transparent"
            outline.color_toggle_unselected: "transparent"
            outline.color_toggle_selected: "transparent"
            outline.opacity: 0.0
        }
        hovered {
            container.color: FxStyle.tokens.sys.color.primary
            container.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceContainer
            container.color_toggle_selected: FxStyle.tokens.sys.color.primary
            container.opacity: 1.0

            container.elevation: FxStyle.tokens.sys.elevation.level1

            container.stateLayer.color: FxStyle.tokens.sys.color.primaryAccent
            container.stateLayer.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceAccentVariant
            container.stateLayer.color_toggle_selected: FxStyle.tokens.sys.color.primaryAccent
            container.stateLayer.opacity: FxStyle.tokens.sys.state.hovered.stateLayerOpacity

            label.color: "transparent"
            label.color_toggle_unselected: "transparent"
            label.color_toggle_selected: "transparent"
            label.opacity: 0.0

            icon.color: FxStyle.tokens.sys.color.primaryAccent
            icon.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceAccentVariant
            icon.color_toggle_selected: FxStyle.tokens.sys.color.primaryAccent
            icon.opacity: 1.0

            outline.color: "transparent"
            outline.color_toggle_unselected: "transparent"
            outline.color_toggle_selected: "transparent"
            outline.opacity: 0.0
        }
        focused {
            container.color: FxStyle.tokens.sys.color.primary
            container.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceContainer
            container.color_toggle_selected: FxStyle.tokens.sys.color.primary
            container.opacity: 1.0

            container.elevation: FxStyle.tokens.sys.elevation.level0

            container.stateLayer.color: FxStyle.tokens.sys.color.primaryAccent
            container.stateLayer.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceAccentVariant
            container.stateLayer.color_toggle_selected: FxStyle.tokens.sys.color.primaryAccent
            container.stateLayer.opacity: FxStyle.tokens.sys.state.focused.stateLayerOpacity

            label.color: "transparent"
            label.color_toggle_unselected: "transparent"
            label.color_toggle_selected: "transparent"
            label.opacity: 0.0

            icon.color: FxStyle.tokens.sys.color.primaryAccent
            icon.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceAccentVariant
            icon.color_toggle_selected: FxStyle.tokens.sys.color.primaryAccent
            icon.opacity: 1.0

            outline.color: "transparent"
            outline.color_toggle_unselected: "transparent"
            outline.color_toggle_selected: "transparent"
            outline.opacity: 0.0
        }
        pressed {
            container.color: FxStyle.tokens.sys.color.primary
            container.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceContainer
            container.color_toggle_selected: FxStyle.tokens.sys.color.primary
            container.opacity: 1.0

            container.elevation: FxStyle.tokens.sys.elevation.level0

            container.stateLayer.color: FxStyle.tokens.sys.color.primaryAccent
            container.stateLayer.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceAccentVariant
            container.stateLayer.color_toggle_selected: FxStyle.tokens.sys.color.primaryAccent
            container.stateLayer.opacity: FxStyle.tokens.sys.state.pressed.stateLayerOpacity

            label.color: "transparent"
            label.color_toggle_unselected: "transparent"
            label.color_toggle_selected: "transparent"
            label.opacity: 0.0

            icon.color: FxStyle.tokens.sys.color.primaryAccent
            icon.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceAccentVariant
            icon.color_toggle_selected: FxStyle.tokens.sys.color.primaryAccent
            icon.opacity: 1.0

            outline.color: "transparent"
            outline.color_toggle_unselected: "transparent"
            outline.color_toggle_selected: "transparent"
            outline.opacity: 0.0
        }
    }

    FxButtonVariantToken {
        id: tonal_variant
        colorConfig: FxButtonVariantToken.Tonal
        shadowColor: FxStyle.tokens.sys.color.shadow
        enabled {
            container.color: FxStyle.tokens.sys.color.secondaryContainer
            container.color_toggle_unselected: FxStyle.tokens.sys.color.secondaryContainer
            container.color_toggle_selected: FxStyle.tokens.sys.color.secondary
            container.opacity: 1.0

            container.elevation: FxStyle.tokens.sys.elevation.level0

            container.stateLayer.color: "transparent"
            container.stateLayer.color_toggle_unselected: "transparent"
            container.stateLayer.color_toggle_selected: "transparent"
            container.stateLayer.opacity: 0.0

            label.color: "transparent"
            label.color_toggle_unselected: "transparent"
            label.color_toggle_selected: "transparent"
            label.opacity: 0.0

            icon.color: FxStyle.tokens.sys.color.secondaryContainerAccent
            icon.color_toggle_unselected: FxStyle.tokens.sys.color.secondaryContainerAccent
            icon.color_toggle_selected: FxStyle.tokens.sys.color.secondaryAccent
            icon.opacity: 1.0

            outline.color: "transparent"
            outline.color_toggle_unselected: "transparent"
            outline.color_toggle_selected: "transparent"
            outline.opacity: 0.0
        }
        disabled {
            container.color: FxStyle.tokens.sys.color.surfaceAccent
            container.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceAccent
            container.color_toggle_selected: FxStyle.tokens.sys.color.surfaceAccent
            container.opacity: 0.1

            container.elevation: FxStyle.tokens.sys.elevation.level0

            container.stateLayer.color: "transparent"
            container.stateLayer.color_toggle_unselected: "transparent"
            container.stateLayer.color_toggle_selected: "transparent"
            container.stateLayer.opacity: 0.0

            label.color: "transparent"
            label.color_toggle_unselected: "transparent"
            label.color_toggle_selected: "transparent"
            label.opacity: 0.0

            icon.color: FxStyle.tokens.sys.color.surfaceAccent
            icon.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceAccent
            icon.color_toggle_selected: FxStyle.tokens.sys.color.surfaceAccent
            icon.opacity: 0.38

            outline.color: "transparent"
            outline.color_toggle_unselected: "transparent"
            outline.color_toggle_selected: "transparent"
            outline.opacity: 0.0
        }
        hovered {
            container.color: FxStyle.tokens.sys.color.secondaryContainer
            container.color_toggle_unselected: FxStyle.tokens.sys.color.secondaryContainer
            container.color_toggle_selected: FxStyle.tokens.sys.color.secondary
            container.opacity: 1.0

            container.elevation: FxStyle.tokens.sys.elevation.level1

            container.stateLayer.color: FxStyle.tokens.sys.color.secondaryContainerAccent
            container.stateLayer.color_toggle_unselected: FxStyle.tokens.sys.color.secondaryContainerAccent
            container.stateLayer.color_toggle_selected: FxStyle.tokens.sys.color.secondaryAccent
            container.stateLayer.opacity: FxStyle.tokens.sys.state.hovered.stateLayerOpacity

            label.color: "transparent"
            label.color_toggle_unselected: "transparent"
            label.color_toggle_selected: "transparent"
            label.opacity: 0.0

            icon.color: FxStyle.tokens.sys.color.secondaryContainerAccent
            icon.color_toggle_unselected: FxStyle.tokens.sys.color.secondaryContainerAccent
            icon.color_toggle_selected: FxStyle.tokens.sys.color.secondaryAccent
            icon.opacity: 1.0

            outline.color: "transparent"
            outline.color_toggle_unselected: "transparent"
            outline.color_toggle_selected: "transparent"
            outline.opacity: 0.0
        }
        focused {
            container.color: FxStyle.tokens.sys.color.secondaryContainer
            container.color_toggle_unselected: FxStyle.tokens.sys.color.secondaryContainer
            container.color_toggle_selected: FxStyle.tokens.sys.color.secondary
            container.opacity: 1.0

            container.elevation: FxStyle.tokens.sys.elevation.level0

            container.stateLayer.color: FxStyle.tokens.sys.color.secondaryContainerAccent
            container.stateLayer.color_toggle_unselected: FxStyle.tokens.sys.color.secondaryContainerAccent
            container.stateLayer.color_toggle_selected: FxStyle.tokens.sys.color.secondaryAccent
            container.stateLayer.opacity: FxStyle.tokens.sys.state.focused.stateLayerOpacity

            label.color: "transparent"
            label.color_toggle_unselected: "transparent"
            label.color_toggle_selected: "transparent"
            label.opacity: 0.0

            icon.color: FxStyle.tokens.sys.color.secondaryContainerAccent
            icon.color_toggle_unselected: FxStyle.tokens.sys.color.secondaryContainerAccent
            icon.color_toggle_selected: FxStyle.tokens.sys.color.secondaryAccent
            icon.opacity: 1.0

            outline.color: "transparent"
            outline.color_toggle_unselected: "transparent"
            outline.color_toggle_selected: "transparent"
            outline.opacity: 0.0
        }
        pressed {
            container.color: FxStyle.tokens.sys.color.secondaryContainer
            container.color_toggle_unselected: FxStyle.tokens.sys.color.secondaryContainer
            container.color_toggle_selected: FxStyle.tokens.sys.color.secondary
            container.opacity: 1.0

            container.elevation: FxStyle.tokens.sys.elevation.level0

            container.stateLayer.color: FxStyle.tokens.sys.color.secondaryContainerAccent
            container.stateLayer.color_toggle_unselected: FxStyle.tokens.sys.color.secondaryContainerAccent
            container.stateLayer.color_toggle_selected: FxStyle.tokens.sys.color.secondaryAccent
            container.stateLayer.opacity: FxStyle.tokens.sys.state.pressed.stateLayerOpacity

            label.color: "transparent"
            label.color_toggle_unselected: "transparent"
            label.color_toggle_selected: "transparent"
            label.opacity: 0.0

            icon.color: FxStyle.tokens.sys.color.secondaryContainerAccent
            icon.color_toggle_unselected: FxStyle.tokens.sys.color.secondaryContainerAccent
            icon.color_toggle_selected: FxStyle.tokens.sys.color.secondaryAccent
            icon.opacity: 1.0

            outline.color: "transparent"
            outline.color_toggle_unselected: "transparent"
            outline.color_toggle_selected: "transparent"
            outline.opacity: 0.0
        }
    }

    FxButtonVariantToken {
        id: outlined_variant
        colorConfig: FxButtonVariantToken.Outlined
        shadowColor: FxStyle.tokens.sys.color.shadow
        enabled {
            container.color: "transparent"
            container.color_toggle_unselected: "transparent"
            container.color_toggle_selected: FxStyle.tokens.sys.color.inverseSurface
            container.opacity: 1.0

            container.elevation: FxStyle.tokens.sys.elevation.level0

            container.stateLayer.color: "transparent"
            container.stateLayer.color_toggle_unselected: "transparent"
            container.stateLayer.color_toggle_selected: "transparent"
            container.stateLayer.opacity: 0.0

            label.color: "transparent"
            label.color_toggle_unselected: "transparent"
            label.color_toggle_selected: "transparent"
            label.opacity: 0.0

            icon.color: FxStyle.tokens.sys.color.surfaceAccentVariant
            icon.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceAccentVariant
            icon.color_toggle_selected: FxStyle.tokens.sys.color.inverseSurfaceAccent
            icon.opacity: 1.0

            outline.color: FxStyle.tokens.sys.color.outlineVariant
            outline.color_toggle_unselected: FxStyle.tokens.sys.color.outlineVariant
            outline.color_toggle_selected: "transparent"
            outline.opacity: 1.0
        }
        disabled {
            container.color: "transparent"
            container.color_toggle_unselected: "transparent"
            container.color_toggle_selected: FxStyle.tokens.sys.color.surfaceAccent
            container.opacity: 0.1

            container.elevation: FxStyle.tokens.sys.elevation.level0

            container.stateLayer.color: "transparent"
            container.stateLayer.color_toggle_unselected: "transparent"
            container.stateLayer.color_toggle_selected: "transparent"
            container.stateLayer.opacity: 0.0

            label.color: "transparent"
            label.color_toggle_unselected: "transparent"
            label.color_toggle_selected: "transparent"
            label.opacity: 0.0

            icon.color: FxStyle.tokens.sys.color.surfaceAccent
            icon.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceAccent
            icon.color_toggle_selected: FxStyle.tokens.sys.color.surfaceAccent
            icon.opacity: 0.38

            outline.color: FxStyle.tokens.sys.color.outlineVariant
            outline.color_toggle_unselected: FxStyle.tokens.sys.color.outlineVariant
            outline.color_toggle_selected: "transparent"
            outline.opacity: 1.0
        }
        hovered {
            container.color: "transparent"
            container.color_toggle_unselected: "transparent"
            container.color_toggle_selected: FxStyle.tokens.sys.color.inverseSurface
            container.opacity: 1.0

            container.elevation: FxStyle.tokens.sys.elevation.level0

            container.stateLayer.color: FxStyle.tokens.sys.color.surfaceAccentVariant
            container.stateLayer.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceAccentVariant
            container.stateLayer.color_toggle_selected: FxStyle.tokens.sys.color.inverseSurfaceAccent
            container.stateLayer.opacity: FxStyle.tokens.sys.state.hovered.stateLayerOpacity

            label.color: "transparent"
            label.color_toggle_unselected: "transparent"
            label.color_toggle_selected: "transparent"
            label.opacity: 0.0

            icon.color: FxStyle.tokens.sys.color.surfaceAccentVariant
            icon.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceAccentVariant
            icon.color_toggle_selected: FxStyle.tokens.sys.color.inverseSurfaceAccent
            icon.opacity: 1.0

            outline.color: FxStyle.tokens.sys.color.outlineVariant
            outline.color_toggle_unselected: FxStyle.tokens.sys.color.outlineVariant
            outline.color_toggle_selected: "transparent"
            outline.opacity: 1.0
        }
        focused {
            container.color: "transparent"
            container.color_toggle_unselected: "transparent"
            container.color_toggle_selected: FxStyle.tokens.sys.color.inverseSurface
            container.opacity: 1.0

            container.elevation: FxStyle.tokens.sys.elevation.level0

            container.stateLayer.color: FxStyle.tokens.sys.color.surfaceAccentVariant
            container.stateLayer.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceAccentVariant
            container.stateLayer.color_toggle_selected: FxStyle.tokens.sys.color.inverseSurfaceAccent
            container.stateLayer.opacity: FxStyle.tokens.sys.state.focused.stateLayerOpacity

            label.color: "transparent"
            label.color_toggle_unselected: "transparent"
            label.color_toggle_selected: "transparent"
            label.opacity: 0.0

            icon.color: FxStyle.tokens.sys.color.surfaceAccentVariant
            icon.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceAccentVariant
            icon.color_toggle_selected: FxStyle.tokens.sys.color.inverseSurfaceAccent
            icon.opacity: 1.0

            outline.color: FxStyle.tokens.sys.color.outlineVariant
            outline.color_toggle_unselected: FxStyle.tokens.sys.color.outlineVariant
            outline.color_toggle_selected: "transparent"
            outline.opacity: 1.0
        }
        pressed {
            container.color: "transparent"
            container.color_toggle_unselected: "transparent"
            container.color_toggle_selected: FxStyle.tokens.sys.color.inverseSurface
            container.opacity: 1.0

            container.elevation: FxStyle.tokens.sys.elevation.level0

            container.stateLayer.color: FxStyle.tokens.sys.color.surfaceAccentVariant
            container.stateLayer.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceAccentVariant
            container.stateLayer.color_toggle_selected: FxStyle.tokens.sys.color.inverseSurfaceAccent
            container.stateLayer.opacity: FxStyle.tokens.sys.state.pressed.stateLayerOpacity

            label.color: "transparent"
            label.color_toggle_unselected: "transparent"
            label.color_toggle_selected: "transparent"
            label.opacity: 0.0

            icon.color: FxStyle.tokens.sys.color.surfaceAccentVariant
            icon.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceAccentVariant
            icon.color_toggle_selected: FxStyle.tokens.sys.color.inverseSurfaceAccent
            icon.opacity: 1.0

            outline.color: FxStyle.tokens.sys.color.outlineVariant
            outline.color_toggle_unselected: FxStyle.tokens.sys.color.outlineVariant
            outline.color_toggle_selected: "transparent"
            outline.opacity: 1.0
        }
    }

    FxButtonVariantToken {
        id: standard_variant
        colorConfig: FxButtonVariantToken.Text
        shadowColor: FxStyle.tokens.sys.color.shadow
        enabled {
            container.color: "transparent"
            container.color_toggle_unselected: "transparent"
            container.color_toggle_selected: "transparent"
            container.opacity: 0.0

            container.elevation: FxStyle.tokens.sys.elevation.level0

            container.stateLayer.color: "transparent"
            container.stateLayer.color_toggle_unselected: "transparent"
            container.stateLayer.color_toggle_selected: "transparent"
            container.stateLayer.opacity: 0.0

            label.color: "transparent"
            label.color_toggle_unselected: "transparent"
            label.color_toggle_selected: "transparent"
            label.opacity: 0.0

            icon.color: FxStyle.tokens.sys.color.surfaceAccentVariant
            icon.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceAccentVariant
            icon.color_toggle_selected: FxStyle.tokens.sys.color.primary
            icon.opacity: 1.0

            outline.color: "transparent"
            outline.color_toggle_unselected: "transparent"
            outline.color_toggle_selected: "transparent"
            outline.opacity: 0.0
        }
        disabled {
            container.color: "transparent"
            container.color_toggle_unselected: "transparent"
            container.color_toggle_selected: "transparent"
            container.opacity: 0.0

            container.elevation: FxStyle.tokens.sys.elevation.level0

            container.stateLayer.color: "transparent"
            container.stateLayer.color_toggle_unselected: "transparent"
            container.stateLayer.color_toggle_selected: "transparent"
            container.stateLayer.opacity: 0.0

            label.color: "transparent"
            label.color_toggle_unselected: "transparent"
            label.color_toggle_selected: "transparent"
            label.opacity: 0.0

            icon.color: FxStyle.tokens.sys.color.surfaceAccent
            icon.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceAccent
            icon.color_toggle_selected: FxStyle.tokens.sys.color.surfaceAccent
            icon.opacity: 0.38

            outline.color: "transparent"
            outline.color_toggle_unselected: "transparent"
            outline.color_toggle_selected: "transparent"
            outline.opacity: 0.0
        }
        hovered {
            container.color: "transparent"
            container.color_toggle_unselected: "transparent"
            container.color_toggle_selected: "transparent"
            container.opacity: 0.0

            container.elevation: FxStyle.tokens.sys.elevation.level0

            container.stateLayer.color: FxStyle.tokens.sys.color.surfaceAccentVariant
            container.stateLayer.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceAccentVariant
            container.stateLayer.color_toggle_selected: FxStyle.tokens.sys.color.primary
            container.stateLayer.opacity: FxStyle.tokens.sys.state.hovered.stateLayerOpacity

            label.color: "transparent"
            label.color_toggle_unselected: "transparent"
            label.color_toggle_selected: "transparent"
            label.opacity: 0.0

            icon.color: FxStyle.tokens.sys.color.surfaceAccentVariant
            icon.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceAccentVariant
            icon.color_toggle_selected: FxStyle.tokens.sys.color.primary
            icon.opacity: 1.0

            outline.color: "transparent"
            outline.color_toggle_unselected: "transparent"
            outline.color_toggle_selected: "transparent"
            outline.opacity: 0.0
        }
        focused {
            container.color: "transparent"
            container.color_toggle_unselected: "transparent"
            container.color_toggle_selected: "transparent"
            container.opacity: 0.0

            container.elevation: FxStyle.tokens.sys.elevation.level0

            container.stateLayer.color: FxStyle.tokens.sys.color.surfaceAccentVariant
            container.stateLayer.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceAccentVariant
            container.stateLayer.color_toggle_selected: FxStyle.tokens.sys.color.primary
            container.stateLayer.opacity: FxStyle.tokens.sys.state.focused.stateLayerOpacity

            label.color: "transparent"
            label.color_toggle_unselected: "transparent"
            label.color_toggle_selected: "transparent"
            label.opacity: 0.0

            icon.color: FxStyle.tokens.sys.color.surfaceAccentVariant
            icon.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceAccentVariant
            icon.color_toggle_selected: FxStyle.tokens.sys.color.primary
            icon.opacity: 1.0

            outline.color: "transparent"
            outline.color_toggle_unselected: "transparent"
            outline.color_toggle_selected: "transparent"
            outline.opacity: 0.0
        }
        pressed {
            container.color: "transparent"
            container.color_toggle_unselected: "transparent"
            container.color_toggle_selected: "transparent"
            container.opacity: 0.0

            container.elevation: FxStyle.tokens.sys.elevation.level0

            container.stateLayer.color: FxStyle.tokens.sys.color.surfaceAccentVariant
            container.stateLayer.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceAccentVariant
            container.stateLayer.color_toggle_selected: FxStyle.tokens.sys.color.primary
            container.stateLayer.opacity: FxStyle.tokens.sys.state.pressed.stateLayerOpacity

            label.color: "transparent"
            label.color_toggle_unselected: "transparent"
            label.color_toggle_selected: "transparent"
            label.opacity: 0.0

            icon.color: FxStyle.tokens.sys.color.surfaceAccentVariant
            icon.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceAccentVariant
            icon.color_toggle_selected: FxStyle.tokens.sys.color.primary
            icon.opacity: 1.0

            outline.color: "transparent"
            outline.color_toggle_unselected: "transparent"
            outline.color_toggle_selected: "transparent"
            outline.opacity: 0.0
        }
    }
}
