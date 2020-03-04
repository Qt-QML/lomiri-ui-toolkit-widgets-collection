CXX_MODULE = qml
TARGET  = LomiriPerformanceMetrics
TARGETPATH = Lomiri/PerformanceMetrics
IMPORT_VERSION = 0.1

#QMAKE_DOCS = $$PWD/doc/qtquicklayouts.qdocconf

include(plugin/plugin.pri)

QML_FILES +=  BarGraph.qml \
             PerformanceOverlay.qml \

load(lomiri_qml_plugin)
