#include "fx_state_layer_specification.h"

FxStateLayerSpecification::FxStateLayerSpecification(QObject *parent)
    : QObject{parent}
    , color_(new FxSpecColor(this))
    , opacity_(new FxSpecFloat(this))
{
    color_->setDefaultValue(QColor(Qt::transparent));
    opacity_->setDefaultValue(0.08);
}

FxStateLayerSpecification::~FxStateLayerSpecification()
{
    delete color_;
    delete opacity_;
}

FxSpecColor *FxStateLayerSpecification::color() const
{
    return color_;
}

FxSpecFloat *FxStateLayerSpecification::opacity() const
{
    return opacity_;
}

QString FxStateLayerSpecification::state()
{
    return state_;
}

void FxStateLayerSpecification::setState(const QString &state)
{
    if (state_ == state)
        return;

    state_ = state;
    color_->setState(state_);
    opacity_->setState(state_);

    emit stateChanged();
}
