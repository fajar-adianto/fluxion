import QtQuick
import QuixFlux
import Fluxion

QxStore {
    id: root

    readonly property alias systemTokens: system_tokens
    QtObject {
        id: system_tokens

        property color background: color_scheme.background
        property color backgroundAccent: color_scheme.backgroundAccent
        property color surface: color_scheme.surface
        property color surfaceDim: color_scheme.surfaceDim
        property color surfaceBright: color_scheme.surfaceBright
        property color surfaceContainerLowest: color_scheme.surfaceContainerLowest
        property color surfaceContainerLow: color_scheme.surfaceContainerLow
        property color surfaceContainer: color_scheme.surfaceContainer
        property color surfaceContainerHigh: color_scheme.surfaceContainerHigh
        property color surfaceContainerHighest: color_scheme.surfaceContainerHighest
        property color surfaceAccent: color_scheme.surfaceAccent
        property color surfaceVariant: color_scheme.surfaceVariant
        property color surfaceAccentVariant: color_scheme.surfaceAccentVariant
        property color inverseSurface: color_scheme.inverseSurface
        property color inverseSurfaceAccent: color_scheme.inverseSurfaceAccent
        property color outline: color_scheme.outline
        property color outlineVariant: color_scheme.outlineVariant
        property color shadow: color_scheme.shadow
        property color scrim: color_scheme.scrim
        property color surfaceTint: color_scheme.surfaceTint
        property color primary: color_scheme.primary
        property color primaryAccent: color_scheme.primaryAccent
        property color primaryContainer: color_scheme.primaryContainer
        property color primaryContainerAccent: color_scheme.primaryContainerAccent
        property color inversePrimary: color_scheme.inversePrimary
        property color secondary: color_scheme.secondary
        property color secondaryAccent: color_scheme.secondaryAccent
        property color secondaryContainer: color_scheme.secondaryContainer
        property color secondaryContainerAccent: color_scheme.secondaryContainerAccent
        property color tertiary: color_scheme.tertiary
        property color tertiaryAccent: color_scheme.tertiaryAccent
        property color tertiaryContainer: color_scheme.tertiaryContainer
        property color tertiaryContainerAccent: color_scheme.tertiaryContainerAccent
        property color error: color_scheme.error
        property color errorAccent: color_scheme.errorAccent
        property color errorContainer: color_scheme.errorContainer
        property color errorContainerAccent: color_scheme.errorContainerAccent
        property color primaryFixed: color_scheme.primaryFixed
        property color primaryFixedDim: color_scheme.primaryFixedDim
        property color primaryFixedAccent: color_scheme.primaryFixedAccent
        property color primaryFixedAccentVariant: color_scheme.primaryFixedAccentVariant
        property color secondaryFixed: color_scheme.secondaryFixed
        property color secondaryFixedDim: color_scheme.secondaryFixedDim
        property color secondaryFixedAccent: color_scheme.secondaryFixedAccent
        property color secondaryFixedAccentVariant: color_scheme.secondaryFixedAccentVariant
        property color tertiaryFixed: color_scheme.tertiaryFixed
        property color tertiaryFixedDim: color_scheme.tertiaryFixedDim
        property color tertiaryFixedAccent: color_scheme.tertiaryFixedAccent
        property color tertiaryFixedAccentVariant: color_scheme.tertiaryFixedAccentVariant
    }

    FxColorScheme {
        id: color_scheme
        contrastLevel: 0.0
        useDarkMode: FxStyle.contexts.useDarkTheme
        sourceColor: "#6EB6D3"
        variant: FxColorScheme.TonalSpot
    }

    // Action filters.

    QxFilter {
        type: FxStyleActionTypes.setContrastLevel
        onDispatched:
            (type, message) => {
                color_scheme.contrastLevel = message.contrast_level;
            }
    }

    QxFilter {
        type: FxStyleActionTypes.setSourceColor
        onDispatched:
            (type, message) => {
                color_scheme.sourceColor = message.source_color;
            }
    }

    QxFilter {
        type: FxStyleActionTypes.useContentColorScheme
        onDispatched: {
            color_scheme.variant = FxColorScheme.Content
        }
    }

    QxFilter {
        type: FxStyleActionTypes.useExpressiveColorScheme
        onDispatched: {
            color_scheme.variant = FxColorScheme.Expressive
        }
    }

    QxFilter {
        type: FxStyleActionTypes.useFidelityColorScheme
        onDispatched: {
            color_scheme.variant = FxColorScheme.Fidelity
        }
    }

    QxFilter {
        type: FxStyleActionTypes.useFruitSaladColorScheme
        onDispatched: {
            color_scheme.variant = FxColorScheme.FruitSalad
        }
    }

    QxFilter {
        type: FxStyleActionTypes.useMonochromeColorScheme
        onDispatched: {
            color_scheme.variant = FxColorScheme.Monochrome
        }
    }

    QxFilter {
        type: FxStyleActionTypes.useNeutralColorScheme
        onDispatched: {
            color_scheme.variant = FxColorScheme.Neutral
        }
    }

    QxFilter {
        type: FxStyleActionTypes.useRainbowColorScheme
        onDispatched: {
            color_scheme.variant = FxColorScheme.Rainbow
        }
    }

    QxFilter {
        type: FxStyleActionTypes.useTonalSpotColorScheme
        onDispatched: {
            color_scheme.variant = FxColorScheme.TonalSpot
        }
    }

    QxFilter {
        type: FxStyleActionTypes.useVibranColorScheme
        onDispatched: {
            color_scheme.variant = FxColorScheme.Vibrant
        }
    }
}
