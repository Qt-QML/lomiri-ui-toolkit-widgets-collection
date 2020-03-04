include( plugin_dependency.pri )
include( add_makecheck.pri )

TEMPLATE = app
QT += testlib qml quick systeminfo LomiriToolkit-private
CONFIG += no_keywords c++11
