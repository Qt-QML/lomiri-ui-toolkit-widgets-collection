TEMPLATE = aux

CONFIG+=lomiri_qml_module

uri = Lomiri.Components
installPath = $$[QT_INSTALL_QML]/$$replace(uri, \\., /)/1.3

qml_files.installPath = $$installPath
qml_files.files = *.qml

# javascript files
js_files.installPath = $$installPath
js_files.files = *.js

LOMIRI_QML_MODULE_FILES += qml_files js_files
