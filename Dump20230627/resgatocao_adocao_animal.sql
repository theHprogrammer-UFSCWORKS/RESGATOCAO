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
-- Table structure for table `adocao_animal`
--

DROP TABLE IF EXISTS `adocao_animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adocao_animal` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `adotado` tinyint(1) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `idade` varchar(20) NOT NULL,
  `sexo` varchar(10) NOT NULL,
  `peso` double NOT NULL,
  `cor` varchar(20) NOT NULL,
  `cor_olho` varchar(20) NOT NULL,
  `sobre` longtext NOT NULL,
  `raca_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `adocao_animal_raca_id_8ef67d98_fk_adocao_raca_id` (`raca_id`),
  CONSTRAINT `adocao_animal_raca_id_8ef67d98_fk_adocao_raca_id` FOREIGN KEY (`raca_id`) REFERENCES `adocao_raca` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adocao_animal`
--

LOCK TABLES `adocao_animal` WRITE;
/*!40000 ALTER TABLE `adocao_animal` DISABLE KEYS */;
INSERT INTO `adocao_animal` VALUES
(1,'Fro',0,'animal_photos/Fro/dog2_1-1024x676.jpg','ate_1_ano','femea',6,'Preto e amarelo','Castanhos','A Frô é um “espeto”, é a mais curiosa e destemida dos três. Não tem medo de cachorros muito maiores do que ela e chega a latir para eles. É a única que saiu parecida com a mãe, tem pelo lisinho.',1);
/*!40000 ALTER TABLE `adocao_animal` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-27 13:35:04
