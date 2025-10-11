pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Controls.Material
import QtQuick.Layouts
import Fluxion

Drawer {
    id: root

    // Property Declarations.

    property Item content
    property alias color: container.color
    property alias elevation: container.elevation
    property alias shapeToken: container.shapeToken
    property string headlineText: "Title"
    property Component headlineTrailingItem

    property FxMotionSpringToken springToken: FxStyle.tokens.sys.motion.spring.defaults.spatial

    property bool headlineShown: true
    property bool headlineModalOpened: false
    property alias headlineModal: headline_modal.sourceComponent

    property bool backButtonShown: false
    property bool closeButtonShown: true

    // Signals

    signal closeButtonClicked()
    signal backButtonClicked()

    // Functions

    function openHeadlineModal() { headlineModalOpened = true; }
    function closeHeadlineModal() { headlineModalOpened = false; }

    function hideBackButton() { root.backButtonShown = false; }
    function hideCloseButton() { root.closeButtonShown = false; }
    function hideHeadline() { root.headlineShown = false; }
    function showBackButton() { root.backButtonShown = true; }
    function showCloseButton() { root.closeButtonShown = true; }
    function showHeadline() { root.headlineShown = true; }

    // Object properties.

    width: 256
    height: parent.height
    topPadding: 24

    edge: Qt.RightEdge
    modal: false
    interactive: false

    enter: Transition {
        SpringAnimation {
            damping: root.springToken.dampingForAnimation
            spring: root.springToken.stiffnessForAnimation
        }
    }

    exit: Transition {
        SpringAnimation {
            damping: root.springToken.dampingForAnimation
            spring: root.springToken.stiffnessForAnimation
        }
    }

    background: FxSurface {
        id: container
        shapeToken: FxStyle.tokens.sys.shape.corner.noRounding
        elevation: FxStyle.tokens.sys.elevation.level0
        color: FxStyle.tokens.sys.color.surface
    }

    onContentChanged: {
        content.parent = content_container;
    }

    onCloseButtonClicked: root.close();

    // Child objects.

    ColumnLayout{
        id: content_column
        anchors.fill: parent
        spacing: 24

        RowLayout {
            id: headline
            Layout.alignment: Qt.AlignVCenter
            Layout.rightMargin: 24
            Layout.leftMargin: root.backButtonShown ? 16 : 24
            spacing: 12

            Loader {
                id: back_button_loader
                active: root.backButtonShown && root.headlineShown
                visible: active

                Layout.alignment: Qt.AlignVCenter
                Layout.minimumWidth: item && "implicitWidth" in item ? item.implicitWidth : 0
                Layout.preferredWidth: item && "implicitWidth" in item ? item.implicitWidth : 0

                sourceComponent: FxIconButton {
                    id: back_button
                    iconName: "arrow-left"
                    buttonColor: FxExpressiveButton.Color.Text

                    onClicked: root.backButtonClicked();
                }
            }

            Loader {
                id: headline_content
                active: !headline_modal.active && root.headlineShown
                visible: active

                Layout.alignment: Qt.AlignVCenter
                Layout.fillWidth: true

                sourceComponent: Component {
                    RowLayout {
                        Layout.alignment: Qt.AlignVCenter
                        spacing: 12
                        Item {
                            id: headline_label_container
                            Layout.alignment: Qt.AlignVCenter
                            Layout.preferredHeight: headline_label.height
                            Layout.fillWidth: true
                            FxLabel {
                                id: headline_label
                                typeScaleToken: FxStyle.tokens.sys.typescale.title_large
                                color: FxStyle.tokens.sys.color.surfaceAccentVariant
                                text: root.headlineText
                            }
                        }

                        Loader {
                            id: headline_trailing_item_loader
                            active: true
                            sourceComponent: root.headlineTrailingItem ? root.headlineTrailingItem : undefined

                            Layout.alignment: Qt.AlignVCenter
                        }
                    }
                }
            }

            Loader {
                id: headline_modal
                active: root.headlineModalOpened && root.headlineShown
                visible: active

                Layout.alignment: Qt.AlignVCenter
                Layout.preferredHeight: FxStyle.tokens.sys.typescale.title_large.lineHeight
                Layout.fillWidth: true
            }

            Loader {
                id: close_button_loader
                active: root.closeButtonShown && root.headlineShown
                visible: active

                Layout.alignment: Qt.AlignVCenter
                Layout.minimumWidth: item && "implicitWidth" in item ? item.implicitWidth : 0
                Layout.preferredWidth: item && "implicitWidth" in item ? item.implicitWidth : 0

                sourceComponent: FxIconButton {
                    id: close_button
                    iconName: "close"
                    buttonColor: FxExpressiveButton.Color.Text

                    onClicked: root.closeButtonClicked();
                }
            }
        }

        Item {
            id: content_container
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }
}
