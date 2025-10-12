#include "fx_button_variant_token.h"

FxButtonVariantToken::FxButtonVariantToken(QObject *parent)
    : QObject{parent}
    , disabled_{this}
    , enabled_{this}
    , focused_{this}
    , hovered_{this}
    , pressed_{this}
{
    // Intentionally left empty.
}

FxIconButtonVariantToken::FxIconButtonVariantToken(QObject *parent)
    : FxButtonVariantToken{parent}
{
    // Intentionally left empty;
}

FxButtonVariantToken::ColorConfig FxButtonVariantToken::colorConfig()
{
    return color_config_;
}

void FxButtonVariantToken::setColorConfig(ColorConfig color_config)
{
    if (color_config_ == color_config)
        return;

    color_config_ = color_config;
    emit colorConfigChanged();
}

FxButtonVariantElements *FxButtonVariantToken::disabled()
{
    return &disabled_;
}

FxButtonVariantElements *FxButtonVariantToken::enabled()
{
    return &enabled_;
}

FxButtonVariantElements *FxButtonVariantToken::focused()
{
    return &focused_;
}

FxButtonVariantElements *FxButtonVariantToken::hovered()
{
    return &hovered_;
}

FxButtonVariantElements *FxButtonVariantToken::pressed()
{
    return &pressed_;
}

QColor FxButtonVariantToken::shadowColor()
{
    return shadow_color_;
}

void FxButtonVariantToken::setShadowColor(QColor color)
{
    if (shadow_color_ == color)
        return;

    shadow_color_ = color;
    emit shadowColorChanged();
}


/// Utility classes.

// FxButtonColorValues

FxButtonColorValues::FxButtonColorValues(QObject *parent)
    : QObject{parent}
    , opacity_(0)
{
    // Intentionally left empty.
}

QColor FxButtonColorValues::color()
{
    return color_;
}

void FxButtonColorValues::setColor(QColor color)
{
    if (color_ == color)
        return;

    color_ = color;
    emit colorChanged();
}

QColor FxButtonColorValues::color_toggle_selected()
{
    return color_toggle_selected_;
}

void FxButtonColorValues::setColor_toggle_selected(QColor color)
{
    if (color_toggle_selected_ == color)
        return;

    color_toggle_selected_ = color;
    emit color_toggle_selectedChanged();
}

QColor FxButtonColorValues::color_toggle_unselected()
{
    return color_toggle_unselected_;
}

void FxButtonColorValues::setColor_toggle_unselected(QColor color)
{
    if (color_toggle_unselected_ == color)
        return;

    color_toggle_unselected_ = color;
    emit color_toggle_unselectedChanged();
}

qreal FxButtonColorValues::opacity()
{
    return opacity_;
}

void FxButtonColorValues::setOpacity(qreal opacity)
{
    if (opacity_ == opacity)
        return;

    opacity_ = opacity;
    emit opacityChanged();
}


// FxButtonContainerValues


FxButtonContainerValues::FxButtonContainerValues(QObject *parent)
    : FxButtonColorValues{parent}
    , state_layer_{this}
{
    // Intentionally left empty;
}

int FxButtonContainerValues::elevation()
{
    return elevation_;
}

void FxButtonContainerValues::setElevation(int elevation)
{
    if (elevation_ == elevation)
        return;

    elevation_ = elevation;
    emit elevationChanged();
}

FxButtonColorValues *FxButtonContainerValues::stateLayer()
{
    return &state_layer_;
}


//FxButtonVariantElements


FxButtonVariantElements::FxButtonVariantElements(QObject *parent)
    : QObject{parent}
    , container_{this}
    , icon_{this}
    , label_{this}
    , outline_{this}
{
    // Intentionally left empty
}

FxButtonContainerValues *FxButtonVariantElements::container()
{
    return &container_;
}

FxButtonColorValues *FxButtonVariantElements::icon()
{
    return &icon_;
}

FxButtonColorValues *FxButtonVariantElements::label()
{
    return &label_;
}

FxButtonColorValues *FxButtonVariantElements::outline()
{
    return &outline_;
}
