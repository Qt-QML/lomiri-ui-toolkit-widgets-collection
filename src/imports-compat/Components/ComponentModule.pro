CXX_MODULE = qml
TARGET  = UbuntuComponents
TARGETPATH = Ubuntu/Components
IMPORT_VERSION = 0.1

include(plugin/plugin.pri)

OTHER_FILES+= qmldir

load(lomiri_qml_plugin)
