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
import Lomiri.Test 1.3
import Lomiri.Components 1.3

Item {
    width: 100
    height: 62

    TestCase {

        function test_API() {
            verify(Lomiri.hasOwnProperty("toolkitVersion"), "toolkitVersion is part of 1.3 API!");
            verify(Lomiri.hasOwnProperty("toolkitVersionMajor"), "toolkitVersionMajor is part of 1.3 API!");
            verify(Lomiri.hasOwnProperty("toolkitVersionMinor"), "toolkitVersionMajor is part of 1.3 API!");
            verify(Lomiri.hasOwnProperty("version"), "version() is part of 1.3 API!");
        }

        function test_toolkitversionMajor()
        {
            compare(Lomiri.toolkitVersionMajor, 1, "Wrong major version!");
        }

        function test_toolkitversionMinor()
        {
            compare(Lomiri.toolkitVersionMinor, 3, "Wrong minor version!");
        }

        function test_toolkitversion()
        {
            compare(Lomiri.toolkitVersion, 1 * 256 + 3, "Wrong composed version!");
        }

        function test_version()
        {
            compare(Lomiri.version(1, 0), 1 * 256 + 0, "Wrong composit version for 1.0!");
            compare(Lomiri.version(1, 1), 1 * 256 + 1, "Wrong composit version for 1.1!");
            compare(Lomiri.version(1, 2), 1 * 256 + 2, "Wrong composit version for 1.2!");
            compare(Lomiri.version(1, 3), 1 * 256 + 3, "Wrong composit version for 1.3!");
            compare(Lomiri.version(2, 0), 2 * 256 + 0, "Wrong composit version for 2.0!");
            compare(Lomiri.version(2, 2), 2 * 256 + 2, "Wrong composit version for 2.2!");
        }
    }
}
