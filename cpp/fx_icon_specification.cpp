#include "fx_icon_specification.h"

FxIconSpecification::FxIconSpecification(QObject *parent)
    : QObject{parent}
    , color_(new FxSpecColor(this))
    , opacity_(new FxSpecFloat(this))
{
    color_->setDefaultValue(QColor(Qt::white));

    opacity_->setDefaultValue(1);
    opacity_->setDisabled(0.38);
}

FxIconSpecification::~FxIconSpecification()
{
    delete color_;
    delete opacity_;
}

FxSpecColor *FxIconSpecification::color() const
{
    return color_;
}

FxSpecFloat *FxIconSpecification::opacity() const
{
    return opacity_;
}

QString FxIconSpecification::state()
{
    return state_;
}

void FxIconSpecification::setState(const QString &state)
{
    if (state_ == state)
        return;

    state_ = state;
    color_->setState(state_);
    opacity_->setState(state_);

    emit stateChanged();
}
