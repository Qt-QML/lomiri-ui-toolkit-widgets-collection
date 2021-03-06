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

Item {
    id: switchStyle

    /*!
      The padding between the thumb and the outside border of the switch.
     */
    property real thumbPadding: units.gu(0.33)

    /*!
      The padding between the icon and the border of the thumb.
     */
    property real iconPadding: thumbPadding

    implicitWidth: units.gu(6)
    implicitHeight: units.gu(3)
    opacity: styledItem.enabled ? 1.0 : 0.5
    LayoutMirroring.enabled: false
    LayoutMirroring.childrenInherit: true

    /*!
      The background color of the switch.
     */
    property color backgroundColor: Theme.palette.normal.base

    /*!
      The background color of the thumb when the switch is checked.
     */
    property color checkedThumbColor: LomiriColors.green

    /*!
      The background color of the thumb when the switch is not checked.
     */
    property color uncheckedThumbColor: Qt.rgba(0, 0, 0, 0.2)

    /*!
      The foreground color of the icon that is currently selected.
     */
    property color selectedIconColor: Theme.palette.normal.foregroundText

   /*!
     The color of the icon that is not currently selected.
    */
    property color unselectedIconColor: Theme.palette.normal.backgroundText

    /*!
      The source of the selected icon when the switch is checked.
     */
    property url checkedIconSource: "image://theme/tick"

    /*!
      The source of the selected icon when the switch is not checked.
     */
    property url uncheckedIconSource: "image://theme/close"

    LomiriShape {
        id: background
        anchors.fill: parent
        color: switchStyle.backgroundColor
        clip: true

        LomiriShape {
            id: thumb
            states: [
                State {
                    name: "checked"
                    when: styledItem.checked
                    PropertyChanges {
                        target: thumb
                        x: rightThumbPosition.x
                        color: switchStyle.checkedThumbColor
                    }
                },
                State {
                    name: "unchecked"
                    when: !styledItem.checked
                    PropertyChanges {
                        target: thumb
                        x: leftThumbPosition.x
                        color: switchStyle.uncheckedThumbColor
                    }
                }
            ]

            transitions: [
                // Avoid animations on width changes (during initialization)
                // by explicitly setting from and to for the Transitions.
                Transition {
                    from: "unchecked"
                    to: "checked"
                    LomiriNumberAnimation {
                        target: thumb
                        properties: "x"
                        duration: LomiriAnimation.FastDuration
                        easing: LomiriAnimation.StandardEasing
                    }
                    ColorAnimation {
                        target: thumb
                        properties: "color"
                        duration: LomiriAnimation.FastDuration
                        easing: LomiriAnimation.StandardEasing
                    }
                },
                Transition {
                    from: "checked"
                    to: "unchecked"
                    LomiriNumberAnimation {
                        target: thumb
                        properties: "x"
                        duration: LomiriAnimation.FastDuration
                        easing: LomiriAnimation.StandardEasing
                    }
                    ColorAnimation {
                        target: thumb
                        properties: "color"
                        duration: LomiriAnimation.FastDuration
                        easing: LomiriAnimation.StandardEasing
                    }
                }
            ]

            width: (background.width - switchStyle.thumbPadding * 3.0) / 2.0
            anchors {
                top: parent.top
                bottom: parent.bottom
                topMargin: switchStyle.thumbPadding
                bottomMargin: switchStyle.thumbPadding
            }

            property real iconSize: Math.min(width, height) - 2*switchStyle.iconPadding

            PartialColorize {
                anchors {
                    verticalCenter: parent.verticalCenter
                    right: parent.left
                    rightMargin: switchStyle.iconPadding + switchStyle.thumbPadding
                }
                rightColor: switchStyle.unselectedIconColor
                source: Image {
                    source: switchStyle.uncheckedIconSource
                    sourceSize {
                        width: thumb.iconSize
                        height: thumb.iconSize
                    }
                }
            }

            PartialColorize {
                anchors {
                    verticalCenter: parent.verticalCenter
                    left: parent.right
                    leftMargin: switchStyle.iconPadding + switchStyle.thumbPadding
                }
                rightColor: switchStyle.unselectedIconColor
                source: Image {
                    source: switchStyle.checkedIconSource
                    sourceSize {
                        width: thumb.iconSize
                        height: thumb.iconSize
                    }
                }
            }
        }

        Item {
            id: leftThumbPosition
            anchors {
                left: parent.left
                top: parent.top
                leftMargin: switchStyle.thumbPadding
                topMargin: switchStyle.thumbPadding
            }
            height: thumb.height
            width: thumb.width

            PartialColorize {
                anchors.centerIn: parent
                source: Image {
                    source: switchStyle.uncheckedIconSource
                    sourceSize {
                        width: thumb.iconSize
                        height: thumb.iconSize
                    }
                }
                progress: MathUtils.clamp((thumb.x - parent.x - x) / width, 0.0, 1.0)
                leftColor: "transparent"
                rightColor: switchStyle.selectedIconColor
            }
        }

        Item {
            id: rightThumbPosition
            anchors {
                right: parent.right
                top: parent.top
                rightMargin: switchStyle.thumbPadding
                topMargin: switchStyle.thumbPadding
            }
            height: thumb.height
            width: thumb.width

            PartialColorize {
                anchors.centerIn: parent
                source: Image {
                    source: switchStyle.checkedIconSource
                    sourceSize {
                        width: thumb.iconSize
                        height: thumb.iconSize
                    }
                }
                progress: MathUtils.clamp((thumb.x + thumb.width - parent.x - x) / width, 0.0, 1.0)
                leftColor: switchStyle.selectedIconColor
                rightColor: "transparent"
            }
        }
    }
}
