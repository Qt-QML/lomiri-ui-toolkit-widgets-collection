# -*- Mode: Python; coding: utf-8; indent-tabs-mode: nil; tab-width: 4 -*-
#
# Copyright (C) 2012, 2013, 2014 Canonical Ltd.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation; version 3.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

"""Tests for the Lomiri UI Toolkit Gallery"""

import testscenarios

import lomiriuitoolkit
from lomiriuitoolkit import lomiri_scenarios
from lomiriuitoolkit.tests import gallery


class GalleryAppTestCase(gallery.GalleryTestCase):
    """Generic tests for the Gallery"""

    scenarios = lomiri_scenarios.get_device_simulation_scenarios()

    def test_select_main_view_must_return_main_window_emulator(self):
        main_view = self.main_view
        self.assertIsInstance(main_view, lomiriuitoolkit.MainView)

    def test_slider(self):
        self.open_page('slidersElement')

        item_data = [
            ["slider_standard"],
            ["slider_live"],
            ["slider_range"]
        ]

        for data in item_data:
            objName = data[0]
            self.getObject(objName)
            self.tap(objName)

            # TODO: move slider value

    def test_progress_and_activity(self):
        self.open_page('progressBarsElement')

        item_data = [
            ["progressbar_standard"],
            ["progressbar_indeterminate"],
            ["activityindicator_standard"]
        ]

        for data in item_data:
            objName = data[0]
            self.getObject(objName)
            self.tap(objName)

            # TODO: check for properties

    def test_lomirishape(self):
        # Flaky test case
        # FIXME: https://bugs.launchpad.net/lomiri-ui-toolkit/+bug/1308979
        return

        self.open_page('lomiriShapesElement')

        item_data = [
            ["lomirishape_color_hex"],
            ["lomirishape_color_lightblue"],
            ["lomirishape_color_darkgray"],
            ["lomirishape_image"],
            ["lomirishape_radius_small"],
            ["lomirishape_radius_medium"],
            ["lomirishape_sizes_15_6"],
            ["lomirishape_sizes_10_14"]
        ]

        for data in item_data:
            objName = data[0]
            self.getObject(objName)


class OpenPagesTestCase(gallery.GalleryTestCase):

    names = [
        'navigation', 'toggles', 'buttons', 'sliders', 'textinputs',
        'optionSelectors', 'pickers', 'progressBars', 'lomiriShapes', 'icons',
        'labels', 'listItems', 'lomiriListView', 'dialogs', 'popovers',
        'sheets', 'animations'
    ]

    pages_scenarios = [
        (name, dict(
            element_name=name+'Element',
            template_name=name+'Template'))
        for name in names
    ]

    scenarios = testscenarios.multiply_scenarios(
        lomiri_scenarios.get_device_simulation_scenarios(),
        pages_scenarios)

    def test_open_page(self):
        self.open_page(self.element_name)
        self.main_view.wait_select_single(objectName=self.template_name)
