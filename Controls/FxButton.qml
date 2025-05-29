pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Templates as T
import Fluxion

T.Button {
    id: root

    // Property declarations.

    property alias containerSpecs: container.containerSpecs
    property alias labelTextSpecs: label_text_specs
    property alias stateLayerSpecs: container.stateLayerSpecs

    property alias interactionState: interaction_state

    property string iconName

    property bool isDense: false
    readonly property bool hasIcon: iconName.length > 0
    readonly property bool iconOnly: hasIcon && (root.text.length <= 0)

    readonly property real implicitContainerHeight: 40
    readonly property real implicitLeftPadding: iconOnly ? 0 : (isDense ? 12 : (hasIcon ? 16 : 24))
    readonly property real implicitRightPadding: iconOnly ? 0 : (isDense ? hasIcon ? 16 : 12 : 24)

    // Object properties.

    hoverEnabled: true

    leftPadding: implicitLeftPadding
    rightPadding: implicitRightPadding

    height: implicitContainerHeight
    width: implicitLeftPadding + contentItem.implicitWidth + implicitRightPadding

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
        containerSpecs.shapeToken: FxStyle.tokens.sys.shape.corner.full

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

        implicitHeight: root.implicitContainerHeight
        implicitWidth: root.iconOnly ? implicitHeight : button_content.implicitWidth
        anchors.centerIn: root

        Row {
            id: button_content
            spacing: 8

            height: parent.implicitHeight

            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter

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
                        fontSize: root.iconOnly ? 24 : 18

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
