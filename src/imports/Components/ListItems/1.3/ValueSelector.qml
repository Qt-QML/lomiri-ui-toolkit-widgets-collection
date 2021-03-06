/*
 * Copyright 2015 Canonical Ltd.
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

/*!
    ****DEPRECATED! PLEASE USE ITEM SELECTOR OR FOR THE LOMIRI SHAPE VERSION THE OPTION SELECTOR.****

    \qmltype ValueSelector
    \inqmlmodule Lomiri.Components.ListItems 1.0
    \ingroup lomiri-listitems
    \brief List item displaying single selected value when not expanded,
    where expanding it opens a listing of all the possible values for selection.

    Examples:
    \qml
        import Lomiri.Components.ListItems 1.3 as ListItem
        Column {
            width: 250
            ListItem.ValueSelector {
                text: "Standard"
                values: ["Value 1", "Value 2", "Value 3", "Value 4"]
            }
            ListItem.ValueSelector {
                text: "Disabled"
                values: ["Value 1", "Value 2", "Value 3", "Value 4"]
                enabled: false
            }
            ListItem.ValueSelector {
                text: "Expanded"
                values: ["Value 1", "Value 2", "Value 3", "Value 4"]
                expanded: true
            }
            ListItem.ValueSelector {
                text: "Icon"
                iconName: "compose"
                values: ["Value 1", "Value 2", "Value 3", "Value 4"]
                selectedIndex: 2
            }
        }
    \endqml
*/
Empty {
    id: selector
    __height: column.height

    /*!
      The text that is shown in the list item as a label.
      \qmlproperty string text
     */

    /*!
      \deprecated

      \b{Use iconName or iconSource instead.}

      The location of the icon to show in the list item (optional), or an Item that is
      shown on the left side inside the list item. The icon will automatically be
      anchored to the left side of the list item, and if its height is undefined, to the top
      and bottom of the list item.
      \qmlproperty variant icon
    */
    property alias icon: selectorMain.icon

    /*!
      The location of the icon to show in the list item if iconSource failed to load (optional).
      \qmlproperty url fallbackIconSource
     */
    property alias fallbackIconSource: selectorMain.fallbackIconSource

    /*!
      The icon shown in the list item if iconName failed to load (optional).

      \qmlproperty string fallbackIconName

      If both fallbackIconSource and fallbackIconName are defined, fallbackIconName will be ignored.

      \note The complete list of icons available in Lomiri is not published yet.
            For now please refer to the folders where the icon themes are installed:
            \list
              \li Lomiri Touch: \l file:/usr/share/icons/suru
              \li Lomiri Desktop: \l file:/usr/share/icons/lomiri-mono-dark
            \endlist
            These 2 separate icon themes will be merged soon.
    */
    property alias fallbackIconName: selectorMain.fallbackIconName

    /*!
      \internal
      \deprecated
      Width of the icon to be displayed
    */
    property real __iconWidth

    /*!
      \internal
      \deprecated
      Height of the icon to be displayed
    */
    property real __iconHeight

    /*!
      \internal
      \deprecated
      The margins on the left side of the icon.
     */
    property real __leftIconMargin

    /*!
      \internal
      \deprecated
      The margins on the right side of the icon.
     */
    property real __rightIconMargin

    /*!
      Show or hide the frame around the icon
      \qmlproperty bool iconFrame
     */
    property alias iconFrame: selectorMain.iconFrame

    /*!
      The list of values that will be shown under the label text
     */
    property variant values

    /*!
      The index of the currently selected element from the \l values array.
     */
    property int selectedIndex: 0

    /*!
      Specifies whether the selector is 'open' or 'closed'.
     */
    property bool expanded: false

    showDivider: false

    Column {
        id: column
        anchors {
            left: parent.left
            right: parent.right
            topMargin: units.dp(2)
            bottomMargin: units.dp(2)
        }

        Base {
            id: selectorMain
            height: units.gu(6)
            showDivider: true
            onClicked: selector.expanded = !selector.expanded
            selected: selector.selected
            iconSource: selector.iconSource

            LabelVisual {
                id: label
                anchors {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                }
                text: selector.text
                width: Math.min(implicitWidth, parent.width * 0.8)
            }
            LabelVisual {
                id: valueLabel
                anchors {
                    verticalCenter: parent.verticalCenter
                    right: accordion.left
                    rightMargin: selector.__contentsMargins
                    leftMargin: selector.__contentsMargins
                    left: label.right
                }
                textSize: Label.Small
                text: selector.values[selector.selectedIndex]
                font.bold: selector.expanded
                horizontalAlignment: Text.AlignRight
            }
            Item {
                id: accordion
                width: accordionIcon.width
                anchors {
                    right: parent.right
                    top: parent.top
                    bottom: parent.bottom
                }
                Image {
                    id: accordionIcon
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    source: Qt.resolvedUrl("../../artwork/chevron.png")
                    opacity: enabled ? 1.0 : 0.5
                    rotation: expanded ? 270 : 90
                    width: implicitWidth / 1.5
                    height: implicitHeight / 1.5

                    states: [
                        State {
                            name: "expanded"
                            when: selector.expanded
                            PropertyChanges { target: accordionIcon; rotation: 270 }
                        }, State {
                            name: "closed"
                            when: !selector.expanded
                            PropertyChanges { target: accordionIcon; rotation: 90 }
                        }
                    ]

                    transitions: Transition {
                        LomiriNumberAnimation {
                            target: accordionIcon
                            properties: "rotation"
                            duration: LomiriAnimation.SnapDuration
                        }
                    }
                }
            }
        }

        Repeater {
            id: valueRepeater
            property int valueHeight: selector.expanded ? units.gu(5) : 0

            states: [ State {
                    name: "expanded"
                    when: selector.expanded
                    PropertyChanges {
                        target: valueRepeater
                        valueHeight: units.gu(5)
                    }
                }, State {
                    name: "closed"
                    when: !selector.expanded
                    PropertyChanges {
                        target: valueRepeater
                        valueHeight: 0
                    }
                }
            ]

            transitions: Transition {
                LomiriNumberAnimation {
                    target: valueRepeater
                    properties: "valueHeight"
                    duration: LomiriAnimation.SnapDuration
                }
            }

            model: selector.values
            Rectangle {
                color: Qt.lighter(theme.palette.normal.base)
                height: valueRepeater.valueHeight
                width: parent.width

                Empty {
                    id: valueBase
                    height: parent.height
                    visible: valueBase.height > 0
                    onClicked: {
                        selector.selectedIndex = index
                        selector.expanded = false
                    }

                    selected: index === selector.selectedIndex

                    LabelVisual {
                        text: modelData
                        anchors {
                            left: parent.left
                            leftMargin: units.gu(3)
                            verticalCenter: parent.verticalCenter
                        }
                        font.bold: valueBase.selected
                        property real heightMargin: valueBase.height - implicitHeight
                        visible: heightMargin > 0
                        // fade in/out the values when expanding/contracting the selector.
                        opacity: heightMargin < 10 ? heightMargin/10 : 1
                    }
                }
            }
        }
    }
}
