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

// FIXME: In the example code below, replace the delegate
//  by the new text button when it becomes available.
/*!
    \qmltype Toolbar
    \inqmlmodule Lomiri.Components
    \ingroup lomiri
    \brief Toolbar that can be used as an extension for the edit mode header.
    Example:
    \qml
    PageHeader {
        id: editHeader
        property Component delegate: Component {
            AbstractButton {
                id: button
                action: modelData
                width: label.width + units.gu(4)
                height: parent.height
                Rectangle {
                    color: LomiriColors.slate
                    opacity: 0.1
                    anchors.fill: parent
                    visible: button.pressed
                }
                Label {
                    anchors.centerIn: parent
                    id: label
                    text: action.text
                    font.weight: text === "Confirm" ? Font.Normal : Font.Light
                }
            }
        }

        leadingActionBar {
            anchors.leftMargin: 0
            actions: Action {
                text: "Cancel"
                iconName: "close"
            }
            delegate: editHeader.delegate
        }
        trailingActionBar {
            anchors.rightMargin: 0
            actions: Action {
                text: "Confirm"
                iconName: "tick"
            }
            delegate: editHeader.delegate
        }

        extension: Toolbar {
            anchors {
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }
            trailingActionBar.actions: [
                Action { iconName: "bookmark-new" },
                Action { iconName: "add" },
                Action { iconName: "edit-select-all" },
                Action { iconName: "edit-copy" },
                Action { iconName: "select" }
            ]
            leadingActionBar.actions: Action {
                iconName: "delete"
                text: "delete"
                onTriggered: print("Delete action triggered")
            }
        }
    }
    \endqml
    See \l PageHeader.
*/
StyledItem {
    id: toolbar
    styleName: "ToolbarStyle"

    /*!
      \qmlproperty ActionBar leadingActionBar
      The leading ActionBar that should hold at most one action.
      Recommneded for the delete action.
      Example:
      \qml
      Toolbar {
          leadingActionBar.actions: [
              Action {
                  iconName: "delete"
                  text: "Delete"
                  onTriggered: print("delete!")
              }
          ]
      }
      \endqml
      See \l ActionBar.
     */
    readonly property alias leadingActionBar: leading
    ActionBar {
        id: leading
        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
            leftMargin: units.gu(1)
        }
        numberOfSlots: 1
        delegate: toolbar.__styleInstance.defaultDelegate
        Component.onCompleted: {
            if (actions && actions.length > 1) {
                print("WARNING: Toolbar with more than one leading actions is not supported.");
            }
        }
        StyleHints {
            backgroundColor: "transparent" // background is drawn by the toolbarStyle
            buttons {
                foregroundColor: toolbar.__styleInstance.buttons.foregroundColor
                pressedForegroundColor: toolbar.__styleInstance.buttons.pressedForegroundColor
                disabledForegroundColor: toolbar.__styleInstance.buttons.disabledForegroundColor
                backgroundColor: toolbar.__styleInstance.buttons.backgroundColor
                pressedBackgroundColor: toolbar.__styleInstance.buttons.pressedBackgroundColor
                disabledBackgroundColor: toolbar.__styleInstance.buttons.disabledBackgroundColor
            }
        }
    }

    /*!
      \qmlproperty ActionBar trailingActionBar
      The \l ActionBar with trailing actions.
      Example:
      \qml
      Toolbar {
            trailingActionBar.actions: [
                Action { iconName: "bookmark-new" },
                Action { iconName: "add" },
                Action { iconName: "edit-select-all" },
                Action { iconName: "edit-copy" }
            ]
      }
      \endqml
      The trailing ActionBar may contain up to 8 actions.
      Scrolling and support for more than 8 actions will be added in the near future.
      See \l ActionBar.
      */
    readonly property alias trailingActionBar: trailing
    ActionBar {
        id: trailing
        styleName: "ScrollingActionBarStyle"
        anchors {
            left: leading.right
            right: parent.right
            top: parent.top
            bottom: parent.bottom
            leftMargin: units.gu(1)
            rightMargin: units.gu(1)
        }
        delegate: toolbar.__styleInstance.defaultDelegate
        StyleHints {
            backgroundColor: "transparent" // background is drawn by the toolbarStyle
            buttons {
                foregroundColor: toolbar.__styleInstance.buttons.foregroundColor
                pressedForegroundColor: toolbar.__styleInstance.buttons.pressedForegroundColor
                disabledForegroundColor: toolbar.__styleInstance.buttons.disabledForegroundColor
                backgroundColor: toolbar.__styleInstance.buttons.backgroundColor
                pressedBackgroundColor: toolbar.__styleInstance.buttons.pressedBackgroundColor
                disabledBackgroundColor: toolbar.__styleInstance.buttons.disabledBackgroundColor
            }
            scrollButtons {
                backgroundColor: toolbar.__styleInstance.backgroundColor // must be opaque to hide the icon buttons
            }
        }
    }
}
