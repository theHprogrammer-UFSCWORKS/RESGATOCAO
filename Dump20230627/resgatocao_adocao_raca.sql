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
-- Table structure for table `adocao_raca`
--

DROP TABLE IF EXISTS `adocao_raca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adocao_raca` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(30) NOT NULL,
  `tipo_animal_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `adocao_raca_tipo_animal_id_5569ef0e_fk_adocao_tipoanimal_id` (`tipo_animal_id`),
  CONSTRAINT `adocao_raca_tipo_animal_id_5569ef0e_fk_adocao_tipoanimal_id` FOREIGN KEY (`tipo_animal_id`) REFERENCES `adocao_tipoanimal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adocao_raca`
--

LOCK TABLES `adocao_raca` WRITE;
/*!40000 ALTER TABLE `adocao_raca` DISABLE KEYS */;
INSERT INTO `adocao_raca` VALUES
(1,'SRD - Cachorro',1),
(2,'SRD - Gato',2),
(3,'Akita',1),
(4,'Basset hound',1),
(5,'Beagle',1),
(6,'Bichon frisé',1),
(7,'Boiadeiro australiano',1),
(8,'Border collie',1),
(9,'Boston terrier',1),
(10,'Boxer',1),
(11,'Buldogue francês',1),
(12,'Buldogue inglês',1),
(13,'Bull terrier',1),
(14,'Cane corso',1),
(15,'Cavalier king charles spaniel',1),
(16,'Chihuahua',1),
(17,'Chow chow',1),
(18,'Cocker spaniel inglês',1),
(19,'Dachshund',1),
(20,'Dálmata',1),
(21,'Doberman',1),
(22,'Dogo argentino',1),
(23,'Dogue alemão',1),
(24,'Fila brasileiro',1),
(25,'Golden retriever',1),
(26,'Husky siberiano',1),
(27,'Jack russell terrier',1),
(28,'Labrador retriever',1),
(29,'Lhasa apso',1),
(30,'Lulu da pomerânia',1),
(31,'Maltês',1),
(32,'Mastiff inglês',1),
(33,'Mastim tibetano',1),
(34,'Pastor alemão',1),
(35,'Pastor australiano',1),
(36,'Pastor de Shetland',1),
(37,'Pequinês',1),
(38,'Pinscher',1),
(39,'Pit bull',1),
(40,'Poodle',1),
(41,'Pug',1),
(42,'Rottweiler',1),
(43,'Schnauzer',1),
(44,'Shar-pei',1),
(45,'Shiba',1),
(46,'Shih tzu',1),
(47,'Staffordshire bull terrier',1),
(48,'Weimaraner',1),
(49,'Yorkshire',1),
(50,'Abissínio',2),
(51,'American Bobtail',2),
(52,'American Curl',2),
(53,'American Shorthair',2),
(54,'American Wirehair',2),
(55,'Asiático',2),
(56,'Australian Mist',2),
(57,'Bombaim',2),
(58,'British Shorthair',2),
(59,'Burmês',2),
(60,'Burmilla',2),
(61,'Cornish Rex',2),
(62,'Devon Rex',2),
(63,'Don Sphynx',2),
(64,'German Rex',2),
(65,'Havana',2),
(66,'Khao Manee',2),
(67,'Korat',2),
(68,'Kurilian Bobtail',2),
(69,'Manx',2),
(70,'Mau Egípcio',2),
(71,'Munchkin',2),
(72,'Ocicat',2),
(73,'Oriental',2),
(74,'Peterbald',2),
(75,'Pixiebob',2),
(76,'Russo',2),
(77,'Seychellois',2),
(78,'Siamês',2),
(79,'Singapura',2),
(80,'Snowshoe',2),
(81,'Sokoke',2),
(82,'Tonquinês',2),
(83,'LaPerm',2),
(84,'Maine Coon',2),
(85,'Neva Masquerade',2),
(86,'Norueguês da Floresta',2),
(87,'Ragamuffin',2),
(88,'Ragdoll',2),
(89,'Sagrado da Birmânia',2),
(90,'Scottish Fold',2),
(91,'Scottish Straight',2),
(92,'Selkirk Rex',2),
(93,'Siberiano',2),
(94,'Somali',2),
(95,'Van Turco',2),
(96,'Vankedisi',2),
(97,'Angorá',2),
(98,'Bobtail Japonês',2),
(99,'Chartreux',2),
(100,'Cymric',2),
(101,'Balinês',2),
(102,'British Longhair',2),
(103,'Persa',2);
/*!40000 ALTER TABLE `adocao_raca` ENABLE KEYS */;
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
