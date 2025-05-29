#ifndef FX_SPEC_COLOR_H
#define FX_SPEC_COLOR_H

#include <QColor>
#include <QObject>
#include <QMap>
#include <QString>
#include <QQmlEngine>

class FxSpecColor : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QColor enabled READ enabled WRITE setEnabled NOTIFY enabledChanged FINAL)
    Q_PROPERTY(QColor defaultValue READ defaultValue WRITE setDefaultValue NOTIFY defaultValueChanged FINAL)
    Q_PROPERTY(QColor disabled READ disabled WRITE setDisabled NOTIFY disabledChanged FINAL)
    Q_PROPERTY(QColor hovered READ hovered WRITE setHovered NOTIFY hoveredChanged FINAL)
    Q_PROPERTY(QColor focused READ focused WRITE setFocused NOTIFY focusedChanged FINAL)
    Q_PROPERTY(QColor pressed READ pressed WRITE setPressed NOTIFY pressedChanged FINAL)
    Q_PROPERTY(QColor value READ value NOTIFY valueChanged FINAL)
    QML_ELEMENT
public:

    // Constructors.

    explicit FxSpecColor(QObject *parent = nullptr);

    // QML properties exposing methods.

    QColor enabled();
    void setEnabled(QColor enabled_value);

    QColor defaultValue();
    void setDefaultValue(QColor default_value);

    QColor disabled();
    void setDisabled(QColor disabled_value);

    QColor hovered();
    void setHovered(QColor hovered_value);

    QColor focused();
    void setFocused(QColor focused_value);

    QColor pressed();
    void setPressed(QColor pressed_value);

    QColor value();

    // Public methods.

    QString state();
    void setState(const QString &state);

private:
    QMap<QString, QColor> data_;
    QColor default_value_;
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

#endif // FX_SPEC_COLOR_H
