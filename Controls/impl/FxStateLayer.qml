import QtQuick
import QtQuick.Effects
import "../../Styles"

/*!
    \brief Material 3 state layer implementation. Must be a direct child of an UI Element.
*/
MultiEffect {
    id: root

    // Property declarations.

    /*!
        This property holds the container object of UI element which is to be manipulated by the state layer.
        \note It is not supported to have container that is not a sibling of state layer.
    */
    required property Item container
    required property color stateLayerColor

    property bool hasPressedState: false
    property bool hasHoveredState: true

    QtObject {
        id: _
        property bool isEnabled: root.parent.enabled
        property bool isDragged: false // Not implemented yet.
        property bool isFocused: root.parent.activeFocus
        property bool isHovered: root.hasHoveredState ? root.parent.hovered : false;
        property bool isPressed: root.hasPressedState ? root.parent.pressed : false;
    }

    // Object properties.

    source: container
    anchors.fill: container
    colorization: 1

    states: [
        State {
            name: "enabled"
            when: _.isEnabled && !(_.isDragged || _.isFocused || _.isHovered || _.isPressed)
            PropertyChanges { root.visible: false }
        },
        State {
            name: "disabled"
            when: !_.isEnabled
            PropertyChanges { root.opacity: 0.12; root.colorizationColor: FxStyle.tokens.sys.color.surfaceAccent }
            PropertyChanges { container.opacity: 0 }
        },
        State {
            name: "hovered"
            when: _.isEnabled && _.isHovered && !(_.isDragged || _.isPressed)
            PropertyChanges { root.opacity: FxStyle.tokens.sys.state.hovered.stateLayerOpacity; root.colorizationColor: stateLayerColor }
        },
        State {
            name: "focused"
            when: _.isEnabled && _.isFocused && !(_.isDragged || _.isHovered || _.isPressed)
            PropertyChanges { root.opacity: FxStyle.tokens.sys.state.focused.stateLayerOpacity; root.colorizationColor: stateLayerColor }
        },
        State {
            name: "pressed"
            when: _.isEnabled && _.isPressed && !_.isDragged
            PropertyChanges { root.opacity: FxStyle.tokens.sys.state.pressed.stateLayerOpacity; root.colorizationColor: stateLayerColor }
        },
        State {
            name: "dragged"
            when: _.isEnabled && _.isDragged
            PropertyChanges { root.opacity: FxStyle.tokens.sys.state.dragged.stateLayerOpacity; root.colorizationColor: stateLayerColor }
        }
    ]
}
