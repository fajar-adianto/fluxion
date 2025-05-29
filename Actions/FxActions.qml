pragma Singleton
import QtQuick

Item {
    id: root

    readonly property alias contexts: context_actions
    FxContextActions { id: context_actions }

    readonly property alias styles: style_actions
    FxStyleActions { id: style_actions }
}
