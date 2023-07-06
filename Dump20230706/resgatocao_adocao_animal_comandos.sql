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
-- Table structure for table `adocao_animal_comandos`
--

DROP TABLE IF EXISTS `adocao_animal_comandos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adocao_animal_comandos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `animal_id` bigint(20) NOT NULL,
  `comando_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `adocao_animal_comandos_animal_id_comando_id_6bab6370_uniq` (`animal_id`,`comando_id`),
  KEY `adocao_animal_comandos_comando_id_ddf01e42_fk_adocao_comando_id` (`comando_id`),
  CONSTRAINT `adocao_animal_comandos_animal_id_378351ea_fk_adocao_animal_id` FOREIGN KEY (`animal_id`) REFERENCES `adocao_animal` (`id`),
  CONSTRAINT `adocao_animal_comandos_comando_id_ddf01e42_fk_adocao_comando_id` FOREIGN KEY (`comando_id`) REFERENCES `adocao_comando` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adocao_animal_comandos`
--

LOCK TABLES `adocao_animal_comandos` WRITE;
/*!40000 ALTER TABLE `adocao_animal_comandos` DISABLE KEYS */;
INSERT INTO `adocao_animal_comandos` VALUES
(1,3,1),
(2,3,4);
/*!40000 ALTER TABLE `adocao_animal_comandos` ENABLE KEYS */;
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
