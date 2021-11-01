/*
 * Copyright 2014 Canonical Ltd.
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

#include <QtCore/QDebug>
#include <QtCore/QFile>
#include <QtCore/QRegularExpression>
#include <QtCore/QString>
#include <QtTest/QSignalSpy>
#include <QtTest/QTest>
#include <LomiriToolkit/private/ucserviceproperties_p_p.h>

#include "qstringliteral.h"
#include "uctestcase.h"

UT_USE_NAMESPACE

class tst_ServiceProperties : public QObject
{
    Q_OBJECT

public:
    tst_ServiceProperties() {}

private:

    QString error;

    // FIXME use LomiriTestCase::ignoreWaring in Vivid
    void ignoreWarning(const QString& fileName, uint line, uint column, const QString& message, uint occurences=1)
    {
        for (uint i = 0; i < occurences; i++) {
            QString url(QUrl::fromLocalFile(QFileInfo(fileName).absoluteFilePath()).toEncoded());
            QString warning(QString("%1:%2:%3: %4").arg(url).arg(line).arg(column).arg(message));
            QTest::ignoreMessage(QtWarningMsg, warning.toUtf8());
        }
    }


private Q_SLOTS:

    void initTestCase()
    {
        // The test uses this schema, which might not be available on non-Ubuntu
        // distros even though the AccountsService is available.
        if (!QFile::exists(
                    QStringLiteral("/usr/share/accountsservice/interfaces/com.lomiri.touch.AccountsService.Sound.xml"))) {
            error = QStringLiteral("Skip test: required schema not installed.");
            return;
        }

        // check if the connection is possible, otherwise we must skip all tests
        QScopedPointer<LomiriTestCase> test(new LomiriTestCase("IncomingCallVibrateWatcher.qml"));
        UCServiceProperties *watcher = static_cast<UCServiceProperties*>(test->rootObject()->property("service").value<QObject*>());
        QVERIFY(watcher);
        if (watcher->status() == UCServiceProperties::Synchronizing ||
            watcher->status() == UCServiceProperties::Inactive) {
            QSignalSpy wait(watcher, SIGNAL(statusChanged()));
            wait.wait();
        }
        if (watcher->status() == UCServiceProperties::ConnectionError) {
            error = "Skip test: " + watcher->error();
        }
    }

    void cleanup()
    {
        // restore env var setting
        qputenv("SHOW_SERVICEPROPERTIES_WARNINGS", QByteArray());
    }

    void test_change_property()
    {
        if (!error.isEmpty()) {
            QSKIP(qPrintable(error));
        }
        QScopedPointer<LomiriTestCase> test(new LomiriTestCase("IncomingCallVibrateWatcher.qml"));
        UCServiceProperties *watcher = static_cast<UCServiceProperties*>(test->rootObject()->property("service").value<QObject*>());
        QVERIFY(watcher);

        bool backup = watcher->property("incomingCallVibrate").toBool();
        UCServicePropertiesPrivate *pWatcher = UCServicePropertiesPrivate::get(watcher);
        QSignalSpy spy(watcher, SIGNAL(incomingCallVibrateChanged()));
        pWatcher->testProperty("IncomingCallVibrate", !backup);
        spy.wait(400);
        QCOMPARE(spy.count(), 1);
        QCOMPARE(watcher->property("incomingCallVibrate").toBool(), !backup);

        // restore value
        spy.clear();
        pWatcher->testProperty("IncomingCallVibrate", backup);
        spy.wait(400);
    }

    void test_environment_variable_data()
    {
        QTest::addColumn<QByteArray>("value");
        QTest::addColumn<bool>("warning");

        QTest::newRow("empty string, no warning") << QByteArray() << false;
        QTest::newRow("0 integer, no warning") << QByteArray("0") << false;
        QTest::newRow("boolean false, no warning") << QByteArray("false") << false;
        QTest::newRow("boolean FALSE, no warning") << QByteArray("false") << false;
        QTest::newRow("1 integer, warning") << QByteArray("1") << true;
        QTest::newRow("boolean true, warning") << QByteArray("true") << true;
        QTest::newRow("boolean TRUE, warning") << QByteArray("true") << true;
        QTest::newRow("positive integer, no warning") << QByteArray("5") << false;
        QTest::newRow("invalid integral value, no warning") << QByteArray("whatever") << false;
    }

    void test_environment_variable()
    {
        if (!error.isEmpty()) {
            QSKIP(qPrintable(error));
        }
        QFETCH(QByteArray, value);
        QFETCH(bool, warning);
        qputenv("SHOW_SERVICEPROPERTIES_WARNINGS", value);
        if (warning) {
            // \u201C is a "Left Double Quotation Mark", and \u201D is "Right Double Quotation Mark"
            QRegularExpression warningRe(QStringLiteral(u" QML ServiceProperties: No such property ['\u201C]ThisIsAnInvalidPropertyToWatch['\u201D]$"));
            QTest::ignoreMessage(QtWarningMsg, warningRe);

        }
        QScopedPointer<LomiriTestCase> test(new LomiriTestCase("InvalidPropertyWatcher.qml"));
        UCServiceProperties *watcher = static_cast<UCServiceProperties*>(test->rootObject()->property("service").value<QObject*>());
        QVERIFY(watcher);
        // error should contain the warning
        // \u201C is a "Left Double Quotation Mark", and \u201D is "Right Double Quotation Mark"
        // And sometimes they appear as '?' for some reason. However, that's beside the point of the test.
        QRegularExpression errorRe(QStringLiteral(u"^No such property ['\u201C?]ThisIsAnInvalidPropertyToWatch['\u201D?]$"));
        QTRY_VERIFY2(errorRe.match(watcher->property("error").toString()).hasMatch(),
            qPrintable(QStringLiteral("The content of the \"error\" property is \"%1\"")
                .arg(watcher->property("error").toString())));
    }

    void test_invalid_property_data()
    {
        QTest::addColumn<bool>("warning");

        QTest::newRow("Without warning") << false;
        QTest::newRow("With warning") << true;
    }
    void test_invalid_property()
    {
        if (!error.isEmpty()) {
            QSKIP(qPrintable(error));
        }
        QFETCH(bool, warning);
        qputenv("SHOW_SERVICEPROPERTIES_WARNINGS", warning ? "1" : "0");
        if (warning) {
            // \u201C is a "Left Double Quotation Mark", and \u201D is "Right Double Quotation Mark"
            QRegularExpression warningRe(QStringLiteral(u" QML ServiceProperties: No such property ['\u201C]ThisIsAnInvalidPropertyToWatch['\u201D]$"));
            QTest::ignoreMessage(QtWarningMsg, warningRe);
        }
        QScopedPointer<LomiriTestCase> test(new LomiriTestCase("InvalidPropertyWatcher.qml"));
        UCServiceProperties *watcher = static_cast<UCServiceProperties*>(test->rootObject()->property("service").value<QObject*>());
        QVERIFY(watcher);
        // error should contain the warning
        // \u201C is a "Left Double Quotation Mark", and \u201D is "Right Double Quotation Mark"
        // And sometimes they appear as '?' for some reason. However, that's beside the point of the test.
        QRegularExpression errorRe(QStringLiteral(u"^No such property ['\u201C?]ThisIsAnInvalidPropertyToWatch['\u201D?]$"));
        QTRY_VERIFY2(errorRe.match(watcher->property("error").toString()).hasMatch(),
            qPrintable(QStringLiteral("The content of the \"error\" property is \"%1\"")
                .arg(watcher->property("error").toString())));
    }

    void test_one_valid_one_invalid_property_data()
    {
        QTest::addColumn<bool>("warning");

        QTest::newRow("Without warning") << false;
        QTest::newRow("With warning") << true;
    }
    void test_one_valid_one_invalid_property()
    {
        if (!error.isEmpty()) {
            QSKIP(qPrintable(error));
        }
        QFETCH(bool, warning);
        qputenv("SHOW_SERVICEPROPERTIES_WARNINGS", warning ? "1" : "0");
        if (warning) {
            // \u201C is a "Left Double Quotation Mark", and \u201D is "Right Double Quotation Mark"
            QRegularExpression warningRe(QStringLiteral(u" QML ServiceProperties: No such property ['\u201C]ThisIsAnInvalidPropertyToWatch['\u201D]$"));
            QTest::ignoreMessage(QtWarningMsg, warningRe);

        }
        QScopedPointer<LomiriTestCase> test(new LomiriTestCase("InvalidPropertyWatcher2.qml"));
        UCServiceProperties *watcher = static_cast<UCServiceProperties*>(test->rootObject()->property("service").value<QObject*>());
        QVERIFY(watcher);
        // error should contain the wearning
        // \u201C is a "Left Double Quotation Mark", and \u201D is "Right Double Quotation Mark"
        // And sometimes they appear as '?' for some reason. However, that's beside the point of the test.
        QRegularExpression errorRe(QStringLiteral(u"^No such property ['\u201C?]ThisIsAnInvalidPropertyToWatch['\u201D?]$"));
        QTRY_VERIFY2(errorRe.match(watcher->property("error").toString()).hasMatch(),
            qPrintable(QStringLiteral("The content of \"error\" property is \"%1\"")
                .arg(watcher->property("error").toString())));
    }

    void test_change_connection_props_data()
    {
        QTest::addColumn<QString>("property");
        QTest::addColumn<QString>("value");
        QTest::addColumn<bool>("warning");

        QTest::newRow("Changing servcie, no warning") << "service" << "anything.else" << false;
        QTest::newRow("Changing servcie, with warning") << "service" << "anything.else" << true;
        QTest::newRow("Changing interface, no warning") << "serviceInterface" << "anything.else" << false;
        QTest::newRow("Changing interface, with warning") << "serviceInterface" << "anything.else" << true;
        QTest::newRow("Changing adaptor, no warning") << "adaptorInterface" << "anything.else" << false;
        QTest::newRow("Changing adaptor, with warning") << "adaptorInterface" << "anything.else" << true;
    }
    void test_change_connection_props()
    {
        QFETCH(QString, property);
        QFETCH(QString, value);

        if (!error.isEmpty()) {
            QSKIP(qPrintable(error));
        }
        QFETCH(bool, warning);
        qputenv("SHOW_SERVICEPROPERTIES_WARNINGS", warning ? "1" : "0");
        if (warning) {
            ignoreWarning("IncomingCallVibrateWatcher.qml", 22, 5, "QML ServiceProperties: Changing connection parameters forbidden.");
        }
        QScopedPointer<LomiriTestCase> test(new LomiriTestCase("IncomingCallVibrateWatcher.qml"));
        UCServiceProperties *watcher = static_cast<UCServiceProperties*>(test->rootObject()->property("service").value<QObject*>());
        QVERIFY(watcher);

        // try to change the property
        watcher->setProperty(property.toLocal8Bit().constData(), value);
        // error shoudl also have the warning
        QCOMPARE(watcher->property("error").toString(), QString("Changing connection parameters forbidden."));
    }

};

QTEST_MAIN(tst_ServiceProperties)

#include "tst_serviceproperties.moc"
