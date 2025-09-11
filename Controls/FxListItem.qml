pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import Fluxion

FxContainer {
    id: root

// Object properties.

    property string headlineText: "Headline"
    property string supportingText

    property bool isTall: false

    property list<Item> leadingItems
    property list<Item> trailingItems

    property Item leadingItem
    property Item trailingItem

    property alias headlineTextSpecs: headline_text_specs
    property alias supportingTextSpecs: supporting_text_specs
    property alias iconSpecs: icon_specs

// Signals

    signal clicked()

// Private properties.

    QtObject {
        id: _

        readonly property Item leadingItem: root.leadingItem
        onLeadingItemChanged: { root.leadingItem.parent = leading_item_layout; }

        readonly property Item trailingItem: root.trailingItem
        onTrailingItemChanged: { root.trailingItem.parent = trailing_item_layout; }

        readonly property bool hasSupportingText: (root.supportingText.length > 0)
        readonly property real tallestContentHeight: Math.max(leading_item_layout.implicitHeight,
                                                              subject_item_layout.implicitHeight,
                                                              trailing_item_layout.implicitHeight) + (8 * 2) // Use vertical padding of 8 to determined tallest content height.

        property real minimumHeight: root.isTall ? 88 : hasSupportingText ? 72 : 56
        property real implicitHeight: (tallestContentHeight <= minimumHeight) ? minimumHeight :
                                                                               (tallestContentHeight > 72) ? 88 : 72
        property real verticalPadding: (implicitHeight < 88) ? 8 : 12

        Component.onCompleted: {
            if (leadingItem) leadingItem.parent = leading_item_layout;
            for (var i = 0; i < root.leadingItems.length; i++) {
                root.leadingItems[i].parent = leading_item_layout;
            }

            if (trailingItem) trailingItem.parent = trailing_item_layout;
            for (var i = 0; i < root.trailingItems.length; i++) {
                root.trailingItems[i].parent = trailing_item_layout;
            }
        }
    }

// Object properties.

    state: interaction.state
    height: _.implicitHeight

    containerSpecs.shapeToken: FxStyle.tokens.sys.shape.corner.noRounding
    containerSpecs.color.defaultValue: FxStyle.tokens.sys.color.surface

    // Container specs (disabled).
    containerSpecs.opacity.disabled: 1.00 // Overwrite default disabled opacity value of <FxContainerSpecification>.

    // State-layer specs (hovered).
    stateLayerSpecs.color.hovered: FxStyle.tokens.sys.color.surfaceAccent
    stateLayerSpecs.opacity.hovered: FxStyle.tokens.sys.state.hovered.stateLayerOpacity

    // State-layer specs (focused).
    stateLayerSpecs.color.focused: FxStyle.tokens.sys.color.surfaceAccent
    stateLayerSpecs.opacity.focused: FxStyle.tokens.sys.state.focused.stateLayerOpacity

    // State-layer specs (pressed).
    stateLayerSpecs.color.pressed: FxStyle.tokens.sys.color.surfaceAccent
    stateLayerSpecs.opacity.pressed: FxStyle.tokens.sys.state.pressed.stateLayerOpacity

// Child Objects.

    FxInteractionState {
        id: interaction
        target: mouse_area
        isHovered: mouse_area.containsMouse
        isPressed: mouse_area.pressed
    }

    FxTextSpecification {
        id: headline_text_specs

        state: interaction.state
        typeScaleToken: FxStyle.tokens.sys.typescale.body_medium

        // Label text specs (default values).
        color.defaultValue: FxStyle.tokens.sys.color.surfaceAccent
        opacity.defaultValue: 1.00

        // Label text specs (disabled).
        opacity.disabled: 0.38
    }

    FxTextSpecification {
        id: supporting_text_specs

        state: interaction.state
        typeScaleToken: FxStyle.tokens.sys.typescale.body_small

        // Label text specs (default values).
        color.defaultValue: FxStyle.tokens.sys.color.surfaceAccentVariant
        opacity.defaultValue: 1.00

        // Label text specs (disabled).
        opacity.disabled: 1.00 // Overwrite default disabled opacity value of <FxTextSpecification>.
    }

    FxIconSpecification {
        id: icon_specs

        state: interaction.state

        // Icon specs (default values).
        color.defaultValue: FxStyle.tokens.sys.color.surfaceAccentVariant
        opacity.defaultValue: 1.00

        // Leading icon specs (disabled).
        color.disabled: FxStyle.tokens.sys.color.surfaceAccent
        opacity.disabled: 0.38
    }


    MouseArea {
        id: mouse_area
        anchors.fill: root
        hoverEnabled: true

        onClicked: { root.clicked(); }

        RowLayout {
            id: content_layout
            spacing: 16
            anchors {
                fill: mouse_area
                leftMargin: 16
                rightMargin: 16
                topMargin: _.verticalPadding
                bottomMargin: _.verticalPadding
            }

            StackLayout {
                id: leading_item_layout
                Layout.fillWidth: false
                Layout.fillHeight: false
                Layout.alignment: root.isTall ? Qt.AlignTop : Qt.AlignVCenter
            }

            ColumnLayout {
                id: subject_item_layout
                Layout.alignment: Qt.AlignVCenter
                Layout.fillWidth: true

                spacing: 0

                Text {
                    id: headline_text
                    Layout.fillWidth: true
                    //Layout.fillHeight: true

                    text: root.headlineText
                    elide: Text.ElideRight
                    wrapMode: Text.Wrap
                    maximumLineCount: 1
                    font: headline_text_specs.typeScaleToken.font
                    color: headline_text_specs.color.value
                    opacity: headline_text_specs.opacity.value
                }

                Loader {
                    id: supporting_text_loader
                    Layout.fillWidth: true
                    //Layout.fillHeight: true

                    active: root.supportingText.length > 0
                    visible: active
                    sourceComponent: Component {
                        Text {
                            id: supporting_text
                            text: root.supportingText
                            elide: Text.ElideRight
                            wrapMode: Text.Wrap
                            maximumLineCount: root.isTall ? 2 : 1
                            font: supporting_text_specs.typeScaleToken.font
                            color: supporting_text_specs.color.value
                            opacity: supporting_text_specs.opacity.value
                        }
                    }
                }
            }

            StackLayout {
                id: trailing_item_layout
                Layout.fillWidth: false
                Layout.fillHeight: false
                Layout.alignment: root.isTall ? Qt.AlignTop : Qt.AlignVCenter
            }
        }
    }
}
