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
-- Table structure for table `adocao_adocao`
--

DROP TABLE IF EXISTS `adocao_adocao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adocao_adocao` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data_adocao` datetime(6) DEFAULT NULL,
  `data_inicio` datetime(6) NOT NULL,
  `etapa` varchar(50) NOT NULL,
  `adotante_id` bigint(20) NOT NULL,
  `animal_id` bigint(20) NOT NULL,
  `observacoes` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `adocao_adocao_adotante_id_bbddfad5_fk_account_user_id` (`adotante_id`),
  KEY `adocao_adocao_animal_id_77da76f6` (`animal_id`),
  CONSTRAINT `adocao_adocao_adotante_id_bbddfad5_fk_account_user_id` FOREIGN KEY (`adotante_id`) REFERENCES `account_user` (`id`),
  CONSTRAINT `adocao_adocao_animal_id_77da76f6_fk_adocao_animal_id` FOREIGN KEY (`animal_id`) REFERENCES `adocao_animal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adocao_adocao`
--

LOCK TABLES `adocao_adocao` WRITE;
/*!40000 ALTER TABLE `adocao_adocao` DISABLE KEYS */;
INSERT INTO `adocao_adocao` VALUES
(2,'2023-07-06 05:52:58.000000','2023-07-04 15:59:24.284565','finalizado_adocao_realizada',10,1,'Entrevista presencial realizada. Todos os documentos foram aprovados.'),
(3,'2023-07-06 06:18:31.000000','2023-07-06 05:48:38.747471','finalizado_adocao_rejeitada',10,2,'Não compareceu a entrevista'),
(4,NULL,'2023-07-06 06:28:00.805895','requisicao_realizada',10,2,'');
/*!40000 ALTER TABLE `adocao_adocao` ENABLE KEYS */;
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
