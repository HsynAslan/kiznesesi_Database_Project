CREATE DATABASE  IF NOT EXISTS `eticaret` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `eticaret`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: eticaret
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `campaigns`
--

DROP TABLE IF EXISTS `campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaigns` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `discount_amount` decimal(10,2) NOT NULL,
  `code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `campaigns_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaigns`
--

LOCK TABLES `campaigns` WRITE;
/*!40000 ALTER TABLE `campaigns` DISABLE KEYS */;
INSERT INTO `campaigns` VALUES (1,1,10.00,'WINTER2024','2024-12-21 23:37:51'),(2,2,20.00,'SUMMER2024','2024-12-21 23:37:51'),(3,3,15.00,'NEWYEAR2024','2024-12-21 23:37:51');
/*!40000 ALTER TABLE `campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `feature_id` int DEFAULT NULL,
  `feature_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `feature_id` (`feature_id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`feature_id`) REFERENCES `product_features` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (9,8,5,5,'2024-12-21 22:07:44',2,'mavi'),(10,8,1,1,'2024-12-21 22:07:49',NULL,NULL),(13,9,2,3,'2024-12-22 09:41:39',NULL,NULL);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Elektronik','Telefonlar, bilgisayarlar, televizyonlar ve diğer elektronik cihazlar'),(2,'Moda','Kadın ve erkek giyim, ayakkabı, çantalar ve aksesuarlar'),(3,'Ev Eşyaları','Mobilya, mutfak eşyaları, dekorasyon ürünleri'),(4,'Kitaplar','Farklı türlerde kitaplar: romanlar, akademik kitaplar, çocuk kitapları'),(5,'Gıda','Yiyecek ve içecekler, organik ve sağlıklı ürünler');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_replies`
--

DROP TABLE IF EXISTS `comment_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_replies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `review_id` int NOT NULL,
  `user_id` int NOT NULL,
  `reply_text` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `review_id` (`review_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `comment_replies_ibfk_1` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comment_replies_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_replies`
--

LOCK TABLES `comment_replies` WRITE;
/*!40000 ALTER TABLE `comment_replies` DISABLE KEYS */;
INSERT INTO `comment_replies` VALUES (3,5,8,'asda','2024-12-12 11:21:50'),(4,6,8,'asdad','2024-12-12 12:19:39'),(5,6,8,'asdadd','2024-12-12 12:19:48'),(6,14,9,'asdasd','2024-12-21 23:09:36'),(7,13,9,'asdad','2024-12-21 23:09:43'),(8,13,9,'asdads','2024-12-21 23:12:46'),(9,14,9,'asdasdad','2024-12-21 23:12:50'),(10,11,9,'bence de','2024-12-21 23:13:02'),(11,14,9,'saqeadsad','2024-12-21 23:18:10'),(12,7,9,'bencde de güzel','2024-12-21 23:18:31'),(13,14,9,'admin mi sin','2024-12-21 23:20:01'),(14,11,9,'bende gzeü','2024-12-21 23:20:34'),(15,16,9,'bende beğenmedim','2024-12-21 23:21:15'),(16,16,8,'bende beğenmedim','2024-12-21 23:21:34'),(17,16,8,'bende beğendim','2024-12-21 23:22:58'),(18,16,8,'bende beğendimm 2','2024-12-21 23:29:34'),(19,17,9,'bende abe','2024-12-21 23:30:28');
/*!40000 ALTER TABLE `comment_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comparisons`
--

DROP TABLE IF EXISTS `comparisons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comparisons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product1_id` int NOT NULL,
  `product2_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `product1_id` (`product1_id`),
  KEY `product2_id` (`product2_id`),
  CONSTRAINT `comparisons_ibfk_1` FOREIGN KEY (`product1_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comparisons_ibfk_2` FOREIGN KEY (`product2_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comparisons`
--

LOCK TABLES `comparisons` WRITE;
/*!40000 ALTER TABLE `comparisons` DISABLE KEYS */;
INSERT INTO `comparisons` VALUES (1,1,5,'2024-12-22 23:43:24');
/*!40000 ALTER TABLE `comparisons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounted_products`
--

DROP TABLE IF EXISTS `discounted_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discounted_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cart_id` int NOT NULL,
  `old_price` decimal(10,2) DEFAULT NULL,
  `new_price` decimal(10,2) DEFAULT NULL,
  `discount_code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounted_products`
--

LOCK TABLES `discounted_products` WRITE;
/*!40000 ALTER TABLE `discounted_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `discounted_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `FK_product_id` (`product_id`),
  CONSTRAINT `FK_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (3,3,1,12,25000.00),(4,3,3,55,200.00),(5,4,1,1,25000.00),(6,4,2,1,50000.00),(7,5,1,1,25000.00),(8,6,2,1,50000.00),(9,7,2,1,50000.00),(10,9,1,1,25000.00),(11,9,2,1,50000.00),(12,10,3,3,200.00);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` enum('pending','completed','cancelled') DEFAULT 'pending',
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `shipping_company_id` int DEFAULT NULL,
  `address` text NOT NULL,
  `shipping_status` enum('pending','shipped','delivered','canceled') DEFAULT 'pending',
  `payment_method` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `fk_shipping_company` (`shipping_company_id`),
  CONSTRAINT `fk_shipping_company` FOREIGN KEY (`shipping_company_id`) REFERENCES `shipping_companies` (`id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,6,51000.00,'pending','2024-12-11 14:20:20',5,'Ankara','pending',''),(2,6,301000.00,'pending','2024-12-11 14:56:02',4,'keçiören','pending',''),(3,6,311000.00,'pending','2024-12-11 15:01:39',2,'yenimahalala','pending',''),(4,8,75000.00,'pending','2024-12-11 15:04:59',2,'esertepe','pending',''),(5,8,25000.00,'pending','2024-12-11 15:12:08',1,'wefwaqefrqwaefwaqfaqw','delivered',''),(6,8,50000.00,'pending','2024-12-11 15:19:43',2,'aagasdad','pending',''),(7,8,50000.00,'pending','2024-12-11 15:20:00',1,'Ankara Keçiören','pending',''),(8,8,0.00,'pending','2024-12-11 15:36:38',1,'Ankara Keçiören','pending',''),(9,8,75000.00,'pending','2024-12-11 15:42:54',1,'asdads','pending','paypal'),(10,9,600.00,'pending','2024-12-20 10:16:24',2,'Ankara','delivered','paypal');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_features`
--

DROP TABLE IF EXISTS `product_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_features` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `feature_name` varchar(100) DEFAULT NULL,
  `feature_image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_features_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_features`
--

LOCK TABLES `product_features` WRITE;
/*!40000 ALTER TABLE `product_features` DISABLE KEYS */;
INSERT INTO `product_features` VALUES (1,5,'siyah','/uploads/c9ac5b134e82f184ae555883d96fd075'),(2,5,'mavi','/uploads/6e3566126a67873873eb86da409847b2');
/*!40000 ALTER TABLE `product_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `stock` int DEFAULT '0',
  `category_id` int DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'İphone 11','128 GB beyaz',25000.00,100,1,'/uploads/164f5c23df954cf168bb5e806f9a9a17','2024-12-11 02:16:14'),(2,'Asus Tuf','4050 Ekran Kartı',50000.00,200,1,'/uploads/9f6bc017d0bfcc8e75bfcfbccc3797f9','2024-12-11 02:28:08'),(3,'makyaj','mat ruj ',200.00,100,2,'/uploads/165d0002e94fd52151fcef81da41fd0a','2024-12-11 12:05:12'),(4,'İphone 11','Apple İphone 11',25000.00,100,1,'/uploads/2e119cbc0c200c6220809e42cafd6ac6','2024-12-21 09:50:20'),(5,'iphone 11111','asazcasd',30000.00,1000,1,'/uploads/faac641a07197d22310b51efd1ef3f02','2024-12-21 12:12:13');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_votes`
--

DROP TABLE IF EXISTS `review_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_votes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `review_id` int NOT NULL,
  `user_id` int NOT NULL,
  `vote` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `review_id` (`review_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `review_votes_ibfk_1` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`) ON DELETE CASCADE,
  CONSTRAINT `review_votes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_votes`
--

LOCK TABLES `review_votes` WRITE;
/*!40000 ALTER TABLE `review_votes` DISABLE KEYS */;
INSERT INTO `review_votes` VALUES (1,6,8,1,'2024-12-12 12:20:07'),(2,6,4,1,'2024-12-12 11:35:29'),(3,5,4,-1,'2024-12-12 11:35:41'),(4,6,9,1,'2024-12-20 10:59:31'),(5,8,9,1,'2024-12-21 10:15:09'),(6,11,9,1,'2024-12-21 23:13:58'),(7,17,9,1,'2024-12-21 23:30:31');
/*!40000 ALTER TABLE `review_votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `comment` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reviews_chk_1` CHECK ((`rating` between 1 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (5,8,1,3,'xcvscdfvs','2024-12-12 11:21:47'),(6,8,1,1,'asdadd','2024-12-12 11:23:30'),(7,9,4,3,'güzel','2024-12-21 10:03:05'),(8,9,4,5,'asdadasdd','2024-12-21 10:03:14'),(9,9,1,2,'yeni','2024-12-21 10:26:50'),(10,9,1,3,'en yeni','2024-12-21 11:03:19'),(11,9,5,3,'asdad','2024-12-21 12:50:23'),(12,8,1,3,'güzel - düzenlendi','2024-12-21 22:19:30'),(13,8,1,5,'çok iyi','2024-12-21 22:32:00'),(14,3,1,4,'admin yazdı','2024-12-21 23:03:41'),(15,9,5,1,'dasda','2024-12-21 23:14:05'),(16,9,2,1,'beğenmedim','2024-12-21 23:21:09'),(17,3,2,3,'yöneticiiym ve beğendim','2024-12-21 23:30:14');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_companies`
--

DROP TABLE IF EXISTS `shipping_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipping_companies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_companies`
--

LOCK TABLES `shipping_companies` WRITE;
/*!40000 ALTER TABLE `shipping_companies` DISABLE KEYS */;
INSERT INTO `shipping_companies` VALUES (1,'Yurtiçi Kargo',25.50,'Türkiye çapında kargo taşımacılığı hizmeti, uygun fiyatlar ve güvenilirlik.'),(2,'PTT Kargo',18.75,'Devletin resmi kargo şirketi, uygun fiyatlı ve geniş hizmet ağı.'),(3,'Aras Kargo',22.00,'Yüksek kaliteli taşımacılık, hızlı teslimat ve uygun fiyatlar.'),(4,'MNG Kargo',20.00,'Geniş hizmet ağı ve hızlı teslimat seçenekleri, müşteri memnuniyeti garantisi.'),(5,'HepsiJet',30.00,'E-ticaret odaklı hızlı teslimat ve uygun fiyatlarla kargo çözümleri.');
/*!40000 ALTER TABLE `shipping_companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_messages`
--

DROP TABLE IF EXISTS `support_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `response` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_messages`
--

LOCK TABLES `support_messages` WRITE;
/*!40000 ALTER TABLE `support_messages` DISABLE KEYS */;
INSERT INTO `support_messages` VALUES (1,0,'sdfsf','fsf@a','asdad',NULL,'2024-12-11 18:09:47'),(2,0,'Hüseyin','btdhaslan@gmail.com','hata mevcut',NULL,'2024-12-11 18:16:45'),(3,0,'asdas','dada@asdad','dsdad','asdada','2024-12-11 18:18:37'),(4,8,'asdadd','d@asda','asdad','halloldu','2024-12-11 18:24:33'),(5,9,'Hüseyin Aslan','btdhaslan10@gmail.com','adsadadsasdsaddads',NULL,'2024-12-20 10:44:14');
/*!40000 ALTER TABLE `support_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `address` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `role` enum('user','admin') DEFAULT 'user',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,'Kevser Aslan','kevseraslan098@gmail.com','$2b$10$IK/Eqbuo2qka3M04VHk9iumI3.bKCvK5u03GDnKkTCKlH4SigJMLG','05437610998','Pendik Esenyalı','2024-12-11 01:57:06','admin'),(4,'Doğukan Aslan','btdhaslan2@gmail.com','$2b$10$67XI1h94OLXlBwZ8LWGTved9681jJvHMUxafXNLSwB3.rS8Yst5uy','4567891236','asdaddad','2024-12-11 02:29:13','user'),(5,'hüseyin asla','btdhaslan54@gmail.com','$2b$10$gPQqP9QSE4.lwAe3fTjzL.GPctiSGGh9gf33M0C0ZhjgdXnWd13ma','123456789','asdas','2024-12-11 02:51:42','user'),(6,'hüseyin','btdhaslan5@gmail.com','$2b$10$7zsmQ0hglP7ThjqHRtUDVObZpWJhtSCUPj8tfavTO8P8fUeqHHicq','123456789','ankara','2024-12-11 02:59:19','user'),(7,'Hüseyin Aslan','btdhaslan7@gmail.com','$2b$10$QBrRSX8jlZ7.O/xv9ZRnfOHHnyIH0oGIPHDedO.U193PycVA91kQO','123456789','Ankara','2024-12-11 11:37:32','user'),(8,'huso','btdhaslan8@gmail.com','$2b$10$ZNAN3orf/BuezbF.t7B6uOe4jpnRClCNYMxTx3PTlUVxbZ8pLM6sC','123456','asdasdasdad','2024-12-11 15:04:36','user'),(9,'Hüseyin Aslann','btdhaslan10@gmail.com','$2b$10$jAQCVyikhau4eo1VAAcIPe3kKZM6NpohrfereEzy.56O0Jj5dNRAK','05075807020','19 Mayıs Cad. 19 / 12 Keçiören Ankaraaa','2024-12-12 13:10:02','user');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlists`
--

DROP TABLE IF EXISTS `wishlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlists` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `wishlists_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlists_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlists`
--

LOCK TABLES `wishlists` WRITE;
/*!40000 ALTER TABLE `wishlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlists` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-23  2:53:36
