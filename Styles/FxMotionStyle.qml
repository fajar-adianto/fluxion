import QtQuick
import QuixFlux

QxStore {
    id: root

    readonly property alias systemTokens: system_tokens
    QtObject {
        id: system_tokens
        readonly property alias duration: duration
        readonly property alias easing: easing
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
}
