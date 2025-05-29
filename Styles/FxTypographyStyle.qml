import QtQuick
import QuixFlux
import Fluxion

QxStore {
    id: root

    readonly property alias systemTokens: system_tokens
    QtObject {
        id: system_tokens

        readonly property alias display_large: display_large
        readonly property alias display_medium: display_medium
        readonly property alias display_small: display_small
        readonly property alias headline_large: headline_large
        readonly property alias headline_medium: headline_medium
        readonly property alias headline_small: headline_small
        readonly property alias title_large: title_large
        readonly property alias title_medium: title_medium
        readonly property alias title_small: title_small
        readonly property alias body_large: body_large
        readonly property alias body_medium: body_medium
        readonly property alias body_small: body_small
        readonly property alias label_large: label_large
        readonly property alias label_medium: label_medium
        readonly property alias label_small: label_small
    }

    readonly property alias referenceTokens: reference_tokens
    QtObject { // Typeface reference.
        id: reference_tokens

        property string brand: robotoFlex_loader.font.family
        property string plain: robotoFlex_loader.font.family

        property int weight_regular: Font.Normal
        property int weight_medium: Font.Medium
        property int weight_bold: Font.Bold
    }

    // Private objects.

    FxTypeScaleToken {
        id: display_large
        role: FxTypeScaleToken.Role.Display
        scale: FxTypeScaleToken.Scale.Large
        fontName: reference_tokens.brand
        weight: reference_tokens.weight_regular
        size: 57
        tracking: -0.25
        lineHeight: 64
    }

    FxTypeScaleToken {
        id: display_medium
        role: FxTypeScaleToken.Role.Display
        scale: FxTypeScaleToken.Scale.Medium
        fontName: reference_tokens.brand
        weight: reference_tokens.weight_regular
        size: 45
        tracking: 0
        lineHeight: 52
    }

    FxTypeScaleToken {
        id: display_small
        role: FxTypeScaleToken.Role.Display
        scale: FxTypeScaleToken.Scale.Small
        fontName: reference_tokens.brand
        weight: reference_tokens.weight_regular
        size: 36
        tracking: 0
        lineHeight: 44
    }

    FxTypeScaleToken {
        id: headline_large
        role: FxTypeScaleToken.Role.Headline
        scale: FxTypeScaleToken.Scale.Large
        fontName: reference_tokens.brand
        weight: reference_tokens.weight_regular
        size: 32
        tracking: 0
        lineHeight: 40
    }

    FxTypeScaleToken {
        id: headline_medium
        role: FxTypeScaleToken.Role.Headline
        scale: FxTypeScaleToken.Scale.Medium
        fontName: reference_tokens.brand
        weight: reference_tokens.weight_regular
        size: 28
        tracking: 0
        lineHeight: 36
    }

    FxTypeScaleToken {
        id: headline_small
        role: FxTypeScaleToken.Role.Headline
        scale: FxTypeScaleToken.Scale.Small
        fontName: reference_tokens.brand
        weight: reference_tokens.weight_regular
        size: 24
        tracking: 0
        lineHeight: 32
    }

    FxTypeScaleToken {
        id: title_large
        role: FxTypeScaleToken.Role.Title
        scale: FxTypeScaleToken.Scale.Large
        fontName: reference_tokens.brand
        weight: reference_tokens.weight_regular
        size: 22
        tracking: 0
        lineHeight: 28
    }

    FxTypeScaleToken {
        id: title_medium
        role: FxTypeScaleToken.Role.Title
        scale: FxTypeScaleToken.Scale.Medium
        fontName: reference_tokens.plain
        weight: reference_tokens.weight_medium
        size: 16
        tracking: 0.15
        lineHeight: 24
    }

    FxTypeScaleToken {
        id: title_small
        role: FxTypeScaleToken.Role.Title
        scale: FxTypeScaleToken.Scale.Small
        fontName: reference_tokens.plain
        weight: reference_tokens.weight_medium
        size: 14
        tracking: 0.1
        lineHeight: 20
    }

    FxTypeScaleToken {
        id: body_large
        role: FxTypeScaleToken.Role.Body
        scale: FxTypeScaleToken.Scale.Large
        fontName: reference_tokens.plain
        weight: reference_tokens.weight_regular
        size: 16
        tracking: 0.5
        lineHeight: 24
    }

    FxTypeScaleToken {
        id: body_medium
        role: FxTypeScaleToken.Role.Body
        scale: FxTypeScaleToken.Scale.Medium
        fontName: reference_tokens.plain
        weight: reference_tokens.weight_regular
        size: 14
        tracking: 0.25
        lineHeight: 20
    }

    FxTypeScaleToken {
        id: body_small
        role: FxTypeScaleToken.Role.Body
        scale: FxTypeScaleToken.Scale.Small
        fontName: reference_tokens.plain
        weight: reference_tokens.weight_regular
        size: 12
        tracking: 0.4
        lineHeight: 16
    }

    FxTypeScaleToken {
        id: label_large
        role: FxTypeScaleToken.Role.Label
        scale: FxTypeScaleToken.Scale.Large
        fontName: reference_tokens.plain
        weight: isProminent ? reference_tokens.weight_bold : reference_tokens.weight_medium
        size: 14
        tracking: 0.1
        lineHeight: 20

        property bool isProminent: false
    }

    FxTypeScaleToken {
        id: label_medium
        role: FxTypeScaleToken.Role.Label
        scale: FxTypeScaleToken.Scale.Medium
        fontName: reference_tokens.plain
        weight: isProminent ? reference_tokens.weight_bold : reference_tokens.weight_medium
        size: 12
        tracking: 0.5
        lineHeight: 16

        property bool isProminent: false
    }

    FxTypeScaleToken {
        id: label_small
        role: FxTypeScaleToken.Role.Label
        scale: FxTypeScaleToken.Scale.Small
        fontName: reference_tokens.plain
        weight: reference_tokens.weight_medium
        size: 11
        tracking: 0.5
        lineHeight: 16
    }

    FontLoader {
        id: robotoFlex_loader
        source: "fonts/RobotoFlex.ttf"
    }
}
