CXX_MODULE = qml
TARGET  = UbuntuComponentsStyles
TARGETPATH = Ubuntu/Components/Styles
IMPORT_VERSION = 1.1

include(plugin/plugin.pri)

load(lomiri_qml_plugin)

OTHER_FILES+=qmldir
