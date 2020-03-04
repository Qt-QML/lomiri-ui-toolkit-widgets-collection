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
 *
 */

import QtQuick 2.4
import Lomiri.Components 1.3

/*!
    \qmltype LomiriNumberAnimation
    \inqmlmodule Lomiri.Components
    \ingroup lomiri
    \brief LomiriNumberAnimation is a NumberAnimation that has predefined
           settings to ensure that Lomiri applications are consistent in their animations.

    Example of use:

    \qml
    import QtQuick 2.4
    import Lomiri.Components 1.3

    Rectangle {
        width: 100; height: 100
        color: LomiriColors.orange

        LomiriNumberAnimation on x { to: 50 }
    }
    \endqml

    LomiriNumberAnimation is predefined with the following settings:
    \list
    \li \e duration: \l{LomiriAnimation::FastDuration}{LomiriAnimation.FastDuration}
    \li \e easing: \l{LomiriAnimation::StandardEasing}{LomiriAnimation.StandardEasing}
    \endlist

    If the standard duration and easing used by LomiriNumberAnimation do not
    satisfy a use case or you need to use a different type of Animation
    (e.g. ColorAnimation), use standard durations and easing defined in
    \l LomiriAnimation manually in order to ensure consistency.
*/
NumberAnimation {
    duration: LomiriAnimation.FastDuration
    easing: LomiriAnimation.StandardEasing
}
