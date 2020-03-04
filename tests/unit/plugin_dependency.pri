PLUGIN_SRC = $$PWD/../../src/imports
PLUGIN_BLD = $$shadowed($$PWD)/../../qml/Lomiri

COMPONENTS_PATH = ../../../qml/Lomiri/Components
INCLUDEPATH += $$PLUGIN_SRC/Components/plugin
INCLUDEPATH += $$PLUGIN_SRC/Layouts/plugin
INCLUDEPATH += $$PLUGIN_SRC/Test/plugin
PRE_TARGETDEPS =  $$PLUGIN_BLD/Components/libLomiriComponents.so
PRE_TARGETDEPS += $$PLUGIN_BLD/Test/libLomiriTest.so
LIBS += -L$$PLUGIN_BLD/Components -lLomiriComponents
LIBS += -L$$PLUGIN_BLD/Test -lLomiriTest
LIBS += -L$${ROOT_BUILD_DIR}/lib -lLomiriGestures
LIBS += -L$$PLUGIN_BLD/LomiriToolkit -lLomiriToolkit
DEFINES += QUICK_TEST_SOURCE_DIR=\"\\\"$$_PRO_FILE_PWD_\\\"\"
QMAKE_CXXFLAGS += -Werror

DEFINES+=LOMIRI_COMPONENT_PATH='\\"$${ROOT_BUILD_DIR}/qml/Lomiri/Components\\"'
DEFINES+=LOMIRI_QML_IMPORT_PATH='\\"$${ROOT_BUILD_DIR}/qml\\"'
DEFINES+=LOMIRI_SOURCE_ROOT='\\"$${ROOT_SOURCE_DIR}\\"'
DEFINES+=LOMIRI_BUILD_ROOT='\\"$${ROOT_BUILD_DIR}\\"'
