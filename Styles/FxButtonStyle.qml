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
          case FxButtonVariantToken.Elevated:
            return elevated_variant;
          case FxButtonVariantToken.Filled:
            return filled_variant;
          case FxButtonVariantToken.Tonal:
            return tonal_variant;
          case FxButtonVariantToken.Outlined:
            return outlined_variant;
          case FxButtonVariantToken.Text:
            return text_variant;
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

        readonly property alias elevated: elevated_variant
        readonly property alias filled: filled_variant
        readonly property alias tonal: tonal_variant
        readonly property alias outlined: outlined_variant
        readonly property alias text: text_variant
    }

    // Button measurement tokens.

    FxButtonMeasurementToken {
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
        space.inner: 4
        space.leading: 12
        space.trailing: 12
        typeScaleToken: FxStyle.tokens.sys.typescale.title_small
    }

    FxButtonMeasurementToken {
        id: small
        sizeConfig: FxButtonMeasurementToken.Small
        height: 40
        iconSize: 20
        outlineWidth: 1
        selectedContainerShape.pressedMorph: shape.pressedMorph
        selectedContainerShape.round: shape.square
        selectedContainerShape.square: shape.round
        shape.pressedMorph: FxStyle.tokens.sys.shape.corner.small
        shape.round: FxStyle.tokens.sys.shape.corner.full
        shape.square: FxStyle.tokens.sys.shape.corner.medium
        space.inner: 8
        space.leading: 16
        space.trailing: 16
        typeScaleToken: FxStyle.tokens.sys.typescale.title_small
    }

    FxButtonMeasurementToken {
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
        space.inner: 8
        space.leading: 24
        space.trailing: 24
        typeScaleToken: FxStyle.tokens.sys.typescale.title_medium
    }

    FxButtonMeasurementToken {
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
        space.inner: 12
        space.leading: 48
        space.trailing: 48
        typeScaleToken: FxStyle.tokens.sys.typescale.headline_small
    }

    FxButtonMeasurementToken {
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
        space.inner: 16
        space.leading: 64
        space.trailing: 64
        typeScaleToken: FxStyle.tokens.sys.typescale.headline_large
    }

    // Button variant tokens.

    FxButtonVariantToken {
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

            label.color: FxStyle.tokens.sys.color.primary
            label.color_toggle_unselected: FxStyle.tokens.sys.color.primary
            label.color_toggle_selected: FxStyle.tokens.sys.color.primaryAccent
            label.opacity: 1.0

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

            label.color: FxStyle.tokens.sys.color.surfaceAccent
            label.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceAccent
            label.color_toggle_selected: FxStyle.tokens.sys.color.surfaceAccent
            label.opacity: 0.38

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

            label.color: FxStyle.tokens.sys.color.primary
            label.color_toggle_unselected: FxStyle.tokens.sys.color.primary
            label.color_toggle_selected: FxStyle.tokens.sys.color.primaryAccent
            label.opacity: 1.0

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

            label.color: FxStyle.tokens.sys.color.primary
            label.color_toggle_unselected: FxStyle.tokens.sys.color.primary
            label.color_toggle_selected: FxStyle.tokens.sys.color.primaryAccent
            label.opacity: 1.0

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

            label.color: FxStyle.tokens.sys.color.primary
            label.color_toggle_unselected: FxStyle.tokens.sys.color.primary
            label.color_toggle_selected: FxStyle.tokens.sys.color.primaryAccent
            label.opacity: 1.0

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

            label.color: FxStyle.tokens.sys.color.primaryAccent
            label.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceAccentVariant
            label.color_toggle_selected: FxStyle.tokens.sys.color.primaryAccent
            label.opacity: 1.0

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

            label.color: FxStyle.tokens.sys.color.surfaceAccent
            label.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceAccent
            label.color_toggle_selected: FxStyle.tokens.sys.color.surfaceAccent
            label.opacity: 0.38

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

            label.color: FxStyle.tokens.sys.color.primaryAccent
            label.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceAccentVariant
            label.color_toggle_selected: FxStyle.tokens.sys.color.primaryAccent
            label.opacity: 1.0

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

            label.color: FxStyle.tokens.sys.color.primaryAccent
            label.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceAccentVariant
            label.color_toggle_selected: FxStyle.tokens.sys.color.primaryAccent
            label.opacity: 1.0

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

            label.color: FxStyle.tokens.sys.color.primaryAccent
            label.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceAccentVariant
            label.color_toggle_selected: FxStyle.tokens.sys.color.primaryAccent
            label.opacity: 1.0

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

            label.color: FxStyle.tokens.sys.color.secondaryContainerAccent
            label.color_toggle_unselected: FxStyle.tokens.sys.color.secondaryContainerAccent
            label.color_toggle_selected: FxStyle.tokens.sys.color.secondaryAccent
            label.opacity: 1.0

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

            label.color: FxStyle.tokens.sys.color.surfaceAccent
            label.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceAccent
            label.color_toggle_selected: FxStyle.tokens.sys.color.surfaceAccent
            label.opacity: 0.38

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

            label.color: FxStyle.tokens.sys.color.secondaryContainerAccent
            label.color_toggle_unselected: FxStyle.tokens.sys.color.secondaryContainerAccent
            label.color_toggle_selected: FxStyle.tokens.sys.color.secondaryAccent
            label.opacity: 1.0

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

            label.color: FxStyle.tokens.sys.color.secondaryContainerAccent
            label.color_toggle_unselected: FxStyle.tokens.sys.color.secondaryContainerAccent
            label.color_toggle_selected: FxStyle.tokens.sys.color.secondaryAccent
            label.opacity: 1.0

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

            label.color: FxStyle.tokens.sys.color.secondaryContainerAccent
            label.color_toggle_unselected: FxStyle.tokens.sys.color.secondaryContainerAccent
            label.color_toggle_selected: FxStyle.tokens.sys.color.secondaryAccent
            label.opacity: 1.0

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

            label.color: FxStyle.tokens.sys.color.surfaceAccentVariant
            label.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceAccentVariant
            label.color_toggle_selected: FxStyle.tokens.sys.color.inverseSurfaceAccent
            label.opacity: 1.0

            icon.color: FxStyle.tokens.sys.color.surfaceAccentVariant
            icon.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceAccentVariant
            icon.color_toggle_selected: FxStyle.tokens.sys.color.inverseSurfaceAccent
            icon.opacity: 1.0

            outline.color: FxStyle.tokens.sys.color.outlineVariant
            outline.color_toggle_unselected: "transparent"
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

            label.color: FxStyle.tokens.sys.color.surfaceAccent
            label.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceAccent
            label.color_toggle_selected: FxStyle.tokens.sys.color.surfaceAccent
            label.opacity: 0.38

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

            label.color: FxStyle.tokens.sys.color.surfaceAccentVariant
            label.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceAccentVariant
            label.color_toggle_selected: FxStyle.tokens.sys.color.inverseSurfaceAccent
            label.opacity: 1.0

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

            label.color: FxStyle.tokens.sys.color.surfaceAccentVariant
            label.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceAccentVariant
            label.color_toggle_selected: FxStyle.tokens.sys.color.inverseSurfaceAccent
            label.opacity: 1.0

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

            label.color: FxStyle.tokens.sys.color.surfaceAccentVariant
            label.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceAccentVariant
            label.color_toggle_selected: FxStyle.tokens.sys.color.inverseSurfaceAccent
            label.opacity: 1.0

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
        id: text_variant
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

            label.color: FxStyle.tokens.sys.color.primary
            label.color_toggle_unselected: FxStyle.tokens.sys.color.primary
            label.color_toggle_selected: FxStyle.tokens.sys.color.primary
            label.opacity: 1.0

            icon.color: FxStyle.tokens.sys.color.primary
            icon.color_toggle_unselected: FxStyle.tokens.sys.color.primary
            icon.color_toggle_selected: FxStyle.tokens.sys.color.primary
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

            label.color: FxStyle.tokens.sys.color.surfaceAccent
            label.color_toggle_unselected: FxStyle.tokens.sys.color.surfaceAccent
            label.color_toggle_selected: FxStyle.tokens.sys.color.surfaceAccent
            label.opacity: 0.38

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

            container.stateLayer.color: FxStyle.tokens.sys.color.primary
            container.stateLayer.color_toggle_unselected: FxStyle.tokens.sys.color.primary
            container.stateLayer.color_toggle_selected: FxStyle.tokens.sys.color.primary
            container.stateLayer.opacity: FxStyle.tokens.sys.state.hovered.stateLayerOpacity

            label.color: FxStyle.tokens.sys.color.primary
            label.color_toggle_unselected: FxStyle.tokens.sys.color.primary
            label.color_toggle_selected: FxStyle.tokens.sys.color.primary
            label.opacity: 1.0

            icon.color: FxStyle.tokens.sys.color.primary
            icon.color_toggle_unselected: FxStyle.tokens.sys.color.primary
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

            container.stateLayer.color: FxStyle.tokens.sys.color.primary
            container.stateLayer.color_toggle_unselected: FxStyle.tokens.sys.color.primary
            container.stateLayer.color_toggle_selected: FxStyle.tokens.sys.color.primary
            container.stateLayer.opacity: FxStyle.tokens.sys.state.focused.stateLayerOpacity

            label.color: FxStyle.tokens.sys.color.primary
            label.color_toggle_unselected: FxStyle.tokens.sys.color.primary
            label.color_toggle_selected: FxStyle.tokens.sys.color.primary
            label.opacity: 1.0

            icon.color: FxStyle.tokens.sys.color.primary
            icon.color_toggle_unselected: FxStyle.tokens.sys.color.primary
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

            container.stateLayer.color: FxStyle.tokens.sys.color.primary
            container.stateLayer.color_toggle_unselected: FxStyle.tokens.sys.color.primary
            container.stateLayer.color_toggle_selected: FxStyle.tokens.sys.color.primary
            container.stateLayer.opacity: FxStyle.tokens.sys.state.pressed.stateLayerOpacity

            label.color: FxStyle.tokens.sys.color.primary
            label.color_toggle_unselected: FxStyle.tokens.sys.color.primary
            label.color_toggle_selected: FxStyle.tokens.sys.color.primary
            label.opacity: 1.0

            icon.color: FxStyle.tokens.sys.color.primary
            icon.color_toggle_unselected: FxStyle.tokens.sys.color.primary
            icon.color_toggle_selected: FxStyle.tokens.sys.color.primary
            icon.opacity: 1.0

            outline.color: "transparent"
            outline.color_toggle_unselected: "transparent"
            outline.color_toggle_selected: "transparent"
            outline.opacity: 0.0
        }
    }
}
