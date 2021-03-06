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
    \qmltype Button
    \inqmlmodule Lomiri.Components
    \ingroup lomiri
    \brief Standard Lomiri button.

    \l {http://design.lomiri.com/apps/building-blocks/buttons}{See also the Design Guidelines on Buttons}.

    Examples:
    \qml
        Column {
            Button {
                text: "Send"
                onClicked: print("clicked text-only Button")
            }
            Button {
                iconName: "compose"
                gradient: LomiriColors.greyGradient
                onClicked: print("clicked icon-only Button")
            }
            Button {
                iconName: "compose"
                text: "Icon on left"
                iconPosition: "left"
                onClicked: print("clicked text and icon Button")
            }
        }
    \endqml
    An \l Action can be used to specify \b clicked, iconSource and text. Example:
    \qml
        Item {
            Action {
                id: action1
                text: "Click me"
                onTriggered: print("action!")
                iconName: "compose"
            }
            Button {
                anchors.centerIn: parent
                action: action1
                color: LomiriColors.warmGrey
            }
       }
    \endqml*/
AbstractButton {
    id: button
    /*!
      \since Lomiri.Components 1.1
      If set to a color, the button has a stroke border instead of a filled shape.
    */
    property color strokeColor: Qt.rgba(0.0, 0.0, 0.0, 0.0)

    /*!
         \qmlproperty url Button::iconSource
       The source URL of the icon to display inside the button.
       Leave this value blank for a text-only button.
       If \l action is set, the default iconSource is that of the action.
    */

    /*!
       The text to display in the button. If an icon was defined,
       the text will be shown next to the icon, otherwise it will
       be centered. Leave blank for an icon-only button.
       If \l action is set, the default text is that of the action.
       \qmlproperty string Button::text
    */

    /*!
       The background color of the button.

       \sa gradient
    */
    property color color: __styleInstance.defaultColor

    /*!
       The gradient used to fill the background of the button.

       Standard Lomiri gradients are defined in \l LomiriColors.

       If both a gradient and a color are specified, the gradient will be used.

       \sa color
    */
    property Gradient gradient: __styleInstance.defaultGradient

    /*!
      The font used for the button's text.
    */
    property font font: __styleInstance.defaultFont

    /*!
       The position of the icon relative to the text. Options
       are "left" and "right". The default value is "left".

       If only text or only an icon is defined, this
       property is ignored and the text or icon is
       centered horizontally and vertically in the button.

       Currently this is a string value. We are waiting for
       support for enums:
       https://bugreports.qt-project.org/browse/QTBUG-14861
    */
    property string iconPosition: "left"

    styleName: "ButtonStyle"
    activeFocusOnTab: true
}
