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
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_account_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES
(1,'2023-06-25 20:43:57.883184','2','',1,'[{\"added\": {}}]',7,1),
(2,'2023-06-25 22:44:07.428170','2','',3,'',7,1),
(3,'2023-06-25 22:44:07.431701','3','teste@gmail.com',3,'',7,1),
(4,'2023-06-26 00:01:04.013040','4','oteste2@gmail.com',3,'',7,1),
(5,'2023-06-26 00:01:04.016385','5','oteste3@gmail.com',3,'',7,1),
(6,'2023-06-26 00:01:04.024052','6','oteste4@gmail.com',3,'',7,1),
(7,'2023-06-27 01:58:29.412352','1','Cachorro',1,'[{\"added\": {}}]',11,1),
(8,'2023-06-27 01:58:41.550106','2','Gato',1,'[{\"added\": {}}]',11,1),
(9,'2023-06-27 02:16:26.292571','1','Fro',1,'[{\"added\": {}}]',8,1),
(10,'2023-06-27 02:19:24.026397','1','Fro',1,'[{\"added\": {}}]',13,1),
(11,'2023-06-27 02:19:38.616776','2','Fro',1,'[{\"added\": {}}]',13,1),
(12,'2023-07-05 01:50:27.532487','2','Fro - Raphaela Cristina',2,'[{\"changed\": {\"fields\": [\"Etapa da ado\\u00e7\\u00e3o\", \"Observa\\u00e7\\u00f5es\"]}}]',15,1),
(13,'2023-07-06 04:47:26.590150','8','oteste5@gmail.com',3,'',7,1),
(14,'2023-07-06 04:47:26.594311','9','oteste6@gmail.com',3,'',7,1),
(15,'2023-07-06 04:47:26.597604','7','professor@resgatocao.com',3,'',7,1),
(16,'2023-07-06 05:18:52.776323','1','Funcionários',1,'[{\"added\": {}}]',3,1),
(17,'2023-07-06 05:19:41.290345','11','professor@resgatocao.com',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"Groups\"]}}]',7,1),
(18,'2023-07-06 05:25:29.482610','2','Zhen',1,'[{\"added\": {}}]',8,1),
(19,'2023-07-06 05:27:58.155511','3','Chambinha',1,'[{\"added\": {}}]',8,1),
(20,'2023-07-06 05:30:43.639602','4','Pati Fifi',1,'[{\"added\": {}}]',8,1),
(21,'2023-07-06 05:33:09.092793','3','Chambinha',1,'[{\"added\": {}}]',13,11),
(22,'2023-07-06 05:33:24.393357','4','Chambinha',1,'[{\"added\": {}}]',13,11),
(23,'2023-07-06 05:33:45.229629','5','Chambinha',1,'[{\"added\": {}}]',13,11),
(24,'2023-07-06 05:34:02.637868','6','Zhen',1,'[{\"added\": {}}]',13,11),
(25,'2023-07-06 05:34:24.452711','7','Zhen',1,'[{\"added\": {}}]',13,11),
(26,'2023-07-06 05:34:45.787311','8','Zhen',1,'[{\"added\": {}}]',13,11),
(27,'2023-07-06 05:35:00.203562','9','Pati Fifi',1,'[{\"added\": {}}]',13,11),
(28,'2023-07-06 05:35:25.179982','10','Pati Fifi',1,'[{\"added\": {}}]',13,11),
(29,'2023-07-06 05:35:38.176336','11','Pati Fifi',1,'[{\"added\": {}}]',13,11),
(30,'2023-07-06 05:42:06.579715','4','Pati Fifi',2,'[{\"changed\": {\"fields\": [\"Avatar\"]}}]',8,11),
(31,'2023-07-06 05:43:21.661752','3','Chambinha',2,'[{\"changed\": {\"fields\": [\"Avatar\"]}}]',8,11),
(32,'2023-07-06 05:53:02.615074','2','Fro - Raphaela Cristina',2,'[{\"changed\": {\"fields\": [\"Data de Conclus\\u00e3o\", \"Etapa da ado\\u00e7\\u00e3o\", \"Observa\\u00e7\\u00f5es\"]}}]',15,11),
(33,'2023-07-06 05:53:20.451983','1','Fro',2,'[{\"changed\": {\"fields\": [\"Adotado\"]}}]',8,11),
(34,'2023-07-06 06:16:48.866970','1','Funcionários',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1),
(35,'2023-07-06 06:18:18.007755','3','Zhen - Raphaela Cristina',2,'[{\"changed\": {\"fields\": [\"Etapa da ado\\u00e7\\u00e3o\", \"Observa\\u00e7\\u00f5es\"]}}]',15,1),
(36,'2023-07-06 06:18:33.639365','3','Zhen - Raphaela Cristina',2,'[{\"changed\": {\"fields\": [\"Data de Conclus\\u00e3o\"]}}]',15,1),
(37,'2023-07-06 08:07:09.453798','12','teste_silva@gmail.com',3,'',7,1),
(38,'2023-07-06 08:09:15.076180','13','teste_silva@gmail.com',3,'',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
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
