/*
 * Copyright 2016 Canonical Ltd.
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
 *
 * Author: Christian Dywan <christian.dywan@canonical.com>
 */

import QtQuick 2.4
import Lomiri.Components 1.3
import Lomiri.Components.Private 1.3

Frame {
    anchors.fill: parent
    anchors.margins: -units.gu(0.46)
    color: styledItem.enabled
                ? theme.palette.normal.focus
                : theme.palette.disabled.focus
    thickness: units.dp(2)
    radius: units.gu(1.7)
    visible: styledItem.keyNavigationFocus

    Behavior on anchors.margins {
        LomiriNumberAnimation {
            duration: LomiriAnimation.FastDuration
        }
    }
}
