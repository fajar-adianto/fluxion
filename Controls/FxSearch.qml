pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T
import QtQuick.Layouts
import Fluxion

Item {
    id: root

// Property declarations.

    component LeadingIconData: QtObject {
        id: leading_icon
        property string name
        property bool asButton: false
    } readonly property LeadingIconData leadingIcon: LeadingIconData {}

    component ActionButtonsData: QtObject {
        property string primaryIconName
        property string secondaryIconName
        property bool withAvatar: false
    } readonly property ActionButtonsData actionButtons: ActionButtonsData {}

    component AvatarData: QtObject {
        property color backgroundColor: FxStyle.tokens.sys.color.tertiaryFixed
        property color fontColor: FxStyle.tokens.sys.color.tertiaryFixedAccent
        property int sourceType: FxAvatar.SourceType.Image
        property string source
        property FxShapeToken shapeToken: FxStyle.tokens.sys.shape.corner.full
    } readonly property AvatarData avatar: AvatarData {}

    property Item fillTarget
    property string hintedSearchText: qsTr("Search")
    property string inputTextPlaceholder: qsTr("Search")
    property real leftPadding: 0
    property real rightPadding: 0

    readonly property alias searchText: search_field.text

    readonly property bool isEmpty: search_field.text.length <= 0
    readonly property bool isDocked: _.isDocked
    readonly property bool isActive: _.isActive

    default property alias searchContent: search_column.children

// Private properties.

    QtObject {
        id: _

        property real avatarSize: 30
        property real buttonSize: 40
        property real iconSize: 24

        property bool isDocked: root.fillTarget ? false : true
        property bool isActive: false

        property bool hasPrimaryActionButton: root.actionButtons.primaryIconName.length > 0
        property bool hasSecondaryActionButton: (root.actionButtons.secondaryIconName.length > 0) || root.actionButtons.withAvatar
    }

// Signals.

    signal backButtonClicked()
    signal leadingButtonClicked()
    signal primaryActionButtonClicked()
    signal secondaryActionButtonClicked()

// States.

    states: [
        State {
            name: "full_view"
            when: _.isActive && !_.isDocked

            ParentChange {
                target: container
                parent: root.fillTarget
            }

            AnchorChanges {
                target: container
                anchors.bottom: root.fillTarget.bottom
                anchors.left: root.fillTarget.left
                anchors.right: root.fillTarget.right
                anchors.top: root.fillTarget.top
            }

            PropertyChanges {
                container.anchors.bottomMargin: 0
                container.anchors.leftMargin: 0
                container.anchors.rightMargin: 0
                container.anchors.topMargin: 0
                container.anchors.margins: 0
            }
        }
    ]

    transitions: [
        Transition {
            to: "full_view"
            ParentAnimation {
                AnchorAnimation { duration: FxStyle.tokens.sys.motion.duration.medium2; easing.type: FxStyle.tokens.sys.motion.easing.emphasized }
                SpringAnimation {
                    properties: "anchors.bottomMargin,anchors.leftMargin,anchors.rightMargin,anchors.topMargin,anchors.margins"
                    damping: FxStyle.tokens.sys.motion.spring.defaults.effects.dampingForAnimation
                    spring: FxStyle.tokens.sys.motion.spring.defaults.effects.stiffnessForAnimation
                }
            }
            onRunningChanged: {
                if (running)
                    container.containerSpecs.shapeToken = FxStyle.tokens.sys.shape.corner.medium;
                else
                    container.containerSpecs.shapeToken = FxStyle.tokens.sys.shape.corner.noRounding;
            }
        },
        Transition {
            from: "full_view"
            ParentAnimation {
                via: root
                AnchorAnimation { duration: FxStyle.tokens.sys.motion.duration.short4 ; easing.type: FxStyle.tokens.sys.motion.easing.emphasized }
                SpringAnimation {
                    properties: "anchors.bottomMargin,anchors.leftMargin,anchors.rightMargin,anchors.topMargin,anchors.margins"
                    damping: FxStyle.tokens.sys.motion.spring.defaults.effects.dampingForAnimation
                    spring: FxStyle.tokens.sys.motion.spring.defaults.effects.stiffnessForAnimation
                }
            }
            onRunningChanged: {
                if (running)
                    container.containerSpecs.shapeToken = FxStyle.tokens.sys.shape.corner.medium;
                else
                    container.containerSpecs.shapeToken =
                            (_.isActive && !_.isDocked) ? FxStyle.tokens.sys.shape.corner.extraLarge : FxStyle.tokens.sys.shape.corner.full;
            }
        }
    ]

// Object Properties.

    implicitHeight: _.isDocked ? 56 : 72
    implicitWidth: 360
    z: 100 // To make sure that the Search Item stays above the container when it is reparented to [root.fillTarget].

// Child objects.

    FxInteractionState { id: interaction_state; target: search_field }

    FxContainer {
        id: container
        z: 99 // To make sure that the container stays above other sibling objects when reparented to [root.fillTarget].
        state: interaction_state.state

        anchors.bottom: search_column.bottom
        anchors.left: search_column.left
        anchors.right: search_column.right
        anchors.top: search_column.top

        containerSpecs {
            color.defaultValue: FxStyle.tokens.sys.color.surfaceContainerHigh
            shapeToken: FxStyle.tokens.sys.shape.corner.full // Changed in State transition.
        }

        stateLayerSpecs {
            color.hovered: FxStyle.tokens.sys.color.surfaceAccent
            opacity.hovered: FxStyle.tokens.sys.state.hovered.stateLayerOpacity
        }
    }

    ColumnLayout {
        id: search_column
        y: (_.isDocked || _.isActive) ? 0 : 8
        z: container.z + 1

        anchors {
            left: root.left; leftMargin: root.leftPadding
            right: root.right; rightMargin: root.rightPadding
        }

        RowLayout {
            id: search_bar

            Layout.alignment: Qt.AlignHCenter
            Layout.preferredHeight: (_.isActive && !_.isDocked) ? 72 : 56
            Layout.maximumHeight: (_.isActive && !_.isDocked) ? 72 : 56
            Layout.preferredWidth: 360
            Layout.maximumWidth: 720
            Layout.fillWidth: true
            Layout.leftMargin: 16
            Layout.rightMargin: 16

            spacing: 16

            Loader {
                id: leading_item
                active: true
                visible: active

                Layout.alignment: Qt.AlignVCenter
                Layout.minimumHeight: _.buttonSize
                Layout.preferredHeight: _.buttonSize
                Layout.maximumHeight: _.buttonSize
                Layout.minimumWidth: _.buttonSize
                Layout.preferredWidth: _.buttonSize
                Layout.maximumWidth: _.buttonSize

                // Margins needed to account only icon size (24px)
                //  from implicit height of the standard button size (40px)
                Layout.margins: (_.iconSize - _.buttonSize) * 0.5

                sourceComponent: root.isActive ? back_button :
                                                        root.leadingIcon.asButton ? leading_button_component : leading_icon_component

                Component {
                    id: back_button
                    FxTextButton {
                        iconName: "arrow-left"
                        isStandard: true

                        onClicked: {
                            _.isActive = false;
                            search_field.clear();
                            root.backButtonClicked();
                        }
                    }
                }

                Component {
                    id: leading_icon_component
                    FxIconFont {
                        name: (root.leadingIcon.name.length > 0) ? root.leadingIcon.name : "magnify"
                        fontSize: _.iconSize
                        color: FxStyle.tokens.sys.color.surfaceAccent
                        opacity: 1
                    }
                }

                Component {
                    id: leading_button_component
                    FxTextButton {
                        iconName: root.leadingIcon.name
                        isStandard: true

                        onClicked: root.leadingButtonClicked();
                    }
                }
            }

            T.TextField {
                id: search_field
                hoverEnabled: true

                Layout.alignment: Qt.AlignVCenter
                Layout.preferredHeight: (_.isActive && !_.isDocked) ? 72 : 56
                Layout.maximumHeight: (_.isActive && !_.isDocked) ? 72 : 56
                Layout.fillWidth: true

                implicitWidth: implicitBackgroundWidth + leftInset + rightInset
                               || Math.max(contentWidth, placeholder.implicitWidth) + leftPadding + rightPadding

                font: FxStyle.tokens.sys.typescale.body_large.font
                color: FxStyle.tokens.sys.color.surfaceAccent
                placeholderText: root.isActive ? root.inputTextPlaceholder : root.hintedSearchText
                placeholderTextColor: FxStyle.tokens.sys.color.surfaceAccentVariant

                selectionColor: FxStyle.tokens.sys.color.secondaryFixedDim
                selectedTextColor: FxStyle.tokens.sys.color.secondaryFixedAccent

                verticalAlignment: TextInput.AlignVCenter

                onPressed: { _.isActive = true; }

                PlaceholderText {
                    id: placeholder
                    x: search_field.leftPadding
                    y: search_field.topPadding
                    width: search_field.width - (search_field.leftPadding + search_field.rightPadding)
                    height: search_field.height - (search_field.topPadding + search_field.bottomPadding)

                    text: search_field.placeholderText
                    font: search_field.font
                    color: search_field.placeholderTextColor
                    verticalAlignment: search_field.verticalAlignment
                    visible: !search_field.length && !search_field.preeditText && (!search_field.activeFocus || search_field.horizontalAlignment !== Qt.AlignHCenter)
                    elide: Text.ElideRight
                    renderType: search_field.renderType
                }
            }

            Loader {
                id: primary_action_button
                active: _.hasPrimaryActionButton && !_.isActive
                visible: active

                Layout.alignment: Qt.AlignVCenter
                Layout.minimumHeight: _.buttonSize
                Layout.preferredHeight: _.buttonSize
                Layout.maximumHeight: _.buttonSize
                Layout.minimumWidth: _.buttonSize
                Layout.preferredWidth: _.buttonSize
                Layout.maximumWidth: _.buttonSize

                // Margins needed to account only icon size (24px)
                //  from implicit height of the standard button size (40px)
                Layout.margins: (_.iconSize - _.buttonSize) * 0.5

                sourceComponent: Component {
                    FxTextButton {
                        iconName: root.actionButtons.primaryIconName ?? ""
                        isStandard: true

                        onClicked: root.primaryActionButtonClicked();
                    }
                }
            }

            Loader {
                id: secondary_action_button

                property bool withAvatar: root.actionButtons.withAvatar

                active: _.hasSecondaryActionButton && !_.isActive
                visible: active

                Layout.alignment: Qt.AlignVCenter
                Layout.minimumHeight: _.buttonSize
                Layout.preferredHeight: _.buttonSize
                Layout.maximumHeight: _.buttonSize
                Layout.minimumWidth: _.buttonSize
                Layout.preferredWidth: _.buttonSize
                Layout.maximumWidth: _.buttonSize

                // Margins needed to account only icon size (24px) or avatar size (30px)
                //  from implicit height of the standard button size (40px)
                Layout.margins: ((withAvatar ? _.avatarSize : _.iconSize) - _.buttonSize) * 0.5

                sourceComponent: Component {
                    FxTextButton {
                        iconName: root.actionButtons.secondaryIconName ?? ""
                        isStandard: true
                        containerSpecs.shapeToken: secondary_action_button.withAvatar ? root.avatar.shapeToken : FxStyle.tokens.sys.shape.corner.full

                        onClicked: root.secondaryActionButtonClicked();

                        Loader {
                            active: secondary_action_button.withAvatar
                            visible: active

                            anchors.centerIn: parent
                            height: _.avatarSize
                            width: _.avatarSize

                            sourceComponent: FxAvatar {
                                avatarSize: _.avatarSize
                                backgroundColor: root.avatar.backgroundColor
                                fontColor: root.avatar.fontColor
                                sourceType: root.avatar.sourceType
                                source: root.avatar.source
                                shapeToken: root.avatar.shapeToken
                            }
                        }
                    }
                }
            }
        }
    }
}
