import QtQuick

QtObject {
    id: root

    enum TypeRole {
        Display,
        Headline,
        Title,
        Body,
        Label
    }

    enum Scale {
        Large,
        Medium,
        Small
    }

    property int role: FxTypeScaleToken.TypeRole.Display
    property int scale: FxTypeScaleToken.Scale.Large
    property int lineHeight: 64
    property alias fontName: root.font.family
    property alias size: root.font.pointSize
    property alias tracking: root.font.letterSpacing
    property alias weight: root.font.weight

    property font font:
        Qt.font({
            family: "Roboto",
            pointSize: 57,
            letterSpacing: -0.25,
            weight: Font.Normal,
            capitalization: Font.MixedCase
        })
}
