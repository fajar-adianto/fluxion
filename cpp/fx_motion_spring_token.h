#ifndef FX_MOTION_SPRING_TOKEN_H
#define FX_MOTION_SPRING_TOKEN_H

#include <QObject>
#include <QQmlEngine>

class FxMotionSpringToken : public QObject
{
    Q_OBJECT
    Q_PROPERTY(qreal damping READ damping WRITE setDamping NOTIFY dampingChanged FINAL)
    Q_PROPERTY(qreal dampingForAnimation READ dampingForAnimation CONSTANT)
    Q_PROPERTY(FxMotionSpringToken::Movement movement READ movement WRITE setMovement NOTIFY movementChanged FINAL)
    Q_PROPERTY(FxMotionSpringToken::Speed speed READ speed WRITE setSpeed NOTIFY speedChanged FINAL)
    Q_PROPERTY(qreal stiffness READ stiffness WRITE setStiffness NOTIFY stiffnessChanged FINAL)
    Q_PROPERTY(qreal stiffnessForAnimation READ stiffnessForAnimation CONSTANT)
    QML_ELEMENT
public:

    // Enums.

    enum class Movement {
        Spatial,
        Effects
    };
    Q_ENUM(Movement)

    enum class Speed {
        Default,
        Fast,
        Slow
    };
    Q_ENUM(Speed)

    explicit FxMotionSpringToken(QObject *parent = nullptr);

    // QML property exposing methods.

    qreal damping();
    void setDamping(qreal damping);

    qreal dampingForAnimation();

    FxMotionSpringToken::Movement movement();
    void setMovement(FxMotionSpringToken::Movement movement);

    FxMotionSpringToken::Speed speed();
    void setSpeed(FxMotionSpringToken::Speed speed);

    qreal stiffness();
    void setStiffness(qreal stiffness);

    qreal stiffnessForAnimation();

private:
    qreal damping_;
    FxMotionSpringToken::Movement movement_;
    FxMotionSpringToken::Speed speed_;
    qreal stiffness_;

signals:
    void dampingChanged();
    void movementChanged();
    void speedChanged();
    void stiffnessChanged();
};

#endif // FX_MOTION_SPRING_TOKEN_H
