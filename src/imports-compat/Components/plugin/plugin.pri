QT *= core-private qml-private quick-private gui-private dbus svg LomiriGestures-private \
      LomiriToolkit-private
equals(QT_MAJOR_VERSION, 5):lessThan(QT_MINOR_VERSION, 2) {
    QT *= v8-private
}

HEADERS += $$PWD/plugin.h

SOURCES += $$PWD/plugin.cpp
