TESTS += $$system(ls tst_*.qml)

include(../qmltest-include.pri)

SOURCES += tst_components.cpp

OTHER_FILES += $$system(ls *.qml) \
    tst_lomiri_namespace_v13.qml
