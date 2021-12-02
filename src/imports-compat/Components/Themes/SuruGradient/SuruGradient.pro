TARGETPATH = Ubuntu/Components/Themes/SuruGradient

PARENT_THEME_FILE = parent_theme
DEPRECATED_FILE = deprecated

QML_FILES += $$PARENT_THEME_FILE \
             $$DEPRECATED_FILE

load(lomiri_qml_module)
