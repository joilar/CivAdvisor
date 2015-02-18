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

#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "application.h"

int main(int argc, char *argv[])
{
    Civilization::Application app(argc, argv);
    app.initialize();

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("advanceListModel", QVariant::fromValue(app.advances()));
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
