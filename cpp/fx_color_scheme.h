#ifndef FX_COLOR_SCHEME_H
#define FX_COLOR_SCHEME_H

#include <QColor>
#include <QObject>
#include <QQmlEngine>

#include "dynamiccolor/dynamic_scheme.h"

using namespace material_color_utilities;

class FxColorScheme : public QObject
{
    Q_OBJECT
    Q_PROPERTY(double contrastLevel READ contrastLevel WRITE setContrastLevel NOTIFY contrastLevelChanged FINAL)
    Q_PROPERTY(QColor sourceColor READ sourceColor WRITE setSourceColor NOTIFY sourceColorChanged FINAL)
    Q_PROPERTY(bool useDarkMode READ useDarkMode WRITE setUseDarkMode NOTIFY useDarkModeChanged FINAL)
    Q_PROPERTY(ColorSchemeVariant variant READ variant WRITE setVariant NOTIFY variantChanged FINAL)

    Q_PROPERTY(QColor background READ background NOTIFY backgroundChanged FINAL)
    Q_PROPERTY(QColor backgroundAccent READ backgroundAccent NOTIFY backgroundAccentChanged FINAL)
    Q_PROPERTY(QColor surface READ surface NOTIFY surfaceChanged FINAL)
    Q_PROPERTY(QColor surfaceDim READ surfaceDim NOTIFY surfaceDimChanged FINAL)
    Q_PROPERTY(QColor surfaceBright READ surfaceBright NOTIFY surfaceBrightChanged FINAL)
    Q_PROPERTY(QColor surfaceContainerLowest READ surfaceContainerLowest NOTIFY surfaceContainerLowestChanged FINAL)
    Q_PROPERTY(QColor surfaceContainerLow READ surfaceContainerLow NOTIFY surfaceContainerLowChanged FINAL)
    Q_PROPERTY(QColor surfaceContainer READ surfaceContainer NOTIFY surfaceContainerChanged FINAL)
    Q_PROPERTY(QColor surfaceContainerHigh READ surfaceContainerHigh NOTIFY surfaceContainerHighChanged FINAL)
    Q_PROPERTY(QColor surfaceContainerHighest READ surfaceContainerHighest NOTIFY surfaceContainerHighestChanged FINAL)
    Q_PROPERTY(QColor surfaceAccent READ surfaceAccent NOTIFY surfaceAccentChanged FINAL)
    Q_PROPERTY(QColor surfaceVariant READ surfaceVariant NOTIFY surfaceVariantChanged FINAL)
    Q_PROPERTY(QColor surfaceAccentVariant READ surfaceAccentVariant NOTIFY surfaceAccentVariantChanged FINAL)
    Q_PROPERTY(QColor inverseSurface READ inverseSurface NOTIFY inverseSurfaceChanged FINAL)
    Q_PROPERTY(QColor inverseSurfaceAccent READ inverseSurfaceAccent NOTIFY inverseSurfaceAccentChanged FINAL)
    Q_PROPERTY(QColor outline READ outline NOTIFY outlineChanged FINAL)
    Q_PROPERTY(QColor outlineVariant READ outlineVariant NOTIFY outlineVariantChanged FINAL)
    Q_PROPERTY(QColor shadow READ shadow NOTIFY shadowChanged FINAL)
    Q_PROPERTY(QColor scrim READ scrim NOTIFY scrimChanged FINAL)
    Q_PROPERTY(QColor surfaceTint READ surfaceTint NOTIFY surfaceTintChanged FINAL)
    Q_PROPERTY(QColor primary READ primary NOTIFY primaryChanged FINAL)
    Q_PROPERTY(QColor primaryAccent READ primaryAccent NOTIFY primaryAccentChanged FINAL)
    Q_PROPERTY(QColor primaryContainer READ primaryContainer NOTIFY primaryContainerChanged FINAL)
    Q_PROPERTY(QColor primaryContainerAccent READ primaryContainerAccent NOTIFY primaryContainerAccentChanged FINAL)
    Q_PROPERTY(QColor inversePrimary READ inversePrimary NOTIFY inversePrimaryChanged FINAL)
    Q_PROPERTY(QColor secondary READ secondary NOTIFY secondaryChanged FINAL)
    Q_PROPERTY(QColor secondaryAccent READ secondaryAccent NOTIFY secondaryAccentChanged FINAL)
    Q_PROPERTY(QColor secondaryContainer READ secondaryContainer NOTIFY secondaryContainerChanged FINAL)
    Q_PROPERTY(QColor secondaryContainerAccent READ secondaryContainerAccent NOTIFY secondaryContainerAccentChanged FINAL)
    Q_PROPERTY(QColor tertiary READ tertiary NOTIFY tertiaryChanged FINAL)
    Q_PROPERTY(QColor tertiaryAccent READ tertiaryAccent NOTIFY tertiaryAccentChanged FINAL)
    Q_PROPERTY(QColor tertiaryContainer READ tertiaryContainer NOTIFY tertiaryContainerChanged FINAL)
    Q_PROPERTY(QColor tertiaryContainerAccent READ tertiaryContainerAccent NOTIFY tertiaryContainerAccentChanged FINAL)
    Q_PROPERTY(QColor error READ error NOTIFY errorChanged FINAL)
    Q_PROPERTY(QColor errorAccent READ errorAccent NOTIFY errorAccentChanged FINAL)
    Q_PROPERTY(QColor errorContainer READ errorContainer NOTIFY errorContainerChanged FINAL)
    Q_PROPERTY(QColor errorContainerAccent READ errorContainerAccent NOTIFY errorContainerAccentChanged FINAL)
    Q_PROPERTY(QColor primaryFixed READ primaryFixed NOTIFY primaryFixedChanged FINAL)
    Q_PROPERTY(QColor primaryFixedDim READ primaryFixedDim NOTIFY primaryFixedDimChanged FINAL)
    Q_PROPERTY(QColor primaryFixedAccent READ primaryFixedAccent NOTIFY primaryFixedAccentChanged FINAL)
    Q_PROPERTY(QColor primaryFixedAccentVariant READ primaryFixedAccentVariant NOTIFY primaryFixedAccentVariantChanged FINAL)
    Q_PROPERTY(QColor secondaryFixed READ secondaryFixed NOTIFY secondaryFixedChanged FINAL)
    Q_PROPERTY(QColor secondaryFixedDim READ secondaryFixedDim NOTIFY secondaryFixedDimChanged FINAL)
    Q_PROPERTY(QColor secondaryFixedAccent READ secondaryFixedAccent NOTIFY secondaryFixedAccentChanged FINAL)
    Q_PROPERTY(QColor secondaryFixedAccentVariant READ secondaryFixedAccentVariant NOTIFY secondaryFixedAccentVariantChanged FINAL)
    Q_PROPERTY(QColor tertiaryFixed READ tertiaryFixed NOTIFY tertiaryFixedChanged FINAL)
    Q_PROPERTY(QColor tertiaryFixedDim READ tertiaryFixedDim NOTIFY tertiaryFixedDimChanged FINAL)
    Q_PROPERTY(QColor tertiaryFixedAccent READ tertiaryFixedAccent NOTIFY tertiaryFixedAccentChanged FINAL)
    Q_PROPERTY(QColor tertiaryFixedAccentVariant READ tertiaryFixedAccentVariant NOTIFY tertiaryFixedAccentVariantChanged FINAL)

    QML_ELEMENT
public:

    // Enums.

    enum ColorSchemeVariant {
        TonalSpot = Qt::UserRole + 1,
        Content,
        Expressive,
        Fidelity,
        FruitSalad,
        Monochrome,
        Neutral,
        Rainbow,
        Vibrant
    };
    Q_ENUM(ColorSchemeVariant)

    // Constructors.

    explicit FxColorScheme(QObject *parent = nullptr);

    // READ methods.

    double contrastLevel();
    QColor sourceColor();
    bool useDarkMode();
    ColorSchemeVariant variant();

    // WRITE methods.

    void setContrastLevel(double contrast_level);
    void setSourceColor(QColor source_color);
    void setUseDarkMode(bool use_dark_mode);
    void setVariant(ColorSchemeVariant variant);

    // Color READ methods.

    QColor background();
    QColor backgroundAccent();
    QColor surface();
    QColor surfaceDim();
    QColor surfaceBright();
    QColor surfaceContainerLowest();
    QColor surfaceContainerLow();
    QColor surfaceContainer();
    QColor surfaceContainerHigh();
    QColor surfaceContainerHighest();
    QColor surfaceAccent();
    QColor surfaceVariant();
    QColor surfaceAccentVariant();
    QColor inverseSurface();
    QColor inverseSurfaceAccent();
    QColor outline();
    QColor outlineVariant();
    QColor shadow();
    QColor scrim();
    QColor surfaceTint();
    QColor primary();
    QColor primaryAccent();
    QColor primaryContainer();
    QColor primaryContainerAccent();
    QColor inversePrimary();
    QColor secondary();
    QColor secondaryAccent();
    QColor secondaryContainer();
    QColor secondaryContainerAccent();
    QColor tertiary();
    QColor tertiaryAccent();
    QColor tertiaryContainer();
    QColor tertiaryContainerAccent();
    QColor error();
    QColor errorAccent();
    QColor errorContainer();
    QColor errorContainerAccent();
    QColor primaryFixed();
    QColor primaryFixedDim();
    QColor primaryFixedAccent();
    QColor primaryFixedAccentVariant();
    QColor secondaryFixed();
    QColor secondaryFixedDim();
    QColor secondaryFixedAccent();
    QColor secondaryFixedAccentVariant();
    QColor tertiaryFixed();
    QColor tertiaryFixedDim();
    QColor tertiaryFixedAccent();
    QColor tertiaryFixedAccentVariant();

private:

    // Private fields.

    double contrast_level_;
    QColor source_color_;
    bool use_dark_mode_;
    ColorSchemeVariant variant_;

    DynamicScheme scheme_;

    // Private methods.

    void updateColorScheme();
    void notifyColorSchemeChange();

signals:
    void contrastLevelChanged();
    void sourceColorChanged();
    void useDarkModeChanged();
    void variantChanged();

    void backgroundChanged();
    void backgroundAccentChanged();
    void surfaceChanged();
    void surfaceDimChanged();
    void surfaceBrightChanged();
    void surfaceContainerLowestChanged();
    void surfaceContainerLowChanged();
    void surfaceContainerChanged();
    void surfaceContainerHighChanged();
    void surfaceContainerHighestChanged();
    void surfaceAccentChanged();
    void surfaceVariantChanged();
    void surfaceAccentVariantChanged();
    void inverseSurfaceChanged();
    void inverseSurfaceAccentChanged();
    void outlineChanged();
    void outlineVariantChanged();
    void shadowChanged();
    void scrimChanged();
    void surfaceTintChanged();
    void primaryChanged();
    void primaryAccentChanged();
    void primaryContainerChanged();
    void primaryContainerAccentChanged();
    void inversePrimaryChanged();
    void secondaryChanged();
    void secondaryAccentChanged();
    void secondaryContainerChanged();
    void secondaryContainerAccentChanged();
    void tertiaryChanged();
    void tertiaryAccentChanged();
    void tertiaryContainerChanged();
    void tertiaryContainerAccentChanged();
    void errorChanged();
    void errorAccentChanged();
    void errorContainerChanged();
    void errorContainerAccentChanged();
    void primaryFixedChanged();
    void primaryFixedDimChanged();
    void primaryFixedAccentChanged();
    void primaryFixedAccentVariantChanged();
    void secondaryFixedChanged();
    void secondaryFixedDimChanged();
    void secondaryFixedAccentChanged();
    void secondaryFixedAccentVariantChanged();
    void tertiaryFixedChanged();
    void tertiaryFixedDimChanged();
    void tertiaryFixedAccentChanged();
    void tertiaryFixedAccentVariantChanged();
};

#endif // FX_COLOR_SCHEME_H
