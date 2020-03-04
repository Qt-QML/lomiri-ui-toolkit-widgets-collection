/*
 * Copyright 2016 Canonical Ltd.
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
 *
 * Author: Zsombor Egri <zsombor.egri@canonical.com>
 */

#include <QtQml/QtQml>
#include <QtQml/QQmlEngine>

#include "lomirigesturesmodule.h"
#include "ucswipearea_p.h"

UG_NAMESPACE_BEGIN

void LomiriGesturesModule::defineModule(const char *uri)
{
    qmlRegisterType<UCSwipeArea>(uri, 1, 3, "SwipeArea");
}

void LomiriGesturesModule::undefineModule()
{
    // nothing so far
}

UG_NAMESPACE_END
