import QtQuick

Item {
    id: root

    required property Item target

    property bool isEnabled: root.target.enabled ?? false
    property bool isDragged: false // Not implemented yet.
    property bool isFocused: root.target.activeFocus
    property bool isHovered: root.target.hovered ?? false
    property bool isPressed: false // Need to be assigned.

    visible: false
    states: [
        State {
            name: "enabled"
            when: root.isEnabled && !(root.isDragged || root.isFocused || root.isHovered || root.isPressed)
        },
        State {
            name: "disabled"
            when: !root.isEnabled
        },
        State {
            name: "hovered"
            when: root.isEnabled && root.isHovered && !(root.isDragged || root.isPressed)
        },
        State {
            name: "focused"
            when: root.isEnabled && root.isFocused && !(root.isDragged || root.isHovered || root.isPressed)
        },
        State {
            name: "pressed"
            when: root.isEnabled && root.isPressed && !root.isDragged
        },
        State {
            name: "dragged"
            when: root.isEnabled && root.isDragged
        }
    ]
}
