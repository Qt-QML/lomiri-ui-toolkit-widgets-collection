TEMPLATE = aux

CONFIG+=lomiri_qml_module

uri = Lomiri.Components
installPath = $$[QT_INSTALL_QML]/$$replace(uri, \\., /)/1.0

qml_files.installPath = $$installPath
qml_files.files = *.qml \
                  *.txt

LOMIRI_QML_MODULE_FILES += qml_files
#INSTALLS += qml_files
