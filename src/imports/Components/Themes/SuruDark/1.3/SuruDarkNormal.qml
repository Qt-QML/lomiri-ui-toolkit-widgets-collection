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
    background: LomiriColors.jet
    backgroundText: "#FFFFFF"
    backgroundSecondaryText: LomiriColors.silk
    backgroundTertiaryText: LomiriColors.ash
    base: LomiriColors.graphite
    baseText: LomiriColors.porcelain
    foreground: LomiriColors.inkstone
    foregroundText: "#FFFFFF"
    raised: "#FFFFFF"
    raisedText: LomiriColors.slate
    raisedSecondaryText: LomiriColors.silk
    overlay: LomiriColors.inkstone
    overlayText: "#FFFFFF"
    overlaySecondaryText: LomiriColors.slate
    field: LomiriColors.jet
    fieldText: "#FFFFFF"
    focus: LomiriColors.lightBlue
    focusText: "#000000"
    selection: Qt.rgba(LomiriColors.lightBlue.r, LomiriColors.lightBlue.g, LomiriColors.lightBlue.b, 0.4)
    selectionText: "#FFFFFF"
    positive: LomiriColors.lightGreen
    positiveText: "#000000"
    negative: LomiriColors.lightRed
    negativeText: "#000000"
    activity: LomiriColors.lightBlue
    activityText: "#000000"
    position: "#00000000"
    positionText: LomiriColors.lightBlue
}
