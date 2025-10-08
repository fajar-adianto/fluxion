import QtQuick
import Fluxion

Behavior {
    id: root

    required property FxMotionSpringToken springToken
    readonly property bool steady: !animation.running

    SpringAnimation {
        id: animation
        spring: root.springToken.stiffnessForAnimation
        damping: root.springToken.dampingForAnimation
    }
}
