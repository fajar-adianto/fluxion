#ifndef FX_BUTTON_VARIANT_TOKEN_H
#define FX_BUTTON_VARIANT_TOKEN_H

#include <QColor>
#include <QObject>
#include <QQmlEngine>

/// Utility classes.

// FxButtonColorValues

class FxButtonColorValues : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QColor color READ color WRITE setColor NOTIFY colorChanged FINAL)
    Q_PROPERTY(QColor color_toggle_selected READ color_toggle_selected WRITE setColor_toggle_selected NOTIFY color_toggle_selectedChanged FINAL)
    Q_PROPERTY(QColor color_toggle_unselected READ color_toggle_unselected WRITE setColor_toggle_unselected NOTIFY color_toggle_unselectedChanged FINAL)
    Q_PROPERTY(qreal opacity READ opacity WRITE setOpacity NOTIFY opacityChanged FINAL)
    QML_ANONYMOUS
public:

    // Constructors.

    explicit FxButtonColorValues(QObject *parent = nullptr);

    // QML property exposing methods.

    QColor color();
    void setColor(QColor color);

    QColor color_toggle_selected();
    void setColor_toggle_selected(QColor color);

    QColor color_toggle_unselected();
    void setColor_toggle_unselected(QColor color);

    qreal opacity();
    void setOpacity(qreal opacity);

private:
    QColor color_;
    QColor color_toggle_selected_;
    QColor color_toggle_unselected_;
    qreal opacity_;

signals:
    void colorChanged();
    void color_toggle_selectedChanged();
    void color_toggle_unselectedChanged();
    void opacityChanged();
};


// FxButtonContainerValues


class FxButtonContainerValues : public FxButtonColorValues
{
    Q_OBJECT
    Q_PROPERTY(int elevation READ elevation WRITE setElevation NOTIFY elevationChanged FINAL)
    Q_PROPERTY(FxButtonColorValues* stateLayer READ stateLayer CONSTANT)
    QML_ANONYMOUS
public:

    // Constructors.

    explicit FxButtonContainerValues(QObject *parent = nullptr);

    // QML property exposing methods.

    int elevation();
    void setElevation(int elevation);

    FxButtonColorValues *stateLayer();

private:
    int elevation_;
    FxButtonColorValues state_layer_;

signals:
    void elevationChanged();
};


// FxButtonVariantElements


class FxButtonVariantElements : public QObject
{
    Q_OBJECT
    Q_PROPERTY(FxButtonContainerValues* container READ container CONSTANT)
    Q_PROPERTY(FxButtonColorValues* icon READ icon CONSTANT)
    Q_PROPERTY(FxButtonColorValues* label READ label CONSTANT)
    Q_PROPERTY(FxButtonColorValues* outline READ outline CONSTANT)
    QML_ANONYMOUS
public:

    // Constructors.

    explicit FxButtonVariantElements(QObject *parent = nullptr);

    // QML property exposing methods.

    FxButtonContainerValues *container();
    FxButtonColorValues *icon();
    FxButtonColorValues *label();
    FxButtonColorValues *outline();

private:
    FxButtonContainerValues container_;
    FxButtonColorValues icon_;
    FxButtonColorValues label_;
    FxButtonColorValues outline_;
};



/// Main classes.

class FxButtonVariantToken : public QObject
{
    Q_OBJECT
    Q_PROPERTY(FxButtonVariantToken::ColorConfig colorConfig READ colorConfig WRITE setColorConfig NOTIFY colorConfigChanged FINAL)
    Q_PROPERTY(FxButtonVariantElements* disabled READ disabled CONSTANT)
    Q_PROPERTY(FxButtonVariantElements* enabled READ enabled CONSTANT)
    Q_PROPERTY(FxButtonVariantElements* focused READ focused CONSTANT)
    Q_PROPERTY(FxButtonVariantElements* hovered READ hovered CONSTANT)
    Q_PROPERTY(FxButtonVariantElements* pressed READ pressed CONSTANT)
    Q_PROPERTY(QColor shadowColor READ shadowColor WRITE setShadowColor NOTIFY shadowColorChanged FINAL)
    QML_ELEMENT
public:

    // Enums.

    enum class ColorConfig {
        Elevated,
        Filled,
        Tonal,
        Outlined,
        Text
    };
    Q_ENUM(ColorConfig)

    // Constructor.

    explicit FxButtonVariantToken(QObject *parent = nullptr);

    // QML property exposing methods.

    FxButtonVariantToken::ColorConfig colorConfig();
    void setColorConfig(FxButtonVariantToken::ColorConfig color_config);

    FxButtonVariantElements *disabled();
    FxButtonVariantElements *enabled();
    FxButtonVariantElements *focused();
    FxButtonVariantElements *hovered();
    FxButtonVariantElements *pressed();

    QColor shadowColor();
    void setShadowColor(QColor color);

private:
    FxButtonVariantToken::ColorConfig color_config_;
    FxButtonVariantElements disabled_;
    FxButtonVariantElements enabled_;
    FxButtonVariantElements focused_;
    FxButtonVariantElements hovered_;
    FxButtonVariantElements pressed_;
    QColor shadow_color_;

signals:
    void colorConfigChanged();
    void shadowColorChanged();
};


class FxIconButtonVariantToken : public FxButtonVariantToken
{
    Q_OBJECT
    QML_ELEMENT
public:

    // Enums.

    enum class ColorConfig {
        Elevated = static_cast<int>(FxButtonVariantToken::ColorConfig::Elevated), // MD3 Expressive update doesn't include Elevated Icon Button. Fluxion still allows it.
        Filled = static_cast<int>(FxButtonVariantToken::ColorConfig::Filled),
        Tonal,
        Outlined,
        Standard
    };
    Q_ENUM(ColorConfig)

    // Constructor.

    explicit FxIconButtonVariantToken(QObject *parent = nullptr);
};

#endif // FX_BUTTON_VARIANT_TOKEN_H
