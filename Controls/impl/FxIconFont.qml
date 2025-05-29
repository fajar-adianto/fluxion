import QtQuick
import "md_icons/md_icons_desktop.js" as MdiDesktop

Item {
    id: root

    required property double fontSize
    required property string name

    property alias color: icon.color

    width: root.fontSize
    height: root.fontSize

    Text {
        id: icon

        // width: root.fontSize
        // height: root.fontSize
        anchors.centerIn: parent

        text: MdiDesktop.icons.find(item => item.name === root.name).hex
        font.family: mdiFont.name
        font.pixelSize: root.fontSize
    }

    FontLoader {
        id: mdiFont
        source: "md_icons/md_icons_desktop.ttf"
    }
}
