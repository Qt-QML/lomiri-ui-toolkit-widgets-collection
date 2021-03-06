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
    \qmltype ComposerSheet
    \inherits SheetBase
    \inqmlmodule Lomiri.Components.Popups 1.0
    \deprecated
    \ingroup lomiri-popups
    \brief Much like the \l DefaultSheet the Composer Sheet allows an application to insert a content
        view over the focused view without disrupting the navigation pattern. However the Composer Sheet
        is optimised for scenarios in which user content is at risk of corruption, most often (but not
        solely) when creating or editing content (e.g compose new message).
        There are two ways to dismiss it: user confirming the manipulation or user cancelling
        the manipulation, using the "confirm" and "cancel" buttons shown in the right and left side
        of the composer header.

    Example:
    \qml
        import Lomiri.Components 1.3
        import Lomiri.Components.Popups 1.3

        Item {
            Component {
                id: composerSheet
                ComposerSheet {
                    id: sheet
                    title: "Composer sheet"
                    Label {
                        text: "A composer sheet has cancel and confirm buttons."
                    }
                    onCancelClicked: PopupUtils.close(sheet)
                    onConfirmClicked: PopupUtils.close(sheet)
                }
            }

            Button {
                anchors.centerIn: parent
                text: "composer"
                width: units.gu(16)
                onClicked: PopupUtils.open(composerSheet)
            }
        }
    \endqml

    \b{Sheets are deprecated. Consider using \l Dialog, \l Popover or \l PageStack instead.}
*/

SheetBase {
    id: composer

    /*!
      The user clicked the "cancel" button.
    */
    signal cancelClicked

    /*!
      The user clicked the "confirm" button.
     */
    signal confirmClicked

    __leftButton: Button {
        text: i18n.dtr("lomiri-ui-toolkit", "Cancel")
        objectName: "cancelButton"
        /*! \internal */ // avoid warning when generating documentation
        onClicked: {
            composer.cancelClicked();
            composer.hide();
        }
    }

    __rightButton: Button {
        text: i18n.dtr("lomiri-ui-toolkit", "Confirm")
        objectName: "confirmButton"
        color: LomiriColors.orange
        /*! \internal */ // avoid warning when generating documentation
        onClicked: {
            composer.confirmClicked();
            composer.hide();
        }
    }
}
