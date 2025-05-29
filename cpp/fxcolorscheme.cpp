#include "fxcolorscheme.h"

#include "dynamiccolor/material_dynamic_colors.h"
#include "scheme/scheme_content.h"
#include "scheme/scheme_expressive.h"
#include "scheme/scheme_fidelity.h"
#include "scheme/scheme_fruit_salad.h"
#include "scheme/scheme_monochrome.h"
#include "scheme/scheme_neutral.h"
#include "scheme/scheme_rainbow.h"
#include "scheme/scheme_tonal_spot.h"
#include "scheme/scheme_vibrant.h"
#include "utils/utils.h"

using namespace material_color_utilities;

FxColorScheme::FxColorScheme(QObject *parent)
    : QObject{parent}
    , contrast_level_(0.0)
    , source_color_(QColor::fromString("#6EB6D3"))
    , use_dark_mode_(false)
    , variant_(ColorSchemeVariant::TonalSpot)
    , scheme_(SchemeTonalSpot(Hct(ArgbFromRgb(source_color_.red(), source_color_.green(), source_color_.blue())),
                              use_dark_mode_,
                              contrast_level_
                              ))
{
    updateColorScheme();
}

double FxColorScheme::contrastLevel()
{
    return contrast_level_;
}

QColor FxColorScheme::sourceColor()
{
    return source_color_;
}

bool FxColorScheme::useDarkMode()
{
    return use_dark_mode_;
}

FxColorScheme::ColorSchemeVariant FxColorScheme::variant()
{
    return variant_;
}

void FxColorScheme::setContrastLevel(double contrast_level)
{
    if (contrast_level == contrast_level_)
        return;

    contrast_level_ = contrast_level;
    emit contrastLevelChanged();

    updateColorScheme();
}

void FxColorScheme::setSourceColor(QColor source_color)
{
    if (source_color == source_color_)
        return;

    source_color_ = source_color;
    emit sourceColorChanged();

    updateColorScheme();
}

void FxColorScheme::setUseDarkMode(bool use_dark_mode)
{
    if (use_dark_mode == use_dark_mode_)
        return;

    use_dark_mode_ = use_dark_mode;
    emit useDarkModeChanged();

    updateColorScheme();
}

void FxColorScheme::setVariant(ColorSchemeVariant variant)
{
    if (variant == variant_)
        return;

    variant_ = variant;
    emit variantChanged();

    updateColorScheme();
}

QColor FxColorScheme::background()
{
    Argb color = MaterialDynamicColors::Background().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::backgroundAccent()
{
    Argb color = MaterialDynamicColors::OnBackground().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::surface()
{
    Argb color = MaterialDynamicColors::Surface().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::surfaceDim()
{
    Argb color = MaterialDynamicColors::SurfaceDim().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::surfaceBright()
{
    Argb color = MaterialDynamicColors::SurfaceBright().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::surfaceContainerLowest()
{
    Argb color = MaterialDynamicColors::SurfaceContainerLowest().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::surfaceContainerLow()
{
    Argb color = MaterialDynamicColors::SurfaceContainerLow().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::surfaceContainer()
{
    Argb color = MaterialDynamicColors::SurfaceContainer().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::surfaceContainerHigh()
{
    Argb color = MaterialDynamicColors::SurfaceContainerHigh().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::surfaceContainerHighest()
{
    Argb color = MaterialDynamicColors::SurfaceContainerHighest().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::surfaceAccent()
{
    Argb color = MaterialDynamicColors::OnSurface().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::surfaceVariant()
{
    Argb color = MaterialDynamicColors::SurfaceVariant().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::surfaceAccentVariant()
{
    Argb color = MaterialDynamicColors::OnSurfaceVariant().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::inverseSurface()
{
    Argb color = MaterialDynamicColors::InverseSurface().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::inverseSurfaceAccent()
{
    Argb color = MaterialDynamicColors::InverseOnSurface().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::outline()
{
    Argb color = MaterialDynamicColors::Outline().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::outlineVariant()
{
    Argb color = MaterialDynamicColors::OutlineVariant().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::shadow()
{
    Argb color = MaterialDynamicColors::Shadow().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::scrim()
{
    Argb color = MaterialDynamicColors::Scrim().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::surfaceTint()
{
    Argb color = MaterialDynamicColors::SurfaceTint().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::primary()
{
    Argb color = MaterialDynamicColors::Primary().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::primaryAccent()
{
    Argb color = MaterialDynamicColors::OnPrimary().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::primaryContainer()
{
    Argb color = MaterialDynamicColors::PrimaryContainer().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::primaryContainerAccent()
{
    Argb color = MaterialDynamicColors::OnPrimaryContainer().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::inversePrimary()
{
    Argb color = MaterialDynamicColors::InversePrimary().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::secondary()
{
    Argb color = MaterialDynamicColors::Secondary().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::secondaryAccent()
{
    Argb color = MaterialDynamicColors::OnSecondary().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::secondaryContainer()
{
    Argb color = MaterialDynamicColors::SecondaryContainer().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::secondaryContainerAccent()
{
    Argb color = MaterialDynamicColors::OnSecondaryContainer().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::tertiary()
{
    Argb color = MaterialDynamicColors::Tertiary().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::tertiaryAccent()
{
    Argb color = MaterialDynamicColors::OnTertiary().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::tertiaryContainer()
{
    Argb color = MaterialDynamicColors::TertiaryContainer().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::tertiaryContainerAccent()
{
    Argb color = MaterialDynamicColors::OnTertiaryContainer().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::error()
{
    Argb color = MaterialDynamicColors::Error().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::errorAccent()
{
    Argb color = MaterialDynamicColors::OnError().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::errorContainer()
{
    Argb color = MaterialDynamicColors::ErrorContainer().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::errorContainerAccent()
{
    Argb color = MaterialDynamicColors::OnErrorContainer().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::primaryFixed()
{
    Argb color = MaterialDynamicColors::PrimaryFixed().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::primaryFixedDim()
{
    Argb color = MaterialDynamicColors::PrimaryFixedDim().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::primaryFixedAccent()
{
    Argb color = MaterialDynamicColors::OnPrimaryFixed().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::primaryFixedAccentVariant()
{
    Argb color = MaterialDynamicColors::OnPrimaryFixedVariant().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::secondaryFixed()
{
    Argb color = MaterialDynamicColors::SecondaryFixed().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::secondaryFixedDim()
{
    Argb color = MaterialDynamicColors::SecondaryFixedDim().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::secondaryFixedAccent()
{
    Argb color = MaterialDynamicColors::OnSecondaryFixed().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::secondaryFixedAccentVariant()
{
    Argb color = MaterialDynamicColors::OnSecondaryFixedVariant().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::tertiaryFixed()
{
    Argb color = MaterialDynamicColors::TertiaryFixed().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::tertiaryFixedDim()
{
    Argb color = MaterialDynamicColors::TertiaryFixedDim().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::tertiaryFixedAccent()
{
    Argb color = MaterialDynamicColors::OnTertiaryFixed().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

QColor FxColorScheme::tertiaryFixedAccentVariant()
{
    Argb color = MaterialDynamicColors::OnTertiaryFixedVariant().GetArgb(scheme_);
    QString color_hex = QString::fromStdString(HexFromArgb(color));
    return QColor::fromString(color_hex.prepend("#"));
}

void FxColorScheme::updateColorScheme()
{
    Argb color = ArgbFromRgb(source_color_.red(), source_color_.green(), source_color_.blue());

    switch (variant_) {
    case ColorSchemeVariant::Content:
        scheme_ = SchemeContent(Hct(color), use_dark_mode_, contrast_level_);
        break;
    case ColorSchemeVariant::Expressive:
        scheme_ = SchemeExpressive(Hct(color), use_dark_mode_, contrast_level_);
        break;
    case ColorSchemeVariant::Fidelity:
        scheme_ = SchemeFidelity(Hct(color), use_dark_mode_, contrast_level_);
        break;
    case ColorSchemeVariant::FruitSalad:
        scheme_ = SchemeFruitSalad(Hct(color), use_dark_mode_, contrast_level_);
        break;
    case ColorSchemeVariant::Monochrome:
        scheme_ = SchemeMonochrome(Hct(color), use_dark_mode_, contrast_level_);
        break;
    case ColorSchemeVariant::Neutral:
        scheme_ = SchemeNeutral(Hct(color), use_dark_mode_, contrast_level_);
        break;
    case ColorSchemeVariant::Rainbow:
        scheme_ = SchemeRainbow(Hct(color), use_dark_mode_, contrast_level_);
        break;
    case ColorSchemeVariant::TonalSpot:
        scheme_ = SchemeTonalSpot(Hct(color), use_dark_mode_, contrast_level_);
        break;
    case ColorSchemeVariant::Vibrant:
        scheme_ = SchemeVibrant(Hct(color), use_dark_mode_, contrast_level_);
        break;
    default:
        scheme_ = SchemeTonalSpot(Hct(color), use_dark_mode_, contrast_level_);
        break;
    }

    notifyColorSchemeChange();
}

void FxColorScheme::notifyColorSchemeChange()
{
    emit backgroundChanged();
    emit backgroundAccentChanged();
    emit surfaceChanged();
    emit surfaceDimChanged();
    emit surfaceBrightChanged();
    emit surfaceContainerLowestChanged();
    emit surfaceContainerLowChanged();
    emit surfaceContainerChanged();
    emit surfaceContainerHighChanged();
    emit surfaceContainerHighestChanged();
    emit surfaceAccentChanged();
    emit surfaceVariantChanged();
    emit surfaceAccentVariantChanged();
    emit inverseSurfaceChanged();
    emit inverseSurfaceAccentChanged();
    emit outlineChanged();
    emit outlineVariantChanged();
    emit shadowChanged();
    emit scrimChanged();
    emit surfaceTintChanged();
    emit primaryChanged();
    emit primaryAccentChanged();
    emit primaryContainerChanged();
    emit primaryContainerAccentChanged();
    emit inversePrimaryChanged();
    emit secondaryChanged();
    emit secondaryAccentChanged();
    emit secondaryContainerChanged();
    emit secondaryContainerAccentChanged();
    emit tertiaryChanged();
    emit tertiaryAccentChanged();
    emit tertiaryContainerChanged();
    emit tertiaryContainerAccentChanged();
    emit errorChanged();
    emit errorAccentChanged();
    emit errorContainerChanged();
    emit errorContainerAccentChanged();
    emit primaryFixedChanged();
    emit primaryFixedDimChanged();
    emit primaryFixedAccentChanged();
    emit primaryFixedAccentVariantChanged();
    emit secondaryFixedChanged();
    emit secondaryFixedDimChanged();
    emit secondaryFixedAccentChanged();
    emit secondaryFixedAccentVariantChanged();
    emit tertiaryFixedChanged();
    emit tertiaryFixedDimChanged();
    emit tertiaryFixedAccentChanged();
    emit tertiaryFixedAccentVariantChanged();
}
