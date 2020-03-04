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

"""Tests for the Lomiri UI Toolkit Gallery - LomiriListView component."""

from lomiriuitoolkit.tests.gallery import GalleryTestCase


class LomiriListViewTestCase(GalleryTestCase):

    def _open_page(self):
        super().open_page('lomiriListViewElement')
        self.listView = self.main_view.select_single(
            objectName="lomiriListView")

    def test_pull_to_refresh_enabled(self):
        self._open_page()
        self.assertTrue(self.listView.pull_to_refresh_enabled())

    def test_manual_refresh_wait(self):
        self._open_page()
        self.assertTrue(self.listView.manual_refresh_wait())

    def test_manual_refresh_nowait(self):
        self._open_page()
        self.assertTrue(self.listView.manual_refresh_nowait())
        # wait for completion
        self.listView.wait_refresh_completed()
