/*
 * Copyright 2014 Canonical Ltd.
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
import QtTest 1.0
import Lomiri.Test 1.0
import Lomiri.Components 1.0
import Lomiri.Components.ListItems 1.0

Item {
    width: units.gu(40)
    height: units.gu(60)

    ListModel {
        id: dummyModel
        Component.onCompleted: {
            for (var i = 0; i < 20; ++i) {
                dummyModel.append({idx: i});
            }
        }
    }

    LomiriListView {
        id: lomiriListView
        anchors { left: parent.left; top: parent.top; right: parent.right }
        height: units.gu(20)
        clip: true
        model: dummyModel

        delegate: Expandable {
            id: expandable
            objectName: "expandable" + index
            expandedHeight: contentColumn.height

            onClicked: lomiriListView.expandedIndex = index

            Column {
                id: contentColumn
                anchors { left: parent.left; right: parent.right; top: parent.top }
                Rectangle {
                    anchors { left: parent.left; right: parent.right}
                    id: collapsedRect
                    color: index % 2 == 0 ? "khaki" : "blue"
                    height: expandable.collapsedHeight
                }
                Rectangle {
                    anchors { left: parent.left; right: parent.right }
                    height: units.gu(40)
                    color: "orange"
                }
            }
        }
    }

    // FIXME: Failing unit tests with Qt 5.6. See bug #1624343.
    LomiriTestCase {
        name: "LomiriListView"
        when: windowShown

        function initTestCase() {
            tryCompare(dummyModel, "count", 20);
        }

        function init() {
            waitForRendering(lomiriListView);
        }

        function expandItem(item) {
            var index = lomiriListView.indexAt(item.x, item.y);
            lomiriListView.expandedIndex = index;
            var targetHeight = Math.min(item.expandedHeight, lomiriListView.height - item.collapsedHeight);
            tryCompare(item, "height", targetHeight);
            waitForRendering(lomiriListView)
        }

        function collapse() {
            if (lomiriListView.expandedIndex == -1) {
                return;
            }

            var expandedItem = findChild(lomiriListView, "expandable" + lomiriListView.expandedIndex);
            lomiriListView.expandedIndex = -1;
            tryCompare(expandedItem, "height", expandedItem.collapsedHeight);
            waitForRendering(lomiriListView);
        }

        function test_expandedItem() {
            var item = findChild(lomiriListView, "expandable1");
            expandItem(item);

            // expandedItem needs to point to the expanded item
            compare(lomiriListView.expandedIndex, 1);
            // item must be expanded now
            compare(item.expanded, true);

            collapse();

            // expandedItem must be unset after collapsing
            compare(lomiriListView.expandedIndex, -1);
        }

        function test_noScrollingNeeded() {
            var item = findChild(lomiriListView, "expandable1");
            fuzzyCompare(lomiriListView.mapFromItem(item, 0, 0).y, item.collapsedHeight, .5);

            expandItem(item);
            waitForRendering(lomiriListView);

            fuzzyCompare(lomiriListView.mapFromItem(item, 0, 0).y, item.collapsedHeight, .5);
        }

        function test_scrollToTop() {
            lomiriListView.height = units.gu(30);
            lomiriListView.positionViewAtIndex(0, ListView.Beginning)

            var item = findChild(lomiriListView, "expandable1");
            fuzzyCompare(lomiriListView.mapFromItem(item, 0, 0).y, item.collapsedHeight, 1);

            expandItem(item);

            fuzzyCompare(lomiriListView.mapFromItem(item, 0, 0).y, 0, .5);
        }

        function test_scrollIntoView() {
            var item = findChild(lomiriListView, "expandable9");
            expandItem(item);
            waitForRendering(lomiriListView);

            // The item must be scrolled upwards, leaving space for one other item at the bottom
            fuzzyCompare(lomiriListView.mapFromItem(item, 0, 0).y, lomiriListView.height - item.collapsedHeight - item.expandedHeight, 1);
        }

        function test_collapseByClickingOutside() {
            // expand item 0
            var item = findChild(lomiriListView, "expandable0");
            expandItem(item);

            // click on item 1
            var item1 = findChild(lomiriListView, "expandable1");
            mouseClick(item1, item1.width / 2, item1.height / 2);

            // make sure item1 is collapsed
            tryCompare(item, "expanded", false);
        }

        function test_dimOthers() {
            var item = findChild(lomiriListView, "expandable1");
            expandItem(item);

            for (var i = 0; i < lomiriListView.contentItem.children.length; ++i) {
                var childItem = lomiriListView.contentItem.children[i];
                if (childItem.hasOwnProperty("expanded")) {
                    compare(childItem.opacity, childItem.expanded ? 1 : .5)
                }

            }
        }

        function test_destroyAndRecreateExpanded() {
            var item = findChild(lomiriListView, "expandable1");
            expandItem(item);

            // scroll the list to the bottom
            lomiriListView.currentIndex = 0;
            lomiriListView.positionViewAtIndex(lomiriListView.count -1, ListView.End);

            // make sure the item is eventually destroyed
            tryCompareFunction(function() { return findChild(lomiriListView, "expandable1") == null;}, true)

            // scroll the list back up
            lomiriListView.positionViewAtIndex(0, ListView.Beginning)

            // wait until the item is recreated.
            tryCompareFunction(function() { return findChild(lomiriListView, "expandable1") != null; }, true);
            item = findChild(lomiriListView, "expandable1");
            compare(item.expanded, true);
            
        }

        function test_collapseOnClick() {
            var item = findChild(lomiriListView, "expandable1");
            item.collapseOnClick = true;
            expandItem(item);

            compare(lomiriListView.expandedIndex, 1);

            mouseClick(item, item.width / 2, item.collapsedHeight / 2);
            tryCompare(lomiriListView, "expandedIndex", -1);

            // restore stuff we've changed
            item.collapseOnClick = false;
        }

        function cleanup() {
            // Restore listview height
            lomiriListView.height = units.gu(60);
            collapse();
            // scroll the ListView back to top
            lomiriListView.positionViewAtIndex(0, ListView.Beginning);
        }
    }
}
