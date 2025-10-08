#include "fx_motion_spring_token.h"

FxMotionSpringToken::FxMotionSpringToken(QObject *parent)
    : QObject{parent}
{
    // Intentionally left empty.
}

qreal FxMotionSpringToken::damping()
{
    return damping_;
}

void FxMotionSpringToken::setDamping(qreal damping)
{
    if (damping_ == damping)
        return;

    damping_ = damping;
    emit dampingChanged();
}

qreal FxMotionSpringToken::dampingForAnimation()
{
    // Damping must be adjusted for Qt6 QML SpringAnimation.
    // This formula is empirical through trials & errors.

    qreal animation_damping = (0.25 * damping_);

    return std::clamp(animation_damping, 0.0, 1.0);
}

FxMotionSpringToken::Movement FxMotionSpringToken::movement()
{
    return movement_;
}

void FxMotionSpringToken::setMovement(Movement movement)
{
    if (movement_ == movement)
        return;

    movement_ = movement;
    emit movementChanged();
}

FxMotionSpringToken::Speed FxMotionSpringToken::speed()
{
    return speed_;
}

void FxMotionSpringToken::setSpeed(Speed speed)
{
    if (speed_ == speed)
        return;

    speed_ = speed;
    emit speedChanged();
}

qreal FxMotionSpringToken::stiffness()
{
    return stiffness_;
}

void FxMotionSpringToken::setStiffness(qreal stiffness)
{
    if (stiffness_ == stiffness)
        return;

    stiffness_ = stiffness;
    emit stiffnessChanged();
}

qreal FxMotionSpringToken::stiffnessForAnimation()
{
    // Stiffness must be adjusted for Qt6 QML SpringAnimation.
    // This formula is empirical through trials & errors.
    qreal animation_stiffness = -(3.42e-7 * stiffness_ * stiffness_) + (0.00216 * stiffness_) + 1.482;
    return std::clamp(animation_stiffness, 0.0, 5.0);
}

