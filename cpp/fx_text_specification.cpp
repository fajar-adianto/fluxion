#include "fx_text_specification.h"

FxTextSpecification::FxTextSpecification(QObject *parent)
    : QObject{parent}
    , color_(new FxSpecColor(this))
    , opacity_(new FxSpecFloat(this))
{
    color_->setDefaultValue(QColor(Qt::black));

    opacity_->setDefaultValue(1);
    opacity_->setDisabled(0.38);
}

FxTextSpecification::~FxTextSpecification()
{
    delete color_;
    delete opacity_;
}

FxSpecColor *FxTextSpecification::color() const
{
    return color_;
}

FxSpecFloat *FxTextSpecification::opacity() const
{
    return opacity_;
}

QString FxTextSpecification::state()
{
    return state_;
}

void FxTextSpecification::setState(const QString &state)
{
    if (state_ == state)
        return;

    state_ = state;
    color_->setState(state_);
    opacity_->setState(state_);

    emit stateChanged();
}

FxTypeScaleToken *FxTextSpecification::typeScaleToken()
{
    return type_scale_token_;
}

void FxTextSpecification::setTypeScaleToken(FxTypeScaleToken *token)
{
    if (type_scale_token_ == token)
        return;

    type_scale_token_ = token;
    emit typeScaleTokenChanged();
}
