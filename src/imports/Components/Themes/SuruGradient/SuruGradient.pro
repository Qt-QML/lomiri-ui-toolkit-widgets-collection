TARGETPATH = Lomiri/Components/Themes/SuruGradient

PARENT_THEME_FILE = parent_theme
DEPRECATED_FILE = deprecated
ARTWORK_FILES +=  artwork/chevron@27.png \
             artwork/chevron_down@30.png \
             artwork/tick@30.png \

QML_FILES += MainViewStyle.qml \
             OptionSelectorStyle.qml \
             Palette.qml \
             TabBarStyle.qml \
    $$ARTWORK_FILES \
    $$PARENT_THEME_FILE \
    $$DEPRECATED_FILE

load(lomiri_qml_module)
