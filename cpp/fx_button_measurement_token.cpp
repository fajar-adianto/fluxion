#include "fx_button_measurement_token.h"


// FxButtonMeasurementToken


FxButtonMeasurementToken::FxButtonMeasurementToken(QObject *parent)
    : QObject{parent}
    , height_(0.0)
    , icon_size_(0.0)
    , outline_width_(0)
    , selected_container_shape_{this}
    , shape_{this}
    , size_config_(SizeConfig::Small)
    , space_{this}
    , type_scale_token_(nullptr)
{
    // Intentionally left empty.
}

qreal FxButtonMeasurementToken::height()
{
    return height_;
}

void FxButtonMeasurementToken::setHeight(qreal height)
{
    if (height_ == height)
        return;

    height_ = height;
    emit heightChanged();
}

qreal FxButtonMeasurementToken::iconSize()
{
    return icon_size_;
}

void FxButtonMeasurementToken::setIconSize(qreal icon_size)
{
    if (icon_size_ == icon_size)
        return;

    icon_size_ = icon_size;
    emit iconSizeChanged();
}

int FxButtonMeasurementToken::outlineWidth()
{
    return outline_width_;
}

void FxButtonMeasurementToken::setOutlineWidth(int width)
{
    if (outline_width_ == width)
        return;

    outline_width_ = width;
    emit outlineWidthChanged();
}

FxButtonShapeTokens *FxButtonMeasurementToken::selectedContainerShape()
{
    return &selected_container_shape_;
}

FxButtonShapeTokens *FxButtonMeasurementToken::shape()
{
    return &shape_;
}

FxButtonMeasurementToken::SizeConfig FxButtonMeasurementToken::sizeConfig()
{
    return size_config_;
}

void FxButtonMeasurementToken::setSizeConfig(SizeConfig size_config)
{
    if (size_config_ == size_config)
        return;

    size_config_ = size_config;
    emit sizeConfigChanged();
}

FxButtonSpaceValues *FxButtonMeasurementToken::space()
{
    return &space_;
}

FxTypeScaleToken *FxButtonMeasurementToken::typeScaleToken()
{
    return type_scale_token_;
}

void FxButtonMeasurementToken::setTypeScaleToken(FxTypeScaleToken *token)
{
    if (token == nullptr)
        return;

    if (type_scale_token_ == token)
        return;

    type_scale_token_ = token;
    emit typeScaleTokenChanged();
}


// FxIconButtonMeasurementToken


FxIconButtonMeasurementToken::FxIconButtonMeasurementToken(QObject *parent)
    : FxButtonMeasurementToken{parent}
    , space_narrow_{this}
    , space_wide_{this}
{
    // Intentionally left empty.
}

FxButtonSpaceValues *FxIconButtonMeasurementToken::space_default()
{
    return space();
}

FxButtonSpaceValues *FxIconButtonMeasurementToken::space_narrow()
{
    return &space_narrow_;
}

FxButtonSpaceValues *FxIconButtonMeasurementToken::space_wide()
{
    return &space_wide_;
}


// FxButtonShapeTokens


FxButtonShapeTokens::FxButtonShapeTokens(QObject *parent)
    : QObject{parent}
    , pressed_morph_(nullptr)
    , round_(nullptr)
    , square_(nullptr)
{
    // Intentionally left empty.
}

FxShapeToken *FxButtonShapeTokens::pressedMorph()
{
    return pressed_morph_;
}

void FxButtonShapeTokens::setPressedMorph(FxShapeToken *token)
{
    if (token == nullptr)
        return;

    if (pressed_morph_ == token)
        return;

    pressed_morph_ = token;
    emit pressedMorphChanged();
}

FxShapeToken *FxButtonShapeTokens::round()
{
    return round_;
}

void FxButtonShapeTokens::setRound(FxShapeToken *token)
{
    if (token == nullptr)
        return;

    if (round_ == token)
        return;

    round_ = token;
    emit roundChanged();
}

FxShapeToken *FxButtonShapeTokens::square()
{
    return square_;
}

void FxButtonShapeTokens::setSquare(FxShapeToken *token)
{
    if (token == nullptr)
        return;

    if (square_ == token)
        return;

    square_ = token;
    emit squareChanged();
}


// FxButtonSpaceValues


FxButtonSpaceValues::FxButtonSpaceValues(QObject *parent)
    : QObject{parent}
    , inner_(0)
    , leading_(0)
    , trailing_(0)
{
    // Intentionally left empty.
}

qreal FxButtonSpaceValues::inner()
{
    return inner_;
}

void FxButtonSpaceValues::setInner(qreal space)
{
    if (inner_ == space)
        return;

    inner_ = space;
    emit innerChanged();
}

qreal FxButtonSpaceValues::leading()
{
    return leading_;
}

void FxButtonSpaceValues::setLeading(qreal space)
{
    if (leading_ == space)
        return;

    leading_ = space;
    emit leadingChanged();
}

qreal FxButtonSpaceValues::trailing()
{
    return trailing_;
}

void FxButtonSpaceValues::setTrailing(qreal space)
{
    if (trailing_ == space)
        return;

    trailing_ = space;
    emit trailingChanged();
}
