cmake_minimum_required(VERSION 3.16)

project(Fluxion VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(QT_QML_OUTPUT_DIRECTORY  ${CMAKE_BINARY_DIR})
set(QT_QML_GENERATE_QMLLS_INI ON)

find_package(Qt6 REQUIRED COMPONENTS Quick QuickControls2)

qt_policy(SET QTP0001 NEW)
qt_policy(SET QTP0004 NEW)
qt_policy(SET QTP0005 NEW)

include(FetchContent)
FetchContent_Declare(
    quixflux
    GIT_REPOSITORY "https://github.com/fajar-adianto/quixflux.git"
    GIT_TAG main
)
FetchContent_MakeAvailable(quixflux)

FetchContent_Declare(
    abseilCpp
    GIT_REPOSITORY "https://github.com/abseil/abseil-cpp.git"
    GIT_TAG master
)
FetchContent_MakeAvailable(abseilCpp)

set_source_files_properties(Styles/FxStyle.qml PROPERTIES QT_QML_SINGLETON_TYPE TRUE)
set_source_files_properties(Actions/FxActions.qml PROPERTIES QT_QML_SINGLETON_TYPE TRUE)
set_source_files_properties(Actions/FxContextActionTypes.qml PROPERTIES QT_QML_SINGLETON_TYPE TRUE)
set_source_files_properties(Actions/FxStyleActionTypes.qml PROPERTIES QT_QML_SINGLETON_TYPE TRUE)

qt_add_library(Fluxion STATIC)
qt_add_qml_module(Fluxion
    URI Fluxion
    VERSION 1.0
    SOURCES
        cpp/fxcolorscheme.h cpp/fxcolorscheme.cpp
        cpp/fx_container_specification.h cpp/fx_container_specification.cpp
        cpp/fx_icon_specification.h cpp/fx_icon_specification.cpp
        cpp/fx_shape_token.h cpp/fx_shape_token.cpp
        cpp/fx_spec_color.h cpp/fx_spec_color.cpp
        cpp/fx_spec_float.h cpp/fx_spec_float.cpp
        cpp/fx_spec_integer.h cpp/fx_spec_integer.cpp
        cpp/fx_state_layer_specification.h cpp/fx_state_layer_specification.cpp
        cpp/fx_text_specification.h cpp/fx_text_specification.cpp
        cpp/fx_type_scale_token.h cpp/fx_type_scale_token.cpp
        cpp/blend/blend.cc
        cpp/blend/blend.h
        cpp/cam/cam.cc
        cpp/cam/cam.h
        cpp/cam/hct.cc
        cpp/cam/hct.h
        cpp/cam/hct_solver.cc
        cpp/cam/hct_solver.h
        cpp/cam/viewing_conditions.cc
        cpp/cam/viewing_conditions.h
        cpp/contrast/contrast.cc
        cpp/contrast/contrast.h
        cpp/dislike/dislike.cc
        cpp/dislike/dislike.h
        cpp/dynamiccolor/contrast_curve.h
        cpp/dynamiccolor/dynamic_color.cc
        cpp/dynamiccolor/dynamic_color.h
        cpp/dynamiccolor/dynamic_scheme.cc
        cpp/dynamiccolor/dynamic_scheme.h
        cpp/dynamiccolor/material_dynamic_colors.cc
        cpp/dynamiccolor/material_dynamic_colors.h
        cpp/dynamiccolor/tone_delta_pair.h
        cpp/dynamiccolor/variant.h
        cpp/palettes/core.h
        cpp/palettes/tones.cc
        cpp/palettes/tones.h
        cpp/quantize/celebi.cc
        cpp/quantize/celebi.h
        cpp/quantize/lab.cc
        cpp/quantize/lab.h
        cpp/quantize/wsmeans.cc
        cpp/quantize/wsmeans.h
        cpp/quantize/wu.cc
        cpp/quantize/wu.h
        cpp/scheme/scheme_content.cc
        cpp/scheme/scheme_content.h
        cpp/scheme/scheme_expressive.cc
        cpp/scheme/scheme_expressive.h
        cpp/scheme/scheme_fidelity.cc
        cpp/scheme/scheme_fidelity.h
        cpp/scheme/scheme_fruit_salad.cc
        cpp/scheme/scheme_fruit_salad.h
        cpp/scheme/scheme_monochrome.cc
        cpp/scheme/scheme_monochrome.h
        cpp/scheme/scheme_neutral.cc
        cpp/scheme/scheme_neutral.h
        cpp/scheme/scheme_rainbow.cc
        cpp/scheme/scheme_rainbow.h
        cpp/scheme/scheme_tonal_spot.cc
        cpp/scheme/scheme_tonal_spot.h
        cpp/scheme/scheme_vibrant.cc
        cpp/scheme/scheme_vibrant.h
        cpp/score/score.cc
        cpp/score/score.h
        cpp/temperature/temperature_cache.cc
        cpp/temperature/temperature_cache.h
        cpp/utils/utils.cc
        cpp/utils/utils.h
    QML_FILES
        Actions/FxActions.qml
        Actions/FxContextActions.qml
        Actions/FxContextActionTypes.qml
        Actions/FxStyleActions.qml
        Actions/FxStyleActionTypes.qml
        Controls/impl/md_icons/md_icons_desktop.js
        Controls/impl/FxBoxShadow.qml
        Controls/impl/FxCaret.qml
        Controls/impl/FxComponentColor.qml
        Controls/impl/FxContentStateModifier.qml
        Controls/impl/FxElevationEffect.qml
        Controls/impl/FxIconFont.qml
        Controls/impl/FxRectangularGlow.qml
        Controls/impl/FxRoundedElevationEffect.qml
        Controls/impl/FxStateLayer.qml
        Controls/FxAvatar.qml
        Controls/FxButton.qml
        Controls/FxContainer.qml
        Controls/FxElevatedButton.qml
        Controls/FxFilledButton.qml
        Controls/FxFilledTextField.qml
        Controls/FxIcon.qml
        Controls/FxInteractionState.qml
        Controls/FxLabel.qml
        Controls/FxListItem.qml
        Controls/FxOutlinedButton.qml
        Controls/FxOutlinedTextField.qml
        Controls/FxRoundedShape.qml
        Controls/FxSearch.qml
        Controls/FxSideSheet.qml
        Controls/FxSurface.qml
        Controls/FxTextButton.qml
        Controls/FxTextField.qml
        Styles/FxColorStyle.qml
        Styles/FxElevationStyle.qml
        Styles/FxMotionStyle.qml
        Styles/FxShapeStyle.qml
        Styles/FxTypographyStyle.qml
        Styles/FxStyle.qml
    RESOURCES
        Controls/impl/md_icons/md_icons_desktop.ttf
        Controls/impl/md_icons/md_icons_webfont.ttf
        Controls/impl/shaders/RectangularGlow.frag.qsb
        Styles/fonts/RobotoFlex.ttf
    IMPORTS
        TARGET QuixFlux
)

set_target_properties(Fluxion PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_compile_definitions(Fluxion
    PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(Fluxion
    PRIVATE
        Qt6::Quick Qt6::QuickControls2
        absl::base absl::flat_hash_map # Abseil-cpp Installation
    PUBLIC
        QuixFlux QuixFluxplugin
)

target_include_directories(Fluxion PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

# Internal include directory.
include_directories(cpp)

