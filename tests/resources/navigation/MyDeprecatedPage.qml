/*
 * Copyright 2012-2015 Canonical Ltd.
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

import QtQuick 2.2
import Lomiri.Components 1.0

Page {
    title: i18n.tr("My 1.0 page")

    Flickable {
        anchors.fill: parent
        contentHeight: height + units.gu(10)
        Label {
            anchors {
                top: parent.top
                topMargin: units.gu(16)
                horizontalCenter: parent.horizontalCenter
            }

            text: i18n.tr("This is an external page.")
            color: "#757373"
        }
    }

    tools: ToolbarItems {
        ToolbarButton {
            action: Action {
                iconName: "settings"
                text: "Settings"
            }
        }
        ToolbarButton {
            action: Action {
                iconName: "contact"
                text: "Contacts"
            }
        }
        ToolbarButton {
            action: Action {
                iconName: "share"
                text: "Share"
            }
        }
        ToolbarButton {
            action: Action {
                iconName: "select"
                text: "Select"
            }
        }
    }
}
