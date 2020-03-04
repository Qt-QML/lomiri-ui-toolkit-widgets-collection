#!/bin/sh
#
# Copyright 2012 - 2016 Canonical Ltd.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation; version 3.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

# Get the current script directory (compatible with Bash and ZSH)
SCRIPT_DIR=`dirname ${BASH_SOURCE[0]-$0}`
SCRIPT_DIR=`cd $SCRIPT_DIR && pwd`

source "$SCRIPT_DIR/build_paths.inc" || return 1
export QML_IMPORT_PATH=$BUILD_DIR/qml
export QML2_IMPORT_PATH=$BUILD_DIR/qml
export LOMIRI_UI_TOOLKIT_THEMES_PATH=$BUILD_DIR/qml
LOMIRI_QML_ROOT=$BUILD_DIR/qml/Lomiri
LOMIRI_QML_DIRS=$LOMIRI_QML_ROOT/Components:$LOMIRI_QML_ROOT/Test:$LOMIRI_QML_ROOT/Layouts:$LOMIRI_QML_ROOT/PerformanceMetrics
export LD_LIBRARY_PATH=$BUILD_DIR/lib:$LOMIRI_QML_DIRS${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
# Build machines may not have initctl and don't need it
test -f /sbin/initctl || return 0
# initctl may be available but not working (for example in a lxd container without upstart)
/sbin/initctl list > /dev/null || return 0
/sbin/initctl set-env --global QML_IMPORT_PATH=$BUILD_DIR/qml
/sbin/initctl set-env --global QML2_IMPORT_PATH=$BUILD_DIR/qml
/sbin/initctl set-env --global LOMIRI_UI_TOOLKIT_THEMES_PATH=$BUILD_DIR/qml
/sbin/initctl set-env --global LD_LIBRARY_PATH=$BUILD_DIR/lib
