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
 */

import QtQuick 2.4
import Lomiri.Components 1.3
import Lomiri.Components.Themes 1.3

PaletteValues {
    background: "#FFFFFF"
    backgroundText: LomiriColors.jet
    backgroundSecondaryText: LomiriColors.inkstone
    backgroundTertiaryText: LomiriColors.graphite
    base: LomiriColors.silk
    baseText: LomiriColors.inkstone
    foreground: LomiriColors.porcelain
    foregroundText: LomiriColors.jet
    raised: "#FFFFFF"
    raisedText: LomiriColors.slate
    raisedSecondaryText: LomiriColors.silk
    overlay: "#FFFFFF"
    overlayText: LomiriColors.slate
    overlaySecondaryText: LomiriColors.silk
    field: "#FFFFFF"
    fieldText: LomiriColors.jet
    focus: LomiriColors.blue
    focusText: "#FFFFFF"
    selection: Qt.rgba(LomiriColors.blue.r, LomiriColors.blue.g, LomiriColors.blue.b, 0.2)
    selectionText: LomiriColors.jet
    positive: LomiriColors.green
    positiveText: "#FFFFFF"
    negative: LomiriColors.red
    negativeText: "#FFFFFF"
    activity: LomiriColors.blue
    activityText: "#FFFFFF"
    position: "#00000000"
    positionText: LomiriColors.blue
}
