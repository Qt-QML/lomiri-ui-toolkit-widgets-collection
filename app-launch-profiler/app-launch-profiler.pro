TEMPLATE = app
LIBS += -llttng-ust -ldl
CONFIG += -I.

# warnings_are_errors depending on the compiler version, sometimes it doesn't
# add the required flags (for instance for recent clang version on old Qt).
warnings_are_errors:!contains(QMAKE_CXXFLAGS_WARN_ON, -Werror){
    QMAKE_CXXFLAGS_WARN_ON += -Werror
}

HEADERS += app-launch-tracepoints.h
SOURCES += app-launch-tracepoints.c
TARGET = app-launch-tracepoints
installPath = $$[QT_INSTALL_PREFIX]/bin/
app-launch-tracepoints.path = $$installPath
app-launch-tracepoints.files = app-launch-tracepoints
app-launch-scripts.path = $$installPath
app-launch-scripts.files = app-launch-profiler-lttng \
                           profile_appstart.sh \
                           appstart_test
INSTALLS += app-launch-tracepoints
INSTALLS += app-launch-scripts


