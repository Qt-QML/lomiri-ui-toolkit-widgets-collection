CXX_MODULE = qml
TARGET  = LomiriLayouts
TARGETPATH = Lomiri/Layouts
IMPORT_VERSION = 0.1

#QMAKE_DOCS = $$PWD/doc/qtquicklayouts.qdocconf

include(plugin/plugin.pri)

load(lomiri_qml_plugin)
