/*
 * Copyright 2013 Canonical Ltd.
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
 * Authors: Lars Uebernickel <lars.uebernickel@canonical.com>
 */

#ifndef LOMIRITHEMEICONPROVIDER_P_H
#define LOMIRITHEMEICONPROVIDER_P_H

#include <QtQuick/QQuickImageProvider>

#include <LomiriToolkit/lomiritoolkitglobal.h>

UT_NAMESPACE_BEGIN

class LOMIRITOOLKIT_EXPORT LomiriThemeIconProvider: public QQuickImageProvider
{
public:
    LomiriThemeIconProvider(const QString &themeName = QString());
    QImage requestImage(const QString &id, QSize *size, const QSize &requestedSize) override;

private:
    QString m_themeName;
    QSharedPointer<class IconTheme> getTheme();
};

UT_NAMESPACE_END

#endif // LOMIRITHEMEICONPROVIDER_P_H
