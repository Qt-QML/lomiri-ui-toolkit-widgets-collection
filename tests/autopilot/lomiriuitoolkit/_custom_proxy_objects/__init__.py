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

"""Lomiri UI Toolkit Autopilot custom proxy objects."""

from lomiriuitoolkit._custom_proxy_objects._actionbar import ActionBar
from lomiriuitoolkit._custom_proxy_objects._sections import Sections
from lomiriuitoolkit._custom_proxy_objects._checkbox import CheckBox
from lomiriuitoolkit._custom_proxy_objects._common import (
    check_autopilot_version,
    get_keyboard,
    get_pointing_device,
    ToolkitException,
    LomiriUIToolkitCustomProxyObjectBase,
)
from lomiriuitoolkit._custom_proxy_objects._flickable import QQuickFlickable
from lomiriuitoolkit._custom_proxy_objects._header import (
    AppHeader,
    Header,
)

from lomiriuitoolkit._custom_proxy_objects.popups import (
    Dialog,
    ActionSelectionPopover,
)

from lomiriuitoolkit._custom_proxy_objects import listitems
from lomiriuitoolkit._custom_proxy_objects._uclistitem import (
    UCListItem
)
from lomiriuitoolkit._custom_proxy_objects._mainview import MainView
from lomiriuitoolkit._custom_proxy_objects._optionselector import (
    OptionSelector
)
from lomiriuitoolkit._custom_proxy_objects import pickers
from lomiriuitoolkit._custom_proxy_objects import popups
from lomiriuitoolkit._custom_proxy_objects._qquickgridview import (
    QQuickGridView
)
from lomiriuitoolkit._custom_proxy_objects._qquicklistview import (
    QQuickListView
)
from lomiriuitoolkit._custom_proxy_objects._tabbar import TabBar
from lomiriuitoolkit._custom_proxy_objects._tabs import Tabs
from lomiriuitoolkit._custom_proxy_objects._textarea import TextArea
from lomiriuitoolkit._custom_proxy_objects._textfield import TextField
from lomiriuitoolkit._custom_proxy_objects._toolbar import Toolbar
from lomiriuitoolkit._custom_proxy_objects._lomirilistview import (
    LomiriListView11,
    LomiriListView,
)

__all__ = [
    'AppHeader',
    'ActionBar',
    'ActionSelectionPopover',
    'check_autopilot_version',
    'CheckBox',
    'get_keyboard',
    'get_pointing_device',
    'Header',
    'Dialog',
    'listitems',
    'UCListItem',
    'MainView',
    'OptionSelector',
    'pickers',
    'popups',
    'QQuickFlickable',
    'QQuickGridView',
    'QQuickListView',
    'Sections',
    'TabBar',
    'Tabs',
    'TextArea',
    'TextField',
    'Toolbar',
    'ToolkitException',
    'LomiriListView11',
    'LomiriListView',
    'LomiriUIToolkitCustomProxyObjectBase',
]
