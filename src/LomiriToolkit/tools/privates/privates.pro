TEMPLATE = app
TARGET = createprivateshapetextures
QT += gui svg
QMAKE_CXXFLAGS += -Wno-unused-variable

# warnings_are_errors depending on the compiler version, sometimes it doesn't
# add the required flags (for instance for recent clang version on old Qt).
warnings_are_errors:!contains(QMAKE_CXXFLAGS_WARN_ON, -Werror){
    QMAKE_CXXFLAGS_WARN_ON += -Werror
}

SOURCES += createprivateshapetextures.cpp
