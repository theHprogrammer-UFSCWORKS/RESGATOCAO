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
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add content type',4,'add_contenttype'),
(14,'Can change content type',4,'change_contenttype'),
(15,'Can delete content type',4,'delete_contenttype'),
(16,'Can view content type',4,'view_contenttype'),
(17,'Can add session',5,'add_session'),
(18,'Can change session',5,'change_session'),
(19,'Can delete session',5,'delete_session'),
(20,'Can view session',5,'view_session'),
(21,'Can add endereco',6,'add_endereco'),
(22,'Can change endereco',6,'change_endereco'),
(23,'Can delete endereco',6,'delete_endereco'),
(24,'Can view endereco',6,'view_endereco'),
(25,'Can add user',7,'add_user'),
(26,'Can change user',7,'change_user'),
(27,'Can delete user',7,'delete_user'),
(28,'Can view user',7,'view_user'),
(29,'Can add animal',8,'add_animal'),
(30,'Can change animal',8,'change_animal'),
(31,'Can delete animal',8,'delete_animal'),
(32,'Can view animal',8,'view_animal'),
(33,'Can add comando',9,'add_comando'),
(34,'Can change comando',9,'change_comando'),
(35,'Can delete comando',9,'delete_comando'),
(36,'Can view comando',9,'view_comando'),
(37,'Can add outras caracteristica',10,'add_outrascaracteristica'),
(38,'Can change outras caracteristica',10,'change_outrascaracteristica'),
(39,'Can delete outras caracteristica',10,'delete_outrascaracteristica'),
(40,'Can view outras caracteristica',10,'view_outrascaracteristica'),
(41,'Can add tipo animal',11,'add_tipoanimal'),
(42,'Can change tipo animal',11,'change_tipoanimal'),
(43,'Can delete tipo animal',11,'delete_tipoanimal'),
(44,'Can view tipo animal',11,'view_tipoanimal'),
(45,'Can add raca',12,'add_raca'),
(46,'Can change raca',12,'change_raca'),
(47,'Can delete raca',12,'delete_raca'),
(48,'Can view raca',12,'view_raca'),
(49,'Can add foto animal',13,'add_fotoanimal'),
(50,'Can change foto animal',13,'change_fotoanimal'),
(51,'Can delete foto animal',13,'delete_fotoanimal'),
(52,'Can view foto animal',13,'view_fotoanimal'),
(53,'Can add animal resgate',14,'add_animalresgate'),
(54,'Can change animal resgate',14,'change_animalresgate'),
(55,'Can delete animal resgate',14,'delete_animalresgate'),
(56,'Can view animal resgate',14,'view_animalresgate'),
(57,'Can add adocao',15,'add_adocao'),
(58,'Can change adocao',15,'change_adocao'),
(59,'Can delete adocao',15,'delete_adocao'),
(60,'Can view adocao',15,'view_adocao');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
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
