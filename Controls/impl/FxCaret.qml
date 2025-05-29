import QtQuick
import "../../Styles"

Rectangle {
    id: root

    visible: parent.activeFocus && !parent.readOnly && (parent.selectionStart === parent.selectionEnd)
    color: FxStyle.tokens.sys.color.primary
    width: 1

    Timer {
      id: flash_timer

      running: root.visible
      repeat: true
      interval: Application.styleHints.cursorFlashTime / 2
      onTriggered: root.opacity = !root.opacity ? 1 : 0

      // force the cursor visible when gaining focus
      onRunningChanged: root.opacity = 1
    }

    Connections {
        target: root.parent

        function onCursorPositionChanged() {
          // Keep a moving cursor visible
          root.opacity = 1
          flash_timer.restart()
        }
    }
}
