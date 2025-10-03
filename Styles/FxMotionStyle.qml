import QtQuick
import QuixFlux
import Fluxion

QxStore {
    id: root

    property bool useExpressiveMotionScheme: false

    readonly property alias systemTokens: system_tokens
    QtObject {
        id: system_tokens
        readonly property alias duration: duration
        readonly property alias easing: easing
        readonly property alias spring: spring
    }

    // Private objects.

    QtObject {
        id: duration
        readonly property int short1: 50
        readonly property int short2: 100
        readonly property int short3: 150
        readonly property int short4: 200
        readonly property int medium1: 250
        readonly property int medium2: 300
        readonly property int medium3: 350
        readonly property int medium4: 400
        readonly property int long1: 450
        readonly property int long2: 500
        readonly property int long3: 550
        readonly property int long4: 600
        readonly property int extraLong1: 700
        readonly property int extraLong2: 800
        readonly property int extraLong3: 900
        readonly property int extraLong4: 1000
    }

    QtObject {
        id: easing

        readonly property int emphasized: Easing.InOutExpo
        readonly property int emphasized_accelerate: Easing.InQuint
        readonly property int emphasized_decelerate: Easing.OutExpo
        readonly property int standard: Easing.InOutQuint
        readonly property int standard_accelerate: Easing.InCubic
        readonly property int standard_decelerate: Easing.OutCirc
    }

    QtObject {
        id: spring
        readonly property alias defaults: defaults
        readonly property alias fast: fast
        readonly property alias slow: slow
    }

    QtObject {
        id: fast
        readonly property alias spatial: fast_spatial
        readonly property alias effects: fast_effects
    }

    QtObject {
        id: defaults
        readonly property alias spatial: default_spatial
        readonly property alias effects: default_effects
    }

    QtObject {
        id: slow
        readonly property alias spatial: slow_spatial
        readonly property alias effects: slow_effects
    }


    // Motion spring tokens.

    FxMotionSpringToken {
        id: fast_spatial
        speed: FxMotionSpringToken.Fast
        movement: FxMotionSpringToken.Spatial
        damping: root.useExpressiveMotionScheme ? 0.6 : 0.9
        stiffness: root.useExpressiveMotionScheme ? 800 : 1400
    }

    FxMotionSpringToken {
        id: default_spatial
        speed: FxMotionSpringToken.Fast
        movement: FxMotionSpringToken.Spatial
        damping: root.useExpressiveMotionScheme ? 0.8 : 0.9
        stiffness: root.useExpressiveMotionScheme ? 380 : 700
    }

    FxMotionSpringToken {
        id: slow_spatial
        speed: FxMotionSpringToken.Fast
        movement: FxMotionSpringToken.Spatial
        damping: root.useExpressiveMotionScheme ? 0.8 : 0.9
        stiffness: root.useExpressiveMotionScheme ? 200 : 300
    }

    // Currently, all "effects" motion spring parameters are the same for both Standard and Expressive motion scheme

    FxMotionSpringToken {
        id: fast_effects
        speed: FxMotionSpringToken.Fast
        movement: FxMotionSpringToken.Spatial
        damping: 1.0
        stiffness: 3800
    }

    FxMotionSpringToken {
        id: default_effects
        speed: FxMotionSpringToken.Fast
        movement: FxMotionSpringToken.Spatial
        damping: 1.0
        stiffness: 1600
    }

    FxMotionSpringToken {
        id: slow_effects
        speed: FxMotionSpringToken.Fast
        movement: FxMotionSpringToken.Spatial
        damping: 1.0
        stiffness: 800
    }

    // Action filters.

    QxFilter {
        type: FxContextActionTypes.switchMotionScheme
        onDispatched:
            (type, message) => {
                root.useExpressiveMotionScheme = !root.useExpressiveMotionScheme;
            }
    }

    QxFilter {
        type: FxContextActionTypes.useExpressiveMotionScheme
        onDispatched:
            (type, message) => {
                root.useExpressiveMotionScheme = true;
            }
    }

    QxFilter {
        type: FxContextActionTypes.useStandardMotionScheme
        onDispatched:
            (type, message) => {
                root.useExpressiveMotionScheme = false;
            }
    }

}
