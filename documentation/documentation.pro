TEMPLATE=aux
TARGET=documentation

load(qt_build_config)
load(qt_functions)

#find the path to qdoc and qhelpgenerator
qtPrepareTool(QDOC, qdoc)
qtPrepareTool(QHELPGENERATOR, qhelpgenerator)

DOC_SRC = $$ROOT_SOURCE_DIR
equals(QT_MAJOR_VERSION, 5):lessThan(QT_MINOR_VERSION, 2) {
    DOC_SRC = $$ROOT_SOURCE_DIR/documentation
}

DOC_PATH=$$shadowed($$ROOT_SOURCE_DIR)/documentation
generate_docs.commands = cd $$ROOT_SOURCE_DIR; SRC=$$ROOT_SOURCE_DIR/documentation BLD=$$ROOT_BUILD_DIR/documentation $$ROOT_SOURCE_DIR/documentation/docs.sh \'$$QDOC\' \'$$QHELPGENERATOR\' $$DOC_PATH

# QMAKE_CLEAN can't remove a directory, thus this is needed.
# https://stackoverflow.com/a/29853833
clean_docs.depends = FORCE
clean_docs.commands = rm -rf $$DOC_PATH/qdoc.log $$DOC_PATH/qdoc.err $$DOC_PATH/offline/ $$DOC_PATH/lomiriuserinterfacetoolkit.qch $$DOC_PATH/html/
clean.depends += clean_docs
QMAKE_EXTRA_TARGETS += clean_docs clean

#install the online docs only when building outside of Qt
!qt_submodule_build{
    install_docs.files = $$shadowed($$ROOT_SOURCE_DIR)/documentation/html
    install_docs.path = /usr/share/lomiri-ui-toolkit/doc
    install_docs.CONFIG += no_check_exist directory no_build
    install_docs.depends = docs
    INSTALLS += install_docs
}

install_qch.files = $$shadowed($$ROOT_SOURCE_DIR)/documentation/lomiriuserinterfacetoolkit.qch
install_qch.path =  $$[QT_INSTALL_DOCS]
install_qch.CONFIG += no_check_exist no_build
install_qch.depends = docs
INSTALLS += install_qch

OTHER_FILES += *.qdocconf \
               docs.sh

