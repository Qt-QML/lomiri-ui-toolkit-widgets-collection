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

#ifndef UCTHEMINGEXTENSION_P_H
#define UCTHEMINGEXTENSION_P_H

#include <QtCore/QEvent>
#include <QtCore/QObject>
#include <QtCore/QPointer>
#include <QtQml/QtQml>
#include <QtQuick/private/qquickitem_p.h>

#include <LomiriToolkit/lomiritoolkitglobal.h>

class QQuickItem;

UT_NAMESPACE_BEGIN

class UCTheme;
class LOMIRITOOLKIT_EXPORT UCThemingExtension
{
public:
    enum ThemeType {
        Inherited,
        Custom
    };

    explicit UCThemingExtension(QQuickItem *extendedItem);
    virtual ~UCThemingExtension();

    virtual void preThemeChanged() = 0;
    virtual void postThemeChanged() = 0;
    virtual void itemThemeChanged(UCTheme *, UCTheme*);
    virtual void itemThemeReloaded(UCTheme *);

    UCTheme *getTheme();
    void setTheme(UCTheme *newTheme, ThemeType type = Custom);
    void resetTheme();

    static bool isThemed(QQuickItem *item);
    static QQuickItem *ascendantThemed(QQuickItem *item);

private:
    QPointer<UCTheme> theme;
    QQuickItem *themedItem;
    ThemeType themeType;

    void setParentTheme();
};

UT_NAMESPACE_END

#define UCThemingExtension_iid "org.qt-project.Qt.UCThemingExtension"
Q_DECLARE_INTERFACE(UT_PREPEND_NAMESPACE(UCThemingExtension), UCThemingExtension_iid)

#endif // UCTHEMINGEXTENSION_P_H
