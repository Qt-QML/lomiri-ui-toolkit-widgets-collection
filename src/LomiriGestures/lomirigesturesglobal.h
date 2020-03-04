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

#ifndef LOMIRIGESTURESGLOBAL_H
#define LOMIRIGESTURESGLOBAL_H

#include <QtCore/QtGlobal>

#if defined(QT_BUILD_LOMIRIGESTURES_LIB)
#  define LOMIRIGESTURES_EXPORT Q_DECL_EXPORT
#else
#  define LOMIRIGESTURES_EXPORT Q_DECL_IMPORT
#endif

#if !defined(LOMIRIGESTURES_NO_NAMESPACE)

#define UG_NAMESPACE_BEGIN          namespace LomiriGestures {
#define UG_NAMESPACE_END            }
#define UG_PREPEND_NAMESPACE(name)  LomiriGestures::name
#define UG_USE_NAMESPACE            using namespace LomiriGestures;
#define UG_FORWARD_DECLARE_CLASS(name) \
    UG_NAMESPACE_BEGIN class name; UG_NAMESPACE_END \
    using UG_PREPEND_NAMESPACE(name);
#define UG_FORWARD_DECLARE_STRUCT(name) \
    UG_NAMESPACE_BEGIN struct name; UG_NAMESPACE_END \
    using UG_PREPEND_NAMESPACE(name);

#else // no namespace

#define UG_NAMESPACE_BEGIN
#define UG_NAMESPACE_END
#define UG_PREPEND_NAMESPACE(name)  name
#define UG_USE_NAMESPACE
#define UG_FORWARD_DECLARE_CLASS(name) class name;
#define UG_FORWARD_DECLARE_STRUCT(name) struct name;

#endif

#endif // LOMIRIGESTURESGLOBAL_H
