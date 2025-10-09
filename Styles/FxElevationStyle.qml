import QtQuick
import QuixFlux

QxStore {
    id: root

    readonly property alias systemTokens: system_tokens
    QtObject {
        id: system_tokens

        readonly property int level0: 0
        readonly property int level1: 1
        readonly property int level2: 3
        readonly property int level3: 6
        readonly property int level4: 8
        readonly property int level5: 12
    }

    readonly property alias referenceTokens: reference_tokens
    QtObject {
        id: reference_tokens

        readonly property int maxDistance: shadow.umbra.length
        readonly property alias shadow: shadow
    }

    // Private objects.

    QtObject {
        id: shadow

        readonly property real defaultStrength: 0.025
        readonly property real maxStrength: 0.8

        readonly property real umbraOpacity: 0.2
        readonly property var umbra: [
            { 'offsetX': 0, 'offsetY': 0, 'blur': 0, 'spread': 0 },     // 0dp elevation.
            { 'offsetX': 0, 'offsetY': 2, 'blur': 1, 'spread': -1 },    // 1dp elevation.
            { 'offsetX': 0, 'offsetY': 3, 'blur': 1, 'spread': -2 },    // 2dp elevation.
            { 'offsetX': 0, 'offsetY': 3, 'blur': 3, 'spread': -2 },    // 3dp elevation.
            { 'offsetX': 0, 'offsetY': 2, 'blur': 4, 'spread': -1 },    // 4dp elevation.
            { 'offsetX': 0, 'offsetY': 3, 'blur': 5, 'spread': -1 },    // 5dp elevation.
            { 'offsetX': 0, 'offsetY': 3, 'blur': 5, 'spread': -1 },    // 6dp elevation.
            { 'offsetX': 0, 'offsetY': 4, 'blur': 5, 'spread': -2 },    // 7dp elevation.
            { 'offsetX': 0, 'offsetY': 5, 'blur': 5, 'spread': -3 },    // 8dp elevation.
            { 'offsetX': 0, 'offsetY': 5, 'blur': 6, 'spread': -3 },    // 9dp elevation.
            { 'offsetX': 0, 'offsetY': 6, 'blur': 6, 'spread': -3 },    // 10dp elevation.
            { 'offsetX': 0, 'offsetY': 6, 'blur': 7, 'spread': -4 },    // 11dp elevation.
            { 'offsetX': 0, 'offsetY': 7, 'blur': 8, 'spread': -4 },    // 12dp elevation.
            { 'offsetX': 0, 'offsetY': 7, 'blur': 8, 'spread': -4 },    // 13dp elevation.
            { 'offsetX': 0, 'offsetY': 7, 'blur': 9, 'spread': -4 },    // 14dp elevation.
            { 'offsetX': 0, 'offsetY': 8, 'blur': 9, 'spread': -5 },    // 15dp elevation.
            { 'offsetX': 0, 'offsetY': 8, 'blur': 10, 'spread': -5 },   // 16dp elevation.
            { 'offsetX': 0, 'offsetY': 8, 'blur': 11, 'spread': -5 },   // 17dp elevation.
            { 'offsetX': 0, 'offsetY': 9, 'blur': 11, 'spread': -5 },   // 18dp elevation.
            { 'offsetX': 0, 'offsetY': 9, 'blur': 12, 'spread': -6 },   // 19dp elevation.
            { 'offsetX': 0, 'offsetY': 10, 'blur': 13, 'spread': -6 },  // 20dp elevation.
            { 'offsetX': 0, 'offsetY': 10, 'blur': 13, 'spread': -6 },  // 21dp elevation.
            { 'offsetX': 0, 'offsetY': 10, 'blur': 14, 'spread': -6 },  // 22dp elevation.
            { 'offsetX': 0, 'offsetY': 11, 'blur': 14, 'spread': -7 },  // 23dp elevation.
            { 'offsetX': 0, 'offsetY': 11, 'blur': 15, 'spread': -7 }   // 24dp elevation.
        ]

        readonly property real penumbraOpacity: 0.14
        readonly property var penumbra: [
            { 'offsetX': 0, 'offsetY': 0, 'blur': 0, 'spread': 0 },     // 0dp elevation.
            { 'offsetX': 0, 'offsetY': 1, 'blur': 1, 'spread': 0 },     // 1dp elevation.
            { 'offsetX': 0, 'offsetY': 2, 'blur': 2, 'spread': 0 },     // 2dp elevation.
            { 'offsetX': 0, 'offsetY': 3, 'blur': 4, 'spread': 0 },     // 3dp elevation.
            { 'offsetX': 0, 'offsetY': 4, 'blur': 5, 'spread': 0 },     // 4dp elevation.
            { 'offsetX': 0, 'offsetY': 5, 'blur': 8, 'spread': 0 },     // 5dp elevation.
            { 'offsetX': 0, 'offsetY': 6, 'blur': 10, 'spread': 0 },    // 6dp elevation.
            { 'offsetX': 0, 'offsetY': 7, 'blur': 10, 'spread': 1 },    // 7dp elevation.
            { 'offsetX': 0, 'offsetY': 8, 'blur': 10, 'spread': 1 },    // 8dp elevation.
            { 'offsetX': 0, 'offsetY': 9, 'blur': 12, 'spread': 1 },    // 9dp elevation.
            { 'offsetX': 0, 'offsetY': 10, 'blur': 14, 'spread': 1 },   // 10dp elevation.
            { 'offsetX': 0, 'offsetY': 11, 'blur': 15, 'spread': 1 },   // 11dp elevation.
            { 'offsetX': 0, 'offsetY': 12, 'blur': 17, 'spread': 2 },   // 12dp elevation.
            { 'offsetX': 0, 'offsetY': 13, 'blur': 19, 'spread': 2 },   // 13dp elevation.
            { 'offsetX': 0, 'offsetY': 14, 'blur': 21, 'spread': 2 },   // 14dp elevation.
            { 'offsetX': 0, 'offsetY': 15, 'blur': 22, 'spread': 2 },   // 15dp elevation.
            { 'offsetX': 0, 'offsetY': 16, 'blur': 24, 'spread': 2 },   // 16dp elevation.
            { 'offsetX': 0, 'offsetY': 17, 'blur': 26, 'spread': 2 },   // 17dp elevation.
            { 'offsetX': 0, 'offsetY': 18, 'blur': 28, 'spread': 2 },   // 18dp elevation.
            { 'offsetX': 0, 'offsetY': 19, 'blur': 29, 'spread': 2 },   // 19dp elevation.
            { 'offsetX': 0, 'offsetY': 20, 'blur': 31, 'spread': 3 },   // 20dp elevation.
            { 'offsetX': 0, 'offsetY': 21, 'blur': 33, 'spread': 3 },   // 21dp elevation.
            { 'offsetX': 0, 'offsetY': 22, 'blur': 35, 'spread': 3 },   // 22dp elevation.
            { 'offsetX': 0, 'offsetY': 23, 'blur': 36, 'spread': 3 },   // 23dp elevation.
            { 'offsetX': 0, 'offsetY': 24, 'blur': 38, 'spread': 3 }    // 24dp elevation.
        ]

        readonly property real ambientOpacity: 0.12
        readonly property var ambient: [
            { 'offsetX': 0, 'offsetY': 0, 'blur': 0, 'spread': 0 },     // 0dp elevation.
            { 'offsetX': 0, 'offsetY': 1, 'blur': 3, 'spread': 0 },     // 1dp elevation.
            { 'offsetX': 0, 'offsetY': 1, 'blur': 5, 'spread': 0 },     // 2dp elevation.
            { 'offsetX': 0, 'offsetY': 1, 'blur': 8, 'spread': 0 },     // 3dp elevation.
            { 'offsetX': 0, 'offsetY': 1, 'blur': 10, 'spread': 0 },    // 4dp elevation.
            { 'offsetX': 0, 'offsetY': 1, 'blur': 14, 'spread': 0 },    // 5dp elevation.
            { 'offsetX': 0, 'offsetY': 1, 'blur': 18, 'spread': 0 },    // 6dp elevation.
            { 'offsetX': 0, 'offsetY': 2, 'blur': 16, 'spread': 1 },    // 7dp elevation.
            { 'offsetX': 0, 'offsetY': 3, 'blur': 14, 'spread': 2 },    // 8dp elevation.
            { 'offsetX': 0, 'offsetY': 3, 'blur': 16, 'spread': 2 },    // 9dp elevation.
            { 'offsetX': 0, 'offsetY': 4, 'blur': 18, 'spread': 3 },    // 10dp elevation.
            { 'offsetX': 0, 'offsetY': 4, 'blur': 20, 'spread': 3 },    // 11dp elevation.
            { 'offsetX': 0, 'offsetY': 5, 'blur': 22, 'spread': 4 },    // 12dp elevation.
            { 'offsetX': 0, 'offsetY': 5, 'blur': 24, 'spread': 4 },    // 13dp elevation.
            { 'offsetX': 0, 'offsetY': 5, 'blur': 26, 'spread': 4 },    // 14dp elevation.
            { 'offsetX': 0, 'offsetY': 6, 'blur': 28, 'spread': 5 },    // 15dp elevation.
            { 'offsetX': 0, 'offsetY': 6, 'blur': 30, 'spread': 5 },    // 16dp elevation.
            { 'offsetX': 0, 'offsetY': 6, 'blur': 32, 'spread': 5 },    // 17dp elevation.
            { 'offsetX': 0, 'offsetY': 7, 'blur': 34, 'spread': 6 },    // 18dp elevation.
            { 'offsetX': 0, 'offsetY': 7, 'blur': 36, 'spread': 6 },    // 19dp elevation.
            { 'offsetX': 0, 'offsetY': 8, 'blur': 38, 'spread': 7 },    // 20dp elevation.
            { 'offsetX': 0, 'offsetY': 8, 'blur': 40, 'spread': 7 },    // 21dp elevation.
            { 'offsetX': 0, 'offsetY': 8, 'blur': 42, 'spread': 7 },    // 22dp elevation.
            { 'offsetX': 0, 'offsetY': 9, 'blur': 44, 'spread': 8 },    // 23dp elevation.
            { 'offsetX': 0, 'offsetY': 9, 'blur': 46, 'spread': 8 }     // 24dp elevation.
        ]
    }
}
