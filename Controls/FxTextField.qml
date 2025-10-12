pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Templates as T
import Fluxion

T.TextField {
    id: root

    // Property declarations.

    // Texts and Icon.
    property string labelText
    property string supportingText
    property string errorText
    property string prefixText // Reserved for future implementation.
    property string suffixText // Reserved for future implementation.
    property string leadingIconName
    property string trailingIconName

    // Style.
    property bool allowSupportingRow: true
    property bool allowTrailingItem: true
    property bool hasTrailingButton: false

    // Specs related.
    readonly property alias interactionState: interaction_state
    readonly property alias labelTextSpecs: label_text_specs

    // Visual component states.
    readonly property bool isPopulated: root.activeFocus || root.length || root.preeditText
    readonly property bool hasError: (!root.acceptableInput || (root.length > root.maximumLength))
    readonly property bool leadingIconVisible: _.hasLeadingIcon && (width >= _.minimumWidth)
    readonly property bool trailingItemVisible: _.hasTrailingItem && (width >=
                                                                      (_.hasLeadingIcon ?
                                                                           (_.minimumWidth - _.preferredLeftPadding + _.containerLeftPadding) :
                                                                           _.minimumWidth))

    // Visual components.

    readonly property alias container: container

    readonly property alias private_: _
    QtObject {
        id: _

        property bool hasLeadingIcon: root.leadingIconName.length > 0
        property bool hasTrailingItem: root.trailingIconName.length > 0
        property bool hasSupportingText: root.supportingText.length > 0

        // Implicit sizes.

        property real horizontalSpacing: 16
        property real verticalSpacing: 4

        property real topPadding: 8
        property real bottomPadding: 8

        property real containerLeftPadding: root.leadingIconVisible ? 12 : 16
        property real containerRightPadding: root.trailingItemVisible ? 12 : 16
        property real implicitLeftPadding: containerLeftPadding + (root.leadingIconVisible ? (iconSize + horizontalSpacing) : 0)
        property real implicitRightPadding: containerRightPadding + (root.trailingItemVisible ? (iconSize + horizontalSpacing) : 0)

        property real iconSize: 24

        property real preferredLeftPadding: hasLeadingIcon ? (12 + iconSize + horizontalSpacing) : 16
        property real preferredRightPadding: hasTrailingItem ? (horizontalSpacing + iconSize + 12) : 16

        property alias emptyLabelWidth: empty_label_metrics.width
        property alias populatedLabelWidth: populated_label_metrics.width

        property real minimumWidth: preferredLeftPadding + emptyLabelWidth + preferredRightPadding
        property real implicitWidth: implicitLeftPadding + emptyLabelWidth + implicitRightPadding

        property alias inputTextLineHeight: input_text_metrics.height
        property alias emptyLabelLineHeight: empty_label_metrics.height
        property alias populatedLabelLineHeight: populated_label_metrics.height
        property alias supportingTextLineHeight: supporting_text_metrics.height

        property real lineHeight: 56
        property real supportingLineHeight: verticalSpacing + supportingTextLineHeight
    }

    // Signals.

    signal trailingButtonClicked();
    signal trailingButtonPressAndHold();
    signal trailingButtonReleased()

    // Object properties.

    hoverEnabled: true
    font: input_text_specs.typeScaleToken.font
    color: input_text_specs.color.value

    implicitWidth: _.implicitWidth
    leftPadding: _.implicitLeftPadding
    rightPadding: _.implicitRightPadding
    topPadding: _.topPadding + populated_label_metrics.height
    bottomInset: root.allowSupportingRow ? _.supportingLineHeight : 0

    background: container

    // Caret object.

    cursorDelegate: FxCaret {
        id: caret
        color: root.hasError ? FxStyle.tokens.sys.color.error : FxStyle.tokens.sys.color.primary
    }

    // Child objects.

    TextMetrics {
        id: empty_label_metrics
        font: label_text_specs.emptyTypeScaleToken.font
        elide: Text.ElideRight
        text: root.labelText
    }

    TextMetrics {
        id: populated_label_metrics
        font: label_text_specs.populatedTypeScaleToken.font
        elide: Text.ElideRight
        text: root.labelText
    }

    FontMetrics {
        id: input_text_metrics
        font: root.font
    }

    FontMetrics {
        id: supporting_text_metrics
        font: supporting_text_specs.typeScaleToken.font
    }

    FxInteractionState {
        id: interaction_state
        target: root
    }

    FxContainer {
        id: container
        state: interaction_state.state
    }

    FxTextSpecification {
        id: label_text_specs

        property FxTypeScaleToken populatedTypeScaleToken: FxStyle.tokens.sys.typescale.body_small
        property FxTypeScaleToken emptyTypeScaleToken: FxStyle.tokens.sys.typescale.body_large
        property color noErrorHoveredColor: FxStyle.tokens.sys.color.surfaceAccentVariant

        state: interaction_state.state
        typeScaleToken: root.isPopulated ? populatedTypeScaleToken : emptyTypeScaleToken

        // Label text specs (default values).
        color.defaultValue: root.hasError ? FxStyle.tokens.sys.color.error : FxStyle.tokens.sys.color.surfaceAccentVariant
        opacity.defaultValue: 1.00

        // Label text specs (disabled).
        color.disabled: FxStyle.tokens.sys.color.surfaceAccent
        opacity.disabled: 0.38

        // Label text specs (focused).
        color.focused: root.hasError ? FxStyle.tokens.sys.color.error : FxStyle.tokens.sys.color.primary

        // Trailing icon specs (hovered).
        color.hovered: root.activeFocus ? (root.hasError ? FxStyle.tokens.sys.color.error : FxStyle.tokens.sys.color.primary) :
                                          (root.hasError ? FxStyle.tokens.sys.color.errorContainerAccent : noErrorHoveredColor)
    }

    FxTextSpecification {
        id: input_text_specs

        state: interaction_state.state
        typeScaleToken: FxStyle.tokens.sys.typescale.body_large

        // Label text specs (default values).
        color.defaultValue: FxStyle.tokens.sys.color.surfaceAccent
        opacity.defaultValue: 1.00

        // Label text specs (disabled).
        opacity.disabled: 0.38
    }

    FxTextSpecification {
        id: supporting_text_specs

        state: interaction_state.state
        typeScaleToken: FxStyle.tokens.sys.typescale.body_small

        // Label text specs (default values).
        color.defaultValue: root.hasError ? FxStyle.tokens.sys.color.error : FxStyle.tokens.sys.color.surfaceAccentVariant
        opacity.defaultValue: 1.00

        // Label text specs (disabled).
        color.disabled: FxStyle.tokens.sys.color.surfaceAccent
        opacity.disabled: 0.38
    }

    FxIconSpecification {
        id: leading_icon_specs

        state: interaction_state.state

        // Leading icon specs (default values).
        color.defaultValue: FxStyle.tokens.sys.color.surfaceAccentVariant
        opacity.defaultValue: 1.00

        // Leading icon specs (disabled).
        color.disabled: FxStyle.tokens.sys.color.surfaceAccent
        opacity.disabled: 0.38
    }

    FxIconSpecification {
        id: trailing_icon_specs

        state: interaction_state.state

        // Trailing icon specs (default values).
        color.defaultValue: root.hasError ? FxStyle.tokens.sys.color.error : FxStyle.tokens.sys.color.surfaceAccentVariant
        opacity.defaultValue: 1.0

        // Trailing icon specs (disabled).
        color.disabled: FxStyle.tokens.sys.color.surfaceAccent
        opacity.disabled: 0.38

        // Trailing icon specs (hovered).
        color.hovered: root.hasError ? FxStyle.tokens.sys.color.errorContainerAccent : FxStyle.tokens.sys.color.surfaceAccentVariant
    }

    Loader {
        id: leading_icon_loader

        active: root.leadingIconVisible
        anchors {
            left: root.left;                        leftMargin: _.containerLeftPadding
            verticalCenter: root.verticalCenter;    verticalCenterOffset: (root.topInset - root.bottomInset) * 0.5
        }

        sourceComponent: Component {
            id: leading_icon
            FxIconFont {
                name: root.leadingIconName
                fontSize: _.iconSize
                color: leading_icon_specs.color.value
                opacity: leading_icon_specs.opacity.value

                height: _.iconSize
                width: height
            }
        }
    }

    Loader {
        id: trailing_item_loader

        active: root.allowTrailingItem && root.trailingItemVisible
        anchors {
            right: root.right;                      rightMargin: _.containerRightPadding
            verticalCenter: root.verticalCenter;    verticalCenterOffset: (root.topInset - root.bottomInset) * 0.5
        }

        sourceComponent: root.hasTrailingButton ? trailing_button : trailing_icon

        Component {
            id: trailing_icon
            FxIconFont {
                name: root.hasError ? "alert-circle" : root.trailingIconName
                fontSize: _.iconSize
                color: trailing_icon_specs.color.value
                opacity: trailing_icon_specs.opacity.value

                height: _.iconSize
                width: height
            }
        }

        Component {
            id: trailing_button
            Item {
                height: _.iconSize
                width: height

                FxIconButton {
                    buttonColor: FxIconButton.Color.Standard
                    anchors.centerIn: parent

                    iconName: root.trailingIconName
                    onClicked: root.trailingButtonClicked()
                    onPressAndHold: root.trailingButtonPressAndHold()
                    onReleased: root.trailingButtonReleased()

                    // Label specifications.

                    labelTextSpecs.opacity.disabled: trailing_icon_specs.opacity.disabled
                    labelTextSpecs.color.disabled: trailing_icon_specs.color.disabled

                    labelTextSpecs.color.enabled: trailing_icon_specs.color.value
                    labelTextSpecs.color.hovered: trailing_icon_specs.color.hovered
                    labelTextSpecs.color.focused: trailing_icon_specs.color.value
                    labelTextSpecs.color.pressed: trailing_icon_specs.color.value

                    // State layer specifications.

                    stateLayerSpecs.color.hovered: trailing_icon_specs.color.hovered
                    stateLayerSpecs.color.focused: trailing_icon_specs.color.hovered
                    stateLayerSpecs.color.pressed: trailing_icon_specs.color.hovered
                }
            }
        }
    }

    Loader {
        id: supporting_text_loader
        active: root.allowSupportingRow

        anchors {
            bottom: parent.bottom
            left: parent.left;      leftMargin: _.containerLeftPadding
            right: parent.right;    rightMargin: _.containerRightPadding
        }

        sourceComponent: Component {
            FxLabel {
                text: root.hasError ? root.errorText : root.supportingText
                elide: Text.ElideRight
                typeScaleToken: supporting_text_specs.typeScaleToken
                color: supporting_text_specs.color.value
                opacity: supporting_text_specs.opacity.value
            }
        }
    }
}
