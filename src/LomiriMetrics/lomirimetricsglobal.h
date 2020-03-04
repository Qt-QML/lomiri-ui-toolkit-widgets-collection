// Copyright © 2016 Canonical Ltd.
// Author: Loïc Molinari <loic.molinari@canonical.com>
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

#ifndef LOMIRIMETRICSGLOBAL_H
#define LOMIRIMETRICSGLOBAL_H

#include <QtCore/QtGlobal>

#if defined(QT_BUILD_LOMIRIMETRICS_LIB)
#define LOMIRI_METRICS_EXPORT Q_DECL_EXPORT
#else
#define LOMIRI_METRICS_EXPORT Q_DECL_IMPORT
#endif

#endif  // LOMIRIMETRICSGLOBAL_H
