-- MariaDB dump 10.19  Distrib 10.11.3-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: resgatocao
-- ------------------------------------------------------
-- Server version	10.11.3-MariaDB

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
-- Table structure for table `adocao_fotoanimal`
--

DROP TABLE IF EXISTS `adocao_fotoanimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adocao_fotoanimal` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `foto` varchar(100) NOT NULL,
  `animal_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `adocao_fotoanimal_animal_id_b326fe4a_fk_adocao_animal_id` (`animal_id`),
  CONSTRAINT `adocao_fotoanimal_animal_id_b326fe4a_fk_adocao_animal_id` FOREIGN KEY (`animal_id`) REFERENCES `adocao_animal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adocao_fotoanimal`
--

LOCK TABLES `adocao_fotoanimal` WRITE;
/*!40000 ALTER TABLE `adocao_fotoanimal` DISABLE KEYS */;
INSERT INTO `adocao_fotoanimal` VALUES
(1,'animal_photos/Fro/dog2_3-1024x683.jpg',1),
(2,'animal_photos/Fro/dog2_2-1024x698.jpg',1),
(3,'animal_photos/Chambinha/dog5_3_cktyUV0.jpg',3),
(4,'animal_photos/Chambinha/dog5_2-1024x683.jpg',3),
(5,'animal_photos/Chambinha/dog5_1-1024x683.jpg',3),
(6,'animal_photos/Zhen/cat2_3-1024x683.jpg',2),
(7,'animal_photos/Zhen/cat2_2-1024x683.jpg',2),
(8,'animal_photos/Zhen/cat2_1-1024x683_IXROTBY.jpg',2),
(9,'animal_photos/Pati Fifi/dog9_3-1024x683.jpg',4),
(10,'animal_photos/Pati Fifi/dog9_2_J51NqqE.jpg',4),
(11,'animal_photos/Pati Fifi/dog9_1-1024x683.jpg',4);
/*!40000 ALTER TABLE `adocao_fotoanimal` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-06  5:33:14
