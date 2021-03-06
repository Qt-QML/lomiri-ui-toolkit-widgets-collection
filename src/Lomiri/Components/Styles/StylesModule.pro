TEMPLATE=aux

CONFIG+=lomiri_qml_module

uri = Lomiri.Components.Styles
installPath = $$[QT_INSTALL_QML]/$$replace(uri, \\., /)

# qmldir file
qmldir_file.installPath = $$installPath
qmldir_file.files = qmldir

# qml source files
qml_files.installPath = $$installPath
qml_files.files = *.qml

# javascript files
js_files.installPath = $$installPath
js_files.files = *.js

#artwork files
artwork_files.installPath = $$installPath/artwork
artwork_files.files = $$system(find artwork -type f)

LOMIRI_QML_MODULE_FILES += qmldir_file qml_files js_files artwork_files

