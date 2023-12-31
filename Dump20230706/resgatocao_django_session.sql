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
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES
('fvdop4sc9y7dklps6ewmejgegqc0o5jv','.eJxVjMsOwiAQRf-FtSFAeY1L934DAWaQqoGktCvjv2uTLnR7zzn3xULc1hq2QUuYkZ2ZZKffLcX8oLYDvMd26zz3ti5z4rvCDzr4tSM9L4f7d1DjqN9aQbFTMgrLZMCiJy2lKxFAWCLt4wQknTO2WHTkVXGIWhcJSTgtks_s_QHVoDed:1qHGdQ:ExHWo5AetoUYVOJtPAtgt-jkd4MeblK1N9wbCroH9l8','2023-07-20 04:30:28.147049'),
('htoieu4crz9cc4vcl8lqtdydou9co0u3','.eJxVjMsOwiAQRf-FtSFAeY1L934DAWaQqoGktCvjv2uTLnR7zzn3xULc1hq2QUuYkZ2ZZKffLcX8oLYDvMd26zz3ti5z4rvCDzr4tSM9L4f7d1DjqN9aQbFTMgrLZMCiJy2lKxFAWCLt4wQknTO2WHTkVXGIWhcJSTgtks_s_QHVoDed:1qGrdr:EX0Y7WhwxHhnI9yLsp7oRuC_-dE6LB42uAVVi9KYzd8','2023-07-19 01:49:15.911578'),
('jgmhedfoax2h3084xnci27foyegc8769','.eJxVjMsOwiAQRf-FtSFAeY1L934DAWaQqoGktCvjv2uTLnR7zzn3xULc1hq2QUuYkZ2ZZKffLcX8oLYDvMd26zz3ti5z4rvCDzr4tSM9L4f7d1DjqN9aQbFTMgrLZMCiJy2lKxFAWCLt4wQknTO2WHTkVXGIWhcJSTgtks_s_QHVoDed:1qHIHO:M45dJ0A3h5OO725fxUXUcQSxiEbMdU8k1guwIgEXmJ4','2023-07-20 06:15:50.986330'),
('krdsiysmkae19uxbxxju8tnfd3w12na3','.eJxVjMsOwiAQRf-FtSEz5VFw6d5vIAMDUjU0Ke3K-O_apAvd3nPOfYlA21rD1vMSJhZngShOv2Ok9MhtJ3yndptlmtu6TFHuijxol9eZ8_NyuH8HlXr91tZpX_TovBoY0Ruv2CCkIVOMpJMpXCzTaAkBtSqKgcAZthBRAQOI9wfwUDeH:1qHHtD:y2JLZWrTKTEPjgleqzXB-yTeWP3Fn5QwqWfGq44398s','2023-07-20 05:50:51.861884'),
('tkm6vog3e989tdyheqakt80n5iuc61rl','.eJxVjMsOwiAQRf-FtSFAeY1L934DAWaQqoGktCvjv2uTLnR7zzn3xULc1hq2QUuYkZ2ZZKffLcX8oLYDvMd26zz3ti5z4rvCDzr4tSM9L4f7d1DjqN9aQbFTMgrLZMCiJy2lKxFAWCLt4wQknTO2WHTkVXGIWhcJSTgtks_s_QHVoDed:1qDZex:vJFkJbXbGNfuAQXOqaAP2-1cFNXfjAGDwDsXjeVUAuU','2023-07-10 00:00:47.194164');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
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
