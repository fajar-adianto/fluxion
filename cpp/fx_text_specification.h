#ifndef FX_TEXT_SPECIFICATION_H
#define FX_TEXT_SPECIFICATION_H

#include "fx_spec_color.h"
#include "fx_spec_float.h"
#include "fx_type_scale_token.h"

class FxTextSpecification : public QObject
{
    Q_OBJECT
    Q_PROPERTY(FxSpecColor* color READ color CONSTANT)
    Q_PROPERTY(FxSpecFloat* opacity READ opacity CONSTANT)
    Q_PROPERTY(QString state READ state WRITE setState NOTIFY stateChanged FINAL)
    Q_PROPERTY(FxTypeScaleToken* typeScaleToken READ typeScaleToken WRITE setTypeScaleToken NOTIFY typeScaleTokenChanged FINAL)
    QML_ELEMENT
public:

    // Constructors.

    explicit FxTextSpecification(QObject *parent = nullptr);
    ~FxTextSpecification();

    // QML properties exposing methods.

    FxSpecColor *color() const;
    FxSpecFloat *opacity() const;

    QString state();
    void setState(const QString &state);

    FxTypeScaleToken *typeScaleToken();
    void setTypeScaleToken(FxTypeScaleToken *token);

private:
    FxSpecColor *color_;
    FxSpecFloat *opacity_;
    FxTypeScaleToken *type_scale_token_;

    QString state_;

signals:
    void stateChanged();
    void typeScaleTokenChanged();
};

#endif // FX_TEXT_SPECIFICATION_H
