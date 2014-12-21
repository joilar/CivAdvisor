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

PRAGMA foreign_keys = OFF;

DROP TABLE IF EXISTS "Cards";
DROP TABLE IF EXISTS "Groups";
DROP TABLE IF EXISTS "CardGroups";

PRAGMA foreign_keys = ON;

CREATE TABLE "Cards" ("id" INTEGER PRIMARY KEY  NOT NULL , "name" VARCHAR, "value" INTEGER, "text" VARCHAR);
CREATE TABLE "Groups" ("id" INTEGER PRIMARY KEY  NOT NULL , "name" VARCHAR, "credit" INTEGER);
CREATE TABLE "CardGroups" ("cardId" REFERENCES Cards, "groupId" REFERENCES Groups);

INSERT INTO "Cards" ("name", "value", "text") VALUES ('Pottery',45,'During FAMINE, reduce loss by 4 unit points per GRAIN trade card held.');
INSERT INTO "Cards" ("name", "value", "text") VALUES ('Cloth Making',45,'Ships allowed an extra move.');
INSERT INTO "Cards" ("name", "value", "text") VALUES ('Agriculture',110,'Increases population limit by 1 in any area occupied alone.');
INSERT INTO "Cards" ("name", "value", "text") VALUES ('Metalworking',80,'In battle, remove tokens after players without METALWORKING have removed theirs.');
INSERT INTO "Cards" ("name", "value", "text") VALUES ('Drama & Poetry',60,'');
INSERT INTO "Cards" ("name", "value", "text") VALUES ('Music',60,'');
INSERT INTO "Cards" ("name", "value", "text") VALUES ('Astronomy',80,'Permits voyages across open seas.');
INSERT INTO "Cards" ("name", "value", "text") VALUES ('Coinage',110,'Each round, may fix taxation at 1, 2, or 3 tokens per city. Same rate must be applied towards all cities.');
INSERT INTO "Cards" ("name", "value", "text") VALUES ('Medicine',140,'During EPIDEMIC, lose only 11 unit points. Lose at most 5 unit points due to EPIDEMIC order.');
INSERT INTO "Cards" ("name", "value", "text") VALUES ('Engineering',140,'Opponents must have at least 8 tokens to attack. Lose 7 unit points at most due to FLOOD.');
INSERT INTO "Cards" ("name", "value", "text") VALUES ('Literacy',110,'');
INSERT INTO "Cards" ("name", "value", "text") VALUES ('Architecture',80,'');
INSERT INTO "Cards" ("name", "value", "text") VALUES ('Mysticism',30,'');
INSERT INTO "Cards" ("name", "value", "text") VALUES ('Democracy',200,'During CIVIL WAR, 45 units form the first faction: 15 chosen by player; 30 chosen by nominee. During CIVIL DISORDER, only cities in excess of 6 are reduced.');
INSERT INTO "Cards" ("name", "value", "text") VALUES ('Law',170,'During ICONOCLASM & HERESY, lose only 3 cities. During HERESY orders, lose only 1 city. During CIVIL DISORDER, only cities in excess of 5 are reduced.');
INSERT INTO "Cards" ("name", "value", "text") VALUES ('Philosophy',240,'During ICONOCLASM & HERESY, lose only 2 cities. Immune to HERESY orders. During CIVIL WAR, only 15 units form first faction. Units chosen by player with most tokens in stock.');

INSERT INTO "Groups" ("name", "credit") VALUES ('Crafts',10);
INSERT INTO "Groups" ("name", "credit") VALUES ('Arts',5);
INSERT INTO "Groups" ("name", "credit") VALUES ('Science',20);
INSERT INTO "Groups" ("name", "credit") VALUES ('Civics',0);

INSERT INTO "CardGroups" VALUES((SELECT "id" FROM "Cards" WHERE "name" = 'Pottery'), (SELECT "id" FROM "Groups" WHERE "name" = 'Crafts'));
INSERT INTO "CardGroups" VALUES((SELECT "id" FROM "Cards" WHERE "name" = 'Cloth Making'), (SELECT "id" FROM "Groups" WHERE "name" = 'Crafts'));
INSERT INTO "CardGroups" VALUES((SELECT "id" FROM "Cards" WHERE "name" = 'Agriculture'), (SELECT "id" FROM "Groups" WHERE "name" = 'Crafts'));
INSERT INTO "CardGroups" VALUES((SELECT "id" FROM "Cards" WHERE "name" = 'Metalworking'), (SELECT "id" FROM "Groups" WHERE "name" = 'Crafts'));
INSERT INTO "CardGroups" VALUES((SELECT "id" FROM "Cards" WHERE "name" = 'Drama & Poetry'), (SELECT "id" FROM "Groups" WHERE "name" = 'Arts'));
INSERT INTO "CardGroups" VALUES((SELECT "id" FROM "Cards" WHERE "name" = 'Music'), (SELECT "id" FROM "Groups" WHERE "name" = 'Arts'));
INSERT INTO "CardGroups" VALUES((SELECT "id" FROM "Cards" WHERE "name" = 'Astronomy'), (SELECT "id" FROM "Groups" WHERE "name" = 'Science'));
INSERT INTO "CardGroups" VALUES((SELECT "id" FROM "Cards" WHERE "name" = 'Coinage'), (SELECT "id" FROM "Groups" WHERE "name" = 'Science'));
INSERT INTO "CardGroups" VALUES((SELECT "id" FROM "Cards" WHERE "name" = 'Medicine'), (SELECT "id" FROM "Groups" WHERE "name" = 'Science'));
INSERT INTO "CardGroups" VALUES((SELECT "id" FROM "Cards" WHERE "name" = 'Engineering'), (SELECT "id" FROM "Groups" WHERE "name" = 'Crafts'));
INSERT INTO "CardGroups" VALUES((SELECT "id" FROM "Cards" WHERE "name" = 'Engineering'), (SELECT "id" FROM "Groups" WHERE "name" = 'Science'));
INSERT INTO "CardGroups" VALUES((SELECT "id" FROM "Cards" WHERE "name" = 'Literacy'), (SELECT "id" FROM "Groups" WHERE "name" = 'Arts'));
INSERT INTO "CardGroups" VALUES((SELECT "id" FROM "Cards" WHERE "name" = 'Literacy'), (SELECT "id" FROM "Groups" WHERE "name" = 'Civics'));
INSERT INTO "CardGroups" VALUES((SELECT "id" FROM "Cards" WHERE "name" = 'Architecture'), (SELECT "id" FROM "Groups" WHERE "name" = 'Arts'));
INSERT INTO "CardGroups" VALUES((SELECT "id" FROM "Cards" WHERE "name" = 'Architecture'), (SELECT "id" FROM "Groups" WHERE "name" = 'Civics'));
INSERT INTO "CardGroups" VALUES((SELECT "id" FROM "Cards" WHERE "name" = 'Mysticism'), (SELECT "id" FROM "Groups" WHERE "name" = 'Arts'));
INSERT INTO "CardGroups" VALUES((SELECT "id" FROM "Cards" WHERE "name" = 'Mysticism'), (SELECT "id" FROM "Groups" WHERE "name" = 'Science'));
INSERT INTO "CardGroups" VALUES((SELECT "id" FROM "Cards" WHERE "name" = 'Democracy'), (SELECT "id" FROM "Groups" WHERE "name" = 'Crafts'));
INSERT INTO "CardGroups" VALUES((SELECT "id" FROM "Cards" WHERE "name" = 'Democracy'), (SELECT "id" FROM "Groups" WHERE "name" = 'Civics'));
INSERT INTO "CardGroups" VALUES((SELECT "id" FROM "Cards" WHERE "name" = 'Law'), (SELECT "id" FROM "Groups" WHERE "name" = 'Civics'));
INSERT INTO "CardGroups" VALUES((SELECT "id" FROM "Cards" WHERE "name" = 'Law'), (SELECT "id" FROM "Groups" WHERE "name" = 'Arts'));
INSERT INTO "CardGroups" VALUES((SELECT "id" FROM "Cards" WHERE "name" = 'Philosophy'), (SELECT "id" FROM "Groups" WHERE "name" = 'Civics'));
INSERT INTO "CardGroups" VALUES((SELECT "id" FROM "Cards" WHERE "name" = 'Philosophy'), (SELECT "id" FROM "Groups" WHERE "name" = 'Science'));
