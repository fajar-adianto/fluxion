pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Templates as T
import Fluxion

T.Button {
    id: root

    // Enumerations.

    enum Size {
        ExtraSmall,
        Small,
        Medium,
        Large,
        ExtraLarge
    }

    enum IconOnlyWidthPolicy {
        Narrow,
        Default,
        Wide
    }

    // Property declarations.

    property alias containerSpecs: container.containerSpecs
    property alias labelTextSpecs: label_text_specs
    property alias stateLayerSpecs: container.stateLayerSpecs

    property alias interactionState: interaction_state

    property string iconName

    property int buttonSize: FxButton.Size.Small
    property int iconOnlyWidthPolicy: FxButton.IconOnlyWidthPolicy.Default

    readonly property bool hasIcon: iconName.length > 0
    readonly property bool iconOnly: hasIcon && (root.text.length <= 0)

    QtObject {
        id: _

        property var iconOnlyWidths: ({})

        readonly property real containerHeigth: heights[root.buttonSize]
        readonly property real leadingPadding: root.iconOnly ? 0 : paddings[root.buttonSize]
        readonly property real trailingPadding: root.iconOnly ? 0 : paddings[root.buttonSize]

        readonly property int iconOnlyWidthPolicy: root.iconOnlyWidthPolicy

        readonly property var heights:({
            [FxButton.Size.ExtraSmall]: 32,
            [FxButton.Size.Small]: 40,
            [FxButton.Size.Medium]: 56,
            [FxButton.Size.Large]: 96,
            [FxButton.Size.ExtraLarge]: 136
        })

        readonly property var narrowWidths:({
            [FxButton.Size.ExtraSmall]: 28,
            [FxButton.Size.Small]: 32,
            [FxButton.Size.Medium]: 48,
            [FxButton.Size.Large]: 64,
            [FxButton.Size.ExtraLarge]: 104
        })

        readonly property var wideWidths:({
            [FxButton.Size.ExtraSmall]: 40,
            [FxButton.Size.Small]: 52,
            [FxButton.Size.Medium]: 72,
            [FxButton.Size.Large]: 128,
            [FxButton.Size.ExtraLarge]: 184
        })

        readonly property var iconSizes:({
            [FxButton.Size.ExtraSmall]: 20,
            [FxButton.Size.Small]: 24,
            [FxButton.Size.Medium]: 24,
            [FxButton.Size.Large]: 32,
            [FxButton.Size.ExtraLarge]: 40
        })

        readonly property var paddings:({
            [FxButton.Size.ExtraSmall]: 12,
            [FxButton.Size.Small]: 16,
            [FxButton.Size.Medium]: 24,
            [FxButton.Size.Large]: 48,
            [FxButton.Size.ExtraLarge]: 64
        })

        readonly property var spacings:({
            [FxButton.Size.ExtraSmall]: 4,
            [FxButton.Size.Small]: 8,
            [FxButton.Size.Medium]: 8,
            [FxButton.Size.Large]: 12,
            [FxButton.Size.ExtraLarge]: 16
        })

        onIconOnlyWidthPolicyChanged: {
            if (_.iconOnlyWidthPolicy === FxButton.IconOnlyWidthPolicy.Narrow)
                _.iconOnlyWidths = _.narrowWidths;
            else if (_.iconOnlyWidthPolicy === FxButton.IconOnlyWidthPolicy.Wide)
                _.iconOnlyWidths = _.wideWidths;
            else
                _.iconOnlyWidths = _.heights;
        }
    }

    // Object properties.

    hoverEnabled: true

    leftPadding: _.leadingPadding
    rightPadding: _.trailingPadding

    height: _.containerHeigth
    width: _.leadingPadding + contentItem.implicitWidth + _.trailingPadding

    font: label_text_specs.typeScaleToken.font

    background: container

    FxInteractionState {
        id: interaction_state
        target: root
        isPressed: root.pressed
    }

    FxContainer {
        id: container
        state: interaction_state.state
        containerSpecs.shapeToken: interaction_state.isPressed ? FxStyle.tokens.sys.shape.corner.small : FxStyle.tokens.sys.shape.corner.full

        // Container specs (disabled).
        containerSpecs.color.disabled: FxStyle.tokens.sys.color.surfaceAccent
        containerSpecs.opacity.disabled: 0.12
    }

    FxTextSpecification {
        id: label_text_specs
        state: interaction_state.state
        typeScaleToken: FxStyle.tokens.sys.typescale.label_large

        // Label text specs (default values).
        opacity.defaultValue: 1.00

        // Label text specs (disabled).
        color.disabled: FxStyle.tokens.sys.color.surfaceAccent
        opacity.disabled: 0.38
    }

    contentItem: Item {

        implicitHeight: _.containerHeigth
        implicitWidth: root.iconOnly ? _.iconOnlyWidths[root.iconOnlyWidthPolicy] : button_content.implicitWidth
        anchors.centerIn: root

        Row {
            id: button_content
            spacing: _.spacings[root.buttonSize]

            height: parent.implicitHeight

            anchors.centerIn: parent

            Loader {
                id: button_icon_loader
                active: root.hasIcon
                visible: active

                anchors.verticalCenter: parent.verticalCenter

                sourceComponent: Component {
                    FxIconFont {
                        name: root.iconName
                        color: label_text_specs.color.value
                        opacity: label_text_specs.opacity.value
                        fontSize: _.iconSizes[root.buttonSize]

                        width: fontSize
                        height: fontSize
                    }
                }
            }

            Loader {
                id: button_text_loader
                active: root.text.length > 0
                visible: active

                anchors.verticalCenter: parent.verticalCenter

                sourceComponent: Component {
                    Text {
                        id: button_text
                        text: root.text
                        font: root.font
                        color: label_text_specs.color.value
                        opacity: label_text_specs.opacity.value
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }
            }
        }
    }
}
