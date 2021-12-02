/*
 * Copyright 2021 UBports Foundation.
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

#include "deprecationprinter_p.h"

#include <QtCore/QDebug>
#include <QtCore/QLoggingCategory>
#include <QtQml/QQmlEngine>

UT_NAMESPACE_BEGIN

namespace {
    Q_LOGGING_CATEGORY(lcDeprecation, "lomiri.components.deprecation", QtMsgType::QtWarningMsg);

    const char * names[] = {
        "Components",
        "Layouts",
        "Metrics",
        "PerformanceMetrics",
    };
};

/* 
 * Internal class managing Ubuntu.* deprecation warnings, to be shared between
 * C++ and QML modules.
 *
 * Why tracking printed warning, you asked? In C++ compat modules we can trigger
 * this once at registerTypes(), but for pure QML compat modules we don't have
 * that opportunity, so we trigger it every time our compat type is created.
 * Hence, the tracker. And so why not share it with C++ counterpart?
 *
 * Logging category is used so that apps that know it can't migrate (e.g. it
 * needs to be compatible with older systems) can disable the warnings.
 */

DeprecationPrinter * DeprecationPrinter::instance()
{
    static DeprecationPrinter printer;
    return &printer;
}

void DeprecationPrinter::printDeprecation(DeprecationPrinter::Deprecations d)
{
    if (m_printed[d])
        return;

    qCWarning(lcDeprecation).noquote().nospace()
        << "Ubuntu." << names[d] << " is deprecated and is provided for compatibility. "
           "Please use Lomiri." << names[d] << " when possible.";

    m_printed[d] = true;
}

UT_NAMESPACE_END
