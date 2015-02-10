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

#ifndef ADVANCE_H
#define ADVANCE_H

#include "object.h"

namespace Civilization {
    class Advance;
}

class Civilization::Advance : public Civilization::Object
{
    Q_OBJECT
    Q_PROPERTY(QString name MEMBER m_name NOTIFY nameChanged)
    Q_PROPERTY(QString text MEMBER m_text NOTIFY textChanged)
    Q_PROPERTY(int id MEMBER m_id NOTIFY idChanged)
    Q_PROPERTY(int value MEMBER m_value NOTIFY valueChanged)

public:
    explicit Advance(QObject *parent = 0);

signals:
    void nameChanged();
    void textChanged();
    void idChanged();
    void valueChanged();

public slots:

private:
    QString m_name;
    QString m_text;
    int m_id;
    int m_value;

};

#endif // ADVANCE_H
