CREATE DATABASE  IF NOT EXISTS `metrosystemcph` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `metrosystemcph`;
-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (x86_64)
--
-- Host: sc2sem.mysql.database.azure.com    Database: metrosystemcph
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `line`
--

DROP TABLE IF EXISTS `line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `line` (
  `Name` varchar(2) NOT NULL,
  `Stretch` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line`
--

LOCK TABLES `line` WRITE;
/*!40000 ALTER TABLE `line` DISABLE KEYS */;
INSERT INTO `line` VALUES ('M1','Vanløse - Vestamager'),('M2','Vanløse - Kbh Lufthavn'),('M3','Cityringen'),('M4','Kbh H. - Orientkaj');
/*!40000 ALTER TABLE `line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `linestation`
--

DROP TABLE IF EXISTS `linestation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `linestation` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Line` varchar(2) DEFAULT NULL,
  `StationID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Line` (`Line`),
  KEY `StationID` (`StationID`),
  CONSTRAINT `linestation_ibfk_1` FOREIGN KEY (`Line`) REFERENCES `line` (`Name`),
  CONSTRAINT `linestation_ibfk_2` FOREIGN KEY (`StationID`) REFERENCES `station` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linestation`
--

LOCK TABLES `linestation` WRITE;
/*!40000 ALTER TABLE `linestation` DISABLE KEYS */;
INSERT INTO `linestation` VALUES (1,'M1',1),(2,'M2',1),(3,'M1',2),(4,'M2',2),(5,'M1',3),(6,'M2',3),(7,'M1',4),(8,'M2',4),(9,'M1',5),(10,'M2',5),(11,'M1',6),(12,'M2',6),(13,'M1',7),(14,'M2',7),(15,'M1',8),(16,'M2',8),(17,'M1',9),(18,'M2',9),(19,'M1',17),(20,'M1',18),(21,'M1',19),(22,'M1',20),(23,'M1',21),(24,'M1',22),(25,'M2',10),(26,'M2',11),(27,'M2',12),(28,'M2',13),(29,'M2',14),(30,'M2',15),(31,'M2',16),(32,'M3',23),(33,'M3',5),(34,'M3',25),(35,'M3',26),(36,'M3',27),(37,'M3',28),(38,'M3',29),(39,'M3',30),(40,'M3',31),(41,'M3',32),(42,'M3',33),(43,'M3',34),(44,'M3',8),(45,'M3',36),(46,'M3',37),(47,'M3',38),(48,'M3',39);
/*!40000 ALTER TABLE `linestation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `station`
--

DROP TABLE IF EXISTS `station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `station` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(80) DEFAULT NULL,
  `latitude` decimal(7,5) DEFAULT NULL,
  `longitude` decimal(7,5) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `station`
--

LOCK TABLES `station` WRITE;
/*!40000 ALTER TABLE `station` DISABLE KEYS */;
INSERT INTO `station` VALUES (1,'Vanløse',55.68700,12.49300),(2,'Flintholm',55.68600,12.49900),(3,'Lindevang',55.68400,12.51300),(4,'Fasanvej',55.68200,12.52300),(5,'Frederiksberg',55.68100,12.53200),(6,'Forum',55.68200,12.55200),(7,'Nørreport',55.68400,12.57200),(8,'Kongens Nytorv',55.67900,12.58500),(9,'Christianshavn',55.67200,12.59100),(10,'Amagerbro',55.66400,12.60300),(11,'Lergravsparken',55.66200,12.61700),(12,'Øresund',55.66200,12.62900),(13,'Amager Strand',55.65600,12.63200),(14,'Femøren',55.64500,12.63800),(15,'Kastrup',55.63600,12.64700),(16,'Københavns Lufthavn',55.63000,12.64900),(17,'Islands Brygge',55.66400,12.58500),(18,'DR Byen',55.65600,12.58900),(19,'Sundby',55.64500,12.58600),(20,'Bella Center',55.63800,12.58300),(21,'Ørestad',55.62900,12.57900),(22,'Vestamager',55.61900,12.57600),(23,'Frederiksberg Allé',55.67400,12.54000),(25,'Aksel Møllers Have',55.68600,12.53300),(26,'Nuuks Plads',55.68900,12.54300),(27,'Nørrebros Runddel',55.69400,12.54900),(28,'Nørrebro',55.70000,12.53800),(29,'Skjolds Plads',55.70300,12.54900),(30,'Vibenshus Runddel',55.70600,12.56400),(31,'Poul Henningsens Plads',55.70900,12.57700),(32,'Trianglen',55.69900,12.57600),(33,'Østerport',55.69300,12.58600),(34,'Marmorkirken',55.68500,12.58900),(36,'Gammel Strand',55.67800,12.57900),(37,'Rådhuspladsen',55.67600,12.56900),(38,'København H',55.67100,12.56400),(39,'Enghave Plads',55.66700,12.54600);
/*!40000 ALTER TABLE `station` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-09 19:53:52
