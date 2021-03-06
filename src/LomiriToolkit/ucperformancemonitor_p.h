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
 * Author: Florian Boucault <florian.boucault@canonical.com>
 */

#ifndef UCPERFORMANCEMONITOR_P_H
#define UCPERFORMANCEMONITOR_P_H

#include <QtCore/QElapsedTimer>
#include <QtCore/QLoggingCategory>
#include <QtCore/QObject>
#include <QtCore/QSharedPointer>
#include <QtQuick/QQuickWindow>

#include <LomiriToolkit/lomiritoolkitglobal.h>

UT_NAMESPACE_BEGIN

class LOMIRITOOLKIT_EXPORT UCPerformanceMonitor : public QObject
{
    Q_OBJECT

public:
    explicit UCPerformanceMonitor(QObject* parent = 0);
    ~UCPerformanceMonitor();

private Q_SLOTS:
    void onApplicationStateChanged(Qt::ApplicationState state);
    void connectToWindow(QQuickWindow* window);
    void startTimer();
    void stopTimer();
    void windowDestroyed();

private:
    QQuickWindow* findQQuickWindow();

private:
    int m_framesAboveThreshold;
    int m_warningCount;
    QElapsedTimer m_timer;
    QQuickWindow* m_window;
};

UT_NAMESPACE_END

Q_DECLARE_LOGGING_CATEGORY(ucPerformance)

#endif // UCPERFORMANCEMONITOR_P_H
