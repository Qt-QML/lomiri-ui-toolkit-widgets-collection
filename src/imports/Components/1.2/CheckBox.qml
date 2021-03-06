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

/*!
    \qmltype CheckBox
    \inqmlmodule Lomiri.Components
    \ingroup lomiri
    \brief CheckBox is a component with two states, checked or unchecked. It can
    be used to set boolean options. The behavior is the same as \l Switch, the
    only difference is the graphical style.

    \l {https://design.lomiri.com/apps/building-blocks/selection}{See also the Design Guidelines on selection}.

    Example:
    \qml
    Item {
        CheckBox {
            checked: true
        }
    }
    \endqml
*/
AbstractButton {
    id: checkBox

    /*!
      Specifies whether the checkbox is checked or not. By default the property
      is set to false.
    */
    property bool checked: false

    /*!
      \internal
     */
    onTriggered: checked = !checked

    style: Theme.createStyleComponent("CheckBoxStyle.qml", checkBox)
}
