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
 */

#ifndef QUICKUTILS_P_H
#define QUICKUTILS_P_H

#include <QtCore/QObject>
#include <QtCore/QPointer>
#include <QtQuick/QQuickView>

#include <LomiriToolkit/lomiritoolkitglobal.h>

class QQuickItem;
class QQmlEngine;
class QQmlComponent;
class QInputInfoManager;
class QInputDevice;

UT_NAMESPACE_BEGIN

class LOMIRITOOLKIT_EXPORT QuickUtils : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QQuickItem *rootObject READ rootObject NOTIFY rootObjectChanged)
    Q_PROPERTY(QString inputMethodProvider READ inputMethodProvider)
    Q_PROPERTY(bool touchScreenAvailable READ touchScreenAvailable NOTIFY touchScreenAvailableChanged)
    Q_PROPERTY(bool mouseAttached MEMBER m_mouseAttached WRITE setMouseAttached NOTIFY mouseAttachedChanged)
    Q_PROPERTY(bool keyboardAttached MEMBER m_keyboardAttached WRITE setKeyboardAttached NOTIFY keyboardAttachedChanged)
public:
    static QuickUtils *instance(QObject *parent = Q_NULLPTR)
    {
        if (!m_instance) {
            if (!parent) {
                qFatal("Creating QuickUtils singleton requires a parent object!");
            }
            m_instance = new QuickUtils(parent);
        }
        return m_instance;
    }
    ~QuickUtils() { m_instance = Q_NULLPTR; }

    QQuickItem *rootObject();
    Q_INVOKABLE QQuickItem *rootItem(QObject *object);
    QString inputMethodProvider() const;
    bool touchScreenAvailable() const;

    Q_INVOKABLE static QString className(QObject *item);
    Q_REVISION(1) Q_INVOKABLE static bool inherits(QObject *object, const QString &fromClass);
    QObject* createQmlObject(const QUrl &url, QQmlEngine *engine);
    static bool showDeprecationWarnings();
    static bool descendantItemOf(QQuickItem *item, const QQuickItem *parent);
    Q_INVOKABLE static QQuickItem *firstFocusableChild(QQuickItem *item);
    Q_INVOKABLE static QQuickItem *lastFocusableChild(QQuickItem *item);

    bool mouseAttached()
    {
        return m_mouseAttached;
    }
    bool keyboardAttached()
    {
        return m_keyboardAttached;
    }

Q_SIGNALS:
    void rootObjectChanged();
    void activated();
    void deactivated();
    void touchScreenAvailableChanged();
    void mouseAttachedChanged();
    void keyboardAttachedChanged();

protected:
    bool eventFilter(QObject *, QEvent *) override;

private:
    explicit QuickUtils(QObject *parent = 0);
    QPointer<QQuickWindow> m_rootWindow;
    QPointer<QQuickView> m_rootView;
    QInputInfoManager *m_inputInfo;
    QStringList m_omitIM;
    QSet<QString> m_mice;
    QSet<QString> m_keyboards;
    bool m_mouseAttached:1;
    bool m_keyboardAttached:1;
    bool m_explicitMouseAttached:1;
    bool m_explicitKeyboardAttached:1;

    static QuickUtils *m_instance;

    void lookupQuickView();
    void registerDevice(QInputDevice *device, const QString &deviceId);
    void setMouseAttached(bool set);
    void setKeyboardAttached(bool set);
private Q_SLOTS:
    void onInputInfoReady();
    void onDeviceAdded(QInputDevice *device);
    void onDeviceRemoved(const QString deviceId);
};

#define UC_QML_DEPRECATION_WARNING(msg) \
    { \
        static bool loggedOnce = false; \
        if (!loggedOnce) { \
            if (QuickUtils::showDeprecationWarnings()) { \
                qmlWarning(this) << msg; \
            } \
        } \
    }

UT_NAMESPACE_END

#endif // QUICKUTILS_P_H
