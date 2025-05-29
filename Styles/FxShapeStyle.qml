import QtQuick
import QuixFlux
import Fluxion

QxStore {
    id: root

    readonly property alias systemTokens: system_tokens
    QtObject {
        id: system_tokens

        readonly property alias corner: corner
    }

    // Private objects.

    QtObject {
        id: corner

        readonly property alias noRounding: no_rounding
        readonly property alias extraSmall: extra_small
        readonly property alias small: small
        readonly property alias medium: medium
        readonly property alias large: large
        readonly property alias extraLarge: extra_large
        readonly property alias full: full
    }

    FxShapeToken {
        id: no_rounding
        directionalModifier: FxShapeToken.DirectionalModifier.None
        role: FxShapeToken.Role.None
        value: 0
    }

    FxShapeToken {
        id: extra_small
        directionalModifier: FxShapeToken.DirectionalModifier.None
        role: FxShapeToken.Role.ExtraSmall
        value: 4

        readonly property alias top: extra_small_top
    }

    FxShapeToken {
        id: extra_small_top
        directionalModifier: FxShapeToken.DirectionalModifier.Top
        role: extra_small.role
        value: extra_small.value
    }

    FxShapeToken {
        id: small
        directionalModifier: FxShapeToken.DirectionalModifier.None
        role: FxShapeToken.Role.Small
        value: 8
    }

    FxShapeToken {
        id: medium
        directionalModifier: FxShapeToken.DirectionalModifier.None
        role: FxShapeToken.Role.Medium
        value: 12
    }

    FxShapeToken {
        id: large
        directionalModifier: FxShapeToken.DirectionalModifier.None
        role: FxShapeToken.Role.Large
        value: 16

        readonly property alias end: large_end
        readonly property alias top: large_top
    }

    FxShapeToken {
        id: large_end
        directionalModifier: FxShapeToken.DirectionalModifier.End
        role: large.role
        value: large.value
    }

    FxShapeToken {
        id: large_top
        directionalModifier: FxShapeToken.DirectionalModifier.Top
        role: large.role
        value: large.value
    }

    FxShapeToken {
        id: extra_large
        directionalModifier: FxShapeToken.DirectionalModifier.None
        role: FxShapeToken.Role.ExtraLarge
        value: 28

        readonly property alias top: extra_large_top
    }

    FxShapeToken {
        id: extra_large_top
        directionalModifier: FxShapeToken.DirectionalModifier.Top
        role: extra_large.role
        value: extra_large.value
    }

    FxShapeToken {
        id: full
        directionalModifier: FxShapeToken.DirectionalModifier.None
        role: FxShapeToken.Role.Full
        value: 0.5
    }
}
