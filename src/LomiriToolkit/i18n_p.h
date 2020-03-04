/*
 * Copyright 2012-2015 Canonical Ltd.
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
 * Author: Tim Peeters <tim.peeters@canonical.com>
 */

#ifndef I18N_P_H
#define I18N_P_H

#include <QtCore/QObject>

#include <LomiriToolkit/lomiritoolkitglobal.h>

class QQmlContext;
class QQmlEngine;

UT_NAMESPACE_BEGIN

class LOMIRITOOLKIT_EXPORT LomiriI18n : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString domain READ domain WRITE setDomain NOTIFY domainChanged)
    Q_PROPERTY(QString language READ language WRITE setLanguage NOTIFY languageChanged)

private:
    Q_DISABLE_COPY(LomiriI18n)
    explicit LomiriI18n(QObject* parent = 0);
    ~LomiriI18n();

public:
    static LomiriI18n *instance(QObject *parent = Q_NULLPTR) {
        if (!m_i18) {
            if (!parent) {
                qFatal("Creating i18n singleton requires a parent object!");
            }
            m_i18 = new LomiriI18n(parent);
        }
        return m_i18;
    }

    Q_INVOKABLE void bindtextdomain(const QString& domain_name, const QString& dir_name);
    Q_INVOKABLE QString tr(const QString& text);
    Q_INVOKABLE QString tr(const QString& singular, const QString& plural, int n);
    Q_INVOKABLE QString dtr(const QString& domain, const QString& text);
    Q_INVOKABLE QString dtr(const QString& domain, const QString& singular, const QString& plural, int n);
    Q_INVOKABLE QString ctr(const QString& context, const QString& text);
    Q_INVOKABLE QString dctr(const QString& domain, const QString& context, const QString& text);
    Q_INVOKABLE QString tag(const QString& text);
    Q_INVOKABLE QString tag(const QString& context, const QString& text);
    Q_INVOKABLE QString relativeDateTime(const QDateTime& datetime);

    // getter
    QString domain() const;
    QString language() const;

    // setter
    void setDomain(const QString& domain);
    void setLanguage(const QString& lang);

Q_SIGNALS:
    void domainChanged();
    void languageChanged();

private:
    static LomiriI18n *m_i18;
    QString m_domain;
    QString m_language;
};

UT_NAMESPACE_END

#endif // I18N_P_H
