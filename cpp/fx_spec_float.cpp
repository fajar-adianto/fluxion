#include "fx_spec_float.h"

FxSpecFloat::FxSpecFloat(QObject *parent)
    : QObject{parent}
    , default_value_(0)
{
    // Intentionally left empty.
}

float FxSpecFloat::enabled()
{
    return data_.value("enabled");
}

void FxSpecFloat::setEnabled(float enabled_value)
{
    if (data_.value("enabled") == enabled_value)
        return;

    data_["enabled"] = enabled_value;
    emit enabledChanged();

    if (state_ == "enabled")
        emit valueChanged();
}

float FxSpecFloat::defaultValue()
{
    return default_value_;
}

void FxSpecFloat::setDefaultValue(float default_value)
{
    if (default_value_ == default_value)
        return;

    default_value_ = default_value;
    emit defaultValueChanged();

    // If (data_) does not contain current state then the default value is used.
    // So, if the default value is changed in this condition, value change notification must be emitted.
    if (!data_.contains(state_))
        emit valueChanged();
}

float FxSpecFloat::disabled()
{
    return data_.value("disabled");
}

void FxSpecFloat::setDisabled(float disabled_value)
{
    if (data_.value("disabled") == disabled_value)
        return;

    data_["disabled"] = disabled_value;
    emit disabledChanged();

    if (state_ == "disabled")
        emit valueChanged();
}

float FxSpecFloat::hovered()
{
    return data_.value("hovered");
}

void FxSpecFloat::setHovered(float hovered_value)
{
    if (data_.value("hovered") == hovered_value)
        return;

    data_["hovered"] = hovered_value;
    emit hoveredChanged();

    if (state_ == "hovered")
        emit valueChanged();
}

float FxSpecFloat::focused()
{
    return data_.value("focused");
}

void FxSpecFloat::setFocused(float focused_value)
{
    if (data_.value("focused") == focused_value)
        return;

    data_["focused"] = focused_value;
    emit hoveredChanged();

    if (state_ == "focused")
        emit valueChanged();
}

float FxSpecFloat::pressed()
{
    return data_.value("pressed");
}

void FxSpecFloat::setPressed(float pressed_value)
{
    if (data_.value("pressed") == pressed_value)
        return;

    data_["pressed"] = pressed_value;
    emit hoveredChanged();

    if (state_ == "pressed")
        emit valueChanged();
}

float FxSpecFloat::value()
{
    if (data_.contains(state_))
        return data_.value(state_);
    else
        return default_value_;
}

QString FxSpecFloat::state()
{
    return state_;
}

void FxSpecFloat::setState(const QString &state)
{
    if (state_ == state)
        return;

    state_ = state;

    // State change means current value of this component property is changed.
    emit valueChanged();
}
