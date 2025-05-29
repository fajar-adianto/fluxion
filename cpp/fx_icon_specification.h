#ifndef FX_ICON_SPECIFICATION_H
#define FX_ICON_SPECIFICATION_H

#include "fx_spec_color.h"
#include "fx_spec_float.h"

class FxIconSpecification : public QObject
{
    Q_OBJECT
    Q_PROPERTY(FxSpecColor* color READ color CONSTANT)
    Q_PROPERTY(FxSpecFloat* opacity READ opacity CONSTANT)
    Q_PROPERTY(QString state READ state WRITE setState NOTIFY stateChanged FINAL)
    QML_ELEMENT
public:

    // Constructors.

    explicit FxIconSpecification(QObject *parent = nullptr);
    ~FxIconSpecification();

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

#endif // FX_ICON_SPECIFICATION_H
