import QtQuick
import Fluxion

Behavior {
    id: root

    required property FxMotionSpringToken springToken

    SpringAnimation {

        property real reciprocal: (1.0 / root.targetValue)
        property real value: root.targetProperty.object[root.targetProperty.name]

        target: root.targetProperty.object
        property: root.targetProperty.name
        to: root.targetValue

        spring: root.springToken.stiffnessForAnimation
        damping: (root.springToken.damping * (1.0 - Math.abs((value - to) * reciprocal)))
    }
}
