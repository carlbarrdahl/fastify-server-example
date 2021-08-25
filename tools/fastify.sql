-- MariaDB dump 10.19  Distrib 10.4.20-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: fastify
-- ------------------------------------------------------
-- Server version	10.4.20-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory` (
  `id` char(36) NOT NULL,
  `quantity` int(11) NOT NULL,
  `expiry_date` date NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `productId` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_c8622e1e24c6d054d36e8824490` (`productId`),
  CONSTRAINT `FK_c8622e1e24c6d054d36e8824490` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `expires_in` int(11) NOT NULL,
  `unit` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('084d661a-f2b8-4c74-ba81-cac451abead9','test2','oe122enuendw',400,'$','2021-08-23 09:28:19.586354','2021-08-23 09:28:19.586354'),('0af7f44d-7ab7-4d9e-a175-3776bb439c31','product_189','dwefnewfjn',100,'€','2021-08-24 22:43:49.324085','2021-08-24 22:43:49.324085'),('34a527a4-2d83-493a-a26d-37971dca97f1','product_187','dwefnewfjn',100,'€','2021-08-24 22:43:49.346047','2021-08-24 22:43:49.346047'),('48b5e36c-ac3e-4dc5-a534-3fd5e0dd923e','product_186','dwefnewfjn',100,'€','2021-08-24 22:43:49.329783','2021-08-24 22:43:49.329783'),('4c8c55ba-168a-479a-a7f8-2a91627f627d','product_161','dwefnewfjn',100,'€','2021-08-24 22:31:40.134242','2021-08-24 22:31:40.134242'),('537c7216-cdc9-4fb4-b6b7-1dade392db4e','product_1897','dwefnewfjn',100,'€','2021-08-24 13:47:59.926486','2021-08-24 13:47:59.926486'),('53954431-4774-40ba-88d4-5b9b38b83998','product_265','dwefnewfjn',100,'€','2021-08-24 22:31:42.026381','2021-08-24 22:31:42.026381'),('5cc52c9c-79c8-499c-8ab4-f85c0dc404eb','product_1890','dwefnewfjn',100,'€','2021-08-24 13:47:59.925362','2021-08-24 13:47:59.925362'),('5da9f5c0-410d-41c7-a020-7bca9dc3a7cc','test1','oe122en',400,'€','2021-08-23 09:28:29.370292','2021-08-23 09:28:29.370292'),('5f46ee45-d7fe-4937-b511-b5ca81f9f3da','product_186','dwefnewfjn',100,'€','2021-08-24 22:43:49.341600','2021-08-24 22:43:49.341600'),('6cda1804-61fb-48ea-8a28-4c142c83ce74','product_569','dwefnewfjn',100,'€','2021-08-24 19:05:09.235592','2021-08-24 19:05:09.235592'),('75194e71-689c-41db-a409-714ce6352621','product_189','dwefnewfjn',100,'€','2021-08-24 22:43:49.332853','2021-08-24 22:43:49.332853'),('8304396f-2aa6-43d4-b518-461897989bdd','product_187','dwefnewfjn',100,'€','2021-08-24 22:43:49.337149','2021-08-24 22:43:49.337149'),('83904c6a-a08c-489a-925c-5cf3557d9d17','product_188','dwefnewfjn',100,'€','2021-08-24 22:43:49.340162','2021-08-24 22:43:49.340162'),('8d15c8cc-678f-4dc9-818b-15ed811b375d','test3','sdwdd',400,'€','2021-08-23 09:28:42.064275','2021-08-23 09:28:42.064275'),('a1ee1c0e-e590-4041-8bdf-942937cb41e0','product_1900','dwefnewfjn',100,'€','2021-08-24 13:47:59.929111','2021-08-24 13:47:59.929111'),('cc08b1b7-a789-4254-83ff-6af12c34fd73','product_1885','dwefnewfjn',100,'€','2021-08-24 13:47:59.928492','2021-08-24 13:47:59.928492'),('da0e7a46-a6f6-4501-8161-0f4c8ded8725','product_1891','dwefnewfjn',100,'€','2021-08-24 13:47:59.935541','2021-08-24 13:47:59.935541'),('dc7ee450-3112-4007-a309-698083e2859d','product_1884','dwefnewfjn',100,'€','2021-08-24 13:47:59.928974','2021-08-24 13:47:59.928974'),('ed433991-607b-45cb-ba6c-a82563d7fd65','product_224','dwefnewfjn',100,'€','2021-08-24 22:31:41.181975','2021-08-24 22:31:41.181975');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_e12875dfb3b1d92d7d7c5377e2` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'user1','$2a$12$zFT1qo8mMo8P4txlx3pHc.Z81xQGCudu/zNbl..9J6bCYo2YTSPHm','user1@x.y','2021-08-24 13:22:50.259966','2021-08-24 19:30:10.099711'),(2,'user2','$2a$12$2yLhwAJMMxhUOtp8ay8ccukQ9EkSiG6WTamrT/SDK6a9TE5KYNmda','user2@x.y','2021-08-24 13:22:59.828051','2021-08-24 19:35:02.311458');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-25 11:25:25
