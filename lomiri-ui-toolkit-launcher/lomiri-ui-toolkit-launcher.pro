TEMPLATE = app
QT += \
    core-private \
    gui-private \
    quick \
    quick-private \
    qml \
    testlib \
    LomiriToolkit \
    LomiriToolkit_private \
    LomiriMetrics
CONFIG += no_keywords c++11
SOURCES += launcher.cpp
installPath = $$[QT_INSTALL_PREFIX]/bin
launcher.path = $$installPath
launcher.files = lomiri-ui-toolkit-launcher
INSTALLS += launcher
