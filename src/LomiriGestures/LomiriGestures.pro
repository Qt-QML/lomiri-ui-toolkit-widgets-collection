TARGET = LomiriGestures
QT = core-private gui-private qml-private quick-private

HEADERS += \
    $$PWD/candidateinactivitytimer_p.h \
    $$PWD/damper_p.h \
    $$PWD/debughelpers_p.h \
    $$PWD/pool_p.h \
    $$PWD/timer_p.h \
    $$PWD/timesource_p.h \
    $$PWD/touchownershipevent_p.h \
    $$PWD/touchregistry_p.h \
    $$PWD/lomirigesturesglobal.h \
    $$PWD/lomirigesturesmodule.h \
    $$PWD/ucswipearea_p.h \
    $$PWD/ucswipearea_p_p.h \
    $$PWD/unownedtouchevent_p.h

SOURCES += \
    $$PWD/candidateinactivitytimer.cpp \
    $$PWD/damper.cpp \
    $$PWD/debughelpers.cpp \
    $$PWD/timer.cpp \
    $$PWD/timesource.cpp \
    $$PWD/touchownershipevent.cpp \
    $$PWD/touchregistry.cpp \
    $$PWD/lomirigesturesmodule.cpp \
    $$PWD/ucswipearea.cpp \
    $$PWD/unownedtouchevent.cpp

load(lomiri_qt_module)
