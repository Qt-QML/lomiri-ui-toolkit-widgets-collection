QT *= qml quick
CONFIG += egl

# Input
SOURCES += \
    $$PWD/upmplugin.cpp \
    $$PWD/upmgraphmodel.cpp \
    $$PWD/upmtexturefromimage.cpp \
    $$PWD/upmrenderingtimes.cpp \
    $$PWD/upmcpuusage.cpp \
    $$PWD/rendertimer.cpp

HEADERS += \
    $$PWD/upmplugin.h \
    $$PWD/upmgraphmodel.h \
    $$PWD/upmtexturefromimage.h \
    $$PWD/upmrenderingtimes.h \
    $$PWD/upmcpuusage.h \
    $$PWD/rendertimer.h
