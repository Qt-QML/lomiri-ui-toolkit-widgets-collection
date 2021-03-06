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

Palette {
    normal: AmbianceNormal {}

    disabled: AmbianceNormal {
        Component.onCompleted: {
            // specific disabled colors
            var diff = {
                selection: Qt.rgba(LomiriColors.blue.r, LomiriColors.blue.g, LomiriColors.blue.b, 0.1),
                positiveText: "#FFFFFF",
                negativeText: "#FFFFFF",
                activityText: "#FFFFFF",
                focusText: "#FFFFFF",
                position: "#00000000"
            };
            for (var p in normal) {
                // skip objectName and all change signals
                if (p === "objectName" || p.indexOf("Changed") > 0) continue;
                disabled[p] = diff[p] || (
                    // if not specific, colors are 40% opaque normal
                    Qt.rgba(normal[p].r, normal[p].g, normal[p].b, normal[p].a * 0.4)
                );
            }
        }
    }

    // selected differs from normal in background, base, foreground
    selected: AmbianceSelected {}

    // selected disabled differs from normal in background, base, foreground
    selectedDisabled: AmbianceSelected {
        Component.onCompleted: {
            // specific selected-disabled colors
            var diff = {
                foreground: LomiriColors.porcelain,
                selection: Qt.rgba(LomiriColors.blue.r, LomiriColors.blue.g, LomiriColors.blue.b, 0.1),
                positiveText: "#FFFFFF",
                negativeText: "#FFFFFF",
                activityText: "#FFFFFF",
                focus: LomiriColors.blue,
                focusText: "#FFFFFF",
                field: "#FFFFFF",
                position: "#00000000"
            };
            for (var p in selected) {
                // skip objectName and all change signals
                if (p === "objectName" || p.indexOf("Changed") > 0) continue;
                selectedDisabled[p] = diff[p] || (
                    // if not specific, colors are 40% opaque normal
                    Qt.rgba(selected[p].r, selected[p].g, selected[p].b, normal[p].a * 0.4)
                );
            }
        }
    }

    highlighted: AmbianceNormal {
        background: LomiriColors.silk
        base: LomiriColors.ash
        baseText: LomiriColors.jet
        foreground: LomiriColors.silk
        raised: LomiriColors.silk
        raisedText: LomiriColors.inkstone
        raisedSecondaryText: LomiriColors.ash
    }

    focused: AmbianceNormal {
        background: Qt.rgba(LomiriColors.blue.r, LomiriColors.blue.g, LomiriColors.blue.b, 0.2)
    }
}
