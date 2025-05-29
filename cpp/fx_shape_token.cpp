#include "fx_shape_token.h"

FxShapeToken::FxShapeToken(QObject *parent)
    : QObject{parent}
    , corners_(new FxShapeCornerValues(this))
    , value_(0)
{
    directional_modifier_ = FxShapeToken::DirectionalModifier::None;
    role_ = FxShapeToken::Role::None;
}

FxShapeToken::~FxShapeToken()
{
    delete corners_;
}

FxShapeCornerValues *FxShapeToken::corners() const
{
    return corners_;
}

FxShapeToken::DirectionalModifier FxShapeToken::directionalModifier()
{
    return directional_modifier_;
}

void FxShapeToken::setDirectionalModifier(DirectionalModifier modifier)
{
    if (directional_modifier_ == modifier)
        return;

    directional_modifier_ = modifier;
    emit directionalModifierChanged();

    corners_->setDirectionalModifier(directional_modifier_);
}

FxShapeToken::Role FxShapeToken::role()
{
    return role_;
}

void FxShapeToken::setRole(Role role)
{
    if (role_ == role)
        return;

    role_ = role;
    emit roleChanged();
}

float FxShapeToken::value()
{
    return value_;
}

void FxShapeToken::setValue(float value)
{
    if (value_ == value)
        return;

    value_ = value;
    emit valueChanged();

    corners_->setValue(value_);
}


// Class FxShapeCornerValues

FxShapeCornerValues::FxShapeCornerValues(QObject *parent)
    : QObject{parent}
    , value_(0)
{
    directional_modifier_ = FxShapeToken::DirectionalModifier::None;
}

float FxShapeCornerValues::bottomLeft()
{
    if (directional_modifier_ == FxShapeToken::DirectionalModifier::Top ||
        directional_modifier_ == FxShapeToken::DirectionalModifier::End)
        return 0;
    else
        return value_;
}

float FxShapeCornerValues::bottomRight()
{
    if (directional_modifier_ == FxShapeToken::DirectionalModifier::Top ||
        directional_modifier_ == FxShapeToken::DirectionalModifier::Start)
        return 0;
    else
        return value_;
}

float FxShapeCornerValues::topLeft()
{
    if (directional_modifier_ == FxShapeToken::DirectionalModifier::Bottom ||
        directional_modifier_ == FxShapeToken::DirectionalModifier::End)
        return 0;
    else
        return value_;
}

float FxShapeCornerValues::topRight()
{
    if (directional_modifier_ == FxShapeToken::DirectionalModifier::Bottom ||
        directional_modifier_ == FxShapeToken::DirectionalModifier::Start)
        return 0;
    else
        return value_;
}

FxShapeToken::DirectionalModifier FxShapeCornerValues::directionalModifier()
{
    return directional_modifier_;
}

void FxShapeCornerValues::setDirectionalModifier(FxShapeToken::DirectionalModifier directional_modifier)
{
    directional_modifier_ = directional_modifier;

    // Directional-modifier change might means values of each corners are changed.
    emit bottomLeftChanged();
    emit bottomRightChanged();
    emit topLeftChanged();
    emit topRightChanged();
}

float FxShapeCornerValues::value()
{
    return value_;
}

void FxShapeCornerValues::setValue(float value)
{
    value_ = value;
}
