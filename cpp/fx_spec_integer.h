#ifndef FX_SPEC_INTEGER_H
#define FX_SPEC_INTEGER_H

#include <QObject>
#include <QMap>
#include <QString>
#include <QQmlEngine>

class FxSpecInteger : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int enabled READ enabled WRITE setEnabled NOTIFY enabledChanged FINAL)
    Q_PROPERTY(int defaultValue READ defaultValue WRITE setDefaultValue NOTIFY defaultValueChanged FINAL)
    Q_PROPERTY(int disabled READ disabled WRITE setDisabled NOTIFY disabledChanged FINAL)
    Q_PROPERTY(int hovered READ hovered WRITE setHovered NOTIFY hoveredChanged FINAL)
    Q_PROPERTY(int focused READ focused WRITE setFocused NOTIFY focusedChanged FINAL)
    Q_PROPERTY(int pressed READ pressed WRITE setPressed NOTIFY pressedChanged FINAL)
    Q_PROPERTY(int value READ value NOTIFY valueChanged FINAL)
    QML_ELEMENT
public:

    // Constructors.

    explicit FxSpecInteger(QObject *parent = nullptr);

    // QML properties exposing methods.

    int enabled();
    void setEnabled(int enabled_value);

    int defaultValue();
    void setDefaultValue(int default_value);

    int disabled();
    void setDisabled(int disabled_value);

    int hovered();
    void setHovered(int hovered_value);

    int focused();
    void setFocused(int focused_value);

    int pressed();
    void setPressed(int pressed_value);

    int value();

    // Public methods.

    QString state();
    void setState(const QString &state);

private:
    QMap<QString, int> data_;
    int default_value_;
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

#endif // FX_SPEC_INTEGER_H
