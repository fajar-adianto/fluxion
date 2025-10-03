#ifndef FX_BUTTON_MEASUREMENT_TOKEN_H
#define FX_BUTTON_MEASUREMENT_TOKEN_H

#include <QObject>
#include <QQmlEngine>

#include "fx_shape_token.h"
#include "fx_type_scale_token.h"

/// Utility classes.

// FxButtonShapeTokens

class FxButtonShapeTokens : public QObject
{
    Q_OBJECT
    Q_PROPERTY(FxShapeToken* pressedMorph READ pressedMorph WRITE setPressedMorph NOTIFY pressedMorphChanged FINAL)
    Q_PROPERTY(FxShapeToken* round READ round WRITE setRound NOTIFY roundChanged FINAL)
    Q_PROPERTY(FxShapeToken* square READ square WRITE setSquare NOTIFY squareChanged FINAL)
    QML_ANONYMOUS
public:

    // Constructors.

    explicit FxButtonShapeTokens(QObject *parent = nullptr);

    // QML property exposing methods.

    FxShapeToken *pressedMorph();
    void setPressedMorph(FxShapeToken *token);

    FxShapeToken *round();
    void setRound(FxShapeToken *token);

    FxShapeToken *square();
    void setSquare(FxShapeToken *token);

private:
    FxShapeToken *pressed_morph_;
    FxShapeToken *round_;
    FxShapeToken *square_;

signals:
    void pressedMorphChanged();
    void roundChanged();
    void squareChanged();
};


// FxButtonSpaceValues


class FxButtonSpaceValues : public QObject
{
    Q_OBJECT
    Q_PROPERTY(qreal inner READ inner WRITE setInner NOTIFY innerChanged FINAL)
    Q_PROPERTY(qreal leading READ leading WRITE setLeading NOTIFY leadingChanged FINAL)
    Q_PROPERTY(qreal trailing READ trailing WRITE setTrailing NOTIFY trailingChanged FINAL)
    QML_ANONYMOUS
public:

    // Constructors.

    explicit FxButtonSpaceValues(QObject *parent = nullptr);

    // QML property exposing methods.

    qreal inner();
    void setInner(qreal space);

    qreal leading();
    void setLeading(qreal space);

    qreal trailing();
    void setTrailing(qreal space);

private:
    qreal inner_;
    qreal leading_;
    qreal trailing_;

signals:
    void innerChanged();
    void leadingChanged();
    void trailingChanged();
};


/// Main classes.

// FxButtonMeasurementToken

class FxButtonMeasurementToken : public QObject
{
    Q_OBJECT
    Q_PROPERTY(qreal height READ height WRITE setHeight NOTIFY heightChanged FINAL)
    Q_PROPERTY(qreal iconSize READ iconSize WRITE setIconSize NOTIFY iconSizeChanged FINAL)
    Q_PROPERTY(int outlineWidth READ outlineWidth WRITE setOutlineWidth NOTIFY outlineWidthChanged FINAL)
    Q_PROPERTY(FxButtonShapeTokens* selectedContainerShape READ selectedContainerShape CONSTANT)
    Q_PROPERTY(FxButtonShapeTokens* shape READ shape CONSTANT)
    Q_PROPERTY(FxButtonMeasurementToken::SizeConfig sizeConfig READ sizeConfig WRITE setSizeConfig NOTIFY sizeConfigChanged FINAL)
    Q_PROPERTY(FxButtonSpaceValues* space READ space CONSTANT)
    Q_PROPERTY(FxTypeScaleToken* typeScaleToken READ typeScaleToken WRITE setTypeScaleToken NOTIFY typeScaleTokenChanged FINAL)
    QML_ELEMENT
public:

    // Enums.

    enum class SizeConfig {
        ExtraSmall,
        Small,
        Medium,
        Large,
        ExtraLarge
    };
    Q_ENUM(SizeConfig)

    // Constructors.

    explicit FxButtonMeasurementToken(QObject *parent = nullptr);

    // QML property exposing methods.

    qreal height();
    void setHeight(qreal height);

    qreal iconSize();
    void setIconSize(qreal icon_size);

    int outlineWidth();
    void setOutlineWidth(int width);

    FxButtonShapeTokens *selectedContainerShape();

    FxButtonShapeTokens *shape();

    FxButtonMeasurementToken::SizeConfig sizeConfig();
    void setSizeConfig(FxButtonMeasurementToken::SizeConfig size_config);

    FxButtonSpaceValues *space();

    FxTypeScaleToken *typeScaleToken();
    void setTypeScaleToken(FxTypeScaleToken *token);

private:
    qreal height_;
    qreal icon_size_;
    int outline_width_;
    FxButtonShapeTokens selected_container_shape_;
    FxButtonShapeTokens shape_;
    FxButtonMeasurementToken::SizeConfig size_config_;
    FxButtonSpaceValues space_;
    FxTypeScaleToken *type_scale_token_;

signals:
    void heightChanged();
    void iconSizeChanged();
    void outlineWidthChanged();
    void sizeConfigChanged();
    void typeScaleTokenChanged();
};


// FxIconButtonMeasurementToken


class FxIconButtonMeasurementToken : public FxButtonMeasurementToken
{
    Q_OBJECT
    Q_PROPERTY(FxButtonSpaceValues* space_default READ space_default CONSTANT)
    Q_PROPERTY(FxButtonSpaceValues* space_narrow READ space_narrow CONSTANT)
    Q_PROPERTY(FxButtonSpaceValues* space_wide READ space_wide CONSTANT)
    QML_ELEMENT
public:

    // Enums.

    enum class WidthConfig {
        Default,
        Narrow,
        Wide
    };
    Q_ENUM(WidthConfig)

    // Constructors.

    explicit FxIconButtonMeasurementToken(QObject *parent = nullptr);

    // QML property exposing methods.

    FxButtonSpaceValues *space_default();
    FxButtonSpaceValues *space_narrow();
    FxButtonSpaceValues *space_wide();

private:
    FxButtonSpaceValues space_narrow_;
    FxButtonSpaceValues space_wide_;
};

#endif // FX_BUTTON_MEASUREMENT_TOKEN_H
