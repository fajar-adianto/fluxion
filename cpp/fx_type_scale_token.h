#ifndef FX_TYPE_SCALE_TOKEN_H
#define FX_TYPE_SCALE_TOKEN_H

#include <QFont>
#include <QObject>
#include <QQmlEngine>

class FxTypeScaleToken : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QFont font READ font CONSTANT)
    Q_PROPERTY(QString fontName READ fontName WRITE setFontName NOTIFY fontNameChanged FINAL)
    Q_PROPERTY(int lineHeight READ lineHeight WRITE setLineHeight NOTIFY lineHeightChanged FINAL)
    Q_PROPERTY(FxTypeScaleToken::Role role READ role WRITE setRole NOTIFY roleChanged FINAL)
    Q_PROPERTY(FxTypeScaleToken::Scale scale READ scale WRITE setScale NOTIFY scaleChanged FINAL)
    Q_PROPERTY(int size READ size WRITE setSize NOTIFY sizeChanged FINAL)
    Q_PROPERTY(qreal tracking READ tracking WRITE setTracking NOTIFY trackingChanged FINAL)
    Q_PROPERTY(QFont::Weight weight READ weight WRITE setWeight NOTIFY weightChanged FINAL)
    QML_ELEMENT
public:

    // Enums.

    enum class Role {
        Display,
        Headline,
        Title,
        Body,
        Label
    };
    Q_ENUM(Role)

    enum class Scale {
        Large,
        Medium,
        Small
    };
    Q_ENUM(Scale)

    // Constructors.

    explicit FxTypeScaleToken(QObject *parent = nullptr);

    // QML property exposing methods.

    QFont font();

    QString fontName();
    void setFontName(const QString &font_name);

    int lineHeight();
    void setLineHeight(int height);

    FxTypeScaleToken::Role role();
    void setRole(FxTypeScaleToken::Role role);

    FxTypeScaleToken::Scale scale();
    void setScale(FxTypeScaleToken::Scale scale);

    int size();
    void setSize(int size);

    qreal tracking();
    void setTracking(qreal tracking);

    QFont::Weight weight();
    void setWeight(QFont::Weight weight);

private:
    QFont font_;
    int line_height_;
    FxTypeScaleToken::Role role_;
    FxTypeScaleToken::Scale scale_;

signals:
    void roleChanged();
    void scaleChanged();
    void lineHeightChanged();
    void fontNameChanged();
    void sizeChanged();
    void trackingChanged();
    void weightChanged();
};

#endif // FX_TYPE_SCALE_TOKEN_H
