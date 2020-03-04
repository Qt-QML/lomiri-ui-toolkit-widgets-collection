TEMPLATE = subdirs

#load Lomiri specific features
load(lomiri-click)

# specify the manifest file, this file is required for click
# packaging and for the IDE to create runconfigurations
LOMIRI_MANIFEST_FILE=manifest.json.in

TARGET = lomiri-ui-toolkit-gallery

QML_FILES += $$files(*.qml,true) \
             $$files(*.js,true)

CONF_FILES +=  lomiri-ui-toolkit-gallery.apparmor \
               lomiri-ui-toolkit-gallery.png

OTHER_FILES += $${CONF_FILES} \
               $${QML_FILES} \
               lomiri-ui-toolkit-gallery.desktop

#specify where the qml/js files are installed to
qml_files.path = /
qml_files.files += $${QML_FILES}

#specify where the config files are installed to
config_files.path = /
config_files.files += $${CONF_FILES}

#install the desktop file, a translated version is
#automatically created in the build directory
desktop_file.path = /
desktop_file.files = lomiri-ui-toolkit-gallery.desktop
desktop_file.CONFIG += no_check_exist

INSTALLS+=config_files qml_files desktop_file
