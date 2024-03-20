CREATE DATABASE  IF NOT EXISTS `progetti` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `progetti`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: progetti
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tablename` varchar(32) NOT NULL,
  `recordblob` mediumblob,
  `dataora` datetime DEFAULT NULL,
  `avatar` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=536 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,'login errata',_binary 'a sti cazzi - non la so','1899-12-30 16:58:07',NULL),(38,'scaricoore',_binary 'INSERT INTO scaricoore (`prefisso`, `id-login`,`data`,`idprogetto`,`idprogettodettaglio`,`ore`,`note`) VALUES (\'OK\',3,\'2024/02/28\',5,\'\',8,\'88888\r\n\')','2024-02-28 16:09:01','tre c'),(40,'scaricoore',_binary 'INSERT INTO scaricoore (`prefisso`, `id-login`,`data`,`idprogetto`,`idprogettodettaglio`,`ore`,`note`) VALUES (\'OK\',3,\'2024/02/28\',5,\'\',8,\'programmazione\r\n\')','2024-02-28 16:16:22','tre c'),(41,'scaricoore',_binary 'INSERT INTO scaricoore (`prefisso`, `id-login`,`data`,`idprogetto`,`idprogettodettaglio`,`ore`,`note`) VALUES (\'OK\',3,\'2024/02/28\',5,\'\',8,\'programmazione\r\n\')','2024-02-28 16:16:22','tre c'),(50,'scaricoore',_binary 'INSERT INTO scaricoore (`prefisso`, `id-login`,`data`,`idprogetto`,`idprogettodettaglio`,`ore`,`note`) VALUES (\'OK\',3,\'2024/02/28\',5,\'PROGRAMMAZIONE\',1,\'ecco la notarelle.\')','2024-02-28 16:49:55','tre c'),(51,'scaricoore',_binary 'INSERT INTO scaricoore (`prefisso`, `id-login`,`data`,`idprogetto`,`idprogettodettaglio`,`ore`,`note`) VALUES (\'OK\',3,\'2024/02/28\',5,\'PROGRAMMAZIONE\',1,\'ecco la notarelle.\')','2024-02-28 16:49:55','tre c'),(79,'scaricoore',_binary 'INSERT INTO scaricoore (`prefisso`, `id-login`,`data`,`idprogetto`,`idprogettodettaglio`,`ore`,`note`) VALUES (\'OK\',5,\'2024/02/29\',4,\'PRO\',4,\'4444\')','2024-02-29 07:48:16','cinque E'),(206,'scaricoore POST ',_binary 'idora = 27\r\nprefisso = OK\r\nid-login = 2\r\ndata = 28/02/2024\r\nidprogetto = 6\r\nidprogettodettaglio = PROGRAMMAZIONE\r\nore = 8\r\nnote = programmazione difficile\r\nma molto difficile','2024-03-04 09:02:59','graziella mancuso [2]'),(207,'scaricoore POST ',_binary 'idora = 27\r\nprefisso = OK\r\nid-login = 2\r\ndata = 28/02/2024\r\nidprogetto = 6\r\nidprogettodettaglio = PROGRAMMAZIONE\r\nore = 8\r\nnote = programmazione difficile\r\nma molto difficile','2024-03-04 09:02:59','graziella mancuso [2]'),(209,'scaricoore POST ',_binary 'idora = 27\r\nprefisso = OK\r\nid-login = 2\r\ndata = 28/02/2024\r\nidprogetto = 6\r\nidprogettodettaglio = PROGRAMMAZIONE\r\nore = 8\r\nnote = programmazione difficile\r\nma molto difficile\r\nma proprio tanto complessa','2024-03-04 09:09:54','antonio basurto [5]'),(210,'scaricoore POST ',_binary 'idora = 27\r\nprefisso = OK\r\nid-login = 2\r\ndata = 28/02/2024\r\nidprogetto = 6\r\nidprogettodettaglio = PROGRAMMAZIONE\r\nore = 8\r\nnote = programmazione difficile\r\nma molto difficile\r\nma proprio tanto complessa','2024-03-04 09:09:54','antonio basurto [5]'),(213,'scaricoore POST PRIMA',_binary 'idora = 27\r\nprefisso = OK\r\nid-login = 2\r\ndata = 28/02/2024\r\nidprogetto = 6\r\nidprogettodettaglio = PROGRAMMAZIONE\r\nore = 7\r\nnote = programmazione complessa','2024-03-04 09:14:56','graziella mancuso [2]'),(214,'scaricoore POST DOPO',_binary 'idora = 27\r\nprefisso = OK\r\nid-login = 2\r\ndata = 28/02/2024\r\nidprogetto = 6\r\nidprogettodettaglio = PROGRAMMAZIONE\r\nore = 7\r\nnote = programmazione complessa','2024-03-04 09:14:57','graziella mancuso [2]'),(216,'scaricoore POST PRIMA',_binary 'idora = 27\r\nprefisso = OK\r\nid-login = 2\r\ndata = 28/02/2024\r\nidprogetto = 6\r\nidprogettodettaglio = PROGRAMMAZIONE\r\nore = 7\r\nnote = programmazione complessa','2024-03-04 09:17:36','graziella mancuso [2]'),(217,'scaricoore POST DOPO',_binary 'idora = 27\r\nprefisso = OK\r\nid-login = 2\r\ndata = 28/02/2024\r\nidprogetto = 6\r\nidprogettodettaglio = PROGRAMMAZIONE\r\nore = 7\r\nnote = programmazione delecata.','2024-03-04 09:17:49','graziella mancuso [2]'),(226,'scaricoore',_binary 'INSERT INTO scaricoore (`prefisso`, `id-login`,`data`,`idprogetto`,`idprogettodettaglio`,`ore`,`note`) VALUES (\'OK\',5,\'2024/03/04\',5,\'PROGRAMMAZIONE\',8,\'programma\')','2024-03-04 09:54:46','antonio basurto [5]'),(288,'scaricoore',_binary 'INSERT INTO scaricoore (`prefisso`, `id-login`,`data`,`idprogetto`,`idprogettodettaglio`,`ore`,`note`) VALUES (\'TST\',2,\'2024/03/05\',2,\'2\',8,\'agg.ot documentazione\')','2024-03-05 14:03:55','graziella mancuso [2]'),(298,'scaricoore POST PRIMA',_binary 'idora = 27\r\nprefisso = OK\r\nid-login = 2\r\ndata = 28/02/2024\r\nidprogetto = 6\r\nidprogettodettaglio = PROGRAMMAZIONE\r\nore = 5\r\nnote = programmazione delicata e fare attenzione agli algoritmi\r\ndi calcolo.','2024-03-05 14:37:32','marika bentivoli [3]'),(299,'scaricoore POST DOPO',_binary 'idora = 27\r\nprefisso = OK\r\nid-login = 2\r\ndata = 03/03/2024\r\nidprogetto = 6\r\nidprogettodettaglio = PROGRAMMAZIONE\r\nore = 5\r\nnote = programmazione delicata e fare attenzione agli algoritmi\r\ndi calcolo.','2024-03-05 14:37:37','marika bentivoli [3]'),(300,'scaricoore POST PRIMA',_binary 'idora = 19\r\nprefisso = OK\r\nid-login = 2\r\ndata = 04/03/2024\r\nidprogetto = 6\r\nidprogettodettaglio = PROGRAMMAZIONE\r\nore = 8\r\nnote = programmazione gui','2024-03-05 14:37:39','marika bentivoli [3]'),(301,'scaricoore POST DOPO',_binary 'idora = 19\r\nprefisso = OK\r\nid-login = 2\r\ndata = 30/03/2024\r\nidprogetto = 6\r\nidprogettodettaglio = PROGRAMMAZIONE\r\nore = 8\r\nnote = programmazione gui','2024-03-05 14:37:45','marika bentivoli [3]'),(302,'scaricoore POST PRIMA',_binary 'idora = 19\r\nprefisso = OK\r\nid-login = 2\r\ndata = 30/03/2024\r\nidprogetto = 6\r\nidprogettodettaglio = PROGRAMMAZIONE\r\nore = 8\r\nnote = programmazione gui','2024-03-05 14:37:51','marika bentivoli [3]'),(303,'scaricoore POST DOPO',_binary 'idora = 19\r\nprefisso = OK\r\nid-login = 2\r\ndata = 02/03/2024\r\nidprogetto = 6\r\nidprogettodettaglio = PROGRAMMAZIONE\r\nore = 8\r\nnote = programmazione gui','2024-03-05 14:37:54','marika bentivoli [3]'),(304,'scaricoore POST PRIMA',_binary 'idora = 19\r\nprefisso = OK\r\nid-login = 2\r\ndata = 02/03/2024\r\nidprogetto = 6\r\nidprogettodettaglio = PROGRAMMAZIONE\r\nore = 8\r\nnote = programmazione gui','2024-03-05 14:38:01','marika bentivoli [3]'),(305,'scaricoore POST DOPO',_binary 'idora = 19\r\nprefisso = OK\r\nid-login = 2\r\ndata = 01/03/2024\r\nidprogetto = 6\r\nidprogettodettaglio = PROGRAMMAZIONE\r\nore = 8\r\nnote = programmazione gui','2024-03-05 14:38:11','marika bentivoli [3]'),(306,'scaricoore POST PRIMA',_binary 'idora = 19\r\nprefisso = OK\r\nid-login = 2\r\ndata = 01/03/2024\r\nidprogetto = 6\r\nidprogettodettaglio = PROGRAMMAZIONE\r\nore = 8\r\nnote = programmazione gui','2024-03-05 14:38:13','marika bentivoli [3]'),(307,'scaricoore POST PRIMA',_binary 'idora = 27\r\nprefisso = OK\r\nid-login = 2\r\ndata = 03/03/2024\r\nidprogetto = 6\r\nidprogettodettaglio = PROGRAMMAZIONE\r\nore = 5\r\nnote = programmazione delicata e fare attenzione agli algoritmi\r\ndi calcolo.','2024-03-05 14:38:18','marika bentivoli [3]'),(308,'scaricoore POST DOPO',_binary 'idora = 27\r\nprefisso = OK\r\nid-login = 2\r\ndata = 05/03/2024\r\nidprogetto = 6\r\nidprogettodettaglio = PROGRAMMAZIONE\r\nore = 5\r\nnote = programmazione delicata e fare attenzione agli algoritmi\r\ndi calcolo.','2024-03-05 14:38:26','marika bentivoli [3]'),(309,'scaricoore POST PRIMA',_binary 'idora = 27\r\nprefisso = OK\r\nid-login = 2\r\ndata = 05/03/2024\r\nidprogetto = 6\r\nidprogettodettaglio = PROGRAMMAZIONE\r\nore = 5\r\nnote = programmazione delicata e fare attenzione agli algoritmi\r\ndi calcolo.','2024-03-05 14:38:35','marika bentivoli [3]'),(310,'scaricoore POST DOPO',_binary 'idora = 27\r\nprefisso = OK\r\nid-login = 2\r\ndata = 04/03/2024\r\nidprogetto = 6\r\nidprogettodettaglio = PROGRAMMAZIONE\r\nore = 5\r\nnote = programmazione delicata e fare attenzione agli algoritmi\r\ndi calcolo.','2024-03-05 14:38:45','marika bentivoli [3]'),(312,'scaricoore',_binary 'INSERT INTO scaricoore (`prefisso`, `id-login`,`data`,`idprogetto`,`idprogettodettaglio`,`ore`,`note`) VALUES (\'OK\',4,\'2024/03/05\',6,\'PROGRAMMAZIONE\',8,\'programmazione\')','2024-03-05 14:46:25','elizabetta biondi [4]'),(313,'scaricoore',_binary 'INSERT INTO scaricoore (`prefisso`, `id-login`,`data`,`idprogetto`,`idprogettodettaglio`,`ore`,`note`) VALUES (\'OK\',4,\'2024/03/05\',7,\'ANALISI\',8,\'studio del problema\')','2024-03-05 14:47:06','elizabetta biondi [4]'),(451,'login',_binary 'b - b','2024-03-14 09:00:18','graziella mancuso [2]'),(486,'login',_binary 'd - d','2024-03-14 14:13:46','elizabetta biondi [4]'),(509,'scaricoore POST DOPO',_binary 'idora = 33\r\nprefisso = OK\r\nid-login = 2\r\ndata = 12/03/2024\r\nidprogetto = 8\r\nidprogettodettaglio = CNV\r\nore = 10\r\nnote = prototipo','2024-03-14 16:47:10','marika bentivoli [3]'),(518,'login',_binary 'c - c','2024-03-15 13:44:59','marika bentivoli [3]'),(519,'scaricoore POST PRIMA',_binary 'idora = 25\r\nprefisso = TST\r\nid-login = 2\r\ndata = 08/03/2001\r\nidprogetto = 1\r\nidprogettodettaglio = 1\r\nore = 8\r\nnote = programmazione      ','2024-03-15 13:49:41','marika bentivoli [3]'),(520,'scaricoore POST PRIMA',_binary 'idora = 25\r\nprefisso = TST\r\nid-login = 2\r\ndata = 08/03/2001\r\nidprogetto = 1\r\nidprogettodettaglio = 1\r\nore = 8\r\nnote = programmazione      ','2024-03-15 13:50:03','marika bentivoli [3]'),(521,'scaricoore POST DOPO',_binary 'idora = 25\r\nprefisso = TST\r\nid-login = 2\r\ndata = 14/03/2024\r\nidprogetto = 1\r\nidprogettodettaglio = 1\r\nore = 8\r\nnote = programmazione      ','2024-03-15 13:50:12','marika bentivoli [3]'),(522,'login',_binary 'c - c','2024-03-15 14:16:50','marika bentivoli [3]'),(523,'login',_binary 'c - c','2024-03-15 14:24:48','marika bentivoli [3]'),(524,'login',_binary 'c - c','2024-03-15 14:26:16','marika bentivoli [3]'),(525,'login',_binary 'c - c','2024-03-15 14:31:47','marika bentivoli [3]'),(526,'login',_binary 'c - c','2024-03-15 14:40:44','marika bentivoli [3]'),(527,'login',_binary 'c - c','2024-03-15 14:44:44','marika bentivoli [3]'),(528,'login',_binary 'c - c','2024-03-15 14:54:09','marika bentivoli [3]'),(529,'login',_binary 'c - c','2024-03-15 16:40:28','marika bentivoli [3]'),(530,'login',_binary 'c - c','2024-03-16 11:10:55','marika bentivoli [3]'),(531,'login',_binary 'c - c','2024-03-16 11:22:14','marika bentivoli [3]'),(532,'login',_binary 'c - c','2024-03-16 11:23:28','marika bentivoli [3]'),(533,'login',_binary 'c - c','2024-03-16 11:50:26','marika bentivoli [3]'),(534,'login',_binary 'c - c','2024-03-16 14:04:18','marika bentivoli [3]'),(535,'login',_binary 'c - c','2024-03-16 14:05:15','marika bentivoli [3]');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Utente` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `prefisso` varchar(3) DEFAULT NULL,
  `avatar` varchar(45) DEFAULT NULL,
  `mail` varchar(200) DEFAULT NULL,
  `Amministratore` int DEFAULT NULL,
  `mailInviataIl` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'a','a','TST','mario rossi [1]',NULL,0,NULL),(2,'b','b','TST','graziella mancuso [2]',NULL,0,NULL),(3,'c','c','OK','marika bentivoli [3]',NULL,1,NULL),(4,'d','d','OK','elizabetta biondi [4]',NULL,0,NULL),(5,'e','e','OK','antonio basurto [5]',NULL,0,NULL),(6,'f','f','OK','pina giusti [6]',NULL,0,NULL);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `progetto`
--

DROP TABLE IF EXISTS `progetto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `progetto` (
  `prefisso` varchar(3) NOT NULL,
  `idprogetto` int NOT NULL AUTO_INCREMENT,
  `NomeProgetto` varchar(200) DEFAULT NULL,
  `Inizio` date NOT NULL,
  `Fine` date NOT NULL,
  `Attivo` varchar(2) DEFAULT 'SI',
  `Budget` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`idprogetto`,`prefisso`),
  UNIQUE KEY `idprogetto_UNIQUE` (`idprogetto`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progetto`
--

LOCK TABLES `progetto` WRITE;
/*!40000 ALTER TABLE `progetto` DISABLE KEYS */;
INSERT INTO `progetto` VALUES ('TST',1,'progetto rifacimento programma verticale gestione marketing','2024-01-01','2024-12-28','SI',30000.00),('TST',2,'manutenzione software gestione target azienda','2024-02-01','2024-03-31','SI',2000.00),('TST',3,'rifacimento manuale programma ARCON.EXE','2024-08-01','2024-09-30','SI',5000.00),('OK',4,'progetto programmazione ','2024-01-01','2024-12-31','SI',1500.00),('OK',5,'sistemazione software datato su nuovi pc.','2024-02-01','2024-03-31','SI',2600.00),('OK',6,'sistemazione programma per accesso aziendale','2024-08-01','2024-08-31','SI',5000.00),('OK',7,'conversione su web stubio - main','2024-01-01','2024-12-31','SI',50000.00),('OK',8,'conversione da um file :MP3 a un file video','2024-01-01','2024-12-31','SI',6500.00);
/*!40000 ALTER TABLE `progetto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `progettodettaglio`
--

DROP TABLE IF EXISTS `progettodettaglio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `progettodettaglio` (
  `prefisso` varchar(3) NOT NULL,
  `idprogetto` int NOT NULL,
  `idprogettodettaglio` varchar(20) NOT NULL,
  `descrizione` varchar(132) NOT NULL,
  `datainizio` date NOT NULL,
  `datafine` date NOT NULL,
  `BudgetDettaglio` decimal(20,2) DEFAULT NULL,
  `OreDettaglio` int DEFAULT NULL,
  `attivo` varchar(2) DEFAULT 'SI',
  PRIMARY KEY (`prefisso`,`idprogetto`,`idprogettodettaglio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progettodettaglio`
--

LOCK TABLES `progettodettaglio` WRITE;
/*!40000 ALTER TABLE `progettodettaglio` DISABLE KEYS */;
INSERT INTO `progettodettaglio` VALUES ('OK',4,'PRO','programmazione ','2024-01-01','2024-12-31',NULL,9000,'SI'),('OK',5,'ANALISI','ANALISI','2024-01-01','2024-12-31',15000.00,50,'SI'),('OK',5,'PROGRAMMAZIONE','programmazione','2024-01-01','2024-12-31',8000.00,1000,'SI'),('OK',6,'PROGRAMMAZIONE','programmazione','2024-08-01','2024-08-31',17000.00,50,'SI'),('OK',7,'ANALISI','STUDIO DI FATTIBILITA E ANALISI','2024-05-01','2024-05-31',5000.00,500,'SI'),('OK',8,'CNV','realizzazione di un prototopo','2024-03-01','2024-03-31',7500.00,100,'SI'),('TST',1,'1','programmazione','2024-01-01','2024-12-31',143430.00,500,'SI'),('TST',1,'2','analisi','2024-01-01','2024-01-31',5000.00,100,'SI'),('TST',2,'1','programmazione e manutenzione programmi','2024-03-01','2024-03-31',5000.00,500,'SI'),('TST',2,'2','spstemazione documentazione ','2024-04-01','2024-04-16',1000.00,50,'SI'),('TST',3,'1','riscrittura del manuale con i link nel software','2024-08-01','2024-09-30',5000.00,1000,'SI');
/*!40000 ALTER TABLE `progettodettaglio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scaricoore`
--

DROP TABLE IF EXISTS `scaricoore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scaricoore` (
  `idora` bigint NOT NULL AUTO_INCREMENT,
  `prefisso` varchar(3) NOT NULL,
  `id-login` int NOT NULL,
  `data` date NOT NULL,
  `idprogetto` int NOT NULL,
  `idprogettodettaglio` varchar(20) NOT NULL,
  `ore` decimal(6,2) NOT NULL,
  `note` longtext NOT NULL,
  PRIMARY KEY (`idora`,`prefisso`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scaricoore`
--

LOCK TABLES `scaricoore` WRITE;
/*!40000 ALTER TABLE `scaricoore` DISABLE KEYS */;
INSERT INTO `scaricoore` VALUES (1,'OK',3,'2024-02-10',5,'PROGRAMMAZIONE',8.00,'programmazione'),(1,'TST',0,'2024-01-01',2,'1',8.00,'analisi '),(2,'OK',3,'2024-02-27',4,'PRO',3.00,'33232232323\n'),(3,'OK',3,'2024-02-27',4,'PRO',8.00,'ibnbibbiit\r\n'),(4,'OK',3,'2024-02-27',5,'PROGRAMMAZIONE',10.00,'programmazione complessa\r\n'),(5,'OK',3,'2024-02-27',5,'PROGRAMMAZIONE',10.00,'programmazione complessa\r\n'),(6,'OK',3,'2024-02-27',5,'PROGRAMMAZIONE',10.00,'programmazione complessa\r\n'),(7,'OK',3,'2024-02-28',4,'PRO',8.00,'note\r\n'),(8,'OK',3,'2024-02-28',5,'PROGRAMMAZIONE',8.00,'88888\r\n'),(9,'OK',3,'2024-02-28',5,'PROGRAMMAZIONE',8.00,'programmazione\r\n'),(10,'OK',3,'2024-02-28',5,'PROGRAMMAZIONE',1.00,'ecco la notarelle.'),(11,'OK',5,'2024-02-28',5,'PROGRAMMAZIONE',8.00,'codice sorgente\r\nsviluppo interfaccia.'),(12,'OK',5,'2024-02-28',5,'ANALISI',8.00,'note.'),(13,'OK',5,'2024-02-29',4,'PRO',4.00,'4444'),(14,'OK',2,'2024-03-02',4,'PRO',5.00,'note'),(15,'OK',1,'2024-03-01',5,'ANALISI',8.00,'analisi'),(16,'OK',1,'2024-03-02',5,'PROGRAMMAZIONE',6.00,'sviluppo'),(17,'OK',2,'2024-03-02',7,'ANALISI',8.00,'analisi'),(18,'OK',2,'2024-03-03',5,'PROGRAMMAZIONE',8.00,'svlipuppo parte su web'),(19,'OK',2,'2024-03-01',6,'PROGRAMMAZIONE',8.00,'programmazione gui'),(20,'OK',3,'2024-02-03',7,'ANALISI',8.00,'analisi veritica'),(21,'OK',2,'2024-02-28',7,'ANALISI',8.00,'analisi'),(22,'OK',2,'2024-02-25',7,'ANALISI',8.00,'analisi'),(23,'OK',5,'2024-02-26',4,'PRO',4.00,'interfaccia'),(24,'TST',2,'2024-03-15',1,'1',8.00,'prova'),(25,'TST',2,'2024-03-14',1,'1',8.00,'programmazione      '),(27,'OK',2,'2024-03-04',6,'PROGRAMMAZIONE',5.00,'programmazione delicata e fare attenzione agli algoritmi\r\ndi calcolo.'),(29,'OK',5,'2024-03-04',5,'PROGRAMMAZIONE',8.00,'programma'),(30,'TST',2,'2024-03-05',2,'2',8.00,'agg.ot documentazione'),(31,'OK',4,'2024-03-05',6,'PROGRAMMAZIONE',8.00,'programmazione'),(32,'OK',4,'2024-03-05',7,'ANALISI',8.00,'studio del problema'),(33,'OK',2,'2024-03-12',8,'CNV',10.00,'prototipo');
/*!40000 ALTER TABLE `scaricoore` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-16 17:37:52
