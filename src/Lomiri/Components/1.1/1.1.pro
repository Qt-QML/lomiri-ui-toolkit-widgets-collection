TEMPLATE = aux

CONFIG+=lomiri_qml_module

uri = Lomiri.Components
installPath = $$[QT_INSTALL_QML]/$$replace(uri, \\., /)/1.1

qml_files.installPath = $$installPath
qml_files.files = *.qml

LOMIRI_QML_MODULE_FILES += qml_files
