/*
 * Copyright 2012 Canonical Ltd.
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
    \qmltype MultiValue
    \inqmlmodule Lomiri.Components.ListItems 1.0
    \ingroup lomiri-listitems
    \brief List item displaying multiple values.
    \note \b{The component is deprecated. Use ListItem component instead.}

    Examples:
    \qml
        import Lomiri.Components.ListItems 1.3 as ListItem
        Column {
            ListItem.MultiValue {
                text: "Label"
                values: ["Value 1", "Value 2", "Value 3", "Value 4"]
                onClicked: selected = !selected
            }
            ListItem.MultiValue {
                text: "Label"
                iconName: "compose"
                values: ["Value 1", "Value 2", "Value 3", "Value 4"]
                progression: true
                onClicked: print("clicked")
            }
        }
    \endqml
*/
Base {
    id: multiValueListItem

    /*!
      The list of values that will be shown under the label text
     */
    property variant values

    Item {
        height: label.height + valueLabel.height
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            right: parent.right
        }
        LabelVisual {
            id: label
            selected: multiValueListItem.selected
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
            }
            text: multiValueListItem.text
        }
        LabelVisual {
            id: valueLabel
            selected: multiValueListItem.selected
            secondary: true
            anchors {
                top: label.bottom
                left: parent.left
                right: parent.right
            }
            textSize: Label.Small
            text: concatenatedValues(multiValueListItem.values)

            function concatenatedValues(values) {
                var n = values.length;
                var result = "";
                if (n > 0) {
                    result = values[0];
                    for (var i = 1; i < n; i++) {
                        result = result + ", " + values[i];
                    }
                }
                return result;
            }
        }
    }
}
