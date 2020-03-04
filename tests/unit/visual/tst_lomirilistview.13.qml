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

import QtQuick 2.4
import QtTest 1.0
import Lomiri.Test 1.3
import Lomiri.Components 1.3

Item {
    width: units.gu(40)
    height: units.gu(60)

    ListModel {
        id: dummyModel
        Component.onCompleted: {
            reload();
        }
        function reload() {
            clear();
            for (var i = 0; i < 20; ++i) {
                dummyModel.append({idx: i});
            }
        }
    }

    // timer used to simulate the model refresh
    Timer {
        id: refreshTimer
        interval: 500
        onTriggered: {
            dummyModel.reload();
        }
    }

    LomiriListView {
        id: lomiriListView
        anchors.fill: parent
        clip: true
        model: dummyModel

        pullToRefresh {
            refreshing: refreshTimer.running
            onRefresh: refreshTimer.restart()
        }

        delegate: ListItem {
            id: expandable
            Label { text: "item " + index }
        }
    }

    LomiriTestCase {
        name: "LomiriListView"
        when: windowShown

        SignalSpy {
            id: refreshSpy
            signalName: "onRefresh"
        }

        function initTestCase() {
            tryCompare(dummyModel, "count", 20);
        }

        function init() {
            waitForRendering(lomiriListView, 1000);
        }

        function cleanup() {
            // scroll the ListView back to top
            lomiriListView.positionViewAtIndex(0, ListView.Beginning);
            refreshSpy.clear();
            refreshSpy.target = null;
            lomiriListView.pullToRefresh.enabled = false;
        }

        function test_0_defaults() {
            verify(lomiriListView.hasOwnProperty("pullToRefresh"), "PullToRefresh is missing");
            compare(lomiriListView.pullToRefresh.enabled, false, "PullToRefresh functionality is disabled by default");
        }

        function test_pullToRefresh_manual_refresh() {
            lomiriListView.pullToRefresh.enabled = true;
            refreshSpy.target = lomiriListView.pullToRefresh
            var x = lomiriListView.width / 2;
            mouseDrag(lomiriListView, x, units.gu(1), 0, lomiriListView.height);
            refreshSpy.wait();
            tryCompareFunction(function() { return lomiriListView.pullToRefresh.refreshing; }, false, 1000);
            waitForRendering(lomiriListView, 1000);
        }
    }
}
