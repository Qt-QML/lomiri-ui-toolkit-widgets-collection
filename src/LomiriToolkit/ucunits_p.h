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

#ifndef UCUNITS_P_H
#define UCUNITS_P_H

#include <QtCore/QHash>
#include <QtCore/QObject>
#include <QtCore/QString>
#include <QtCore/QUrl>
#include <QtGui/QWindow>

#include <LomiriToolkit/lomiritoolkitglobal.h>

class QPlatformWindow;

UT_NAMESPACE_BEGIN

class LOMIRITOOLKIT_EXPORT UCUnits : public QObject
{
    Q_OBJECT
    Q_PROPERTY(float gridUnit READ gridUnit WRITE setGridUnit NOTIFY gridUnitChanged)

public:
    static UCUnits *instance(QObject *parent = Q_NULLPTR) {
        if (!m_units) {
            // we must have a parent!
            if (!parent) {
                qFatal("Creating units singleton requires a parent object!");
            }
            m_units = new UCUnits(parent);
        }
        return m_units;
    }

    explicit UCUnits(QObject *parent = 0);
    explicit UCUnits(QWindow *parent);
    ~UCUnits();
    Q_INVOKABLE float dp(float value);
    Q_INVOKABLE float gu(float value);
    QString resolveResource(const QUrl& url);

    // getters
    float gridUnit();

    // setters
    void setGridUnit(float gridUnit);

Q_SIGNALS:
    void gridUnitChanged();

protected:
    QString suffixForGridUnit(float gridUnit);
    float gridUnitSuffixFromFileName(const QString &fileName);

private Q_SLOTS:
    void windowPropertyChanged(QPlatformWindow *window, const QString &propertyName);
    void screenChanged(QScreen *screen);
    void devicePixelRatioChanged(qreal dpi);

private:
    static UCUnits *m_units;
    float m_devicePixelRatio;
    QScreen *m_screen;
    float m_gridUnit;
};

UT_NAMESPACE_END

#endif // UCUNITS_P_H
