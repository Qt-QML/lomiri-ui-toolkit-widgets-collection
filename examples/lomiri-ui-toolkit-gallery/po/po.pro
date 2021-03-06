TEMPLATE = aux

# Don't use Qt's internal example install system; it installs to the wrong directory.
# This is the side effect of piggy-back on Qt's internal part building system.
CONFIG -= qt_example_installs

MO_FILES = $$system(ls *.po)

TARGET_PREFIX = $$[QT_INSTALL_PREFIX]
TARGET_NAMESPACE = "lomiri-ui-toolkit-gallery"
CLICKABLE {
    TARGET_PREFIX = /
    TARGET_NAMESPACE = "uitk-gallery.ubports"
}


install_mo_commands =
for(po_file, MO_FILES) {
  mo_file = $$replace(po_file,.po,.mo)
  system(msgfmt $$po_file -o $$mo_file)
  mo_name = $$replace(mo_file,.mo,)
  mo_targetpath = $(INSTALL_ROOT)/$${TARGET_PREFIX}/share/locale/$${mo_name}/LC_MESSAGES
  mo_target = $${mo_targetpath}/$${TARGET_NAMESPACE}.mo
  !isEmpty(install_mo_commands): install_mo_commands += &&
  install_mo_commands += test -d $$mo_targetpath || mkdir -p $$mo_targetpath
  install_mo_commands += && cp $$PWD/$$mo_file $$mo_target
}

install.commands = $$install_mo_commands
QMAKE_EXTRA_TARGETS += install
