-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: online_bookstore_final
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `full_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_line` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  `extra1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (4,6,'Atharva Waghmare','Near Ghantibaba Temple, Arni Road, Digras','DIGRAS','Maharashtra','445203','India','0022664452',0,NULL,NULL,NULL,NULL),(5,10,'Atharva Waghmare','Near Ghantibaba Temple, Arni Road, Digras','DIGRAS','Maharashtra','445203','India','9022664452',0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `author_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `biography` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `extra1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (2,'Atharva Waghmare','Very Good Author',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_inventory`
--

DROP TABLE IF EXISTS `book_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_inventory` (
  `inventory_id` int NOT NULL AUTO_INCREMENT,
  `store_id` int NOT NULL,
  `book_id` int NOT NULL,
  `sku` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `mrp` decimal(10,2) DEFAULT NULL,
  `stock_quantity` int DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `extra1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`inventory_id`),
  UNIQUE KEY `ux_store_book` (`store_id`,`book_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `book_inventory_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `bookstores` (`store_id`),
  CONSTRAINT `book_inventory_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_inventory`
--

LOCK TABLES `book_inventory` WRITE;
/*!40000 ALTER TABLE `book_inventory` DISABLE KEYS */;
INSERT INTO `book_inventory` VALUES (4,4,5,NULL,150.00,250.00,25,1,'2026-01-29 11:31:23','2026-02-01 12:02:09',NULL,NULL,NULL,NULL),(5,4,6,NULL,200.00,300.00,25,1,'2026-01-29 11:34:52','2026-02-01 10:30:17',NULL,NULL,NULL,NULL),(6,4,7,NULL,300.00,400.00,15,1,'2026-01-29 11:45:29','2026-01-30 10:56:37',NULL,NULL,NULL,NULL),(8,4,9,NULL,100.00,200.00,4,1,'2026-01-29 16:54:33','2026-01-30 11:12:32',NULL,NULL,NULL,NULL),(9,4,10,NULL,100.00,200.00,115,1,'2026-01-29 17:06:26','2026-01-29 19:38:08',NULL,NULL,NULL,NULL),(10,4,8,NULL,150.00,250.00,20,1,'2026-01-29 20:55:34',NULL,NULL,NULL,NULL,NULL),(11,5,11,NULL,100.00,120.00,18,1,'2026-01-30 07:34:39','2026-01-30 07:36:09',NULL,NULL,NULL,NULL),(12,12,37,NULL,400.00,500.00,10,1,'2026-02-01 11:20:34','2026-02-01 11:22:22',NULL,NULL,NULL,NULL),(13,12,39,NULL,100.00,200.00,30,1,'2026-02-01 11:41:51','2026-02-01 11:51:13',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `book_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `isbn` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` int DEFAULT NULL,
  `publisher_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `publication_date` date DEFAULT NULL,
  `pages` int DEFAULT NULL,
  `language` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_image_url` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` enum('ADMIN','OWNER') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'ADMIN',
  `owner_id` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `extra1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  UNIQUE KEY `isbn` (`isbn`),
  KEY `author_id` (`author_id`),
  KEY `publisher_id` (`publisher_id`),
  KEY `category_id` (`category_id`),
  KEY `owner_id` (`owner_id`),
  CONSTRAINT `books_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`),
  CONSTRAINT `books_ibfk_2` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`publisher_id`),
  CONSTRAINT `books_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
  CONSTRAINT `books_ibfk_4` FOREIGN KEY (`owner_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (5,'Create Your Own Business ','Very nice book','8787',2,2,2,'2020-12-20',360,'english','uploads/34caebee2ae5b69fe7df10ef8fd64a65.jpg','ADMIN',NULL,1,'2026-01-29 11:31:23','2026-01-29 20:56:02',NULL,NULL,NULL,NULL),(6,'Tour & Travels','Tour Guide','2345',NULL,NULL,NULL,NULL,NULL,'English','uploads/1769686492937-774957590.jpg','OWNER',7,1,'2026-01-29 11:34:52','2026-01-30 11:09:05',NULL,NULL,NULL,NULL),(7,'My Book Cover','nice book','7878',NULL,NULL,NULL,NULL,NULL,'English','uploads/1769687129971-335665489.jpg','OWNER',7,1,'2026-01-29 11:45:29',NULL,NULL,NULL,NULL,NULL),(8,'sasas','adadaw','455',2,2,2,NULL,NULL,'english',NULL,'OWNER',7,1,'2026-01-29 12:52:53',NULL,NULL,NULL,NULL,NULL),(9,'uhuhuhada','awdawda','56565',2,2,2,'1990-12-20',100,'marathi','uploads/3f228ebc31a40f57ce676de211c1ac84.jpg','ADMIN',NULL,1,'2026-01-29 16:54:33',NULL,NULL,NULL,NULL,NULL),(10,'dwdwdw','efefe','342',NULL,NULL,NULL,NULL,NULL,'marathi','uploads/1769706386265-490741473.jpg','OWNER',7,1,'2026-01-29 17:06:26',NULL,NULL,NULL,NULL,NULL),(11,'deedeeeee','aaaaaaaaaaaaaaaaaaaaaaa','3333',NULL,NULL,NULL,NULL,NULL,'English','uploads/1769758479404-737419539.png','OWNER',7,1,'2026-01-30 07:34:39',NULL,NULL,NULL,NULL,NULL),(12,'Ashruuu','good girl','4343',2,2,2,'2009-08-31',200,'Hinglish','uploads/6cfacf8ab7a60ba59e52949467cd8893','ADMIN',NULL,1,'2026-02-01 11:15:33',NULL,NULL,NULL,NULL,NULL),(37,'wdwdw','wdwdw','wdwdw',NULL,NULL,NULL,NULL,NULL,'wdwdw','uploads/1769944834152-850788203.jpg','OWNER',7,1,'2026-02-01 11:20:34',NULL,NULL,NULL,NULL,NULL),(38,'qqqqqqqq','qqqqqqqqq','2323',2,2,2,'2020-12-20',888,'qqqqqq','uploads/39bc91c3c559dcf1bc7d3c0e1a0cd5b4','ADMIN',NULL,1,'2026-02-01 11:21:42',NULL,NULL,NULL,NULL,NULL),(39,'eeeeeeeeeeeee','eeeeeeeeeee','434',2,2,2,'2012-12-12',222,'kokok2','uploads/c9e0890377c9aad156f3960d85f642e8','ADMIN',NULL,1,'2026-02-01 11:41:51',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookstores`
--

DROP TABLE IF EXISTS `bookstores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookstores` (
  `store_id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int NOT NULL,
  `store_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `address_line` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_phone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `extra1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`store_id`),
  KEY `owner_id` (`owner_id`),
  CONSTRAINT `bookstores_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookstores`
--

LOCK TABLES `bookstores` WRITE;
/*!40000 ALTER TABLE `bookstores` DISABLE KEYS */;
INSERT INTO `bookstores` VALUES (4,7,'Yash Book Store','Good Book Store','Near Ghantibaba Temple, Arni Road, Digras','YAVATMAL','MAHARASHTRA','445203','India','yash@gmail.com','09022664452','uploads/1769706350849-915549939.jpg',1,'2026-01-29 11:25:19',NULL,NULL,NULL,NULL),(5,7,'Yavatmal Book Store','edede','Near Ghantibaba Temple, Arni Road, Digras','YAVATMAL','MAHARASHTRA','445203','India','atharvawaghmare878@gmail.com','9022664452',NULL,1,'2026-01-29 17:08:47',NULL,NULL,NULL,NULL),(6,7,'wwwwwwdd','adddddddd','Near Ghantibaba Temple, Arni Road, Digras','DIGRAS','Maharashtra','445203','India','atharvawaghmare878@gmail.com','09022664452',NULL,1,'2026-01-29 17:19:37',NULL,NULL,NULL,NULL),(7,7,'adaadad',NULL,NULL,NULL,NULL,NULL,NULL,'adada',NULL,NULL,1,'2026-01-29 17:19:52',NULL,NULL,NULL,NULL),(8,7,'Santosh',NULL,NULL,NULL,NULL,NULL,NULL,'Santosh Bookwala',NULL,NULL,1,'2026-01-30 11:17:04',NULL,NULL,NULL,NULL),(9,7,'Santosh Bookwala',NULL,'Near Ghantibaba Temple, Arni Road, Digras','YAVATMAL','MAHARASHTRA','445203','India','santosh@gmail.com','09022664452',NULL,1,'2026-01-30 11:17:44',NULL,NULL,NULL,NULL),(10,7,'Don book store','good store','Near Ghantibaba Temple, Arni Road, Digras','DIGRAS','Maharashtra','445203','India','atharvawaghmare878@gmail.com','09022664452',NULL,1,'2026-02-01 09:42:18',NULL,NULL,NULL,NULL),(11,7,'Shruti Books',NULL,NULL,NULL,NULL,NULL,NULL,'shruti@gmail.com',NULL,NULL,1,'2026-02-01 11:11:23',NULL,NULL,NULL,NULL),(12,7,'Guddu','Guddu book Store','Near Ghantibaba Temple, Arni Road, Digras','DIGRAS','Maharashtra','445203','India','atharvawaghmare878@gmail.com','09022664452',NULL,1,'2026-02-01 11:12:23',NULL,NULL,NULL,NULL),(13,7,'Minakshi','aaaaaaaa','Near Ghantibaba Temple, Arni Road, Digras','YAVATMAL','MAHARASHTRA','445203','India','atharvawaghmare878@gmail.com','09022664452',NULL,1,'2026-02-01 11:52:08',NULL,NULL,NULL,NULL),(14,7,'Shakuntala',NULL,NULL,NULL,NULL,NULL,NULL,'shakuntala@gmail.com',NULL,NULL,1,'2026-02-01 11:52:30',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `bookstores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `extra1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  UNIQUE KEY `user_id_2` (`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (112,6,'2026-01-29 18:50:39',NULL,NULL,NULL,NULL),(118,10,'2026-01-29 20:39:26',NULL,NULL,NULL,NULL),(119,11,'2026-01-30 06:42:27',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `cart_item_id` int NOT NULL AUTO_INCREMENT,
  `cart_id` int NOT NULL,
  `inventory_id` int NOT NULL,
  `quantity` int DEFAULT '1',
  `price_at_addition` decimal(10,2) DEFAULT NULL,
  `added_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `extra1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cart_item_id`),
  UNIQUE KEY `cart_id_2` (`cart_id`,`inventory_id`),
  KEY `cart_id` (`cart_id`),
  KEY `inventory_id` (`inventory_id`),
  CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`),
  CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`inventory_id`) REFERENCES `book_inventory` (`inventory_id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES (61,119,5,1,180.00,'2026-01-30 06:42:27',NULL,NULL,NULL,NULL),(62,119,4,1,100.00,'2026-01-30 06:42:28',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int DEFAULT NULL,
  `extra1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name` (`category_name`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (2,'Science',NULL,NULL,NULL,NULL,NULL),(3,'Fictions',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `notification_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_read` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `extra1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `order_item_id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint NOT NULL,
  `inventory_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `extra1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`),
  KEY `inventory_id` (`inventory_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`inventory_id`) REFERENCES `book_inventory` (`inventory_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (3,3,6,2,200.00,NULL,NULL,NULL,NULL),(4,4,9,3,100.00,NULL,NULL,NULL,NULL),(5,4,6,2,200.00,NULL,NULL,NULL,NULL),(6,5,5,5,180.00,NULL,NULL,NULL,NULL),(7,5,6,2,200.00,NULL,NULL,NULL,NULL),(8,6,6,5,200.00,NULL,NULL,NULL,NULL),(9,7,8,2,100.00,NULL,NULL,NULL,NULL),(10,8,9,2,100.00,NULL,NULL,NULL,NULL),(11,9,4,1,100.00,NULL,NULL,NULL,NULL),(12,9,5,1,180.00,NULL,NULL,NULL,NULL),(13,10,8,4,100.00,NULL,NULL,NULL,NULL),(14,11,8,6,100.00,NULL,NULL,NULL,NULL),(15,12,5,1,180.00,NULL,NULL,NULL,NULL),(16,13,11,2,100.00,NULL,NULL,NULL,NULL),(17,14,8,2,100.00,NULL,NULL,NULL,NULL),(18,15,8,1,100.00,NULL,NULL,NULL,NULL),(19,16,8,1,100.00,NULL,NULL,NULL,NULL),(20,17,4,16,100.00,NULL,NULL,NULL,NULL),(21,18,5,1,200.00,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `address_id` int NOT NULL,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('Pending','Confirmed','Shipped','Delivered','Cancelled') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Pending',
  `total_amount` decimal(10,2) DEFAULT NULL,
  `extra1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `address_id` (`address_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (3,6,4,'2026-01-29 19:00:07','Delivered',400.00,NULL,NULL,NULL,NULL),(4,6,4,'2026-01-29 19:01:56','Cancelled',700.00,NULL,NULL,NULL,NULL),(5,6,4,'2026-01-29 19:14:52','Delivered',1300.00,NULL,NULL,NULL,NULL),(6,6,4,'2026-01-29 19:28:54','Delivered',1000.00,NULL,NULL,NULL,NULL),(7,6,4,'2026-01-29 19:37:58','Delivered',200.00,NULL,NULL,NULL,NULL),(8,6,4,'2026-01-29 19:38:08','Cancelled',200.00,NULL,NULL,NULL,NULL),(9,10,5,'2026-01-30 06:08:24','Shipped',280.00,NULL,NULL,NULL,NULL),(10,10,5,'2026-01-30 06:09:32','Cancelled',400.00,NULL,NULL,NULL,NULL),(11,10,5,'2026-01-30 06:46:39','Cancelled',600.00,NULL,NULL,NULL,NULL),(12,10,5,'2026-01-30 06:47:18','Pending',180.00,NULL,NULL,NULL,NULL),(13,10,5,'2026-01-30 07:36:09','Delivered',200.00,NULL,NULL,NULL,NULL),(14,10,5,'2026-01-30 11:11:35','Delivered',200.00,NULL,NULL,NULL,NULL),(15,10,5,'2026-01-30 11:12:05','Confirmed',100.00,NULL,NULL,NULL,NULL),(16,10,5,'2026-01-30 11:12:32','Cancelled',100.00,NULL,NULL,NULL,NULL),(17,10,5,'2026-01-30 16:33:37','Shipped',1600.00,NULL,NULL,NULL,NULL),(18,10,5,'2026-02-01 10:30:17','Delivered',200.00,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_otps`
--

DROP TABLE IF EXISTS `password_otps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_otps` (
  `otp_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `otp` varchar(6) NOT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`otp_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `password_otps_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_otps`
--

LOCK TABLES `password_otps` WRITE;
/*!40000 ALTER TABLE `password_otps` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_otps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint DEFAULT NULL,
  `payment_method` enum('CreditCard','DebitCard','UPI','COD') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` enum('Pending','Completed','Failed') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Pending',
  `transaction_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `extra1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  UNIQUE KEY `order_id` (`order_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publishers`
--

DROP TABLE IF EXISTS `publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publishers` (
  `publisher_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `extra1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`publisher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishers`
--

LOCK TABLES `publishers` WRITE;
/*!40000 ALTER TABLE `publishers` DISABLE KEYS */;
INSERT INTO `publishers` VALUES (2,'Atharva Waghmare','9022664452',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `publishers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `review_id` bigint NOT NULL AUTO_INCREMENT,
  `book_id` int NOT NULL,
  `user_id` int NOT NULL,
  `rating` tinyint DEFAULT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `review_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `extra1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `book_id` (`book_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `reviews_chk_1` CHECK ((`rating` between 1 and 5))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ADMIN',NULL,NULL,NULL,NULL),(2,'USER',NULL,NULL,NULL,NULL),(3,'OWNER',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `extra1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (6,1,'Atharva','atharvawaghmare878@gmail.com','$2b$10$p.kXK/4ctE.ErYYjuAFRo.Z4XM9.Ynh1M6fbINnwDxp4lbvOjA6E6','9022664452',1,'2026-01-29 11:18:55','2026-02-01 10:29:54',NULL,NULL,NULL,NULL),(7,3,'Yash Mahajan','yash@gmail.com','$2b$10$8Di.ORRq1CuZfblBi4YewOdwyG0OaBrl83FBymeSZnfWbKuxPa7Am','8888888888',1,'2026-01-29 11:20:25','2026-01-30 11:12:59',NULL,NULL,NULL,NULL),(10,2,'athina','athina@gmail.com','$2b$10$obrRXnVaBCVZbaMRXcOW/eBqh9uyO7r.Us12d05iNFyfQYber1O36','5656565656',1,'2026-01-29 20:39:05','2026-02-01 12:00:54',NULL,NULL,NULL,NULL),(11,2,'hero','hero@gmail.com','$2b$10$RAD9Xsa9pP0GnIe43KPz9OnkXVCzH3qK1B6X83k7blqiKSTqlSIJm','4545454545',1,'2026-01-30 06:42:02','2026-01-30 11:12:56',NULL,NULL,NULL,NULL),(12,2,'kiran','milosok942@juhxs.com','$2b$10$lxsU.hgUGCoNIWPJY8Uz6.kmgcyeTOO9G9QgC/gqjl8C0kFTE3SIa','9847837487',1,'2026-01-30 19:07:54','2026-01-30 19:11:17',NULL,NULL,NULL,NULL),(13,3,'daku','daku@gmail.com','$2b$10$7kLnGYcRdc9KOGuXuiMkgeGKOnT.4q5vHAPStfnq5x/S/z3.Vbs4.','5678678765',1,'2026-01-30 19:48:23',NULL,NULL,NULL,NULL,NULL),(14,2,'tanvi','tanvi@gmail.com','$2b$10$V1jphhkrU4kZDWVQakKnz.cKgW50.AntgMtxafK4/pg6pzpbxl01y','5678789087',1,'2026-01-30 20:10:20','2026-01-30 20:11:38',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `wishlist_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `inventory_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`wishlist_id`),
  UNIQUE KEY `ux_user_inventory` (`user_id`,`inventory_id`),
  KEY `inventory_id` (`inventory_id`),
  CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`inventory_id`) REFERENCES `book_inventory` (`inventory_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` VALUES (48,10,5,'2026-02-01 10:29:33');
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-01 17:37:27
