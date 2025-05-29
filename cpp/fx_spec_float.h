#ifndef FX_SPEC_FLOAT_H
#define FX_SPEC_FLOAT_H

#include <QObject>
#include <QMap>
#include <QString>
#include <QQmlEngine>

class FxSpecFloat : public QObject
{
    Q_OBJECT
    Q_PROPERTY(float enabled READ enabled WRITE setEnabled NOTIFY enabledChanged FINAL)
    Q_PROPERTY(float defaultValue READ defaultValue WRITE setDefaultValue NOTIFY defaultValueChanged FINAL)
    Q_PROPERTY(float disabled READ disabled WRITE setDisabled NOTIFY disabledChanged FINAL)
    Q_PROPERTY(float hovered READ hovered WRITE setHovered NOTIFY hoveredChanged FINAL)
    Q_PROPERTY(float focused READ focused WRITE setFocused NOTIFY focusedChanged FINAL)
    Q_PROPERTY(float pressed READ pressed WRITE setPressed NOTIFY pressedChanged FINAL)
    Q_PROPERTY(float value READ value NOTIFY valueChanged FINAL)
    QML_ELEMENT
public:

    // Constructors.

    explicit FxSpecFloat(QObject *parent = nullptr);

    // QML properties exposing methods.

    float enabled();
    void setEnabled(float enabled_value);

    float defaultValue();
    void setDefaultValue(float default_value);

    float disabled();
    void setDisabled(float disabled_value);

    float hovered();
    void setHovered(float hovered_value);

    float focused();
    void setFocused(float focused_value);

    float pressed();
    void setPressed(float pressed_value);

    float value();

    // Public methods.

    QString state();
    void setState(const QString &state);

private:
    QMap<QString, float> data_;
    float default_value_;
    QString state_;

signals:
    void enabledChanged();
    void defaultValueChanged();
    void disabledChanged();
    void hoveredChanged();
    void focusedChanged();
    void pressedChanged();
    void valueChanged();
};

#endif // FX_SPEC_FLOAT_H
