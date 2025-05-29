#include "fx_container_specification.h"

FxContainerSpecification::FxContainerSpecification(QObject *parent)
    : QObject{parent}
    , color_(new FxSpecColor(this))
    , elevation_(new FxSpecInteger(this))
    , opacity_(new FxSpecFloat(this))
    , outline_color_(new FxSpecColor(this))
    , outline_width_(new FxSpecInteger(this))
{
    color_->setDefaultValue(QColor(Qt::white));
    outline_color_->setDefaultValue(QColor(Qt::transparent));
    outline_width_->setDefaultValue(0);

    elevation_->setDefaultValue(0);

    opacity_->setDefaultValue(1);
    opacity_->setDisabled(0.12);
}

FxContainerSpecification::~FxContainerSpecification()
{
    delete color_;
    delete elevation_;
    delete opacity_;
    delete outline_color_;
}

FxSpecColor *FxContainerSpecification::color() const
{
    return color_;
}

FxSpecInteger *FxContainerSpecification::elevation() const
{
    return elevation_;
}

FxSpecFloat *FxContainerSpecification::opacity() const
{
    return opacity_;
}

FxSpecColor *FxContainerSpecification::outlineColor() const
{
    return outline_color_;
}

FxSpecInteger *FxContainerSpecification::outlineWidth() const
{
    return outline_width_;
}

FxShapeToken *FxContainerSpecification::shapeToken() const
{
    return shape_token_;
}

void FxContainerSpecification::setShapeToken(FxShapeToken *token)
{
    if (shape_token_ == token)
        return;

    shape_token_ = token;
    emit shapeTokenChanged();
}

QString FxContainerSpecification::state()
{
    return state_;
}

void FxContainerSpecification::setState(const QString &state)
{
    if (state_ == state)
        return;

    state_ = state;
    color_->setState(state_);
    elevation_->setState(state_);
    opacity_->setState(state_);
    outline_color_->setState(state_);
    outline_width_->setState(state_);

    emit stateChanged();
}
