-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: traveloka
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `lokasi`
--

DROP TABLE IF EXISTS `lokasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lokasi` (
  `idlokasi` int NOT NULL,
  `kecamatan` varchar(32) DEFAULT NULL,
  `kabupaten/kota` varchar(32) DEFAULT NULL,
  `provinsi` varchar(32) DEFAULT NULL,
  `detail alamat` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`idlokasi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lokasi`
--

LOCK TABLES `lokasi` WRITE;
/*!40000 ALTER TABLE `lokasi` DISABLE KEYS */;
INSERT INTO `lokasi` VALUES (121,'maos','cilacap','jawa tengah','rt01/rw04'),(122,'banjarbaru','kota banjarbaru','kalimantan selatan','rt02/rw03'),(123,'lengkong','bojongsoang','jawa barat','rt04/rw06'),(124,'kopo','bandung','jawa barat','rt03/rw02'),(125,'palem','purbalingga','jawa tengah','rt 03/rw01');
/*!40000 ALTER TABLE `lokasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paketwisata`
--

DROP TABLE IF EXISTS `paketwisata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paketwisata` (
  `idpaket` int NOT NULL,
  `namapaket` varchar(255) DEFAULT NULL,
  `idtravelagent` int DEFAULT NULL,
  `deskripsi` mediumtext,
  `hargapaket` decimal(10,2) DEFAULT NULL,
  `idpelanggan` int DEFAULT NULL,
  `idlokasi` int DEFAULT NULL,
  PRIMARY KEY (`idpaket`),
  KEY `idtravelagent_idx` (`idtravelagent`),
  KEY `fk_idpelanggan_paket_idx` (`idpelanggan`),
  KEY `idlokasiwisata_idx` (`idlokasi`),
  CONSTRAINT `fk_idpelanggan_paket` FOREIGN KEY (`idpelanggan`) REFERENCES `pelanggan` (`idpelanggan`),
  CONSTRAINT `idlokasiwisata` FOREIGN KEY (`idlokasi`) REFERENCES `lokasi` (`idlokasi`),
  CONSTRAINT `idtravelagent` FOREIGN KEY (`idtravelagent`) REFERENCES `travelagent` (`idtravelagent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paketwisata`
--

LOCK TABLES `paketwisata` WRITE;
/*!40000 ALTER TABLE `paketwisata` DISABLE KEYS */;
INSERT INTO `paketwisata` VALUES (61,'Hemat',11,'Paket Hemat Berkah Ramadhan',5000.00,21,121),(62,'Medium',12,'Paket Medium Agak Mahal',7000.00,22,122),(63,'Berkah',13,'Paket Masuk Surga',10000.00,23,123),(64,'Small',14,'Paket Hemat Berdua',12000.00,24,124),(65,'Sweetbox',15,'Paket bertiga',15000.00,25,125);
/*!40000 ALTER TABLE `paketwisata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelanggan`
--

DROP TABLE IF EXISTS `pelanggan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelanggan` (
  `idpelanggan` int NOT NULL,
  `namapelanggan` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idpelanggan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelanggan`
--

LOCK TABLES `pelanggan` WRITE;
/*!40000 ALTER TABLE `pelanggan` DISABLE KEYS */;
INSERT INTO `pelanggan` VALUES (21,'Detia','Kopo'),(22,'Nurul','Bojongede'),(23,'Lici','Bojongsoang'),(24,'Nussa','PGA'),(25,'Kristin','Buahbatu');
/*!40000 ALTER TABLE `pelanggan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pembayarankamarhotel`
--

DROP TABLE IF EXISTS `pembayarankamarhotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pembayarankamarhotel` (
  `idpembayarankamar` int NOT NULL,
  `idpemesanankamar` int DEFAULT NULL,
  `metodeoembayaran` varchar(255) DEFAULT NULL,
  `totalharga` decimal(10,2) DEFAULT NULL,
  `tanggalpembayaran` date DEFAULT NULL,
  PRIMARY KEY (`idpembayarankamar`),
  KEY `idpemesanankamar_idx` (`idpemesanankamar`),
  CONSTRAINT `idpemesanankamar` FOREIGN KEY (`idpemesanankamar`) REFERENCES `pemesaanankamarhotel` (`idpemesaanankamar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pembayarankamarhotel`
--

LOCK TABLES `pembayarankamarhotel` WRITE;
/*!40000 ALTER TABLE `pembayarankamarhotel` DISABLE KEYS */;
INSERT INTO `pembayarankamarhotel` VALUES (101,81,'QRIS',175000.00,'2023-11-01'),(102,82,'Transfer',200000.00,'2023-08-13'),(103,82,'VA',225000.00,'2023-12-08'),(104,84,'QRIS',190000.00,'2023-09-19'),(105,85,'Transfer',210000.00,'2023-12-15');
/*!40000 ALTER TABLE `pembayarankamarhotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pembayarantiket`
--

DROP TABLE IF EXISTS `pembayarantiket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pembayarantiket` (
  `idpembayaran` int NOT NULL,
  `idpemesanantiket` int DEFAULT NULL,
  `metodepembayaran` varchar(255) DEFAULT NULL,
  `totalharga` decimal(10,2) DEFAULT NULL,
  `tanggalpembayaran` date DEFAULT NULL,
  PRIMARY KEY (`idpembayaran`),
  KEY `idpemesanantiket_idx` (`idpemesanantiket`),
  CONSTRAINT `idpemesanantiket` FOREIGN KEY (`idpemesanantiket`) REFERENCES `pemesanantiket` (`idpemesanantiket`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pembayarantiket`
--

LOCK TABLES `pembayarantiket` WRITE;
/*!40000 ALTER TABLE `pembayarantiket` DISABLE KEYS */;
INSERT INTO `pembayarantiket` VALUES (111,41,'QRIS',50000.00,'2023-11-01'),(112,42,'Transfer',75000.00,'2023-08-13'),(113,43,'VA',100000.00,'2023-12-08'),(114,44,'QRIS',125000.00,'2023-09-19'),(115,45,'Transfer',75000.00,'2023-12-15');
/*!40000 ALTER TABLE `pembayarantiket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pemesaanankamarhotel`
--

DROP TABLE IF EXISTS `pemesaanankamarhotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pemesaanankamarhotel` (
  `idpemesaanankamar` int NOT NULL,
  `idpelanggan` int DEFAULT NULL,
  `idkamarhotel` int DEFAULT NULL,
  `tanggalpemesanan` date DEFAULT NULL,
  `statuspemesanan` varchar(50) DEFAULT NULL,
  `idlokasi` int DEFAULT NULL,
  PRIMARY KEY (`idpemesaanankamar`),
  KEY `id_lokasikamarh_idx` (`idlokasi`),
  CONSTRAINT `id_lokasikamarh` FOREIGN KEY (`idlokasi`) REFERENCES `lokasi` (`idlokasi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pemesaanankamarhotel`
--

LOCK TABLES `pemesaanankamarhotel` WRITE;
/*!40000 ALTER TABLE `pemesaanankamarhotel` DISABLE KEYS */;
INSERT INTO `pemesaanankamarhotel` VALUES (81,21,91,'2023-11-01','booked',121),(82,22,92,'2023-08-13','booking',122),(83,23,93,'2023-12-08','booked',123),(84,24,94,'2023-09-19','booking',124),(85,25,95,'2023-12-15','booked',125);
/*!40000 ALTER TABLE `pemesaanankamarhotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pemesanantempatwisata`
--

DROP TABLE IF EXISTS `pemesanantempatwisata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pemesanantempatwisata` (
  `idpemesanantempat` int NOT NULL,
  `idpelanggan` int DEFAULT NULL,
  `idtempatwisata` int DEFAULT NULL,
  `idlokasi` int DEFAULT NULL,
  `tanggalpemesanan` date DEFAULT NULL,
  `statuspemesanan` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idpemesanantempat`),
  KEY `idtempatwisata_idx` (`idtempatwisata`),
  KEY `idlokasi_idx` (`idlokasi`),
  CONSTRAINT `fkidlokasi` FOREIGN KEY (`idlokasi`) REFERENCES `lokasi` (`idlokasi`),
  CONSTRAINT `idtempatwisata` FOREIGN KEY (`idtempatwisata`) REFERENCES `tempatwisata` (`idtempat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pemesanantempatwisata`
--

LOCK TABLES `pemesanantempatwisata` WRITE;
/*!40000 ALTER TABLE `pemesanantempatwisata` DISABLE KEYS */;
INSERT INTO `pemesanantempatwisata` VALUES (71,21,31,121,'2023-11-01','booked'),(72,22,32,122,'2023-08-13','booking'),(73,23,33,123,'2023-12-08','booked'),(74,24,34,124,'2023-09-19','booking'),(75,25,35,125,'2023-12-15','booked');
/*!40000 ALTER TABLE `pemesanantempatwisata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pemesanantiket`
--

DROP TABLE IF EXISTS `pemesanantiket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pemesanantiket` (
  `idpemesanantiket` int NOT NULL,
  `idpelanggan` int DEFAULT NULL,
  `idtiket` int DEFAULT NULL,
  `tanggalpemesanan` date DEFAULT NULL,
  `statuspemesanan` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idpemesanantiket`),
  KEY `idpelanggan_idx` (`idpelanggan`),
  CONSTRAINT `fk_pelanggan_tiket_id` FOREIGN KEY (`idpelanggan`) REFERENCES `pelanggan` (`idpelanggan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pemesanantiket`
--

LOCK TABLES `pemesanantiket` WRITE;
/*!40000 ALTER TABLE `pemesanantiket` DISABLE KEYS */;
INSERT INTO `pemesanantiket` VALUES (41,21,51,'2023-11-01','booked'),(42,22,52,'2023-08-13','booking'),(43,23,53,'2023-12-08','booked'),(44,24,54,'2023-09-19','booking'),(45,25,55,'2023-12-15','booked');
/*!40000 ALTER TABLE `pemesanantiket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tempatwisata`
--

DROP TABLE IF EXISTS `tempatwisata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tempatwisata` (
  `idtempat` int NOT NULL,
  `namatempat` varchar(255) DEFAULT NULL,
  `kota` varchar(255) DEFAULT NULL,
  `hargatiketmasuk` decimal(10,2) DEFAULT NULL,
  `idpelanggan` int DEFAULT NULL,
  PRIMARY KEY (`idtempat`),
  KEY `id_pelanggan_tempat_idx` (`idpelanggan`),
  CONSTRAINT `id_pelanggan_tempat` FOREIGN KEY (`idpelanggan`) REFERENCES `pelanggan` (`idpelanggan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tempatwisata`
--

LOCK TABLES `tempatwisata` WRITE;
/*!40000 ALTER TABLE `tempatwisata` DISABLE KEYS */;
INSERT INTO `tempatwisata` VALUES (31,'Danau Galau','Bandung',5000.00,21),(32,'Panghegar','Jakarta',75000.00,22),(33,'Monas','Jakarta',50000.00,23),(34,'Ancol','Jakarta',150000.00,24),(35,'Kuta','Bali',175000.00,25);
/*!40000 ALTER TABLE `tempatwisata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travelagent`
--

DROP TABLE IF EXISTS `travelagent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travelagent` (
  `idtravelagent` int NOT NULL,
  `namatravelagent` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idtravelagent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travelagent`
--

LOCK TABLES `travelagent` WRITE;
/*!40000 ALTER TABLE `travelagent` DISABLE KEYS */;
INSERT INTO `travelagent` VALUES (11,'Amal','Telkom'),(12,'Jariyah','Bojongsoang'),(13,'Salma','Buahbatu'),(14,'Hanifah','Cimahi'),(15,'Listyanto','USA');
/*!40000 ALTER TABLE `travelagent` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-02 10:48:36
