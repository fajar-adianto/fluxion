#ifndef FX_SHAPE_TOKEN_H
#define FX_SHAPE_TOKEN_H

#include <QObject>
#include <QQmlEngine>

// Forward declartion of FxShapeCornerValues.
class FxShapeCornerValues;

class FxShapeToken : public QObject
{
    Q_OBJECT
    Q_CLASSINFO("RegisterEnumClassesUnscoped", "false")
    Q_PROPERTY(FxShapeCornerValues* corners READ corners CONSTANT)
    Q_PROPERTY(FxShapeToken::DirectionalModifier directionalModifier READ directionalModifier WRITE setDirectionalModifier NOTIFY directionalModifierChanged FINAL)
    Q_PROPERTY(FxShapeToken::Role role READ role WRITE setRole NOTIFY roleChanged FINAL)
    Q_PROPERTY(float value READ value WRITE setValue NOTIFY valueChanged FINAL)
    QML_ELEMENT
public:

    // Enums.

    enum class Role {
        None,
        ExtraSmall,
        Small,
        Medium,
        Large,
        ExtraLarge,
        Full
    };
    Q_ENUM(Role)

    enum class DirectionalModifier {
        None,
        Top,
        Bottom,
        Start,
        End
    };
    Q_ENUM(DirectionalModifier)

    // Constructors.

    explicit FxShapeToken(QObject *parent = nullptr);
    ~FxShapeToken();

    // QML property exposing methods.

    FxShapeCornerValues *corners() const;

    FxShapeToken::DirectionalModifier directionalModifier();
    void setDirectionalModifier(FxShapeToken::DirectionalModifier modifier);

    FxShapeToken::Role role();
    void setRole(FxShapeToken::Role role);

    float value();
    void setValue(float value);

private:
    FxShapeCornerValues *corners_;
    FxShapeToken::DirectionalModifier directional_modifier_;
    FxShapeToken::Role role_;
    float value_;

signals:
    void directionalModifierChanged();
    void roleChanged();
    void valueChanged();
};

class FxShapeCornerValues : public QObject
{
    Q_OBJECT
    Q_PROPERTY(float bottomLeft READ bottomLeft NOTIFY bottomLeftChanged FINAL)
    Q_PROPERTY(float bottomRight READ bottomRight NOTIFY bottomRightChanged FINAL)
    Q_PROPERTY(float topLeft READ topLeft NOTIFY topLeftChanged FINAL)
    Q_PROPERTY(float topRight READ topRight NOTIFY topRightChanged FINAL)
    QML_ELEMENT
public:
    explicit FxShapeCornerValues(QObject *parent = nullptr);

    // QML property exposing methods.

    float bottomLeft();

    float bottomRight();

    float topLeft();

    float topRight();

    // Public methods.

    FxShapeToken::DirectionalModifier directionalModifier();
    void setDirectionalModifier(FxShapeToken::DirectionalModifier directional_modifier);

    float value();
    void setValue(float value);

private:
    FxShapeToken::DirectionalModifier directional_modifier_;
    float value_;

signals:
    void bottomLeftChanged();
    void bottomRightChanged();
    void topLeftChanged();
    void topRightChanged();
};
#endif // FX_SHAPE_TOKEN_H
