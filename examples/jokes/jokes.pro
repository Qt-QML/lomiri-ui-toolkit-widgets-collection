TEMPLATE = subdirs

# Don't use Qt's internal example install system; it installs to the wrong directory.
# This is the side effect of piggy-back on Qt's internal part building system.
CONFIG -= qt_example_installs

# specify the manifest file, this file is required for click
# packaging and for the IDE to create runconfigurations
LOMIRI_MANIFEST_FILE=manifest.json.in

exists($$PWD/../examples.pro) {
    desktop_file.path = $$[QT_INSTALL_EXAMPLES]/lomiri-ui-toolkit/examples/$${TARGET}
    config_files.path = $$[QT_INSTALL_EXAMPLES]/lomiri-ui-toolkit/examples/$${TARGET}
    qml_files.path = $$[QT_INSTALL_EXAMPLES]/lomiri-ui-toolkit/examples/$${TARGET}
    config_files.files += $${LOMIRI_MANIFEST_FILE}
} else {
    #load Lomiri specific features
    load(lomiri-click)
    qml_files.path = /
    config_files.path = /
    desktop_file.path = /
}

TARGET = jokes

QML_FILES += $$files(*.qml,true) \
             $$files(*.js,true)

CONF_FILES +=  $${TARGET}.apparmor \
               $${TARGET}.png \
	       $${TARGET}.wav

OTHER_FILES += $${CONF_FILES} \
               $${QML_FILES} \
               $${TARGET}.desktop

#specify where the qml/js files are installed to
qml_files.files += $${QML_FILES}

#specify where the config files are installed to
config_files.files += $${CONF_FILES}

#install the desktop file, a translated version is
#automatically created in the build directory
desktop_file.files = $${TARGET}.desktop
desktop_file.CONFIG += no_check_exist

INSTALLS+=config_files qml_files desktop_file
