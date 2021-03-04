TEMPLATE = aux

# Don't use Qt's internal example install system; it installs to the wrong directory.
# This is the side effect of piggy-back on Qt's internal part building system.
CONFIG -= qt_example_installs

filetypes = qml png svg js qmltheme jpg qmlproject desktop wav

OTHER_FILES = ""

for(filetype, filetypes) {
  OTHER_FILES += *.$$filetype
}

other_files.path = $$[QT_INSTALL_EXAMPLES]/lomiri-ui-toolkit/examples/calculator/components
other_files.files = $$OTHER_FILES

INSTALLS += other_files

