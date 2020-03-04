/*
 * Copyright 2013-2017 Canonical Ltd.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.4
import Lomiri.Components 1.3
import Lomiri.Components.Labs 1.0

MainWindow {
    objectName: "visualRoot"
    visualRoot: myRoot

    Rectangle {
        id: myRoot
        objectName: "myRoot"
        anchors.fill: parent

        Label {
            objectName: "myLabel"
            text: "Lorem ipsum dolor sit amet"
        }
    }
}
