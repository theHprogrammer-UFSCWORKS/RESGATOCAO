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
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES
(1,'contenttypes','0001_initial','2023-06-25 20:35:58.256159'),
(2,'contenttypes','0002_remove_content_type_name','2023-06-25 20:35:58.348352'),
(3,'auth','0001_initial','2023-06-25 20:35:58.695761'),
(4,'auth','0002_alter_permission_name_max_length','2023-06-25 20:35:58.769927'),
(5,'auth','0003_alter_user_email_max_length','2023-06-25 20:35:58.778966'),
(6,'auth','0004_alter_user_username_opts','2023-06-25 20:35:58.787806'),
(7,'auth','0005_alter_user_last_login_null','2023-06-25 20:35:58.797161'),
(8,'auth','0006_require_contenttypes_0002','2023-06-25 20:35:58.801142'),
(9,'auth','0007_alter_validators_add_error_messages','2023-06-25 20:35:58.811679'),
(10,'auth','0008_alter_user_username_max_length','2023-06-25 20:35:58.819668'),
(11,'auth','0009_alter_user_last_name_max_length','2023-06-25 20:35:58.827899'),
(12,'auth','0010_alter_group_name_max_length','2023-06-25 20:35:58.858242'),
(13,'auth','0011_update_proxy_permissions','2023-06-25 20:35:58.864639'),
(14,'auth','0012_alter_user_first_name_max_length','2023-06-25 20:35:58.872287'),
(15,'account','0001_initial','2023-06-25 20:35:59.517623'),
(16,'admin','0001_initial','2023-06-25 20:35:59.675597'),
(17,'admin','0002_logentry_remove_auto_add','2023-06-25 20:35:59.686024'),
(18,'admin','0003_logentry_add_action_flag_choices','2023-06-25 20:35:59.697632'),
(19,'sessions','0001_initial','2023-06-25 20:35:59.765258'),
(20,'account','0002_alter_endereco_numero','2023-06-25 20:39:59.899415'),
(21,'account','0003_endereco_is_principal_alter_endereco_complemento','2023-06-27 00:56:41.293993'),
(22,'adocao','0001_initial','2023-06-27 00:56:42.452480'),
(23,'adocao','0002_alter_animal_avatar','2023-06-27 02:18:51.711358'),
(24,'adocao','0003_adocao_observacoes_alter_adocao_etapa','2023-07-04 14:58:44.858238'),
(25,'adocao','0004_alter_adocao_unique_together_and_more','2023-07-04 15:59:01.012441'),
(26,'account','0004_alter_user_cpf','2023-07-06 08:02:04.881013'),
(27,'account','0005_alter_user_cpf','2023-07-06 08:04:00.934679'),
(28,'account','0006_alter_user_cpf','2023-07-06 08:09:06.541293');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
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
