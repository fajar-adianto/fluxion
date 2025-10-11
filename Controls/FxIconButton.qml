pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Controls
import Fluxion

FxExpressiveButton {
    id: root

    // Enumerations.

    enum Width {
        Default,
        Narrow,
        Wide
    }

    // Property declarations.

    property int buttonWidth: FxIconButton.Width.Default

    // Functions.

    // This function overrides base QML type <FxExpressiveButton> to adjust the type of the token.
    //  Not directly used in this QML type.
    function getMeasurementToken() : FxIconButtonMeasurementToken {
        switch (root.buttonSize) {
            case FxExpressiveButton.Size.ExtraSmall:
                return FxStyle.tokens.comp.iconButton.size.extraSmall;
            case FxExpressiveButton.Size.Small:
                return FxStyle.tokens.comp.iconButton.size.small;
            case FxExpressiveButton.Size.Medium:
                return FxStyle.tokens.comp.iconButton.size.medium;
            case FxExpressiveButton.Size.Large:
                return FxStyle.tokens.comp.iconButton.size.large;
            case FxExpressiveButton.Size.ExtraLarge:
                return FxStyle.tokens.comp.iconButton.size.extraLarge;
            default:
                return FxStyle.tokens.comp.iconButton.size.small;
        }
    }

    // This function overrides base QML type <FxExpressiveButton> to adjust the type of the token.
    //  Not directly used in this QML type.
    function getVariantToken() : FxButtonVariantToken {
        switch (root.buttonColor) {
            case FxExpressiveButton.Color.Elevated:
                return FxStyle.tokens.comp.iconButton.color.elevated;
            case FxExpressiveButton.Color.Filled:
                return FxStyle.tokens.comp.iconButton.color.filled;
            case FxExpressiveButton.Color.Tonal:
                return FxStyle.tokens.comp.iconButton.color.tonal;
            case FxExpressiveButton.Color.Outlined:
                return FxStyle.tokens.comp.iconButton.color.outlined;
            case FxExpressiveButton.Color.Text:
                return FxStyle.tokens.comp.iconButton.color.text;
            default:
                return FxStyle.tokens.comp.iconButton.color.tonal;
        }
    }

    // Private properties.

    QtObject {
        id: _
        readonly property real leadingPadding: {
            switch (root.buttonWidth) {
                case FxIconButton.Width.Default:
                    return root.measurementToken.space_default.leading;
                case FxIconButton.Width.Narrow:
                    return root.measurementToken.space_narrow.leading;
                case FxIconButton.Width.Wide:
                    return root.measurementToken.space_wide.leading;
                default:
                    return root.measurementToken.space_default.leading;
            }
        }

        readonly property real trailingPadding: {
            switch (root.buttonWidth) {
                case FxIconButton.Width.Default:
                    return root.measurementToken.space_default.trailing;
                case FxIconButton.Width.Narrow:
                    return root.measurementToken.space_narrow.trailing;
                case FxIconButton.Width.Wide:
                    return root.measurementToken.space_wide.trailing;
                default:
                    return root.measurementToken.space_default.trailing;
            }
        }
    }

    // Object properties.

    display: AbstractButton.IconOnly
    leftPadding: _.leadingPadding
    rightPadding: _.trailingPadding

    // Child objects.

    Connections {
        target: root.Component
        function onCompleted() {
            root.text = ""; // FxIconButton cannot have text in it.
        }
    }
}
