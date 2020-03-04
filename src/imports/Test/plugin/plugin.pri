QT *= core-private qml-private quick-private gui-private testlib LomiriGestures-private \
      LomiriToolkit-private
equals(QT_MAJOR_VERSION, 5):lessThan(QT_MINOR_VERSION, 2) {
    QT *= v8-private
}

DEFINES += LOMIRI_QML_IMPORT_PATH='\\"$${ROOT_BUILD_DIR}/qml\\"'

TARGET = $$qtLibraryTarget($$TARGET)
uri = Lomiri.Test

HEADERS += \
    $$PWD/uctestcase.h \
    $$PWD/testplugin.h \
    $$PWD/uctestextras.h

SOURCES += \
    $$PWD/uctestcase.cpp \
    $$PWD/testplugin.cpp \
    $$PWD/uctestextras.cpp
