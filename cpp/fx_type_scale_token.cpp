#include "fx_type_scale_token.h"

FxTypeScaleToken::FxTypeScaleToken(QObject *parent)
    : QObject{parent}
{
    // Intentionally left empty.
}

QFont FxTypeScaleToken::font()
{
    return font_;
}

QString FxTypeScaleToken::fontName()
{
    return font_.family();
}

void FxTypeScaleToken::setFontName(const QString &font_name)
{
    if (font_.family() == font_name)
        return;

    font_.setFamily(font_name);
    emit fontNameChanged();
}

int FxTypeScaleToken::lineHeight()
{
    return line_height_;
}

void FxTypeScaleToken::setLineHeight(int height)
{
    if (line_height_ == height)
        return;

    line_height_ = height;
    emit lineHeightChanged();
}

FxTypeScaleToken::Role FxTypeScaleToken::role()
{
    return role_;
}

void FxTypeScaleToken::setRole(Role role)
{
    if (role_ == role)
        return;

    role_ = role;
    emit roleChanged();
}

FxTypeScaleToken::Scale FxTypeScaleToken::scale()
{
    return scale_;
}

void FxTypeScaleToken::setScale(Scale scale)
{
    if (scale_ == scale)
        return;

    scale_ = scale;
    emit scaleChanged();
}

int FxTypeScaleToken::size()
{
    return font_.pixelSize();
}

void FxTypeScaleToken::setSize(int size)
{
    if (font_.pixelSize() == size)
        return;

    font_.setPixelSize(size);
    emit sizeChanged();
}

qreal FxTypeScaleToken::tracking()
{
    return font_.letterSpacing();
}

void FxTypeScaleToken::setTracking(qreal tracking)
{
    // Material Design 3 uses point for tracking value.
    // Meanwhile, QFont's letterSpacing uses pixel or pecentage.
    // We use point-to-pixel coefficient of 1.333 here.
    qreal point_to_pixel = 1.333;

    qreal tracking_pixel = tracking * point_to_pixel;

    if (font_.letterSpacing() == tracking_pixel)
        return;

    font_.setLetterSpacing(QFont::AbsoluteSpacing, tracking_pixel);
    emit trackingChanged();
}

QFont::Weight FxTypeScaleToken::weight()
{
    return font_.weight();
}

void FxTypeScaleToken::setWeight(QFont::Weight weight)
{
    if (font_.weight() == weight)
        return;

    font_.setWeight(weight);
    emit weightChanged();
}
