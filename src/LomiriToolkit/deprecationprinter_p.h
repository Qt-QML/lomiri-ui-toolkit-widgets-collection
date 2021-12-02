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

#ifndef DEPRECATIONPRINTER_P_H
#define DEPRECATIONPRINTER_P_H

#include <QtCore/QObject>

#include <LomiriToolkit/lomiritoolkitglobal.h>

UT_NAMESPACE_BEGIN

class LOMIRITOOLKIT_EXPORT DeprecationPrinter : public QObject {
    Q_OBJECT
public:
    enum Deprecations {
        COMPONENTS,
        LAYOUTS,
        METRICS,
        PERFORMANCEMETRICS,
        COUNT,
    };
    Q_ENUM(Deprecations);

    static DeprecationPrinter * instance();

public Q_SLOTS:
    void printDeprecation(Deprecations d);

private:
    bool m_printed[COUNT] = { false, false, false, false };
};

UT_NAMESPACE_END

#endif // DEPRECATIONPRINTER_P_H
