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
 */

#include "plugin.h"

#include <QtQml/QQmlEngine>
#include <LomiriToolkit/lomiritoolkitmodule.h>
#include <LomiriGestures/lomirigesturesmodule.h>

UbuntuComponentsPlugin::~UbuntuComponentsPlugin()
{
    UT_PREPEND_NAMESPACE(LomiriToolkitModule)::undefineModule();
    UG_PREPEND_NAMESPACE(LomiriGesturesModule)::undefineModule();
}

void UbuntuComponentsPlugin::registerTypes(const char *uri)
{
    Q_ASSERT(uri == QLatin1String("Ubuntu.Components"));
    Q_UNUSED(uri);

    UG_PREPEND_NAMESPACE(LomiriGesturesModule)::defineModule(uri);
    UT_PREPEND_NAMESPACE(LomiriToolkitModule)::defineModule(uri);
}

void UbuntuComponentsPlugin::initializeEngine(QQmlEngine *engine, const char *uri)
{
    // Give the base URL for Lomiri.Components. Normally it should be adjacent.
    // Only one ".." because the rightmost component is considered a file.
    // FIXME: may be incorrect for QRC case.
    QUrl lomiriBaseUrl = baseUrl().resolved(QUrl("../Lomiri/Components"));

    UT_PREPEND_NAMESPACE(LomiriToolkitModule)::initializeModule(engine, lomiriBaseUrl);
    QQmlExtensionPlugin::initializeEngine(engine, uri);
}
