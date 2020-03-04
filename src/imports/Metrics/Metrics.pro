CXX_MODULE = qml
TARGET  = LomiriMetrics
TARGETPATH = Lomiri/Metrics
IMPORT_VERSION = 1.0
QT += qml LomiriMetrics
SOURCES += plugin.cpp
load(lomiri_qml_plugin)
