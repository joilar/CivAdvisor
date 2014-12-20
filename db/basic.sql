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

DROP TABLE IF EXISTS "Cards";
CREATE TABLE "Cards" ("id" INTEGER PRIMARY KEY  NOT NULL , "name" VARCHAR, "value" INTEGER, "text" VARCHAR);

INSERT INTO "Cards" VALUES(1,'Pottery',45,'During FAMINE, reduce loss by 4 unit points per GRAIN trade card held.');
INSERT INTO "Cards" VALUES(2,'Cloth Making',45,'Ships allowed an extra move.');
INSERT INTO "Cards" VALUES(3,'Agriculture',110,'Increases population limit by 1 in any area occupied alone.');
INSERT INTO "Cards" VALUES(4,'Metalworking',80,'In battle, remove tokens after players without METALWORKING have removed theirs.');
INSERT INTO "Cards" VALUES(5,'Drama & Poetry',60,'');
INSERT INTO "Cards" VALUES(6,'Music',60,'');
INSERT INTO "Cards" VALUES(7,'Astronomy',80,'Permits voyages across open seas.');
INSERT INTO "Cards" VALUES(8,'Coinage',110,'Each round, may fix taxation at 1, 2, or 3 tokens per city. Same rate must be applied towards all cities.');
INSERT INTO "Cards" VALUES(9,'Medicine',140,'During EPIDEMIC, lose only 11 unit points. Lose at most 5 unit points due to EPIDEMIC order.');
INSERT INTO "Cards" VALUES(10,'Engineering',140,'Opponents must have at least 8 tokens to attack. Lose 7 unit points at most due to FLOOD.');
INSERT INTO "Cards" VALUES(11,'Literacy',110,'');
INSERT INTO "Cards" VALUES(12,'Architecture',80,'');
INSERT INTO "Cards" VALUES(13,'Mysticism',30,'');
INSERT INTO "Cards" VALUES(14,'Democracy',200,'During CIVIL WAR, 45 units form the first faction: 15 chosen by player; 30 chosen by nominee. During CIVIL DISORDER, only cities in excess of 6 are reduced.');
INSERT INTO "Cards" VALUES(15,'Law',170,'During ICONOCLASM & HERESY, lose only 3 cities. During HERESY orders, lose only 1 city. During CIVIL DISORDER, only cities in excess of 5 are reduced.');
INSERT INTO "Cards" VALUES(16,'Philosophy',240,'During ICONOCLASM & HERESY, lose only 2 cities. Immune to HERESY orders. During CIVIL WAR, only 15 units form first faction. Units chosen by player with most tokens in stock.');

DROP TABLE IF EXISTS "Groups";
CREATE TABLE "Groups" ("id" INTEGER PRIMARY KEY  NOT NULL , "name" VARCHAR, "credit" INTEGER);

INSERT INTO "Groups" VALUES(1,'Crafts',10);
INSERT INTO "Groups" VALUES(2,'Arts',5);
INSERT INTO "Groups" VALUES(3,'Science',20);
INSERT INTO "Groups" VALUES(4,'Civics',0);
