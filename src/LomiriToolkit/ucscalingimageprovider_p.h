/*
 * Copyright 2012 Canonical Ltd.
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
 * Author: Florian Boucault <florian.boucault@canonical.com>
 */

#ifndef UCSCALINGIMAGEPROVIDER_P_H
#define UCSCALINGIMAGEPROVIDER_P_H

#include <QtGui/QImage>
#include <QtQuick/QQuickImageProvider>

#include <LomiriToolkit/lomiritoolkitglobal.h>

UT_NAMESPACE_BEGIN

class LOMIRITOOLKIT_EXPORT UCScalingImageProvider : public QQuickImageProvider
{
public:
    explicit UCScalingImageProvider();
    QImage requestImage(const QString &id, QSize *size, const QSize &requestedSize) override;
};

UT_NAMESPACE_END

#endif // UCSCALINGIMAGEPROVIDER_P_H
