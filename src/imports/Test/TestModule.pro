TEMPLATE=aux
CONFIG += lomiri_qml_module

uri = Lomiri.Test
installPath = $$[QT_INSTALL_QML]/$$replace(uri, \\., /)

# qmldir
QMLDIR_FILE = qmldir

# make found deployables visible in Qt Creator
OTHER_FILES += $$QMLDIR_FILE

QML_FILES = *.qml
JS_FILES = *.js

# define deployment for found deployables
qmldir_file.installPath = $$installPath
qmldir_file.files = $$QMLDIR_FILE
qml_files.installPath = $$installPath
qml_files.files = $$QML_FILES
js_files.installPath = $$installPath
js_files.files = $$JS_FILES

LOMIRI_QML_MODULE_FILES += qmldir_file qml_files js_files

!cross_compile {
    plugins_qmltypes.path = $$installPath
    plugins_qmltypes.files = plugins.qmltypes
    # Silence spam on stderr due to fonts
    # https://bugs.launchpad.net/lomiri-ui-toolkit/+bug/1256999
    # https://bugreports.qt-project.org/browse/QTBUG-36243
    plugins_qmltypes.extra = $$[QT_INSTALL_BINS]/qmlplugindump -notrelocatable Lomiri.Test 0.1 ../../ 2>/dev/null > $(INSTALL_ROOT)/$$installPath/plugins.qmltypes

    INSTALLS += plugins_qmltypes
}
