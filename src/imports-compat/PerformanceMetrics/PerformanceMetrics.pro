TARGETPATH = Ubuntu/PerformanceMetrics
IMPORT_VERSION = 0.1

QML_FILES += RenderingTimes.qml \
             CpuUsage.qml \
             TextureFromImage.qml \

load(lomiri_qml_module)
