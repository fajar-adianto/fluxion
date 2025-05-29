#include "fx_spec_color.h"

FxSpecColor::FxSpecColor(QObject *parent)
    : QObject{parent}
    , default_value_(QColor(Qt::white))
{
    // Intentionally left empty.
}

QColor FxSpecColor::enabled()
{
    return data_.value("enabled");
}

void FxSpecColor::setEnabled(QColor enabled_value)
{
    if (data_.value("enabled") == enabled_value)
        return;

    data_["enabled"] = enabled_value;
    emit enabledChanged();

    if (state_ == "enabled")
        emit valueChanged();
}

QColor FxSpecColor::defaultValue()
{
    return default_value_;
}

void FxSpecColor::setDefaultValue(QColor default_value)
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

QColor FxSpecColor::disabled()
{
    return data_.value("disabled");
}

void FxSpecColor::setDisabled(QColor disabled_value)
{
    if (data_.value("disabled") == disabled_value)
        return;

    data_["disabled"] = disabled_value;
    emit disabledChanged();

    if (state_ == "disabled")
        emit valueChanged();
}

QColor FxSpecColor::hovered()
{
    return data_.value("hovered");
}

void FxSpecColor::setHovered(QColor hovered_value)
{
    if (data_.value("hovered") == hovered_value)
        return;

    data_["hovered"] = hovered_value;
    emit hoveredChanged();

    if (state_ == "hovered")
        emit valueChanged();
}

QColor FxSpecColor::focused()
{
    return data_.value("focused");
}

void FxSpecColor::setFocused(QColor focused_value)
{
    if (data_.value("focused") == focused_value)
        return;

    data_["focused"] = focused_value;
    emit hoveredChanged();

    if (state_ == "focused")
        emit valueChanged();
}

QColor FxSpecColor::pressed()
{
    return data_.value("pressed");
}

void FxSpecColor::setPressed(QColor pressed_value)
{
    if (data_.value("pressed") == pressed_value)
        return;

    data_["pressed"] = pressed_value;
    emit hoveredChanged();

    if (state_ == "pressed")
        emit valueChanged();
}

QColor FxSpecColor::value()
{
    if (data_.contains(state_))
        return data_.value(state_);
    else
        return default_value_;
}

QString FxSpecColor::state()
{
    return state_;
}

void FxSpecColor::setState(const QString &state)
{
    if (state_ == state)
        return;

    state_ = state;

    // State change means current value of this component property is changed.
    emit valueChanged();
}
