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
-- Table structure for table `klant`
--

DROP TABLE IF EXISTS `klant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `klant` (
  `id` int NOT NULL,
  `voornaam` varchar(255) NOT NULL,
  `achternaam` varchar(255) NOT NULL,
  `adres` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `wachtwoord` varchar(255) NOT NULL,
  `telefoonnummer` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klant`
--

LOCK TABLES `klant` WRITE;
/*!40000 ALTER TABLE `klant` DISABLE KEYS */;
INSERT INTO `klant` VALUES (1,'Kailee','Vines','Louisiana 123','kailee.vines@gmail.com','c21cd08423181d6730a8d26778888415',693027592),(2,'Carlos','Holscher','Delft 123','carlos.holscher@gmail.com','98cb02e1380315e09fdee6fff50f5c71',620751391),(3,'Aron','Dosti','Zoetermeer 123','aron.dosti@gmail.com','1aef1c19d059cb976013d1ee5a6366dc',649329762),(4,'Luka','Grouwstra','Rotterdam 123','luka.grouwstra@gmail.com','a8025c31596f81eea410e98cce0c40cd',639259841),(5,'Pedro','de Groot','Schipluiden 123','pedro.de.groot@gmail.com','06545c9cd8af37c546f0115aaa09a1d8',675926650),(6,'Shivam','Parwat','Maassluis 123','shivam.parwat@gmail.com','da8e017ac8d0e945cd5f2c30ca5a1452',628746501),(7,'Nike','Nederström','Delft 123','nike.nederstrom@gmail.com','a659fa16b0dc04237c7a03c71524347a',639275833),(8,'Mena','Habibi','Den Haag 123','mena.habibi@gmail.com','28699f64e0cf9de3c57ab8b9ab378564',612345678),(9,'wisken','uvwevweosas','Aritrea 123','wisken.uvwevweosas@gmail.com','94ac72cd11f4be5e69b91da32092e4b2',687654321),(10,'petr','czech','polen 123','petr.czech@gmail.com','42b9595c49376b19eec6350433c4ee63',692649625);
/*!40000 ALTER TABLE `klant` ENABLE KEYS */;
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
