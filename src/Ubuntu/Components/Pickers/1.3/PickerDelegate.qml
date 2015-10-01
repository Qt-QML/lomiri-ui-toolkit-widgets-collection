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
import Ubuntu.Components 1.3

/*!
    \qmltype PickerDelegate
    \inqmlmodule Ubuntu.Components.Pickers 1.0
    \ingroup ubuntu-pickers
    \inherits AbstractButton
    \brief PickerDelegate component serves as base for Picker delegates.

    PickerDelegate is a holder component for delegates used in a Picker element.
    Each picker delegate must be derived from this type.
  */

AbstractButton {
    id: pickerDelegate

    /*!
      \qmlproperty Picker picker
      \readonly
      The property holds the Picker component the delegate belongs to.
      */
    readonly property alias picker: internal.picker

    /*! \internal */
    onClicked: {
        if (internal.itemList.currentIndex === index) return;
        picker.__clickedIndex = index;
        internal.itemList.currentIndex = index;
    }

    theme.version: Ubuntu.toolkitVersion
    styleName: "PickerDelegateStyle"

    QtObject {
        id: internal
        property bool inListView: pickerDelegate.parent && (QuickUtils.className(pickerDelegate.parent) !== "QQuickPathView")
        property Item itemList: !inListView ? pickerDelegate.PathView.view : pickerDelegate.ListView.view
        property Picker picker: itemList ? itemList.pickerItem : null
    }
}
