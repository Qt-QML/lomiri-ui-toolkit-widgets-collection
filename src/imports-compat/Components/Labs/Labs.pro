CXX_MODULE = qml
TARGET  = UbuntuComponentsLabs
TARGETPATH = Ubuntu/Components/Labs
IMPORT_VERSION = 1.0

include(plugin/plugin.pri)

load(lomiri_qml_plugin)

OTHER_FILES+=qmldir
