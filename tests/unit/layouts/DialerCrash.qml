/*
 * Copyright 2014 Canonical Ltd.
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
import Lomiri.Components.Pickers 1.0
import Lomiri.Layouts 1.0

MainView {
    width: units.gu(40)
    height: units.gu(71)
    backgroundColor: "#A55263"

    property bool wide: true

    Layouts {
        objectName: "layoutManager"
        layouts: [
            ConditionalLayout {
                name: "wideAspect"
                when: wide

                ItemLayout {
                    item: "object1"
                }
            },

            ConditionalLayout {
                name: "regularAspect"
                when: !wide

                ItemLayout {
                    item: "object2"
                }
            }
        ]

        Dialer {
            Layouts.item: "object1"
        }
    }
}
