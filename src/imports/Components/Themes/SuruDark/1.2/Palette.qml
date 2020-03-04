/*
 * Copyright 2013 Canonical Ltd.
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
import Lomiri.Components 1.2
import Lomiri.Components.Themes 0.1

Palette {
    normal: PaletteValues {
        background: "#221E1C"
        backgroundText: "#5D5D5D78"
        base: "#19000000"
        baseText: "#FFFFFF"
        foreground: "#888888"
        foregroundText: "#FFFFFF"
        overlay: "#F2F2F2"
        overlayText: "#888888"
        field: "#19000000"
        fieldText: "#7F7F7F7F"
    }
    selected: PaletteValues {
        background: "#88D6D6D6" // FIXME: not from design
        backgroundText: "#FFFFFF"
        selection: Qt.rgba(LomiriColors.blue.r, LomiriColors.blue.g, LomiriColors.blue.b, 0.2)
        foreground: LomiriColors.orange
        foregroundText: LomiriColors.darkGrey
        field: "#FFFFFF"
        fieldText: "#888888"
    }
}
