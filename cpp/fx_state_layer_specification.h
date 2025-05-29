#ifndef FX_STATE_LAYER_SPECIFICATION_H
#define FX_STATE_LAYER_SPECIFICATION_H

#include "fx_spec_color.h"
#include "fx_spec_float.h"

class FxStateLayerSpecification : public QObject
{
    Q_OBJECT
    Q_PROPERTY(FxSpecColor* color READ color CONSTANT)
    Q_PROPERTY(FxSpecFloat* opacity READ opacity CONSTANT)
    Q_PROPERTY(QString state READ state WRITE setState NOTIFY stateChanged FINAL)
    QML_ELEMENT
public:
    explicit FxStateLayerSpecification(QObject *parent = nullptr);
    ~FxStateLayerSpecification();

    // QML properties exposing methods.

    FxSpecColor *color() const;
    FxSpecFloat *opacity() const;

    QString state();
    void setState(const QString &state);

private:
    FxSpecColor *color_;
    FxSpecFloat *opacity_;

    QString state_;

signals:
    void stateChanged();
};

#endif // FX_STATE_LAYER_SPECIFICATION_H
