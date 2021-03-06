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
import QtTest 1.0
import Lomiri.Test 1.0
import Lomiri.Components 1.2

Item {
    width: 100
    height: 62

    TestCase {

        function test_API() {
            verify(!Lomiri.hasOwnProperty("toolkitVersion"), "toolkitVersion is part of 1.3 API!");
            verify(!Lomiri.hasOwnProperty("toolkitVersionMajor"), "toolkitVersionMajor is part of 1.3 API!");
            verify(!Lomiri.hasOwnProperty("toolkitVersionMinor"), "toolkitVersionMajor is part of 1.3 API!");
            verify(!Lomiri.hasOwnProperty("version"), "version() is part of 1.3 API!");
        }
    }
}
