import QtQuick
import Fluxion

SpringAnimation {
    id: root

    required property FxMotionSpringToken springToken

    onSpringTokenChanged: {
        // root.mass = 5.0; // Consider setting the mass for fine tuning.
        root.damping = root.springToken.dampingForAnimation;
        root.spring = root.springToken.stiffnessForAnimation;
    }
}
