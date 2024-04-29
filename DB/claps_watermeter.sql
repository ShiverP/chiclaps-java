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
-- Table structure for table `watermeter`
--

DROP TABLE IF EXISTS `watermeter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `watermeter` (
  `macadres` varchar(255) NOT NULL,
  `verificatiecode` int NOT NULL,
  `waterverbruik` int NOT NULL,
  `klant_ID` int NOT NULL,
  `watermeter_dag` varchar(255) NOT NULL,
  `watermeter_week` varchar(255) NOT NULL,
  `watermeter_maand` varchar(255) NOT NULL,
  `watermeter_jaar` varchar(255) NOT NULL,
  `limiet` int DEFAULT NULL,
  PRIMARY KEY (`macadres`),
  KEY `klant_ID` (`klant_ID`),
  CONSTRAINT `klant_ID` FOREIGN KEY (`klant_ID`) REFERENCES `klant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watermeter`
--

LOCK TABLES `watermeter` WRITE;
/*!40000 ALTER TABLE `watermeter` DISABLE KEYS */;
INSERT INTO `watermeter` VALUES ('24-Y5-MI-DE-GE-WV',2792,200,10,'','','','',300),('46-DK-Y6-36-6K-F3',5678,5430,2,'','','','',NULL),('4H-85-HD-5U-D2-DH',723,8658,3,'','','','',NULL),('4H-DH-U3-67-52-K9',3214,6753,6,'','','','',NULL),('65-G6-JH-J9-74-3H',1234,1000,1,'','','','',NULL),('8J-DQ-K7-F2-SH-H4',1425,3682,7,'','','','',NULL),('F5-3G-8H-TG-J8-5H',4321,4578,4,'','','','',NULL),('H3-57-JT-98-5A-U4',4652,3583,5,'','','','',NULL),('S2-S3-45-GH-8J-K9',3948,9685,8,'','','','',NULL),('X1-M7-G5-99-35-YK',1986,8165,9,'','','','',NULL);
/*!40000 ALTER TABLE `watermeter` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-26 14:41:20
