TEMPLATE=aux

CONFIG+=lomiri_qml_module

uri = Lomiri.Components.ListItems
installPath = $$[QT_INSTALL_QML]/$$replace(uri, \\., /)

# qmldir file
qmldir_file.installPath = $$installPath
qmldir_file.files = qmldir

LOMIRI_QML_MODULE_FILES += qmldir_file

