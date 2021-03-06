# -*- Mode: Python; coding: utf-8; indent-tabs-mode: nil; tab-width: 4 -*-
# Copyright 2012 Canonical Ltd.
#
# This program is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 3, as published
# by the Free Software Foundation.

"""Tests for the ActivityIndicator Qml component."""

from autopilot.matchers import Eventually
from textwrap import dedent
from testtools.matchers import Is, Not, Equals
from testtools import skip
import os
from tavastia.tests import TavastiaTestCase

class ActivityIndicatorTests(TavastiaTestCase):
    """Tests for ActivityIndicator component."""

    test_qml_file = "%s/%s.qml" % (os.path.dirname(os.path.realpath(__file__)),"ActivityIndicatorTests")

    def test_can_select_activityindicator(self):
        """Must be able to select the Qml ActivityIndicator component."""

        obj = self.app.select_single('ActivityIndicator')
        self.assertThat(obj, Not(Is(None)))
    
    def test_can_toggle_running(self):
        obj = self.app.select_single('ActivityIndicator')
        self.assertThat(obj, Not(Is(None)))

        self.assertThat(obj.running, Eventually(Equals(False)))
        
        btn = self.app.select_single('Button')

        self.mouse.move_to_object(btn)
        self.mouse.click()

        self.assertThat(obj.running, Eventually(Equals(True)))

        self.mouse.click()

        self.assertThat(obj.running, Eventually(Equals(False)))
        
