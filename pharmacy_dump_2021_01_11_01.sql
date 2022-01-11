-- MySQL dump 10.13  Distrib 5.7.23, for Win64 (x86_64)
--
-- Host: localhost    Database: neopharm_db
-- ------------------------------------------------------
-- Server version	5.7.23-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk_admins_userID` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` longtext COLLATE utf8mb4_unicode_ci,
  `contact_number` longtext COLLATE utf8mb4_unicode_ci,
  `designation` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admins_fk_admins_userid_foreign` (`fk_admins_userID`),
  CONSTRAINT `admins_fk_admins_userid_foreign` FOREIGN KEY (`fk_admins_userID`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (2,2,'Isuru','image','0773571232','test','2021-12-29 01:29:32','2021-12-29 01:29:32',NULL);
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `allocation_handlers`
--

DROP TABLE IF EXISTS `allocation_handlers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `allocation_handlers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `manual_allocation` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allocation_handlers`
--

LOCK TABLES `allocation_handlers` WRITE;
/*!40000 ALTER TABLE `allocation_handlers` DISABLE KEYS */;
/*!40000 ALTER TABLE `allocation_handlers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk_cart_customerId` bigint(20) unsigned NOT NULL,
  `fk_cart_itemId` bigint(20) unsigned NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_fk_cart_customerid_foreign` (`fk_cart_customerId`),
  KEY `carts_fk_cart_itemid_foreign` (`fk_cart_itemId`),
  CONSTRAINT `carts_fk_cart_customerid_foreign` FOREIGN KEY (`fk_cart_customerId`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `carts_fk_cart_itemid_foreign` FOREIGN KEY (`fk_cart_itemId`) REFERENCES `off_the_shelf_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Category-01',NULL,'2021-12-29 03:55:58','2021-12-29 03:55:58',NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cities_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Galle',NULL,'2021-12-29 03:11:34','2021-12-29 03:11:34');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complains`
--

DROP TABLE IF EXISTS `complains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complains` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk_complain_orderId` bigint(20) unsigned NOT NULL,
  `fk_complain_customerId` bigint(20) unsigned NOT NULL,
  `complain` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `complains_fk_complain_orderid_foreign` (`fk_complain_orderId`),
  KEY `complains_fk_complain_customerid_foreign` (`fk_complain_customerId`),
  CONSTRAINT `complains_fk_complain_customerid_foreign` FOREIGN KEY (`fk_complain_customerId`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `complains_fk_complain_orderid_foreign` FOREIGN KEY (`fk_complain_orderId`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complains`
--

LOCK TABLES `complains` WRITE;
/*!40000 ALTER TABLE `complains` DISABLE KEYS */;
/*!40000 ALTER TABLE `complains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_favourite_places`
--

DROP TABLE IF EXISTS `customer_favourite_places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_favourite_places` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk_cfp_customerId` bigint(20) unsigned NOT NULL,
  `longitude` longtext COLLATE utf8mb4_unicode_ci,
  `latitude` longtext COLLATE utf8mb4_unicode_ci,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_favourite_places_fk_cfp_customerid_foreign` (`fk_cfp_customerId`),
  CONSTRAINT `customer_favourite_places_fk_cfp_customerid_foreign` FOREIGN KEY (`fk_cfp_customerId`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_favourite_places`
--

LOCK TABLES `customer_favourite_places` WRITE;
/*!40000 ALTER TABLE `customer_favourite_places` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_favourite_places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk_customer_userId` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `pre_existing_conditions` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_contact_unique` (`contact`),
  KEY `customers_fk_customer_userid_foreign` (`fk_customer_userId`),
  CONSTRAINT `customers_fk_customer_userid_foreign` FOREIGN KEY (`fk_customer_userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,4,'Customer-01','0778917921','Male','78569545','45','cust1@gamil.com','image-01','2021-12-29 03:29:26','2021-12-29 03:29:26',NULL,'Pre-1'),(3,5,'Customer-02','0778917922','Male','78569545','45','cust02@gamil.com','image-01','2022-01-11 00:30:08','2022-01-11 00:30:08',NULL,'Pre-1');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drug_restrictions`
--

DROP TABLE IF EXISTS `drug_restrictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drug_restrictions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `restriction` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drug_restrictions`
--

LOCK TABLES `drug_restrictions` WRITE;
/*!40000 ALTER TABLE `drug_restrictions` DISABLE KEYS */;
/*!40000 ALTER TABLE `drug_restrictions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drugs`
--

DROP TABLE IF EXISTS `drugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drugs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk_drugs_restrictionId` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `drugs_name_unique` (`name`),
  KEY `drugs_fk_drugs_restrictionid_foreign` (`fk_drugs_restrictionId`),
  CONSTRAINT `drugs_fk_drugs_restrictionid_foreign` FOREIGN KEY (`fk_drugs_restrictionId`) REFERENCES `drug_restrictions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drugs`
--

LOCK TABLES `drugs` WRITE;
/*!40000 ALTER TABLE `drugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `drugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favourite_items`
--

DROP TABLE IF EXISTS `favourite_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favourite_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk_fv_itemId` bigint(20) unsigned NOT NULL,
  `fk_fv_customerId` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `favourite_items_fk_fv_itemid_foreign` (`fk_fv_itemId`),
  KEY `favourite_items_fk_fv_customerid_foreign` (`fk_fv_customerId`),
  CONSTRAINT `favourite_items_fk_fv_customerid_foreign` FOREIGN KEY (`fk_fv_customerId`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `favourite_items_fk_fv_itemid_foreign` FOREIGN KEY (`fk_fv_itemId`) REFERENCES `off_the_shelf_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favourite_items`
--

LOCK TABLES `favourite_items` WRITE;
/*!40000 ALTER TABLE `favourite_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `favourite_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_06_01_000001_create_oauth_auth_codes_table',1),(4,'2016_06_01_000002_create_oauth_access_tokens_table',1),(5,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(6,'2016_06_01_000004_create_oauth_clients_table',1),(7,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(8,'2019_08_19_000000_create_failed_jobs_table',1),(9,'2021_01_08_061804_create_user_tokens_table',1),(10,'2021_05_03_073349_create_admins_table',1),(11,'2021_05_03_074024_create_networks_table',1),(12,'2021_05_18_081435_create_customers_table',1),(13,'2021_05_18_091441_create_otp_manges_table',1),(14,'2021_05_19_182931_create_pre_exting_conditions_table',1),(15,'2021_05_19_193402_create_countries_table',1),(16,'2021_05_19_193416_create_cities_table',1),(17,'2021_05_19_194846_create_service_areas_table',1),(18,'2021_05_19_203526_create_suppliers_table',1),(19,'2021_05_19_205400_create_supplier_service_area_details_table',1),(20,'2021_05_20_152913_create_categories_table',1),(21,'2021_05_20_153706_create_off_the_shelf_items_table',1),(22,'2021_05_28_052040_create_allocation_handlers_table',1),(23,'2021_05_30_234732_create_orders_table',1),(24,'2021_05_30_235749_create_prescriptions_table',1),(25,'2021_05_31_002848_create_off_the_shell_details_table',1),(26,'2021_05_31_012033_create_order_details_table',1),(27,'2021_06_04_112815_create_payments_table',1),(28,'2021_06_06_113109_create_complains_table',1),(29,'2021_06_06_113709_create_replies_table',1),(30,'2021_06_13_171018_create_drug_restrictions_table',1),(31,'2021_06_13_171046_create_drugs_table',1),(32,'2021_06_13_171145_create_prescriptions_items_details_table',1),(33,'2021_06_13_171212_create_substitute_items_details_table',1),(34,'2021_06_21_034950_create_promotion_lists_table',1),(35,'2021_06_21_150027_create_favourite_items_table',1),(36,'2021_06_23_073934_create_carts_table',1),(37,'2021_06_28_102747_create_customer_favourite_places_table',1),(38,'2021_07_11_193429_create_remaining_original_items_table',1),(39,'2021_07_11_193506_create_remaining_substitute_items_table',1),(40,'2021_07_27_101959_add-customer-id',1),(41,'2021_07_30_032000_add-pre-existing-conditions',1),(42,'2021_08_03_184422_create_received_payments_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `networks`
--

DROP TABLE IF EXISTS `networks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `networks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `networks_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `networks`
--

LOCK TABLES `networks` WRITE;
/*!40000 ALTER TABLE `networks` DISABLE KEYS */;
INSERT INTO `networks` VALUES (1,'Network-01','2021-12-29 03:11:06','2021-12-29 03:11:06',NULL);
/*!40000 ALTER TABLE `networks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES ('30bb640a65cc89f74fe7007e8ead7008db56682a6beb644d8cf61e451138dcb478159fd841c34dc1',2,1,'MyApp','[]',0,'2021-12-29 01:29:32','2021-12-29 01:29:32','2022-12-29 06:59:32'),('54f4836fb9a9eb2c53fa3a3a10997b3f56fcb2134d2c825fd5f838e70abd95af4fe7860bdf2341a9',2,1,'NxtrqumntSEfB7jYqUKaDTbJQ797OE84','[]',0,'2021-12-29 01:38:26','2021-12-29 01:38:26','2022-12-29 07:08:26'),('80f920acb784f8b7a4957f1fef83d88b06d604225ec72a71154a38edf89455601d54486bb156eb7b',1,1,'MyApp','[]',0,'2021-12-29 01:15:14','2021-12-29 01:15:14','2022-12-29 06:45:14'),('a2b699de6b004a7bad5733b01c5ef1ff1f00cc2f08718be653c0936beba46ff7809f4d2b97590fd6',4,1,'4Zm7Sx9D0gT3Q7nhzDxe0G1d60PuyHUY','[]',0,'2021-12-29 03:29:26','2021-12-29 03:29:26','2022-12-29 08:59:26'),('b38cb7bfc6571e013b9a7ad4e79fad4e1557f155f8300ab48fb42cc5f9e4bc0427bc850c5ba1223e',5,1,'jX5ChppKFRJh7HJxFq5WTrF1XHepbKnT','[]',0,'2022-01-11 00:42:51','2022-01-11 00:42:51','2023-01-11 06:12:51'),('b8cb8fb715231b030ee993acf8438c5c9b48c1185a1ea136f6f1ec0dc98255d36b2611b2b6eb8735',3,1,'MyApp','[]',0,'2021-12-29 03:15:11','2021-12-29 03:15:11','2022-12-29 08:45:11'),('dd7707d61ab8c831007f6c5d36e05318c7775d06fb510a022fcff02ad6bc0c794290eafe4acb69b6',5,1,'REqkXEStg42VavWZ8Jgc2bnAQpSHrJY9','[]',0,'2022-01-11 00:30:08','2022-01-11 00:30:08','2023-01-11 06:00:07'),('f50aed4cbde552e46fbe525fdf18a832f5a31d225589187750ddc71c8557087ce03d5e8597a6da33',5,1,'TSBa5EPrq02IYLHXdvdngwuFODJudgpg','[]',0,'2022-01-11 00:30:31','2022-01-11 00:30:31','2023-01-11 06:00:30');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'Laravel Personal Access Client','pfK2TfH4tceUpeGfwERULLpHlopr7alY6BQwBhFY',NULL,'http://localhost',1,0,0,'2021-12-29 01:12:27','2021-12-29 01:12:27'),(2,NULL,'Laravel Password Grant Client','qZcqM32QQI5CGNFfzTOs1yCpnBQNtIUz21YzRrmB','users','http://localhost',0,1,0,'2021-12-29 01:12:27','2021-12-29 01:12:27');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2021-12-29 01:12:27','2021-12-29 01:12:27');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `off_the_shelf_items`
--

DROP TABLE IF EXISTS `off_the_shelf_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `off_the_shelf_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `drug_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fk_otsi_categoryId` bigint(20) unsigned NOT NULL,
  `company_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `register_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `network` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` longtext COLLATE utf8mb4_unicode_ci,
  `details` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `off_the_shelf_items_fk_otsi_categoryid_foreign` (`fk_otsi_categoryId`),
  CONSTRAINT `off_the_shelf_items_fk_otsi_categoryid_foreign` FOREIGN KEY (`fk_otsi_categoryId`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `off_the_shelf_items`
--

LOCK TABLES `off_the_shelf_items` WRITE;
/*!40000 ALTER TABLE `off_the_shelf_items` DISABLE KEYS */;
INSERT INTO `off_the_shelf_items` VALUES (1,'off-drug-1',1,'Mumbai','India','D001','Test','file',NULL,'2021-12-29 03:56:18','2021-12-29 03:56:18',NULL);
/*!40000 ALTER TABLE `off_the_shelf_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `off_the_shell_details`
--

DROP TABLE IF EXISTS `off_the_shell_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `off_the_shell_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk_otsd_itemId` bigint(20) unsigned NOT NULL,
  `fk_otsd_orderId` bigint(20) unsigned NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `off_the_shell_details_fk_otsd_itemid_foreign` (`fk_otsd_itemId`),
  KEY `off_the_shell_details_fk_otsd_orderid_foreign` (`fk_otsd_orderId`),
  CONSTRAINT `off_the_shell_details_fk_otsd_itemid_foreign` FOREIGN KEY (`fk_otsd_itemId`) REFERENCES `off_the_shelf_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `off_the_shell_details_fk_otsd_orderid_foreign` FOREIGN KEY (`fk_otsd_orderId`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `off_the_shell_details`
--

LOCK TABLES `off_the_shell_details` WRITE;
/*!40000 ALTER TABLE `off_the_shell_details` DISABLE KEYS */;
INSERT INTO `off_the_shell_details` VALUES (1,1,1,10,NULL,'2021-12-29 03:58:32','2021-12-29 03:58:32',NULL);
/*!40000 ALTER TABLE `off_the_shell_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk_order_details_orderId` bigint(20) unsigned NOT NULL,
  `fk_order_details_supplierId` bigint(20) unsigned NOT NULL,
  `claim` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_details_fk_order_details_orderid_foreign` (`fk_order_details_orderId`),
  KEY `order_details_fk_order_details_supplierid_foreign` (`fk_order_details_supplierId`),
  CONSTRAINT `order_details_fk_order_details_orderid_foreign` FOREIGN KEY (`fk_order_details_orderId`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_details_fk_order_details_supplierid_foreign` FOREIGN KEY (`fk_order_details_supplierId`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,1,1,0,'2021-12-29 03:58:32','2021-12-29 03:58:32',NULL);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk_order_customerId` bigint(20) unsigned NOT NULL,
  `fk_order_supplierId` bigint(20) unsigned DEFAULT NULL,
  `fk_order_serviceAreaId` bigint(20) unsigned NOT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transport_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `price_other_note` longtext COLLATE utf8mb4_unicode_ci,
  `item_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `price_other` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `substitute` tinyint(1) DEFAULT NULL,
  `eta_hr` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `eta_min` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_instruction` longtext COLLATE utf8mb4_unicode_ci,
  `longitude` decimal(10,2) NOT NULL,
  `latitude` decimal(10,2) NOT NULL,
  `promo_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_range` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_schedule` tinyint(1) NOT NULL DEFAULT '0',
  `total_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_fk_order_customerid_foreign` (`fk_order_customerId`),
  KEY `orders_fk_order_supplierid_foreign` (`fk_order_supplierId`),
  KEY `orders_fk_order_serviceareaid_foreign` (`fk_order_serviceAreaId`),
  CONSTRAINT `orders_fk_order_customerid_foreign` FOREIGN KEY (`fk_order_customerId`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_fk_order_serviceareaid_foreign` FOREIGN KEY (`fk_order_serviceAreaId`) REFERENCES `service_areas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_fk_order_supplierid_foreign` FOREIGN KEY (`fk_order_supplierId`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,1,1,'update-address','Order Dispatched',NULL,100.00,'200',300.00,400.00,'Visa',0,'1','30','test',1.00,2.00,'P0001','2000-10-10','21245',0,0.00,'2021-12-29 03:58:32','2021-12-29 04:17:41',NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `otp_manges`
--

DROP TABLE IF EXISTS `otp_manges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `otp_manges` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk_otp_userID` bigint(20) unsigned DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `otp_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `send_otp_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `otp_manges_phone_number_unique` (`phone_number`),
  KEY `otp_manges_fk_otp_userid_foreign` (`fk_otp_userID`),
  CONSTRAINT `otp_manges_fk_otp_userid_foreign` FOREIGN KEY (`fk_otp_userID`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otp_manges`
--

LOCK TABLES `otp_manges` WRITE;
/*!40000 ALTER TABLE `otp_manges` DISABLE KEYS */;
INSERT INTO `otp_manges` VALUES (1,NULL,'0778917921','123456','5JKpUlVAVeige6fowfo+pNxNKw5Z8TxuD9yM/km1pMV9bL7S5YK+JUqcLU0iFKRtKys=','2021-12-29 08:56:10','2021-12-29 03:26:10','2021-12-29 03:26:10'),(2,NULL,'0773571232','123456','yLWrDxtwXsmdeu2X0NQV9qJBITdQ+DwKHO+y8lOxpsVNcsDj4KXmW1KXOhEgCKQMKC4=','2022-01-11 06:00:14','2022-01-11 00:29:01','2022-01-11 00:30:14');
/*!40000 ALTER TABLE `otp_manges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk_payment_orderId` bigint(20) unsigned NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payments_fk_payment_orderid_unique` (`fk_payment_orderId`),
  CONSTRAINT `payments_fk_payment_orderid_foreign` FOREIGN KEY (`fk_payment_orderId`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
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
-- Table structure for table `pre_exting_conditions`
--

DROP TABLE IF EXISTS `pre_exting_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pre_exting_conditions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk_pec_cusID` bigint(20) unsigned DEFAULT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pre_exting_conditions_fk_pec_cusid_foreign` (`fk_pec_cusID`),
  CONSTRAINT `pre_exting_conditions_fk_pec_cusid_foreign` FOREIGN KEY (`fk_pec_cusID`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pre_exting_conditions`
--

LOCK TABLES `pre_exting_conditions` WRITE;
/*!40000 ALTER TABLE `pre_exting_conditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `pre_exting_conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescriptions`
--

DROP TABLE IF EXISTS `prescriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prescriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk_prescriptions_orderId` bigint(20) unsigned NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `audio` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prescriptions_fk_prescriptions_orderid_foreign` (`fk_prescriptions_orderId`),
  CONSTRAINT `prescriptions_fk_prescriptions_orderid_foreign` FOREIGN KEY (`fk_prescriptions_orderId`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescriptions`
--

LOCK TABLES `prescriptions` WRITE;
/*!40000 ALTER TABLE `prescriptions` DISABLE KEYS */;
INSERT INTO `prescriptions` VALUES (1,1,'image1.png','isuru','80','details-1',NULL,'2021-12-29 03:58:32','2021-12-29 03:58:32',NULL);
/*!40000 ALTER TABLE `prescriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescriptions_items_details`
--

DROP TABLE IF EXISTS `prescriptions_items_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prescriptions_items_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk_pid_prescriptionId` bigint(20) unsigned NOT NULL,
  `fk_pid_drugId` bigint(20) unsigned NOT NULL,
  `substitute_for_item` tinyint(1) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_action` int(11) NOT NULL DEFAULT '0',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `days` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier_select_days` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prescriptions_items_details_fk_pid_prescriptionid_foreign` (`fk_pid_prescriptionId`),
  KEY `prescriptions_items_details_fk_pid_drugid_foreign` (`fk_pid_drugId`),
  CONSTRAINT `prescriptions_items_details_fk_pid_drugid_foreign` FOREIGN KEY (`fk_pid_drugId`) REFERENCES `drugs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prescriptions_items_details_fk_pid_prescriptionid_foreign` FOREIGN KEY (`fk_pid_prescriptionId`) REFERENCES `prescriptions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescriptions_items_details`
--

LOCK TABLES `prescriptions_items_details` WRITE;
/*!40000 ALTER TABLE `prescriptions_items_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `prescriptions_items_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion_lists`
--

DROP TABLE IF EXISTS `promotion_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion_lists` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk_promotions_itemId` bigint(20) unsigned DEFAULT NULL,
  `promotion_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentage` decimal(10,2) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `promo_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion_lists`
--

LOCK TABLES `promotion_lists` WRITE;
/*!40000 ALTER TABLE `promotion_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `received_payments`
--

DROP TABLE IF EXISTS `received_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `received_payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `received_pay_orderId` bigint(20) unsigned NOT NULL,
  `received_pay_supplierId` bigint(20) unsigned NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `url` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `received_payments_received_pay_orderid_foreign` (`received_pay_orderId`),
  KEY `received_payments_received_pay_supplierid_foreign` (`received_pay_supplierId`),
  CONSTRAINT `received_payments_received_pay_orderid_foreign` FOREIGN KEY (`received_pay_orderId`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `received_payments_received_pay_supplierid_foreign` FOREIGN KEY (`received_pay_supplierId`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `received_payments`
--

LOCK TABLES `received_payments` WRITE;
/*!40000 ALTER TABLE `received_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `received_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remaining_original_items`
--

DROP TABLE IF EXISTS `remaining_original_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remaining_original_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk_roi_prescriptionId` bigint(20) unsigned NOT NULL,
  `fk_roi_drugId` bigint(20) unsigned NOT NULL,
  `substitute` tinyint(1) NOT NULL,
  `remaining_days` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `fk_roi_customerId` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `remaining_original_items_fk_roi_prescriptionid_foreign` (`fk_roi_prescriptionId`),
  KEY `remaining_original_items_fk_roi_drugid_foreign` (`fk_roi_drugId`),
  KEY `remaining_original_items_fk_roi_customerid_foreign` (`fk_roi_customerId`),
  CONSTRAINT `remaining_original_items_fk_roi_customerid_foreign` FOREIGN KEY (`fk_roi_customerId`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `remaining_original_items_fk_roi_drugid_foreign` FOREIGN KEY (`fk_roi_drugId`) REFERENCES `drugs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `remaining_original_items_fk_roi_prescriptionid_foreign` FOREIGN KEY (`fk_roi_prescriptionId`) REFERENCES `prescriptions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remaining_original_items`
--

LOCK TABLES `remaining_original_items` WRITE;
/*!40000 ALTER TABLE `remaining_original_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `remaining_original_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remaining_substitute_items`
--

DROP TABLE IF EXISTS `remaining_substitute_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remaining_substitute_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk_rsi_remaining_itemId` bigint(20) unsigned NOT NULL,
  `fk_rsi_drugId` bigint(20) unsigned NOT NULL,
  `remaining_days` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `remaining_substitute_items_fk_rsi_remaining_itemid_foreign` (`fk_rsi_remaining_itemId`),
  KEY `remaining_substitute_items_fk_rsi_drugid_foreign` (`fk_rsi_drugId`),
  CONSTRAINT `remaining_substitute_items_fk_rsi_drugid_foreign` FOREIGN KEY (`fk_rsi_drugId`) REFERENCES `drugs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `remaining_substitute_items_fk_rsi_remaining_itemid_foreign` FOREIGN KEY (`fk_rsi_remaining_itemId`) REFERENCES `remaining_original_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remaining_substitute_items`
--

LOCK TABLES `remaining_substitute_items` WRITE;
/*!40000 ALTER TABLE `remaining_substitute_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `remaining_substitute_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `replies`
--

DROP TABLE IF EXISTS `replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `replies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk_reply_complainId` bigint(20) unsigned NOT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `replies_fk_reply_complainid_foreign` (`fk_reply_complainId`),
  CONSTRAINT `replies_fk_reply_complainid_foreign` FOREIGN KEY (`fk_reply_complainId`) REFERENCES `complains` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replies`
--

LOCK TABLES `replies` WRITE;
/*!40000 ALTER TABLE `replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_areas`
--

DROP TABLE IF EXISTS `service_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_areas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk_service_area_cityId` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `service_areas_name_unique` (`name`),
  KEY `service_areas_fk_service_area_cityid_foreign` (`fk_service_area_cityId`),
  CONSTRAINT `service_areas_fk_service_area_cityid_foreign` FOREIGN KEY (`fk_service_area_cityId`) REFERENCES `cities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_areas`
--

LOCK TABLES `service_areas` WRITE;
/*!40000 ALTER TABLE `service_areas` DISABLE KEYS */;
INSERT INTO `service_areas` VALUES (1,1,'Udugama','2021-12-29 03:11:56','2021-12-29 03:11:56',NULL);
/*!40000 ALTER TABLE `service_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `substitute_items_details`
--

DROP TABLE IF EXISTS `substitute_items_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `substitute_items_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk_sid_pidId` bigint(20) unsigned NOT NULL,
  `fk_pid_drugId` bigint(20) unsigned NOT NULL,
  `quantity` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_action` int(11) NOT NULL DEFAULT '0',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `days` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier_select_days` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `substitute_items_details_fk_sid_pidid_foreign` (`fk_sid_pidId`),
  KEY `substitute_items_details_fk_pid_drugid_foreign` (`fk_pid_drugId`),
  CONSTRAINT `substitute_items_details_fk_pid_drugid_foreign` FOREIGN KEY (`fk_pid_drugId`) REFERENCES `drugs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `substitute_items_details_fk_sid_pidid_foreign` FOREIGN KEY (`fk_sid_pidId`) REFERENCES `prescriptions_items_details` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `substitute_items_details`
--

LOCK TABLES `substitute_items_details` WRITE;
/*!40000 ALTER TABLE `substitute_items_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `substitute_items_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_service_area_details`
--

DROP TABLE IF EXISTS `supplier_service_area_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier_service_area_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk_ssad_supplierId` bigint(20) unsigned NOT NULL,
  `fk_supplier_service_areaId` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `supplier_service_area_details_fk_ssad_supplierid_foreign` (`fk_ssad_supplierId`),
  KEY `supplier_service_area_details_fk_supplier_service_areaid_foreign` (`fk_supplier_service_areaId`),
  CONSTRAINT `supplier_service_area_details_fk_ssad_supplierid_foreign` FOREIGN KEY (`fk_ssad_supplierId`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supplier_service_area_details_fk_supplier_service_areaid_foreign` FOREIGN KEY (`fk_supplier_service_areaId`) REFERENCES `service_areas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_service_area_details`
--

LOCK TABLES `supplier_service_area_details` WRITE;
/*!40000 ALTER TABLE `supplier_service_area_details` DISABLE KEYS */;
INSERT INTO `supplier_service_area_details` VALUES (1,1,1,'2021-12-29 03:15:15','2021-12-29 03:15:15',NULL);
/*!40000 ALTER TABLE `supplier_service_area_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppliers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk_supplier_userId` bigint(20) unsigned NOT NULL,
  `fk_supplier_networkId` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `register_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_doc_url` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `own_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_nic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` longtext COLLATE utf8mb4_unicode_ci,
  `latitude` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `suppliers_fk_supplier_userid_foreign` (`fk_supplier_userId`),
  KEY `suppliers_fk_supplier_networkid_foreign` (`fk_supplier_networkId`),
  CONSTRAINT `suppliers_fk_supplier_networkid_foreign` FOREIGN KEY (`fk_supplier_networkId`) REFERENCES `networks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `suppliers_fk_supplier_userid_foreign` FOREIGN KEY (`fk_supplier_userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,3,1,'Hashan','uioou','umatec97@gmail.com','077894586','R001','wewew','Hashan','5895652',NULL,NULL,'2021-12-29 03:15:11','2021-12-29 03:15:11',NULL);
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tokens`
--

DROP TABLE IF EXISTS `user_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_token` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `fk_user_token_userID` bigint(20) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_tokens_fk_user_token_userid_foreign` (`fk_user_token_userID`),
  CONSTRAINT `user_tokens_fk_user_token_userid_foreign` FOREIGN KEY (`fk_user_token_userID`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tokens`
--

LOCK TABLES `user_tokens` WRITE;
/*!40000 ALTER TABLE `user_tokens` DISABLE KEYS */;
INSERT INTO `user_tokens` VALUES (1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNTRmNDgzNmZiOWE5ZWIyYzUzZmEzYTNhMTA5OTdiM2Y1NmZjYjIxMzRkMmM4MjVmZDVmODM4ZTcwYWJkOTVhZjRmZTc4NjBiZGYyMzQxYTkiLCJpYXQiOjE2NDA3NjE3MDYsIm5iZiI6MTY0MDc2MTcwNiwiZXhwIjoxNjcyMjk3NzA2LCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.c63haG02q0YhFELOOlYHX9HslwPn9vW09vf-jyoYmQsal2-Hh0E-iGcUIJQOKa4nh6nLGei9-Iioqxs6F5d2BflBAInneCBneYZEo_hJCT03T-zcBFtGFGb2QNBeYAyJQxCd1hSpyDAHvnVadI0iIOLJgcKaleYa1mJObtUlKbhycVj5dg88zHI465kYFU685asUbtKimrTDKMhMCAa7r81wT4NebhntH-Lwr9HqDukX3KiJZCSLKwwPpArgrx2XXt3dO1R03u3jS4TY-EmCdcBreOvdHtCmZXUbsGq26j84Or8vrpgjLXmlk40N6Q-jRduCGENcPzxVgEQqTQ8OPsnSSEZkV93k0Fc_cxAKlk7BCgmM6qt146vGIZpwErM3KAdgUy5trGqG_ErYjlRfOhBgkSx9plkz5icr3VJu0avlxG6t_CHRhQRrToGcSeCzDfDG_sFxIt1MABc3pYRm1pdLwFT_Fp7CqVWchaPs_QCWWu3USQSntJOHWMF3aHnkCqGjez8Kh85KkSgTYKyyGHEaUou6siv-pFeWhn4KrLQeT22YlfhzF6XHrJMYymBLL2NJ01yald00snGWqCfE3bPayLOtgGBGGkn4xSgPq821Rdooz4IzXI5HdM8IkvMVQB7quarFtQ-I189NCnvasdSYFwwT73leLj-86S5Jz-8',2,NULL,'2021-12-29 01:38:26','2021-12-29 01:38:26'),(2,'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYTJiNjk5ZGU2YjAwNGE3YmFkNTczM2IwMWM1ZWYxZmYxZjAwY2MyZjA4NzE4YmU2NTNjMDkzNmJlYmE0NmZmNzgwOWY0ZDJiOTc1OTBmZDYiLCJpYXQiOjE2NDA3NjgzNjYsIm5iZiI6MTY0MDc2ODM2NiwiZXhwIjoxNjcyMzA0MzY2LCJzdWIiOiI0Iiwic2NvcGVzIjpbXX0.riMWwgR80Wr5Zt5OJ2LqCQnf6BPtqc4oJ2OX3oh2M8BIkPJysd1lVcNMJ0vRLCykp-69PEodngG9w7Veu9E91m7eu8jPpa6JDwv9I8ta4m6ie0er2gVqKDmMQs5UCXZ2MNxocwRl6U-h-BCMbQcSqwp1tC2o48O-Ln65UJOoSP8W5qiM7kuXSrqYCr2CpzQEz4nBqHnNn4FubgPGhh282Fpiwy1fDCuibJj8Iuel9nsJllLC_DaZL_mcuQnM0wHX5HsLkUCGqPo4TcaqA5YyY9ZILNFrklU_ux2vsbRGlxTpSYGka6-ogX_HkKl3SVGM228a-xk9td67VCYlOTTCVIVEhotLbDDTv3gJ0JDkNy3gxSvvTNs8E4WBe33-fPmiDtxLh2jI0k7jcF8zh10miRTIOygfC1fsn8c1KJhp9AG8C9E1MUyCJbyeUiWAgIwurDUceUrKvecUVTe-EK-jr0QnA33cIwZfFIU14utTVSC7cU1AwZS5agUnIXI27vJ87jfmDdkht5gnTtZhzjyON7y053fAUgDeZrxjaUEJ91zly_wwZcHdDDCWVATaiA-igtKDMpkr_SBxyVMZo4vDaOCjJWDje0EJ7NKz-esdvhyTShw0Aw7z7nigvGzc5uTxBHzR0_rujzWjojMLQiqVpkbz6244lwhMF46CoBR6wwg',4,NULL,'2021-12-29 03:29:26','2021-12-29 03:29:26'),(3,'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZGQ3NzA3ZDYxYWI4YzgzMTAwN2Y2YzVkMzZlMDUzMThjNzc3NWQwNmZiNTEwYTAyMmZjZmYwMmFkNmJjMGM3OTQyOTBlYWZlNGFjYjY5YjYiLCJpYXQiOjE2NDE4ODA4MDgsIm5iZiI6MTY0MTg4MDgwOCwiZXhwIjoxNjczNDE2ODA3LCJzdWIiOiI1Iiwic2NvcGVzIjpbXX0.1PwcHiHm1SWc_f4HoDTJLuPcGa6-VXLVMUZY7a0VRJY6-h9Tak6k2cBr7DyDKzjUEYRtJRXrrVbEokrJ3Mii7PD44DDlhoYIdxkQuYIYS9QK0RR0Zor56RQttGxbQGN7ru1QF6AAZCF0-5QyMutj5g3WIkXHfDPuY2BH8fwDKRF-MJ2TfrjLy2OgoWANazb2_bDO51IST_nqyc3GhlHc7mmWuzatNhLShYGwfkKcgo4h9HSjVqiCrNMUIiud9KUPHWJtMIyUUcpVTMoOBZrFMH-gDahXLMe7OzPJAo3UwTksrlQef8Uin3BSRSHL0Oax0BtGeFa4X72yp2k1m2Mo1ya9zvsLbVxkP-WRpK_nxFeeJU24QkYIqkJJYUEL7mfApwymboc92-1fMpeEbdsU4AKz13jtjSIwugI9KTcRa8BzssGV9zTXHZwrBsbA-W-yWLdGRw8dWYxvOsT9dqCzFNAndbwlNjwGnCb0tWTyGcRwg3bHG2Gm1b8POxcB6_8DADFmaIoijppJZ7QSnRWJjapDS80VzZ-c0eiSvcab9M6_dzRM3jRHFTj4bbgJinJ2blrqR3aaGAVPztXAwqVb_IG3-7HBhNuxamE6gfcl-sErz_wlMlnjIKwENKCSBxsOku9SX_NbLpf4105-BfFTjF-D1juXvyIqjgIvcwOLItk',5,NULL,'2022-01-11 00:30:08','2022-01-11 00:30:08'),(4,'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZjUwYWVkNGNiZGU1NTJlNDZmYmU1MjVmZGYxOGE4MzJmNWEzMWQyMjU1ODkxODc3NTBkZGM3MWM4NTU3MDg3Y2UwM2Q1ZTg1OTdhNmRhMzMiLCJpYXQiOjE2NDE4ODA4MzEsIm5iZiI6MTY0MTg4MDgzMSwiZXhwIjoxNjczNDE2ODMwLCJzdWIiOiI1Iiwic2NvcGVzIjpbXX0.O1dTsbQm63t-v9cSAU3pzjJ_EnmQK3yu9S-DFcex90KQCKxyR9Cwi9PF2ker-SFmPqcLmv8JWL0G8zbb6-V5yJIqpjxMuUcOz_29AwCdnEH7SIAEaAmDppkmQAJuTfMFyO7XRmSSkVlHf8IiqqVFdxamwfRdQNQ0wdsTV0RtajNzB7nQBoI9Io_KYmFsD5htLiFuHV5MXfdcEjyMFfSCA04Ze4rxNisUhaUfGt1CSHIIpSAOnZq7YRXGqJqUuT2MsqXxvkh-nC38wmIQBO2-37i-XB1Pl5juSgRAfURO8Cv9sJRno7naWroS363c1d-AcnharzoMYsjujp36cByreUdI1jh86QNAcvHWFboJ6PBLBKeUtIn7pi79WVmIX_ra_2V9orxMaCi-u694It_WOvBQtUWbSDINKX89PvVrRWD2i85rvEJMT4CE8DchN4LZ4OnLv064GAsjOKD-fG-3BVPjgeYkUne1HrLvBCxfX2Qc_lSLD9gcKRPR6UMpQJZWTMgOQLuPD-JSk73gnO1mRpAoYZaa17q67OTDGwXO5POX3CCFW3wcMLXZrgnml1LMWO1abDMG4IJj2PW4grGH7OCi2OZ_M7EyS7vRpEh7LYu11Zi861QNHFaDbKcSvGI1U6M-MRWmDIGwa-rgiswTA23056pkT3etP0XI4WrmcWA',5,NULL,'2022-01-11 00:30:31','2022-01-11 00:30:31'),(5,'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYjM4Y2I3YmZjNjU3MWUwMTNiOWE3YWQ0ZTc5ZmFkNGUxNTU3ZjE1NWY4MzAwYWI0OGZiNDJjYzVmOWU0YmMwNDI3YmM4NTBjNWJhMTIyM2UiLCJpYXQiOjE2NDE4ODE1NzEsIm5iZiI6MTY0MTg4MTU3MSwiZXhwIjoxNjczNDE3NTcxLCJzdWIiOiI1Iiwic2NvcGVzIjpbXX0.OWyaP-yqUueOAFmAhAb4aXXBW9TGLNWu8YHcjiUCHXwEpRsZ1l4Aot3omcl44mGbTQ1VnsaQ3mgo_ppxIrvVg02Ji8pWm_LGAChsJ47TP2MyKPBvA7IehvPPnA9yLbM_HB0GcUULRCHf8C3xBuU7MOl1GP_eTkv-TlqRDXqNBazfJ1S1vNHMrnYL_0hwczgqpvVn9RVMgFItdP7xBxolBP-AlrExqknF9EluPu2HUuE4eAEm0tUR_qpmrPYb_-giH2ktsY2bXlWRFppAc9j8Ra9B8As7vKny9qITtZ21NEGS4grgb1i8SBIq9lMx0H7af_c-j8kb0yPlRp3S7xff_ilSOF9di1Y4VtR_puPbvbtbIlhzj_d76fE3pke1WffRKP88KwMDTmLd8dy0VD5hK_C6FPbwQhjuHORc72uNxG97gc-ADK-RfYmxYqPGmpKy5dMgb6ZCEoe0ZK6hNDZwUzlZkp4qOpmRxXWwSMlakoXpktENvV2N8DLY-5o6pki1InlMuXXi6n7h9jDVkiPzRImxAIuomMSzyTQiS7fpYbeVrOZ_zYufvcg-jH5TPoJiXeHMtZ8QDy6kKJ5B9pF6JZTSYJpEdGCbtQg_MFT8IWQZNO8C1PsH5P5tqlU82uBpSmHpDMtXmeMKh3gYcVY-CINrU6fZjqfrWXD-ItpxjGs',5,NULL,'2022-01-11 00:42:51','2022-01-11 00:42:51');
/*!40000 ALTER TABLE `user_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_token` longtext COLLATE utf8mb4_unicode_ci,
  `otp_send_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'isuru97','umayangaisuru97@gmail.com','SuperAdmin','2021-12-29 07:08:07','$2y$10$rPZgYfZeqWa8a4i2B86CQeyxDvyea8t.cf47MVnDMNJ5SiYwIpKLC','eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMzBiYjY0MGE2NWNjODlmNzRmZTcwMDdlOGVhZDcwMDhkYjU2NjgyYTZiZWI2NDRkOGNmNjFlNDUxMTM4ZGNiNDc4MTU5ZmQ4NDFjMzRkYzEiLCJpYXQiOjE2NDA3NjExNzIsIm5iZiI6MTY0MDc2MTE3MiwiZXhwIjoxNjcyMjk3MTcyLCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.eBSGU3U00pWLWCmKmn3Hcl9JbRZbvVCk07vBEJsJotUDJWcSGL-WXEBBI1lBe9ekLE2oCZBzuNgi57MlCKccKdUxFdlnh-wTNgz4P2eSM0DR67IvpauMap-Tt0Vf9iibXkdhKyRHZrQPwizhf2wTZqs6iR1u4CJBnI3wrSxiBwN03YZMDT-aUcjuEfEQuY4UnYef0ar8z_5NGB61pWx3QdsM0LsLEtJ210TKR2Iu0Z-u7dpuHp1cfDE7I_4tUxdhlHVa-CWNrcFm0lZLHtV1fI4YGYL5MeeSyBssS4L95-zqX0Okkiumh7GszTvBB-7LPyj-Fx_8ngUb44sadVignIKyiN3kIY7X_c8rZIC97fYont1rrjXg1pxq0zjkSSTsCvniX51YxNnRwpQyySgxdHOI_u1kcujrbjpDI3Qhzgur5m6rfvh5Ii_z_69Zndm7-AUZn9kKoDe-5ittyXLsB9qrxx9DWBkpTI9Q6EqCTsr_8qEaxqVn_47hiv8RIBYqV39ZKILpHiiEeyxcM0QYktWzY8WfaFv7Kub7Z3bzLLSFa0VgrA6rNRupiq7NAFOigFnTgHI7o-3BxiYP9OBc2UIGz331sRi-rijdoQeMb8tYcCDcqVMAvBBnlJinP35jP-xf2NvdWZ9QsLTjoIYlf9xKp4VOAMd1LdONS20mXGE',NULL,NULL,'2021-12-29 01:29:32','2021-12-29 01:29:32',NULL),(3,'hashan97','umatec97@gmail.com','Supplier','2021-12-29 08:45:48','$2y$10$hgdouAuINdec1MJmgOHhn.vFz/lA7k85Y0ZnJHvAI72x3WifCvMsS','eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYjhjYjhmYjcxNTIzMWIwMzBlZTk5M2FjZjg0MzhjNWM5YjQ4YzExODVhMWVhMTM2ZjZmMWVjMGRjOTgyNTVkMzZiMjYxMWIyYjZlYjg3MzUiLCJpYXQiOjE2NDA3Njc1MTEsIm5iZiI6MTY0MDc2NzUxMSwiZXhwIjoxNjcyMzAzNTExLCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.drZUzjx6rW1_VulvWmlGfce-wUahNwtn-h46SR_fb1Sz02dEPgn-WnROycQRXesGK0hAc_FxKm4XFLEPkQy4aClUO6UWeJLUAG_0N6hg53aCTpb2w3yqxvKfx9QNt-ULYyoodL04WWuqwB_SV-B78fsMQ0bJ5Tml-NSpfP23NLfrgZImA_K9lxf9zsshfIScwFyl7Y7n3Nb04pEHcz9QsVP7ngJfeWLR5dpPHKbY3ACixGOXSMCiB0f-M5jS8cnqc-O36oH41td6J0Q700hfHmBU17bU0ZbL_MPI7_QY4pu5uCo1i4JQKoKtoVMjN_lbZWtff0iUdeBsW630usb7630sIZxg0Rzv8PIco0l6EO66h9q8vuWdx07IZQVUnqQOzyuBdtNZrOt1whxBvRO_wMZHnJCz4QPwumw75tmJfEj0XeDrKvs4AI72oynLzpfjibT_XFTKvvdhRjbvAUNJZsB7TE4T-iEnxzmEzZhJCgwrBwB0799y9yLyRGyojXXUscZ8amJbc55vDxCH0CCpEqOMksjE1oih_0B173zY5CFFNPINLZnN31F8JI1JuoowBHCPBozYETKbLjlQDUiStnxrUVTWuUyIM0LlNRebsjKk_NWZk8dorBWf8_8w3hMrJOTjeegieDwcG9KyvCW33oxbgBcR_feZoVyu3g1hWLg',NULL,NULL,'2021-12-29 03:15:11','2021-12-29 03:15:11',NULL),(4,'0778917921','cust1@gamil.com','Customer','2021-12-29 03:26:10','$2y$10$//ci71A1apPc.Y2Jsmgn1OlZAnmIUtl/nXBsKoGW7Lcq6kBF2/jcK','5JKpUlVAVeige6fowfo+pNxNKw5Z8TxuD9yM/km1pMV9bL7S5YK+JUqcLU0iFKRtKys=','2021-12-29 08:56:10',NULL,'2021-12-29 03:26:10','2021-12-29 03:26:10',NULL),(5,'0773571232','0773571232notregister@gmail.com','Customer','2022-01-11 00:30:14','$2y$10$Jgbgu./Tbdyu2CUqmVP45eKfasnvSBmKNOnolcSBx.dk5StSDAfAe','yLWrDxtwXsmdeu2X0NQV9qJBITdQ+DwKHO+y8lOxpsVNcsDj4KXmW1KXOhEgCKQMKC4=','2022-01-11 06:00:14',NULL,'2022-01-11 00:29:01','2022-01-11 00:30:14',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-11 11:51:48
