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
import Lomiri.Components 1.2
import "internalPopupUtils.js" as InternalPopupUtils

/*!
    \qmltype Dialog
    \inherits PopupBase
    \inqmlmodule Lomiri.Components.Popups 1.0
    \ingroup lomiri-popups
    \brief The Dialog caters for cases in which the application requires the user to determine
        between optional actions. The Dialog will interrupt the user flow and lock the view
        for further interaction before the user has selected a desired action.
        It can only be closed by selecting an optional action confirming or cancelling the operation.

    \l {http://design.lomiri.com/apps/building-blocks/dialog}{See also the Design Guidelines on Dialogs}.

    Example:
    \qml
        import QtQuick 2.4
        import Lomiri.Components 1.2
        import Lomiri.Components.Popups 1.0

        Item {
            width: units.gu(80)
            height: units.gu(80)
            Component {
                 id: dialog
                 Dialog {
                     id: dialogue
                     title: "Save file"
                     text: "Are you sure that you want to save this file?"
                     Button {
                         text: "cancel"
                         onClicked: PopupUtils.close(dialogue)
                     }
                     Button {
                         text: "overwrite previous version"
                         color: LomiriColors.orange
                         onClicked: PopupUtils.close(dialogue)
                     }
                     Button {
                         text: "save a copy"
                         color: LomiriColors.orange
                         onClicked: PopupUtils.close(dialogue)
                     }
                 }
            }
            Button {
                anchors.centerIn: parent
                id: saveButton
                text: "save"
                onClicked: PopupUtils.open(dialog)
            }
        }
    \endqml
*/

PopupBase {
    id: dialog

    /*!
      \qmlproperty list<Object> contents
      Content will be put inside a column in the foreround of the Dialog.
    */
    default property alias contents: contentsColumn.data

    /*!
      The title of the question to ask the user.
      \qmlproperty string title
     */
    property alias title: foreground.title

    /*!
      The question to the user.
      \qmlproperty string text
     */
    property alias text: foreground.text

    /*!
      The Item such as a \l Button that the user interacted with to open the Dialog.
      This property will be used for the automatic positioning of the Dialog next to
      the caller, if possible.
     */
    property Item caller

    /*!
      The property holds the item to which the pointer should be anchored to.
      This can be same as the caller or any child of the caller. By default the
      property is set to caller.
      */
    property Item pointerTarget
    /*! \internal */
    onPointerTargetChanged: {
        console.debug("pointerTarget DEPRECATED")
    }

    /*!
      The property holds the margins from the dialog's dismissArea. The property
      is themed.
      */
    property real edgeMargins: units.gu(2)

    /*!
      The property holds the margin from the dialog's caller. The property
      is themed.
      */
    property real callerMargin: units.gu(1)

    /*!
      The property controls whether the dialog is modal or not. Modal dialogs block
      event propagation to items under dismissArea, when non-modal ones let these
      events passed to these items. In addition, non-modal dialogs do not dim the
      dismissArea.

      The default value is true.
      */
    property bool modal: true

    /*
    QtObject {
        id: internal

        function updatePosition() {
            var pos = new InternalPopupUtils.CallerPositioning(foreground, pointer, dialog, caller, pointerTarget, edgeMargins, callerMargin);
            pos.auto();

        }
    }

    Pointer { id: pointer }
    */

    __foreground: foreground
    __eventGrabber.enabled: modal
    __dimBackground: modal
    fadingAnimation: LomiriNumberAnimation { duration: LomiriAnimation.SnapDuration }

    StyledItem {
        id: foreground
        activeFocusOnPress: true
        width: Math.min(minimumWidth, dialog.width)
        anchors.centerIn: parent
        clip: true
        objectName: 'dialogForeground'

        // used in the style
        property string title
        property string text
        property real minimumWidth: units.gu(38)
        property real minimumHeight: units.gu(32)
        property real maxHeight: 3*dialog.height/4
        property real margins: units.gu(4)
        property real itemSpacing: units.gu(2)
        property Item dismissArea: dialog.dismissArea
        property real keyboardHeight: dialog.anchorToKeyboard && LomiriApplication.inputMethod.visible ? LomiriApplication.inputMethod.keyboardRectangle.height : 0

        height: Math.min(contentsColumn.height + foreground.margins, dialog.height - keyboardHeight)

        Flickable {
            anchors.fill: parent
            anchors.margins: foreground.margins
            contentWidth: contentsColumn.width
            contentHeight: contentsColumn.height - foreground.margins
            boundsBehavior: Flickable.StopAtBounds

            Column {
                id: contentsColumn
                spacing: foreground.itemSpacing
                width: foreground.width - foreground.margins * 2
                height: childrenRect.height + foreground.margins
                onWidthChanged: updateChildrenWidths();

                Label {
                    horizontalAlignment: Text.AlignHCenter
                    text: dialog.title
                    wrapMode: Text.Wrap
                    maximumLineCount: 2
                    elide: Text.ElideRight
                    fontSize: "large"
                    color: LomiriColors.darkGrey
                    visible: (text !== "")
                }

                Label {
                    horizontalAlignment: Text.AlignHCenter
                    text: dialog.text
                    fontSize: "medium"
                    color: LomiriColors.darkGrey
                    wrapMode: Text.Wrap
                    visible: (text !== "")
                }

                onChildrenChanged: updateChildrenWidths()

                function updateChildrenWidths() {
                    for (var i = 0; i < children.length; i++) {
                        children[i].width = contentsColumn.width;
                    }
                }
            }
        }

        style: Theme.createStyleComponent("DialogForegroundStyle.qml", foreground)
    }
}
