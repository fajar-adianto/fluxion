import QtQuick
import Fluxion

/*
   An effect for standard Material Design elevation shadows. Useful for using as \c layer.effect.
 */
Item {
    id: effect

    property FxMotionSpringToken springToken: FxStyle.tokens.sys.motion.spring.fast.effects

    /*
       The source the effect is applied to.
     */
    property var source

    /*
       The elevation of the \l source Item.
     */
    property int elevation: 0

    /*
       Set to \c true if the \l source Item is the same width as its parent and the shadow
       should be full width instead of rounding around the corner of the Item.

       \sa fullHeight
     */
    property bool fullWidth: false

    /*
       Set to \c true if the \l source Item is the same height as its parent and the shadow
       should be full height instead of rounding around the corner of the Item.

       \sa fullWidth
     */
    property bool fullHeight: false

    /*
       \internal

       The actual source Item the effect is applied to.
     */
    readonly property Item sourceItem: source.sourceItem

    readonly property int _elevation: Math.max(0, Math.min(effect.elevation, FxStyle.tokens.ref.elevation.maxDistance))
    property var _umbra: FxStyle.tokens.ref.elevation.shadow.umbra
    property var _penumbra: FxStyle.tokens.ref.elevation.shadow.penumbra
    property var _ambient: FxStyle.tokens.ref.elevation.shadow.ambient
    property real _strength: FxStyle.tokens.ref.elevation.shadow.defaultStrength

    // Nest the shadows and source view in two items rendered as a layer
    // so the shadow is not clipped by the bounds of the source view
    Item {
        id: shadow

        property color color: FxStyle.tokens.sys.color.shadow
        property int margin: -100

        x: margin
        y: margin
        width: parent.width - 2 * margin
        height: parent.height - 2 * margin

        // By rendering as a layer, the shadow will never show through the source item,
        // even when the source item's opacity is less than 1
        layer.enabled: true

        // The box shadows automatically pick up the size of the source Item and not
        // the size of the parent, so we don't need to worry about the extra padding
        // in the parent Item
        FxBoxShadow {
            id: umbra
            springToken: effect.springToken
            offsetX: effect._umbra[effect._elevation].offsetX
            offsetY: effect._umbra[effect._elevation].offsetY
            blurRadius: effect._umbra[effect._elevation].blur
            spreadRadius: effect._umbra[effect._elevation].spread
            strength: effect._strength
            color: Qt.rgba(shadow.color.r, shadow.color.g, shadow.color.b, FxStyle.tokens.ref.elevation.shadow.umbraOpacity)

            fullWidth: effect.fullWidth
            fullHeight: effect.fullHeight
            source: effect.sourceItem
        }

        FxBoxShadow {
            id: penumbra
            springToken: effect.springToken
            offsetX: effect._penumbra[effect._elevation].offsetX
            offsetY: effect._penumbra[effect._elevation].offsetY
            blurRadius: effect._penumbra[effect._elevation].blur
            spreadRadius: effect._penumbra[effect._elevation].spread
            strength: effect._strength
            color: Qt.rgba(shadow.color.r, shadow.color.g, shadow.color.b, FxStyle.tokens.ref.elevation.shadow.penumbraOpacity)

            fullWidth: effect.fullWidth
            fullHeight: effect.fullHeight
            source: effect.sourceItem
        }

        FxBoxShadow {
            id: ambient
            springToken: effect.springToken
            offsetX: effect._ambient[effect._elevation].offsetX
            offsetY: effect._ambient[effect._elevation].offsetY
            blurRadius: effect._ambient[effect._elevation].blur
            spreadRadius: effect._ambient[effect._elevation].spread
            strength: effect._strength
            color: Qt.rgba(shadow.color.r, shadow.color.g, shadow.color.b, FxStyle.tokens.ref.elevation.shadow.ambientOpacity)

            fullWidth: effect.fullWidth
            fullHeight: effect.fullHeight
            source: effect.sourceItem
        }

        ShaderEffect {
            property alias source: effect.source

            x: (parent.width - width)/2
            y: (parent.height - height)/2
            width: effect.sourceItem.width
            height: effect.sourceItem.height
        }
    }
}
