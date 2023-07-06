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
-- Table structure for table `account_user`
--

DROP TABLE IF EXISTS `account_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(15) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(255) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `is_trusty` tinyint(1) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `occupation` varchar(150) DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `phone` varchar(13) DEFAULT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_user`
--

LOCK TABLES `account_user` WRITE;
/*!40000 ALTER TABLE `account_user` DISABLE KEYS */;
INSERT INTO `account_user` VALUES
(1,'pbkdf2_sha256$600000$R4kaUtDM3kxdATpQpaN25J$DYZ1FYJIDJPICyx9cd3EJPRq4jCloFZ9OE5j2Eg7gbE=','2023-07-06 06:15:50.980258',1,'admin','Helder','Silva','admin@resgatocao.com',1,1,'2023-06-25 20:38:16.936872',0,NULL,NULL,NULL,NULL,''),
(10,'pbkdf2_sha256$600000$64HbiXCxYJsZ5xfOFVmwqK$mk+62ArQAGhEaAlEHC4gnTvSUkUkVAZfsAsezSe+zp0=','2023-07-06 06:58:32.741108',0,'rapha1234','Raphaela','Cristina','raphaela_camilosantana@hotmail.com',0,1,'2023-07-04 01:30:14.468534',0,'1996-10-29','Costureira','45774561871','17991663838',''),
(11,'pbkdf2_sha256$600000$nVqh7HoPh8cWwmJuFIppy4$IgdB7pIIy8Yx4PSQPBtneHjHAvUxlsb/26JQasOP6h0=','2023-07-06 06:19:16.848299',0,'Professor','Fabricio','Professor','professor@resgatocao.com',1,1,'2023-07-06 04:49:23.000000',0,'1997-10-12','Professor','45548238817','17992288143',''),
(14,'pbkdf2_sha256$600000$c8bSLcpuzOAYsZQ4CShBpo$hMYeb5aGahI2/GrdPN0OiwILtgtdED9qoXnR7VEYyKc=',NULL,0,'teste1234','Teste','Silva','teste_silva@gmail.com',0,1,'2023-07-06 08:10:11.669027',0,'1992-12-12','Desempregado','45548238817','17992288143','');
/*!40000 ALTER TABLE `account_user` ENABLE KEYS */;
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
