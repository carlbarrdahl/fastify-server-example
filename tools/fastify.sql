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
INSERT INTO `product` VALUES ('025b818c-051d-452a-accb-4a04797f4fdf','product_1034','dwefnewfjn',100,'€','2021-08-24 13:52:59.209698','2021-08-24 13:52:59.209698'),('03132f75-36ca-47b7-aaea-f505b270111b','product_1010','dwefnewfjn',100,'€','2021-08-24 13:52:59.207302','2021-08-24 13:52:59.207302'),('0557c387-62fc-4bc2-92a6-1d2c84ecb408','product_1009','dwefnewfjn',100,'€','2021-08-24 13:52:59.347531','2021-08-24 13:52:59.347531'),('08385f29-9135-4fbd-9110-14b5cea33b42','product_1010','dwefnewfjn',100,'€','2021-08-24 13:52:59.167167','2021-08-24 13:52:59.167167'),('084d661a-f2b8-4c74-ba81-cac451abead9','test2','oe122enuendw',400,'$','2021-08-23 09:28:19.586354','2021-08-23 09:28:19.586354'),('0942df64-eadb-4127-9aa5-7dea1d55840f','product_1011','dwefnewfjn',100,'€','2021-08-24 13:52:59.170090','2021-08-24 13:52:59.170090'),('12c1ccb3-deb2-4718-b78f-da2422f61a99','product_1009','dwefnewfjn',100,'€','2021-08-24 13:52:59.206672','2021-08-24 13:52:59.206672'),('134249cb-a7c4-4887-bbe3-3108191601c6','product_1015','dwefnewfjn',100,'€','2021-08-24 13:52:59.345568','2021-08-24 13:52:59.345568'),('16a75eac-ddf2-4db7-8e98-8edb0aa0324e','product_1009','dwefnewfjn',100,'€','2021-08-24 13:52:59.217949','2021-08-24 13:52:59.217949'),('239bd38e-0b5c-40f5-9c01-0392fe3c0d01','product_1012','dwefnewfjn',100,'€','2021-08-24 13:52:59.227194','2021-08-24 13:52:59.227194'),('24692e5c-0dce-4ec1-a482-bace84d7b5af','product_1014','dwefnewfjn',100,'€','2021-08-24 13:52:59.247233','2021-08-24 13:52:59.247233'),('2659aad4-622d-4b1a-ab89-deb0c001b6e1','product_1010','dwefnewfjn',100,'€','2021-08-24 13:52:59.228066','2021-08-24 13:52:59.228066'),('2d6254ad-6a18-4c87-b765-4cadf73bd6bd','product_1009','dwefnewfjn',100,'€','2021-08-24 13:52:59.261376','2021-08-24 13:52:59.261376'),('31bc2b44-92a5-4a32-9c9b-39c8459116c0','product_1019','dwefnewfjn',100,'€','2021-08-24 13:52:59.206432','2021-08-24 13:52:59.206432'),('3971baed-da51-43ec-a62a-cd655c654cd1','product_1009','dwefnewfjn',100,'€','2021-08-24 13:52:59.187707','2021-08-24 13:52:59.187707'),('3c9d5439-13ce-48a9-b9c5-108367c50fe2','product_1010','dwefnewfjn',100,'€','2021-08-24 13:52:59.317460','2021-08-24 13:52:59.317460'),('3cc12e19-0b4c-4734-bc65-5ba184a3b3b9','product_1013','dwefnewfjn',100,'€','2021-08-24 13:52:59.347693','2021-08-24 13:52:59.347693'),('49b12841-682f-4f36-acdf-8b1c4ba9be88','product_1009','dwefnewfjn',100,'€','2021-08-24 13:52:59.233685','2021-08-24 13:52:59.233685'),('537c7216-cdc9-4fb4-b6b7-1dade392db4e','product_1897','dwefnewfjn',100,'€','2021-08-24 13:47:59.926486','2021-08-24 13:47:59.926486'),('5a4a753c-ac26-4984-bc43-308faf7b6f73','product_1011','dwefnewfjn',100,'€','2021-08-24 13:52:59.189961','2021-08-24 13:52:59.189961'),('5cb1bc3d-44c3-4580-9649-c5a48282d5d2','product_1029','dwefnewfjn',100,'€','2021-08-24 13:52:59.300530','2021-08-24 13:52:59.300530'),('5cc52c9c-79c8-499c-8ab4-f85c0dc404eb','product_1890','dwefnewfjn',100,'€','2021-08-24 13:47:59.925362','2021-08-24 13:47:59.925362'),('5d71f72d-7a28-4c2f-aeef-735275d281e5','product_1010','dwefnewfjn',100,'€','2021-08-24 13:52:59.284538','2021-08-24 13:52:59.284538'),('5da9f5c0-410d-41c7-a020-7bca9dc3a7cc','test1','oe122en',400,'€','2021-08-23 09:28:29.370292','2021-08-23 09:28:29.370292'),('60cb7960-b9dc-4725-968a-133c2db5ec4a','product_1009','dwefnewfjn',100,'€','2021-08-24 13:52:59.220983','2021-08-24 13:52:59.220983'),('619dbe96-9c1e-4270-b83a-e7770020e42d','product_1010','dwefnewfjn',100,'€','2021-08-24 13:52:59.287920','2021-08-24 13:52:59.287920'),('63f4743d-1010-496f-b62b-b79f1acc9c00','product_1009','dwefnewfjn',100,'€','2021-08-24 13:52:59.169570','2021-08-24 13:52:59.169570'),('64fbde28-7682-4d2c-a793-d5e7a0034ea2','product_1010','dwefnewfjn',100,'€','2021-08-24 13:52:59.187867','2021-08-24 13:52:59.187867'),('6bad96c5-6b14-4168-8aae-f4023b79eeb7','product_1010','dwefnewfjn',100,'€','2021-08-24 13:52:59.253463','2021-08-24 13:52:59.253463'),('6c4e6bf7-8ebe-4325-a8d3-04198e490a8d','product_1015','dwefnewfjn',100,'€','2021-08-24 13:52:59.239807','2021-08-24 13:52:59.239807'),('6d4902a0-1115-4059-a3c2-590c7e3b08cb','product_1009','dwefnewfjn',100,'€','2021-08-24 13:52:59.320854','2021-08-24 13:52:59.320854'),('6dd8857e-06d2-4789-aa21-cd1b5340ace6','product_1012','dwefnewfjn',100,'€','2021-08-24 13:52:59.287432','2021-08-24 13:52:59.287432'),('6ec5d3a5-9c2c-43ef-a4f8-10d5f1cd62cf','product_1018','dwefnewfjn',100,'€','2021-08-24 13:52:59.307869','2021-08-24 13:52:59.307869'),('71d5a641-08b2-4b06-a0e3-ba64c31bf576','product_1019','dwefnewfjn',100,'€','2021-08-24 13:52:59.294090','2021-08-24 13:52:59.294090'),('72d74ae6-2bfc-460a-8f47-b41301e2751a','product_1010','dwefnewfjn',100,'€','2021-08-24 13:52:59.259389','2021-08-24 13:52:59.259389'),('7c0b5f1b-9f33-4cbf-b949-578542e51c11','product_1009','dwefnewfjn',100,'€','2021-08-24 13:52:59.255457','2021-08-24 13:52:59.255457'),('7ef105a5-b614-458d-9501-07bc3a94d3f7','product_1010','dwefnewfjn',100,'€','2021-08-24 13:52:59.170968','2021-08-24 13:52:59.170968'),('7fd5c3fb-f20d-458d-b843-fcbda65f0d09','product_1033','dwefnewfjn',100,'€','2021-08-24 13:52:59.297637','2021-08-24 13:52:59.297637'),('8174dc3c-854a-41a8-af93-4ec40c456068','product_1010','dwefnewfjn',100,'€','2021-08-24 13:52:59.323099','2021-08-24 13:52:59.323099'),('8177a111-d870-4cdd-9da2-fb6edc229d26','product_1009','dwefnewfjn',100,'€','2021-08-24 13:52:59.191005','2021-08-24 13:52:59.191005'),('8bfa195a-7c13-489c-b6c9-91b93059ef1c','product_1018','dwefnewfjn',100,'€','2021-08-24 13:52:59.199217','2021-08-24 13:52:59.199217'),('8d15c8cc-678f-4dc9-818b-15ed811b375d','test3','sdwdd',400,'€','2021-08-23 09:28:42.064275','2021-08-23 09:28:42.064275'),('8d70cc60-3ea1-421d-8e9e-f31bad083747','product_1010','dwefnewfjn',100,'€','2021-08-24 13:52:59.327883','2021-08-24 13:52:59.327883'),('95dba0f5-95dd-4da7-ae45-e757acbe426a','product_1010','dwefnewfjn',100,'€','2021-08-24 13:52:59.173639','2021-08-24 13:52:59.173639'),('97ac1ce9-16f2-47f4-8175-acb008cf5fce','product_1010','dwefnewfjn',100,'€','2021-08-24 13:52:59.278922','2021-08-24 13:52:59.278922'),('98f0a0b6-086e-4c42-9ef7-de1cd436ff3e','product_1010','dwefnewfjn',100,'€','2021-08-24 13:52:59.247062','2021-08-24 13:52:59.247062'),('9932e45f-4793-423a-a13f-08df04a2c12c','product_1018','dwefnewfjn',100,'€','2021-08-24 13:52:59.328796','2021-08-24 13:52:59.328796'),('9c934192-4269-4396-8883-38e58120d64b','product_1011','dwefnewfjn',100,'€','2021-08-24 13:52:59.297430','2021-08-24 13:52:59.297430'),('9ddd87d6-0d5f-4755-9d1b-1da77e864e97','product_1010','dwefnewfjn',100,'€','2021-08-24 13:52:59.227376','2021-08-24 13:52:59.227376'),('9f7700a2-7d2a-49e1-a7ad-6536c0d6204c','product_1011','dwefnewfjn',100,'€','2021-08-24 13:52:59.274974','2021-08-24 13:52:59.274974'),('a1ee1c0e-e590-4041-8bdf-942937cb41e0','product_1900','dwefnewfjn',100,'€','2021-08-24 13:47:59.929111','2021-08-24 13:47:59.929111'),('a39242ef-3861-4717-9b33-454d54154c02','product_1011','dwefnewfjn',100,'€','2021-08-24 13:52:59.351571','2021-08-24 13:52:59.351571'),('aa8e4fdc-e4d5-41f1-9ee9-b89c21a718e0','product_1010','dwefnewfjn',100,'€','2021-08-24 13:52:59.208616','2021-08-24 13:52:59.208616'),('aae72220-6c65-4edb-bed8-0b32943c2777','product_1009','dwefnewfjn',100,'€','2021-08-24 13:52:59.158784','2021-08-24 13:52:59.158784'),('ad7669ea-eda3-43d6-9702-1fd85bc23423','product_1010','dwefnewfjn',100,'€','2021-08-24 13:52:59.274663','2021-08-24 13:52:59.274663'),('adf64200-983d-46c4-9569-eb1967acfa2a','product_1009','dwefnewfjn',100,'€','2021-08-24 13:52:59.161303','2021-08-24 13:52:59.161303'),('af519c3a-2118-4019-9d10-0783e7d6b336','product_1019','dwefnewfjn',100,'€','2021-08-24 13:52:59.220826','2021-08-24 13:52:59.220826'),('b0265610-f786-4a7c-abf9-9fa5e6f4da65','product_1009','dwefnewfjn',100,'€','2021-08-24 13:52:59.272423','2021-08-24 13:52:59.272423'),('b45055ad-8019-4dfc-bfaa-d27b5484f3cd','product_1011','dwefnewfjn',100,'€','2021-08-24 13:52:59.274437','2021-08-24 13:52:59.274437'),('b528e28f-9afd-4a9d-872f-6c33a0b289d3','product_1011','dwefnewfjn',100,'€','2021-08-24 13:52:59.328953','2021-08-24 13:52:59.328953'),('ba56589d-45f8-4d21-8b16-48bc2ce1812f','product_1010','dwefnewfjn',100,'€','2021-08-24 13:52:59.283927','2021-08-24 13:52:59.283927'),('bb518d56-df90-48d0-8a48-eae43ec3ed08','product_1012','dwefnewfjn',100,'€','2021-08-24 13:52:59.321442','2021-08-24 13:52:59.321442'),('c1a9e807-6d24-4b67-9f96-a9dc134f9a7e','product_1010','dwefnewfjn',100,'€','2021-08-24 13:52:59.260900','2021-08-24 13:52:59.260900'),('c1b59def-3229-4c6a-8aef-0b9f186847c9','product_1024','dwefnewfjn',100,'€','2021-08-24 13:52:59.321615','2021-08-24 13:52:59.321615'),('c2498675-2b46-45f6-89cc-bf71ecbc62fe','product_1009','dwefnewfjn',100,'€','2021-08-24 13:52:59.248180','2021-08-24 13:52:59.248180'),('c4c316d8-a81d-4816-8875-3a78231c0fbf','product_1010','dwefnewfjn',100,'€','2021-08-24 13:52:59.187213','2021-08-24 13:52:59.187213'),('c54d9753-af43-4d98-a0d4-1776628545b0','product_1010','dwefnewfjn',100,'€','2021-08-24 13:52:59.187047','2021-08-24 13:52:59.187047'),('c8a33631-13fb-4bba-95e9-7e3c3d078316','product_1010','dwefnewfjn',100,'€','2021-08-24 13:52:59.239656','2021-08-24 13:52:59.239656'),('cc08b1b7-a789-4254-83ff-6af12c34fd73','product_1885','dwefnewfjn',100,'€','2021-08-24 13:47:59.928492','2021-08-24 13:47:59.928492'),('cd8da4d2-351a-4122-9f38-6878c72f9662','product_1010','dwefnewfjn',100,'€','2021-08-24 13:52:59.308325','2021-08-24 13:52:59.308325'),('cf5513c5-4a72-47f0-ae74-f07f5af01102','product_1009','dwefnewfjn',100,'€','2021-08-24 13:52:59.189259','2021-08-24 13:52:59.189259'),('d2252a5b-6f55-455e-a671-76f3fb968393','product_1032','dwefnewfjn',100,'€','2021-08-24 13:52:59.240637','2021-08-24 13:52:59.240637'),('d3435715-3b10-4716-9a30-ffe180b4bf1c','product_1022','dwefnewfjn',100,'€','2021-08-24 13:52:59.239490','2021-08-24 13:52:59.239490'),('d7928e9a-1010-4b1e-9e04-b88be4123752','product_1014','dwefnewfjn',100,'€','2021-08-24 13:52:59.315390','2021-08-24 13:52:59.315390'),('d91a2db6-afd9-40c0-873f-93679254340b','product_1009','dwefnewfjn',100,'€','2021-08-24 13:52:59.233447','2021-08-24 13:52:59.233447'),('da0e7a46-a6f6-4501-8161-0f4c8ded8725','product_1891','dwefnewfjn',100,'€','2021-08-24 13:47:59.935541','2021-08-24 13:47:59.935541'),('dbaceba6-2372-40b3-a643-84ee26b3638e','product_1015','dwefnewfjn',100,'€','2021-08-24 13:52:59.289785','2021-08-24 13:52:59.289785'),('dbe67472-a710-434e-a539-004279bff360','product_1009','dwefnewfjn',100,'€','2021-08-24 13:52:59.253706','2021-08-24 13:52:59.253706'),('dc7ee450-3112-4007-a309-698083e2859d','product_1884','dwefnewfjn',100,'€','2021-08-24 13:47:59.928974','2021-08-24 13:47:59.928974'),('e2736192-2882-4883-9a22-295726ac5d89','product_1010','dwefnewfjn',100,'€','2021-08-24 13:52:59.326253','2021-08-24 13:52:59.326253'),('e472cfb5-6192-454e-8ebc-b356d23dd2f8','product_1012','dwefnewfjn',100,'€','2021-08-24 13:52:59.208782','2021-08-24 13:52:59.208782'),('e4b55600-66b2-4d18-a1c9-e469e809b2c9','product_1013','dwefnewfjn',100,'€','2021-08-24 13:52:59.317040','2021-08-24 13:52:59.317040'),('f290c972-81d7-4d45-bf58-7f01b41209c8','product_1010','dwefnewfjn',100,'€','2021-08-24 13:52:59.341010','2021-08-24 13:52:59.341010'),('f4395ff6-38c5-490e-a8b6-da7387a4c0dc','product_1014','dwefnewfjn',100,'€','2021-08-24 13:52:59.198969','2021-08-24 13:52:59.198969'),('fadb6f0c-f982-403a-b3b3-aee95ac02d4c','product_1009','dwefnewfjn',100,'€','2021-08-24 13:52:59.334335','2021-08-24 13:52:59.334335');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'user1','1234','user1@x.y','2021-08-24 13:22:50.259966','2021-08-24 13:22:50.259966'),(2,'user2','abcd','user2@x.y','2021-08-24 13:22:59.828051','2021-08-24 13:22:59.828051');
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

-- Dump completed on 2021-08-24 13:52:59
