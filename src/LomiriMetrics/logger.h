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

#ifndef LOGGER_H
#define LOGGER_H

#include <QtCore/QFile>

#include <LomiriMetrics/lomirimetricsglobal.h>

class UMFileLoggerPrivate;
struct UMLTTNGPlugin;
struct UMEvent;

// Log events to a specific device.
class LOMIRI_METRICS_EXPORT UMLogger
{
public:
    virtual ~UMLogger() {}

    // Log events.
    virtual void log(const UMEvent& event) = 0;

    // Get whether the target device has been opened successfully or not.
    virtual bool isOpen() = 0;
};

// Log events to a file.
class LOMIRI_METRICS_EXPORT UMFileLogger : public UMLogger
{
public:
    UMFileLogger(const QString& filename, bool parsable = true);
    UMFileLogger(FILE* fileHandle, bool parsable = false);
    ~UMFileLogger();

    void log(const UMEvent& event) Q_DECL_OVERRIDE;
    bool isOpen() Q_DECL_OVERRIDE;

    void setParsable(bool parsable);
    bool parsable();

private:
    UMFileLoggerPrivate* const d_ptr;
    Q_DECLARE_PRIVATE(UMFileLogger)
};

#if defined(Q_OS_LINUX)

// Log events to LTTng.
class LOMIRI_METRICS_EXPORT UMLTTNGLogger : public UMLogger
{
public:
    UMLTTNGLogger();
    void log(const UMEvent& event) Q_DECL_OVERRIDE;
    bool isOpen() Q_DECL_OVERRIDE { return true; }

private:
    static UMLTTNGPlugin* m_plugin;
    static bool m_error;

    Q_DECL_UNUSED_MEMBER void* __reserved;
};

#endif  // defined(Q_OS_LINUX)

#endif  // LOGGER_H
