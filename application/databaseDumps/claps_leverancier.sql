-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: claps
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `leverancier`
--

DROP TABLE IF EXISTS `leverancier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leverancier` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `naam` varchar(255) NOT NULL,
  `klant_ID` int NOT NULL,
  `watermeter_macadres` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `klant_ID_2` (`klant_ID`),
  KEY `microbit_macadres` (`watermeter_macadres`),
  CONSTRAINT `klant_ID_2` FOREIGN KEY (`klant_ID`) REFERENCES `klant` (`id`),
  CONSTRAINT `microbit_macadres` FOREIGN KEY (`watermeter_macadres`) REFERENCES `watermeter` (`macadres`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leverancier`
--

LOCK TABLES `leverancier` WRITE;
/*!40000 ALTER TABLE `leverancier` DISABLE KEYS */;
INSERT INTO `leverancier` VALUES (1,'Dunea',1,'65-G6-JH-J9-74-3H'),(2,'Dunea',2,'46-DK-Y6-36-6K-F3'),(3,'Dunea',3,'4H-85-HD-5U-D2-DH'),(4,'Dunea',4,'F5-3G-8H-TG-J8-5H'),(5,'Dunea',5,'H3-57-JT-98-5A-U4'),(6,'Dunea',6,'4H-DH-U3-67-52-K9'),(7,'Dunea',7,'8J-DQ-K7-F2-SH-H4'),(8,'Dunea',8,'S2-S3-45-GH-8J-K9'),(9,'Dunea',9,'X1-M7-G5-99-35-YK'),(10,'Dunea',10,'24-Y5-MI-DE-GE-WV');
/*!40000 ALTER TABLE `leverancier` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-24 14:44:26
