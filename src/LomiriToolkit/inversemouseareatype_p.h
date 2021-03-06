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

#ifndef INVERSEMOUSEAREATYPE_P_H
#define INVERSEMOUSEAREATYPE_P_H

#include <QtCore/QPointer>
#include <QtQuick/private/qquickmousearea_p.h>

#include <LomiriToolkit/lomiritoolkitglobal.h>

class QQuickItem;

UT_NAMESPACE_BEGIN

class LOMIRITOOLKIT_EXPORT InverseMouseAreaType : public QQuickMouseArea
{
    Q_OBJECT
    Q_PROPERTY(QQuickItem *sensingArea READ sensingArea WRITE setSensingArea NOTIFY sensingAreaChanged)
    Q_PROPERTY(bool topmostItem READ topmostItem WRITE setTopmostItem NOTIFY topmostItemChanged)
public:
    explicit InverseMouseAreaType(QQuickItem *parent = 0);
    ~InverseMouseAreaType();

    Q_INVOKABLE bool contains(const QPointF &point) const override;

protected:
    void itemChange(ItemChange, const ItemChangeData &) override;
    void componentComplete() override;
    bool eventFilter(QObject *, QEvent *) override;

    // override mouse events
    void mousePressEvent(QMouseEvent *event) override;
    void mouseDoubleClickEvent(QMouseEvent *event) override;


private: // getter/setter
    QQuickItem *sensingArea() const;
    void setSensingArea(QQuickItem *sensing);
    bool topmostItem() const;
    void setTopmostItem(bool value);
    QEvent * mapEventToArea(QObject *target, QEvent *event, QPoint &point);

Q_SIGNALS:
    void sensingAreaChanged();
    void topmostItemChanged();

private Q_SLOTS:
    void update();
    void resetFilterOnWindowUpdate(QQuickWindow *win);
    
private:
    bool m_ready:1;
    bool m_topmostItem:1;
    bool m_filteredEvent:1;
    QPointer<QObject> m_filterHost;
    QPointer<QQuickItem> m_sensingArea;
    int m_touchId;

    void updateEventFilter(bool enable);
};

UT_NAMESPACE_END

#endif // INVERSEMOUSEAREATYPE_P_H
