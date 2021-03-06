/*
 * Copyright 2012 Canonical Ltd.
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

import QtQuick 2.0
import Lomiri.Components 1.1

Item {
    id: root
    width: units.gu(50)
    height: units.gu(50)

    property string log: ""

    Item {
        id: nil
        width: 0
        height: 0
    }

    InverseMouseArea {
        objectName: "testObject"
        anchors.fill: nil
        onClicked: {
            color.color = "red"
            root.log = "IMA" // FAIL
        }
    }

    Rectangle {
        id: color
        anchors.fill: parent
        color: "blue"
        MouseArea {
            onClicked: {
                parent.color = "green"
                root.log = "MA" // PASS
            }
            anchors.fill: parent
        }
    }
}
