# Updated statement to populate tables
# April 2022, jenr@kea.dk

USE metrosystemcph;
# Disable contraints
SET FOREIGN_KEY_CHECKS = FALSE;
# Empty tables
TRUNCATE TABLE linestation;
TRUNCATE TABLE line;
TRUNCATE TABLE station;
# Re-enable contraints
SELECT FOREIGN_KEY_CHECKS = TRUE;

INSERT INTO Station
VALUES
  (1,'Vanløse',55.68700,12.49300),
  (2,'Flintholm',55.68600,12.49900),
  (3,'Lindevang',55.68400,12.51300),
  (4,'Fasanvej',55.68200,12.52300),
  (5,'Frederiksberg',55.68100,12.53200),
  (6,'Forum',55.68200,12.55200),
  (7,'Nørreport',55.68400,12.57200),
  (8,'Kongens Nytorv',55.67900,12.58500),
  (9,'Christianshavn',55.67200,12.59100),
  (10,'Amagerbro',55.66400,12.60300),
  (11,'Lergravsparken',55.66200,12.61700),
  (12,'Øresund',55.66200,12.62900),
  (13,'Amager Strand',55.65600,12.63200),
  (14,'Femøren',55.64500,12.63800),
  (15,'Kastrup',55.63600,12.64700),
  (16,'Københavns Lufthavn',55.63000,12.64900),
  (17,'Islands Brygge',55.66400,12.58500),
  (18,'DR Byen',55.65600,12.58900),
  (19,'Sundby',55.64500,12.58600),
  (20,'Bella Center',55.63800,12.58300),
  (21,'Ørestad',55.62900,12.57900),
  (22,'Vestamager',55.61900,12.57600),
  (23,'Frederiksberg Allé',55.67400,12.54000),
  (25,'Aksel Møllers Have',55.68600,12.53300),
  (26,'Nuuks Plads',55.68900,12.54300),
  (27,'Nørrebros Runddel',55.69400,12.54900),
  (28,'Nørrebro',55.70000,12.53800),
  (29,'Skjolds Plads',55.70300,12.54900),
  (30,'Vibenshus Runddel',55.70600,12.56400),
  (31,'Poul Henningsens Plads',55.70900,12.57700),
  (32,'Trianglen',55.69900,12.57600),
  (33,'Østerport',55.69300,12.58600),
  (34,'Marmorkirken',55.68500,12.58900),
  (36,'Gammel Strand',55.67800,12.57900),
  (37,'Rådhuspladsen',55.67600,12.56900),
  (38,'København H',55.67100,12.56400),
  (39,'Enghave Plads',55.66700,12.54600),
  (40,'Nordhavn', 55.708, 12.592),
  (41,'Orientkaj', 55.712, 12.595);

INSERT INTO Line
VALUES
  ('M1','Vanløse - Vestamager'),
  ('M2','Vanløse - Kbh Lufthavn'),
  ('M3','Cityringen'),
  ('M4','Kbh H. - Orientkaj');

INSERT INTO LineStation
VALUES
  (1,'M1',1),
  (2,'M2',1),
  (3,'M1',2),
  (4,'M2',2),
  (5,'M1',3),
  (6,'M2',3),
  (7,'M1',4),
  (8,'M2',4),
  (9,'M1',5),
  (10,'M2',5),
  (11,'M1',6),
  (12,'M2',6),
  (13,'M1',7),
  (14,'M2',7),
  (15,'M1',8),
  (16,'M2',8),
  (17,'M1',9),
  (18,'M2',9),
  (19,'M1',17),
  (20,'M1',18),
  (21,'M1',19),
  (22,'M1',20),
  (23,'M1',21),
  (24,'M1',22),
  (25,'M2',10),
  (26,'M2',11),
  (27,'M2',12),
  (28,'M2',13),
  (29,'M2',14),
  (30,'M2',15),
  (31,'M2',16),
  (32,'M3',23),
  (33,'M3',5),
  (34,'M3',25),
  (35,'M3',26),
  (36,'M3',27),
  (37,'M3',28),
  (38,'M3',29),
  (39,'M3',30),
  (40,'M3',31),
  (41,'M3',32),
  (42,'M3',33),
  (43,'M3',34),
  (44,'M3',8),
  (45,'M3',36),
  (46,'M3',37),
  (47,'M3',38),
  (48,'M3',39),
  
  (401, 'M4', 41),
  (402, 'M4', 40),
  (403, 'M4', 33),
  (404, 'M4', 34),
  (405, 'M4', 8),
  (406, 'M4', 36),
  (407, 'M4', 37),
  (408, 'M4', 38);



