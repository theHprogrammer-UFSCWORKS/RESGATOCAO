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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adocao_animal`
--

LOCK TABLES `adocao_animal` WRITE;
/*!40000 ALTER TABLE `adocao_animal` DISABLE KEYS */;
INSERT INTO `adocao_animal` VALUES
(1,'Fro',1,'animal_photos/Fro/dog2_1-1024x676.jpg','ate_1_ano','femea',6,'Preto e amarelo','Castanhos','A Frô é um “espeto”, é a mais curiosa e destemida dos três. Não tem medo de cachorros muito maiores do que ela e chega a latir para eles. É a única que saiu parecida com a mãe, tem pelo lisinho.',1),
(2,'Zhen',0,'animal_photos/Zhen/cat2_1-1024x683.jpg','ate_1_ano','femea',5,'Branco, Cinza, Preto','Amarelos','Zhen caminhava tranquilamente no meio de uma rua muito movimentada quando passamos por ela. A princípio não acreditamos no que estávamos vendo, demos a volta na quadra e sim: lá estava ela em seu esplendor. Paramos o carro e nos preparamos para muita correia, arranhões e talvez a frustração de não conseguirmos pegá-la quando surpreendemente a Zhen veio até nós, pediu colo e começou imediatamente a ronronar. É a gata mais tranqüila do mundo e por isso ganhou esse nome: Zhen.\r\n\r\nZhen tem 5 meses e é a gata mais tranqüila que entrou para a nossa matilha. A Zhen é do tipo que gosta de uma cama tanto quanto de seu pratinho de ração – e se estiverem perto um do outro é o paraíso na Terra. Já está castrada e vacinada, se dá bem com humanos e outros gatinhos. Aliás, adora a companhia humana, procura, pede colo, se aninha, um doce de felina.',2),
(3,'Chambinha',0,'animal_photos/Chambinha/dog5_2-1024x683_Mg5O2b8.jpg','um_a_tres_anos','macho',12,'Bege Claro, Preto','Castanhos','A Chambinha estava na casa de uma pessoa que já tinha muitos cães e tratava todos muito mal. Não havia comida e muito menos carinho. Resolvemos ajudar essa pequena de olhar triste, conosco ela ter uma chance de encontrar uma boa família. Quando chegou na matilha, Chambinha estava apavorada, não queria sair da casinha e qualquer toque carinhoso era considerado uma ameaça. Ela se encolhia e chegava a fazer xixi de tanto medo. Com o tempo ela foi se soltando e entendendo que as pessoas podem ser boas. A primeira vez que aceitou um carinho foi uma festa! Agora ela recuperou totalmente a confiança e a alegria de viver.\r\n\r\nChambinha tem porte médio para pequeno, é uma cachorrinha gentil. Gosta de chamego, convive bem com outros cachorros. Está castrada e vacinada e tem aproximadamente 3 anos.',1),
(4,'Pati Fifi',0,'animal_photos/Pati Fifi/dog9_3-1024x683_ZHlYG0e.jpg','cinco_a_dez_anos','femea',15,'Bege, Branco, Preto','Castanhos','A Pati pertencia a uma guardadora de carros que trabalhava numa praça de Curitiba. Todos os dias acompanhava a tutora no trajeto de casa até a praça, até que um dia sua tutora faleceu. Mesmo sem sua companheira humana, a Pati Fifi continuou a fazer esse trajeto todos os dias demonstrando uma fidelidade que só os cães possuem. Na verdade, ela só tinha a sua tutora para defendê-la e soubemos que ela e estava sendo maltratada e não tinha mais casa para voltar. Esperamos a Pati na praça e ela nos acompanhou, feliz e faceira – e assim ela entrou para a matilha do Tomba Latas.\r\n\r\nPati Fifi já é uma senhorinha, calculamos que tenha uns 9 ou 10 anos. É a doçura em forma de cão, anda de carro super comportada, passeia na guia sem puxar, caminha ao seu lado. Tem cerca de 14 quilos (porte médio), tem o temperamento calmo e quando ama alguém se entrega completamente. Adora ganhar carinho na barriga.',1);
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

-- Dump completed on 2023-07-06  5:33:14
