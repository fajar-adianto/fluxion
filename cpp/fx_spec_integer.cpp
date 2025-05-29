#include "fx_spec_integer.h"

FxSpecInteger::FxSpecInteger(QObject *parent)
    : QObject{parent}
    , default_value_(0)
{
    // Intentionally left empty.
}

int FxSpecInteger::enabled()
{
    return data_.value("enabled");
}

void FxSpecInteger::setEnabled(int enabled_value)
{
    if (data_.value("enabled") == enabled_value)
        return;

    data_["enabled"] = enabled_value;
    emit enabledChanged();

    if (state_ == "enabled")
        emit valueChanged();
}

int FxSpecInteger::defaultValue()
{
    return default_value_;
}

void FxSpecInteger::setDefaultValue(int default_value)
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

int FxSpecInteger::disabled()
{
    return data_.value("disabled");
}

void FxSpecInteger::setDisabled(int disabled_value)
{
    if (data_.value("disabled") == disabled_value)
        return;

    data_["disabled"] = disabled_value;
    emit disabledChanged();

    if (state_ == "disabled")
        emit valueChanged();
}

int FxSpecInteger::hovered()
{
    return data_.value("hovered");
}

void FxSpecInteger::setHovered(int hovered_value)
{
    if (data_.value("hovered") == hovered_value)
        return;

    data_["hovered"] = hovered_value;
    emit hoveredChanged();

    if (state_ == "hovered")
        emit valueChanged();
}

int FxSpecInteger::focused()
{
    return data_.value("focused");
}

void FxSpecInteger::setFocused(int focused_value)
{
    if (data_.value("focused") == focused_value)
        return;

    data_["focused"] = focused_value;
    emit hoveredChanged();

    if (state_ == "focused")
        emit valueChanged();
}

int FxSpecInteger::pressed()
{
    return data_.value("pressed");
}

void FxSpecInteger::setPressed(int pressed_value)
{
    if (data_.value("pressed") == pressed_value)
        return;

    data_["pressed"] = pressed_value;
    emit hoveredChanged();

    if (state_ == "pressed")
        emit valueChanged();
}

int FxSpecInteger::value()
{
    if (data_.contains(state_))
        return data_.value(state_);
    else
        return default_value_;
}

QString FxSpecInteger::state()
{
    return state_;
}

void FxSpecInteger::setState(const QString &state)
{
    if (state_ == state)
        return;

    state_ = state;

    // State change means current value of this component property is changed.
    emit valueChanged();
}
