-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: charityevents_db
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (4,'Blood Drive'),(3,'Charity Auction'),(1,'Fun Run'),(2,'Gala Dinner');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int NOT NULL,
  `org_id` int NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `purpose` text COLLATE utf8mb4_unicode_ci,
  `venue` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_datetime` datetime NOT NULL,
  `end_datetime` datetime NOT NULL,
  `ticket_price_cents` int DEFAULT '0',
  `is_free` tinyint(1) DEFAULT '0',
  `target_amount_cents` int DEFAULT '0',
  `raised_amount_cents` int DEFAULT '0',
  `status` enum('upcoming','past','paused') COLLATE utf8mb4_unicode_ci DEFAULT 'upcoming',
  `hero_image_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_org` (`org_id`),
  KEY `idx_city` (`city`),
  KEY `idx_start` (`start_datetime`),
  KEY `idx_cat` (`category_id`),
  CONSTRAINT `fk_cat` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `fk_org` FOREIGN KEY (`org_id`) REFERENCES `organizations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'City Charity Run',1,1,'10km city run','raise funds for schools','City Park','San Jose','CA','2025-10-05 08:00:00','2025-10-05 12:00:00',3000,0,1000000,250000,'upcoming','https://picsum.photos/seed/run/800/400'),(2,'Autumn Gala Night',2,1,'Black-tie dinner','scholarship program','Grand Hotel','San Francisco','CA','2025-11-02 18:00:00','2025-11-02 22:30:00',15000,0,3000000,500000,'upcoming','https://picsum.photos/seed/gala/800/400'),(3,'Eco Auction 2025',3,2,'Auction donated items','reforestation','Civic Center','Oakland','CA','2025-10-20 17:00:00','2025-10-20 20:00:00',0,1,1500000,300000,'upcoming','https://picsum.photos/seed/auction/800/400'),(4,'Community Blood Drive',4,3,'Donate blood','local hospital support','Health Hub','San Jose','CA','2025-09-15 09:00:00','2025-09-15 17:00:00',0,1,0,0,'past','https://picsum.photos/seed/blood/800/400'),(5,'Bay Area Fun Run',1,2,'5km fun run','park cleanup','Bay Park','San Mateo','CA','2025-10-12 08:00:00','2025-10-12 11:00:00',2000,0,800000,120000,'upcoming','https://picsum.photos/seed/run2/800/400'),(6,'Winter Gala',2,1,'formal dinner','winter shelter','Royal Hall','San Francisco','CA','2025-12-10 19:00:00','2025-12-10 23:00:00',18000,0,4000000,700000,'upcoming','https://picsum.photos/seed/gala2/800/400'),(7,'Charity Auction - Art',3,3,'artworks by local artists','youth center','Art House','San Jose','CA','2025-08-01 16:00:00','2025-08-01 19:00:00',0,1,1200000,900000,'past','https://picsum.photos/seed/auction2/800/400'),(8,'Downtown Run',1,1,'3km family run','food bank','Downtown Square','Oakland','CA','2025-10-26 08:30:00','2025-10-26 10:30:00',1000,0,500000,100000,'upcoming','https://picsum.photos/seed/run3/800/400');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizations`
--

DROP TABLE IF EXISTS `organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organizations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `about` text COLLATE utf8mb4_unicode_ci,
  `contact_email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations`
--

LOCK TABLES `organizations` WRITE;
/*!40000 ALTER TABLE `organizations` DISABLE KEYS */;
INSERT INTO `organizations` VALUES (1,'Hope Foundation','Focus on child education.','contact@hope.org'),(2,'Green Earth','Environmental protection.','hello@green.org'),(3,'Care&Share','Community support.','team@care.org');
/*!40000 ALTER TABLE `organizations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-30 19:17:41
