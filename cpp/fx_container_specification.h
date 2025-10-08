#ifndef FX_CONTAINER_SPECIFICATION_H
#define FX_CONTAINER_SPECIFICATION_H

#include "fx_motion_spring_token.h"
#include "fx_shape_token.h"
#include "fx_spec_color.h"
#include "fx_spec_float.h"
#include "fx_spec_integer.h"

class FxContainerSpecification : public QObject
{
    Q_OBJECT
    Q_PROPERTY(FxSpecColor* color READ color CONSTANT)
    Q_PROPERTY(FxSpecInteger* elevation READ elevation CONSTANT)
    Q_PROPERTY(FxSpecFloat* opacity READ opacity CONSTANT)
    Q_PROPERTY(FxSpecColor* outlineColor READ outlineColor CONSTANT)
    Q_PROPERTY(FxSpecInteger* outlineWidth READ outlineWidth CONSTANT)
    Q_PROPERTY(FxShapeToken* shapeToken READ shapeToken WRITE setShapeToken NOTIFY shapeTokenChanged FINAL)
    Q_PROPERTY(FxMotionSpringToken* springToken READ springToken WRITE setSpringToken NOTIFY springTokenChanged FINAL)
    Q_PROPERTY(QString state READ state WRITE setState NOTIFY stateChanged FINAL)
    QML_ELEMENT
public:
    explicit FxContainerSpecification(QObject *parent = nullptr);
    ~FxContainerSpecification();

    // QML properties exposing methods.

    FxSpecColor *color() const;
    FxSpecInteger *elevation() const;
    FxSpecFloat *opacity() const;
    FxSpecColor *outlineColor() const;
    FxSpecInteger *outlineWidth() const;

    FxShapeToken *shapeToken() const;
    void setShapeToken(FxShapeToken *token);

    FxMotionSpringToken *springToken() const;
    void setSpringToken(FxMotionSpringToken *token);

    QString state();
    void setState(const QString &state);

private:
    FxSpecColor *color_;
    FxSpecInteger *elevation_;
    FxSpecFloat *opacity_;
    FxSpecColor *outline_color_;
    FxSpecInteger *outline_width_;
    FxShapeToken *shape_token_;
    FxMotionSpringToken *spring_token_;

    QString state_;

signals:
    void shapeTokenChanged();
    void springTokenChanged();
    void stateChanged();
};

#endif // FX_CONTAINER_SPECIFICATION_H
