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

import QtQuick 2.0
import Lomiri.Components 1.1
import Lomiri.Components.Pickers 1.0

MainView {
    width: units.gu(40)
    height: units.gu(71)

    Column {
        Button {
            id: datePickerButton
            property date date: new Date()
            text: "Date picker: " + Qt.formatDate(date, "yyyy/MMMM/dd dddd")
            onClicked: {
                var picker = PickerPanel.openDatePicker(datePickerButton, "date", "Years|Months|Days")
                picker.picker.locale = Qt.locale("hu_HU")
            }
        }
        Button {
            id: timePickerButton
            property date date: new Date()
            text: "Time picker: " + Qt.formatTime(date, "hh:mm:ss")
            onClicked: PickerPanel.openDatePicker(timePickerButton, "date", "Hours|Minutes|Seconds")
        }
    }
}
