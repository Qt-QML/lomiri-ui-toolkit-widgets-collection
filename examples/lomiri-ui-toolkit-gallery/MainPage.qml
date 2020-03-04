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

Page {
    id: mainPage
    title: "Lomiri UI Toolkit"

    header: PageHeader {
        title: mainPage.title
        flickable: layout.columns === 1 ? widgetList : null
        // avoid header staying hidden when resizing back to two columns, bug #1556860
        onFlickableChanged: exposed = true
        trailingActionBar.actions: [
            Action {
                text: i18n.tr('Right to Left')
                iconName: 'flash-on'
                visible: LomiriApplication.layoutDirection == Qt.LeftToRight
                onTriggered: LomiriApplication.layoutDirection = Qt.RightToLeft
            },
            Action {
                text: i18n.tr('Left to Right')
                iconName: 'flash-off'
                visible: LomiriApplication.layoutDirection == Qt.RightToLeft
                onTriggered: LomiriApplication.layoutDirection = Qt.LeftToRight
            },
            Action {
                text: i18n.tr('Use dark theme')
                iconName: 'torch-on'
                visible: gallery.theme.name == 'Lomiri.Components.Themes.Ambiance'
                onTriggered: gallery.theme.name = 'Lomiri.Components.Themes.SuruDark'
            },
            Action {
                text: i18n.tr('Use light theme')
                iconName: 'torch-off'
                visible: gallery.theme.name == 'Lomiri.Components.Themes.SuruDark'
                onTriggered: gallery.theme.name = 'Lomiri.Components.Themes.Ambiance'
            },
            Action {
                id: aboutAction
                text: i18n.tr('About')
                iconName: "info"
                onTriggered: mainPage.pageStack.addPageToCurrentColumn(mainPage, Qt.resolvedUrl("About.qml"))
            },
            Action {
                text: i18n.tr("Deactivate mouse")
                iconName: "non-starred"
                visible: QuickUtils.mouseAttached
                onTriggered: QuickUtils.mouseAttached = false
            },
            Action {
                text: i18n.tr("Activate mouse")
                iconName: "starred"
                visible: !QuickUtils.mouseAttached
                onTriggered: QuickUtils.mouseAttached = true
            },
            Action {
                text: i18n.tr("Detach keyboard")
                iconName: "non-starred"
                visible: QuickUtils.keyboardAttached
                onTriggered: QuickUtils.keyboardAttached = false
            },
            Action {
                text: i18n.tr("Attach keyboard")
                iconName: "starred"
                visible: !QuickUtils.keyboardAttached
                onTriggered: QuickUtils.keyboardAttached = true
            }
        ]
    }

    onActiveChanged: {
        if (layout.columns < 2) {
            widgetList.currentIndex = -1;
        }
        if (active) {
            widgetList.openPage();
        }
    }

    LomiriListView {
        id: widgetList
        objectName: "widgetList"
        anchors {
            fill: parent
            topMargin: mainPage.header.flickable ? 0 : mainPage.header.height
        }

        model: WidgetsModel {}
        currentIndex: -1

        onCurrentIndexChanged: openPage()

        function openPage() {
            if (!mainPage.active || currentIndex < 0) return;
            var modelData = model.get(currentIndex);
            var source = Qt.resolvedUrl(modelData.source);
            mainPage.pageStack.addPageToNextColumn(mainPage, source, {title: modelData.label});
        }

        delegate: ListItem {
            objectName: model.objectName
            enabled: source != ""
            // Used by Autopilot
            property string text: label
            onClicked: widgetList.currentIndex = index
            //follow ListItemLayout size
            height: layout.height + (divider.visible ? divider.height : 0)
            ListItemLayout {
                id: layout
                title.text: label
                ProgressionSlot {}
            }
        }
    }
}
