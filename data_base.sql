-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: library_management
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `book_id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `author` varchar(100) NOT NULL,
  `isbn` varchar(20) NOT NULL,
  `category` varchar(50) NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `published_year` year DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`book_id`),
  UNIQUE KEY `isbn` (`isbn`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'Python Crash Course - 3rd Edition','Eric Matthes','9781593279288','Advanced Programming',10,2025,'2026-11-21 17:24:26','2026-11-21 22:41:49'),(2,'Clean Code','Robert C. Martin','9780132350884','Programming',3,2008,'2026-11-21 17:24:26','2026-11-21 17:24:26'),(3,'The Alchemist','Paulo Coelho','9780061122415','Fiction',4,1988,'2026-11-21 17:24:26','2026-11-21 17:24:26'),(4,'Atomic Habits','James Clear','9780735211292','Self Help',6,2018,'2026-11-21 17:24:26','2026-11-21 17:24:26'),(5,'Rich Dad Poor Dad','Robert Kiyosaki','9781612680194','Finance',2,1997,'2026-11-21 17:24:26','2026-11-21 17:24:26'),(8,'Python Programming','rakib','9781234567890','Programming',5,2024,'2026-11-21 21:43:04','2026-11-21 21:43:04');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `readers`
--

DROP TABLE IF EXISTS `readers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `readers` (
  `reader_id` bigint NOT NULL AUTO_INCREMENT,
  `reader_name` varchar(100) NOT NULL,
  `reader_email` varchar(150) NOT NULL,
  `reader_phone` varchar(20) NOT NULL,
  `reader_address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`reader_id`),
  UNIQUE KEY `reader_email` (`reader_email`),
  UNIQUE KEY `reader_phone` (`reader_phone`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `readers`
--

LOCK TABLES `readers` WRITE;
/*!40000 ALTER TABLE `readers` DISABLE KEYS */;
INSERT INTO `readers` VALUES (1,'Rakibul Islam','rakib@example.com','01712345678','Dhaka','2026-11-21 17:24:26','2026-11-21 17:24:26'),(2,'Rahim Ahmed','rahim@example.com','01812345678','Gazipur','2026-11-21 17:24:26','2026-11-21 17:24:26'),(3,'Karim Hasan','karim@example.com','01912345678','Uttara','2026-11-21 17:24:26','2026-11-21 17:24:26'),(4,'Sakib Hossain','sakib@example.com','01612345678','Mirpur','2026-11-21 17:24:26','2026-11-21 17:24:26'),(5,'sohle Hasan','sohle.hasan@example.com','0179283747','Mirpur, Dhaka','2026-11-21 17:24:26','2026-11-22 16:55:34');
/*!40000 ALTER TABLE `readers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'library_management'
--

--
-- Dumping routines for database 'library_management'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-24  0:29:53
