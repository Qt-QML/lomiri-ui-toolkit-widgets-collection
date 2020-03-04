TEMPLATE = subdirs

SUBDIRS += po

filetypes = qml png svg js jpg pro desktop in apparmor

OTHER_FILES = ""

for(filetype, filetypes) {
  OTHER_FILES += *.$$filetype
}

OTHER_FILES += gallery \
               gallery-logging.config

desktop_files.path = $$[QT_INSTALL_EXAMPLES]/lomiri-ui-toolkit/examples/lomiri-ui-toolkit-gallery
desktop_files.files = lomiri-ui-toolkit-gallery.desktop

other_files.path = $$[QT_INSTALL_EXAMPLES]/lomiri-ui-toolkit/examples/lomiri-ui-toolkit-gallery
other_files.files = $$OTHER_FILES

INSTALLS += other_files desktop_files

