pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Effects
import Fluxion

Item {
    id: root

    enum SourceType {
        Image,
        Name,
        Icon
    }

    property real avatarSize: 30

    property color backgroundColor: FxStyle.tokens.sys.color.tertiaryFixed
    property color fontColor: FxStyle.tokens.sys.color.tertiaryFixedAccent
    property FxShapeToken shapeToken: FxStyle.tokens.sys.shape.corner.full
    property string source
    property int sourceType: FxAvatar.SourceType.Image

    // Private properties.

    QtObject {
        id: _

        readonly property string avatarName: (root.sourceType == FxAvatar.SourceType.Name) ? root.source : ""
        readonly property string initials: getInitials(avatarName)
        readonly property real avatarSize: root.avatarSize

        function getInitials(name) {
          if (!name.trim()) return "??"; // Handle empty or whitespace input

          const words = name.trim().split(/\s+/);
          const first = words[0]?.[0] || "";
          const last = words.length > 1 ? words[words.length - 1][0] : words[0]?.[1] || "";

          return (first + last).toUpperCase();
        }

        onAvatarSizeChanged: {
            root.implicitHeight = avatarSize;
            root.implicitWidth = avatarSize;
            root.height = avatarSize;
            root.width = avatarSize;
        }
    }

    // Child objects.

    Item {
        id: background
        visible: root.sourceType !== FxAvatar.SourceType.Image
        anchors.fill: root
        z: -1

        layer.enabled: true

        Rectangle {
            property bool fullCorner: root.shapeToken === FxStyle.tokens.sys.shape.corner.full

            anchors.fill: parent
            color: root.backgroundColor

            radius: height/2
            topLeftRadius: fullCorner ? undefined : root.shapeToken.corners.topLeft
            topRightRadius: fullCorner ? undefined : root.shapeToken.corners.topRight
            bottomLeftRadius: fullCorner ? undefined : root.shapeToken.corners.bottomLeft
            bottomRightRadius: fullCorner ? undefined : root.shapeToken.corners.bottomRight
        }
    }

    Loader {
        id: content_loader
        active: true

        anchors.fill: root
        anchors.centerIn: root

        sourceComponent: (root.sourceType == FxAvatar.SourceType.Image) ? image_avatar :
                         (root.sourceType == FxAvatar.SourceType.Name) ? initials_avatar : icon_avatar
    }

    Component {
        id: image_avatar

        Item {
            Image {
                id: image_source_item
                source: root.source
                anchors.fill: parent
                anchors.centerIn: parent
                visible: false
            }

            MultiEffect {
                source: image_source_item
                anchors.fill: parent
                anchors.centerIn: parent
                maskEnabled: true
                maskSource: background
            }
        }
    }

    Component {
        id: initials_avatar
        Text {
            font: (root.height >= 30) ? FxStyle.tokens.sys.typescale.title_medium.font : FxStyle.tokens.sys.typescale.title_small.font
            text: _.initials
            color: root.fontColor
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

    }

    Component {
        id: icon_avatar
        FxIconFont {
            name: root.source
            color: root.fontColor
            fontSize: root.height - 6
        }
    }
}
