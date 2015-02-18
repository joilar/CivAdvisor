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

#ifndef APPLICATION_H
#define APPLICATION_H

#include <QApplication>

namespace Civilization {
    class Application;
}

class Civilization::Application : public QApplication
{
    Q_OBJECT
    Q_PROPERTY(QList<QObject*> advances READ advances)

public:
    Application(int & argc, char ** argv);

    void initialize ();
    const QList<QObject*>& advances() const { return m_advances; }

signals:

public slots:

private:
    QList<QObject*> m_advances;

};

#endif // APPLICATION_H
