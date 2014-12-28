/* Copyright (C) 2014  John Oilar
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QTextStream>
#include <QtSql>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QTextStream out(stdout);
    out << "Hello world!" << endl;

    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("basic.sqlite");
    bool ok = db.open();

    out << "What is the database name? " << db.databaseName() << endl;
    out << "Did I connect to " << db.databaseName() << "? " << ok << endl;
    out << "Is the connection valid? " << db.isValid() << endl;
    out << "Is the connection open? " << db.isOpen() << endl;
    out << "What is the driver name? " << db.driverName() << endl;
    out << "What is the host name? " << db.hostName() << endl;
    out << "What is the connection name? " << db.connectionName() << endl;
    out << "What are the connection options? " << db.connectOptions() << endl;

    bool hasQuerySize = db.driver()->hasFeature(QSqlDriver::QuerySize);
    out << "Does sqlite support querying the result set size? " << hasQuerySize << endl;

    out << "Tables:";
    QStringList tables = db.tables();
    foreach (QString table, tables) {
        out << " " << table;
    }
    out << endl;

    QSqlQuery query;
    query.setForwardOnly(true);
    query.exec("SELECT * from cards");

    if (hasQuerySize) {
        out << "Querying cards (" << query.size() << " results):" << endl;
    } else {
        out << "Querying cards:" << endl;
    }

    QStringList cards;

    int count = 0;
    while(query.next()) {
        count++;
        QString card = query.value(1).toString();
        cards << card;
        out << card << endl;
    }

    out << count << " results." << endl;

    db.close();

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("cardListModel", QVariant::fromValue(cards));
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
