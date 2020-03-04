#!/bin/bash

. `dirname ${BASH_SOURCE[0]}`/../../../export_qml_dir.sh || exit 1

SCRIPT_DIRECTORY=`dirname $0`
$BUILD_DIR/lomiri-ui-toolkit-launcher/lomiri-ui-toolkit-launcher $@ $SCRIPT_DIRECTORY/gallery.qml
