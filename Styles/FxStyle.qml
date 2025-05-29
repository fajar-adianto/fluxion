pragma Singleton
import QtQuick
import QuixFlux
import Fluxion

QxStore {
    id: root

    bindSource: QxAppDispatcher;

    readonly property alias contexts: contexts
    QtObject {
        id: contexts
        property bool useDarkTheme: false
    }

    readonly property alias tokens: tokens
    QtObject {
        id: tokens

        readonly property alias sys: system_tokens
        readonly property alias ref: reference_tokens
    }

    // Fluxion Style Store Components.

    FxColorStyle { id: color_style }
    FxElevationStyle { id: elevation_style }
    FxMotionStyle { id: motion_style }
    FxShapeStyle { id: shape_style }
    FxTypographyStyle { id: typography_style }

    // Private objects.

    QtObject {
        id: reference_tokens

        readonly property alias elevation: elevation_style.referenceTokens
        readonly property alias typeface: typography_style.referenceTokens
    }

    QtObject {
        id: system_tokens

        readonly property alias color: color_style.systemTokens
        readonly property alias elevation: elevation_style.systemTokens
        readonly property alias motion: motion_style.systemTokens
        readonly property alias shape: shape_style.systemTokens
        readonly property alias typescale: typography_style.systemTokens

        readonly property alias state: state
    }

    QtObject {
        id: state

        readonly property alias hovered: hovered
        readonly property alias focused: focused
        readonly property alias pressed: pressed
        readonly property alias dragged: dragged
    }

    QtObject {
        id: hovered
        readonly property real stateLayerOpacity: 0.08
    }

    QtObject {
        id: focused
        readonly property real stateLayerOpacity: 0.10
    }

    QtObject {
        id: pressed
        readonly property real stateLayerOpacity: 0.10
    }

    QtObject {
        id: dragged
        readonly property real stateLayerOpacity: 0.16
    }

    // Action filters.

    QxFilter {
        type: FxContextActionTypes.switchTheme
        onDispatched: (type, message) => {
            contexts.useDarkTheme = contexts.useDarkTheme ? false : true;
        }
    }

    QxFilter {
        type: FxContextActionTypes.useDarkTheme
        onDispatched: (type, message) => {
            contexts.useDarkTheme = true;
        }
    }

    QxFilter {
        type: FxContextActionTypes.useLightTheme
        onDispatched: (type, message) => {
            contexts.useDarkTheme = false;
        }
    }
}
