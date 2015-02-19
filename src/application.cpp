/* Copyright (C) 2015  John Oilar
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

#include <QTextStream>
#include <QtSql>

#include "application.h"
#include "civ/advance.h"
#include "civ/group.h"

using namespace Civilization;

Application::Application(int &argc, char **argv) :
    QApplication(argc, argv),
    m_advances()
{
}

void Application::initialize () {
    QTextStream out(stdout);
    out << "Hello world!" << endl;

    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("basic.sqlite");
    db.open();

    dumpDatabaseInfo(db);

    loadTable(db, "Advances", [this] {
        m_advances.append(new Advance(this));
        return m_advances.last();
    });

    loadTable(db, "Groups", [this] {
        m_groups.append(new Group(this));
        return m_groups.last();
    });

    db.close();
}

void Application::dumpDatabaseInfo (const QSqlDatabase& db) {
    QTextStream out(stdout);

    out << "What is the database name? " << db.databaseName() << endl;
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
}

void Application::loadTable (
    const QSqlDatabase& db,
    const QString& tableName,
    std::function<QObject*()> nextObject
) {
    QTextStream out(stdout);

    out << "Loading objects from table: " << tableName << endl;

    QSqlQuery query(db);
    query.setForwardOnly(true);
    query.exec("SELECT * from " + tableName);

    QStringList columns;

    QSqlRecord record = query.record();
    out << "Number of columns: " << record.count() << endl;
    for (int i = 0; i < record.count(); i++) {
        out << "column " << i << ": " << record.fieldName(i) << endl;
        columns.append(record.fieldName(i));
    }

    while(query.next()) {
        QObject* object = nextObject();

        for (int i = 0; i < columns.size(); i++) {
            out << " " << columns[i] << ": " << query.value(i).toString();
            QVariant v(query.value(i).toString());
            object->setProperty(columns[i].toLatin1().data(), v);
        }

        out << endl;
    }
}
