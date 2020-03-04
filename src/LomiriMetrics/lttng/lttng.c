// Copyright © 2016 Canonical Ltd.
// Authors: Loïc Molinari <loic.molinari@canonical.com>
//          Albert Astals Cid <albert.astals@canonical.com>
//
// This file is part of Lomiri UI Toolkit.
//
// Lomiri UI Toolkit is free software: you can redistribute it and/or modify it
// under the terms of the GNU Lesser General Public License as published by the
// Free Software Foundation; version 3.
//
// Lomiri UI Toolkit is distributed in the hope that it will be useful, but
// WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
// FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License
// for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with Lomiri UI Toolkit. If not, see <http://www.gnu.org/licenses/>.

#include "tracepoints_p.h"

static void logProcessEvent(UMLTTNGProcessEvent* event)
{
    tracepoint(LomiriMetrics, process, event);
}

static void logFrameEvent(UMLTTNGFrameEvent* event)
{
    tracepoint(LomiriMetrics, frame, event);
}

static void logWindowEvent(UMLTTNGWindowEvent* event)
{
    tracepoint(LomiriMetrics, window, event);
}

static void logGenericEvent(UMLTTNGGenericEvent* event)
{
    tracepoint(LomiriMetrics, generic, event);
}

const struct UMLTTNGPlugin umLttngPlugin = {
    &logProcessEvent,
    &logFrameEvent,
    &logWindowEvent,
    &logGenericEvent,
};
