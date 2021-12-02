CXX_MODULE = qml
TARGET  = UbuntuMetrics
TARGETPATH = Ubuntu/Metrics
IMPORT_VERSION = 1.0
QT += qml LomiriMetrics
# For DeprepationPrinter. Unfortunately I can't find a more beutiful way...
QT += LomiriToolkit-private
SOURCES += plugin.cpp
load(lomiri_qml_plugin)
