LAYOUT_SRC = $$PWD/../../src/imports/Layouts
LAYOUT_BLD = $$shadowed($$PWD)/../../qml/Lomiri/Layouts

INCLUDEPATH += $$LAYOUT_SRC/plugin
PRE_TARGETDEPS = $$LAYOUT_BLD/libLomiriLayouts.so
LIBS += -L$$LAYOUT_BLD -lLomiriLayouts
DEFINES += QUICK_TEST_SOURCE_DIR=\"\\\"$$_PRO_FILE_PWD_\\\"\"
