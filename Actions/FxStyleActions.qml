import QtQuick
import QuixFlux

QxActionCreator {
    signal setContrastLevel(real contrast_level)
    signal setSourceColor(string source_color)
    signal useContentColorScheme()
    signal useExpressiveColorScheme()
    signal useFidelityColorScheme()
    signal useFruitSaladColorScheme()
    signal useMonochromeColorScheme()
    signal useNeutralColorScheme()
    signal useRainbowColorScheme()
    signal useTonalSpotColorScheme()
    signal useVibranColorScheme()
}
