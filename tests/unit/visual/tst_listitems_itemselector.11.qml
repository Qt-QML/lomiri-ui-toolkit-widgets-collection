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
import QtTest 1.0
import Lomiri.Components 1.1
import Lomiri.Components.ListItems 1.0 as ListItem
import Lomiri.Test 1.0

Item {
    width: 400
    height: 400

    Column {
        anchors {
            left: parent.left
            right: parent.right
        }
        ListItem.ItemSelector {
            id: selector

            text: "TEST"
            delegate: selectorDelegate
            model: customModel
        }

        OptionSelectorDelegate {
            id: testDelegate

            text: "TEST"
            subText: "test"
            iconSource: "../../resources/optionselector/test.png"
            constrainImage: true
        }
    }

    Column {
        anchors.left: parent.left
        anchors.right: parent.right

        ListItem.ItemSelector {
            id: expandedSelector
            text: i18n.tr("Return results from:")
            model: [i18n.tr("Phone only"), i18n.tr("Phone and Internet")]
            expanded: true
        }
    }

    Component {
        id: selectorDelegate

        OptionSelectorDelegate {
            text: name
            subText: description
            iconSource: image
            constrainImage: true
        }
    }

    ListModel {
        id: customModel
        ListElement { name: "Name 1"; description: "Description 1"; image: "../../resources/optionselector/test.png" }
        ListElement { name: "Name 2"; description: "Description 2"; image: "../../resources/optionselector/test.png" }
        ListElement { name: "Name 3"; description: "Description 3"; image: "../../resources/optionselector/test.png" }
        ListElement { name: "Name 4"; description: "Description 4"; image: "../../resources/optionselector/test.png" }
    }

    LomiriTestCase {
         name: "ItemSelectorAPI"
         when: windowShown

         function test_expanded() {
             var listContainer = findChild(selector, "listContainer");

             selector.expanded = false;
             compare(listContainer.currentlyExpanded, false, "expanded should be true if list is an expanded one");
             compare(listContainer.state, "collapsed", "state should be collapsed");

             selector.expanded = true;
             compare(listContainer.currentlyExpanded, true, "expanded should be false if list is an expanded one");
             compare(listContainer.state, "expanded", "state should be expanded");
         }

         function test_text() {
             var newText = "Hello World!";
             selector.text = newText;
             compare(selector.text, newText, "set/get");
         }

         function test_0_selectedIndex() {
            compare(selector.selectedIndex, 0, "selectedIndex is 0 by default");
         }

         function test_model() {
             selector.delegate = null;
             selector.model = undefined;
             var newValues = ["value0","value1","value2","value3"];
             selector.model = newValues;
             compare(selector.model, newValues, "set/get");
             selector.model = customModel;
             selector.delegate = selectorDelegate
         }

         function test_custom_model_delegate() {
             compare(selector.model, customModel, "Model wasn't set correctly.");
             compare(selector.delegate, selectorDelegate, "Delegate hasn't been set correctly");
         }

         function test_image_constraint() {
            var image = findChild(testDelegate, "icon");
            compare(image.height, testDelegate.height);
         }

         function test_expandedSelector() {
             verify(expandedSelector.containerHeight > 0, "Expanded ItemSelector height negative");
         }
    }
}
