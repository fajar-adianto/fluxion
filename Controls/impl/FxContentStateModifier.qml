import QtQuick
import QtQuick.Effects
import "../../Styles"

MultiEffect {
    id: root

    // Property declarations.

    required property Item target
    required property FxStateLayer stateLayer

    function extendEnabledState(extension: State) { _.extendState(extension, "enabled"); }
    function extendDisabledState(extension: State) { _.extendState(extension, "disabled"); }
    function extendHoveredState(extension: State) { _.extendState(extension, "hovered"); }
    function extendFocusedState(extension: State) { _.extendState(extension, "focused"); }
    function extendPressedState(extension: State) { _.extendState(extension, "pressed"); }
    function extendDraggedState(extension: State) { _.extendState(extension, "dragged"); }

    QtObject {
        id: _
        function extendState(extension: State, state_name: string)
        {
            if (root.states.some(item => item.name === (state_name + "_base")))
            {
                console.error("FxContentStateModifier: Error! Cannot extend already extended state: " + state_name);
                return;
            }

            var base_state = root.states.find(item => item.name === state_name)
            base_state.name = state_name + "_base";
            extension.name = state_name;
            extension.extend = base_state.name;
            root.states.push(extension);
        }
    }

    // Object properties.

    visible: target.visible
    source: target
    anchors.fill: target
    colorization: 1

    state: target ? stateLayer.state : ""
    states: [
        State {
            id: enabled_state
            name: "enabled"
            // Reserved for future use.
        },
        State {
            id: disabled_state
            name: "disabled"
            PropertyChanges { root.opacity: 0.38; root.colorizationColor: FxStyle.tokens.sys.color.surfaceAccent }
            PropertyChanges { root.target.opacity: 0 }
        },
        State {
            id: hovered_state
            name: "hovered"
            // Reserved for future use.
        },
        State {
            id: focused_state
            name: "focused"
            // Reserved for future use.
        },
        State {
            id: pressed_state
            name: "pressed"
            // Reserved for future use.
        },
        State {
            id: dragged_state
            name: "dragged"
            // Reserved for future use.
        }
    ]
}
