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

#include "ucnamespace.h"

LomiriComponentsPlugin::~LomiriComponentsPlugin()
{
    UT_PREPEND_NAMESPACE(LomiriToolkitModule)::undefineModule();
    UG_PREPEND_NAMESPACE(LomiriGesturesModule)::undefineModule();
}

void LomiriComponentsPlugin::registerTypes(const char *uri)
{
    Q_ASSERT(uri == QLatin1String("Lomiri.Components"));
    Q_UNUSED(uri);

    qmlRegisterSimpleSingletonType<UT_PREPEND_NAMESPACE(UCNamespace)>(uri, 1, 2, "Lomiri");
    qmlRegisterSimpleSingletonType<UT_PREPEND_NAMESPACE(UCNamespaceV13)>(uri, 1, 3, "Lomiri");

    UG_PREPEND_NAMESPACE(LomiriGesturesModule)::defineModule(uri);
    UT_PREPEND_NAMESPACE(LomiriToolkitModule)::defineModule(uri);
}

void LomiriComponentsPlugin::initializeEngine(QQmlEngine *engine, const char *uri)
{
    UT_PREPEND_NAMESPACE(LomiriToolkitModule)::initializeModule(engine, baseUrl());
    QQmlExtensionPlugin::initializeEngine(engine, uri);
}
