-- MySQL dump 10.15  Distrib 10.0.21-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: saleco
-- ------------------------------------------------------
-- Server version	10.0.21-MariaDB

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
-- Table structure for table `CUSTOMER`
--

DROP TABLE IF EXISTS `CUSTOMER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CUSTOMER` (
  `CUS_CODE` int(11) DEFAULT NULL,
  `CUS_LNAME` varchar(15) DEFAULT NULL,
  `CUS_FNAME` varchar(15) DEFAULT NULL,
  `CUS_INITIAL` varchar(1) DEFAULT NULL,
  `CUS_AREACODE` varchar(3) DEFAULT NULL,
  `CUS_PHONE` varchar(8) DEFAULT NULL,
  `CUS_BALANCE` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMER`
--

LOCK TABLES `CUSTOMER` WRITE;
/*!40000 ALTER TABLE `CUSTOMER` DISABLE KEYS */;
INSERT INTO `CUSTOMER` VALUES (10010,'Ramas','Alfred','A','615','844-2573',0),(10011,'Dunne','Leona','K','713','894-1238',0),(10012,'Smith','Kathy','W','615','894-2285',345.86),(10013,'Olowski','Paul','F','615','894-2180',536.75),(10014,'Orlando','Myron','','615','222-1672',0),(10015,'O\'Brian','Amy','B','713','442-3381',0),(10016,'Brown','James','G','615','297-1228',221.19),(10017,'Williams','George','','615','290-2556',768.93),(10018,'Farriss','Anne','G','713','382-7185',216.55),(10019,'Smith','Olette','K','615','297-3809',0);
/*!40000 ALTER TABLE `CUSTOMER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INVOICE`
--

DROP TABLE IF EXISTS `INVOICE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INVOICE` (
  `INV_NUMBER` int(11) DEFAULT NULL,
  `CUS_CODE` int(11) DEFAULT NULL,
  `INV_DATE` datetime DEFAULT NULL,
  `INV_SUBTOTAL` float DEFAULT NULL,
  `INV_TAX` float DEFAULT NULL,
  `INV_TOTAL` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INVOICE`
--

LOCK TABLES `INVOICE` WRITE;
/*!40000 ALTER TABLE `INVOICE` DISABLE KEYS */;
INSERT INTO `INVOICE` VALUES (1001,10014,'0000-00-00 00:00:00',24.9,1.99,26.89),(1002,10011,'0000-00-00 00:00:00',9.98,0.8,10.78),(1003,10012,'0000-00-00 00:00:00',153.85,12.31,166.16),(1004,10011,'0000-00-00 00:00:00',34.97,2.8,37.77),(1005,10018,'0000-00-00 00:00:00',70.44,5.64,76.08),(1006,10014,'0000-00-00 00:00:00',397.83,31.83,429.66),(1007,10015,'0000-00-00 00:00:00',34.97,2.8,37.77),(1008,10011,'0000-00-00 00:00:00',399.15,31.93,431.08);
/*!40000 ALTER TABLE `INVOICE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LINE`
--

DROP TABLE IF EXISTS `LINE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LINE` (
  `INV_NUMBER` int(11) DEFAULT NULL,
  `LINE_NUMBER` int(11) DEFAULT NULL,
  `P_CODE` varchar(10) DEFAULT NULL,
  `LINE_UNITS` float DEFAULT NULL,
  `LINE_PRICE` float DEFAULT NULL,
  `LINE_TOTAL` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LINE`
--

LOCK TABLES `LINE` WRITE;
/*!40000 ALTER TABLE `LINE` DISABLE KEYS */;
INSERT INTO `LINE` VALUES (1001,1,'13-Q2/P2',1,14.99,14.99),(1001,2,'23109-HB',1,9.95,9.95),(1002,1,'54778-2T',2,4.99,9.98),(1003,1,'2238/QPD',1,38.95,38.95),(1003,2,'1546-QQ2',1,39.95,39.95),(1003,3,'13-Q2/P2',5,14.99,74.95),(1004,1,'54778-2T',3,4.99,14.97),(1004,2,'23109-HB',2,9.95,19.9),(1005,1,'PVC23DRT',12,5.87,70.44),(1006,1,'SM-18277',3,6.99,20.97),(1006,2,'2232/QTY',1,109.92,109.92),(1006,3,'23109-HB',1,9.95,9.95),(1006,4,'89-WRE-Q',1,256.99,256.99),(1007,1,'13-Q2/P2',2,14.99,29.98),(1007,2,'54778-2T',1,4.99,4.99),(1008,1,'PVC23DRT',5,5.87,29.35),(1008,2,'WR3/TT3',3,119.95,359.85),(1008,3,'23109-HB',1,9.95,9.95);
/*!40000 ALTER TABLE `LINE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCT`
--

DROP TABLE IF EXISTS `PRODUCT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCT` (
  `P_CODE` varchar(10) DEFAULT NULL,
  `P_DESCRIPT` varchar(35) DEFAULT NULL,
  `P_INDATE` datetime DEFAULT NULL,
  `P_QOH` int(11) DEFAULT NULL,
  `P_MIN` int(11) DEFAULT NULL,
  `P_PRICE` float DEFAULT NULL,
  `P_DISCOUNT` float DEFAULT NULL,
  `V_CODE` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCT`
--

LOCK TABLES `PRODUCT` WRITE;
/*!40000 ALTER TABLE `PRODUCT` DISABLE KEYS */;
INSERT INTO `PRODUCT` VALUES ('11QER/31','Power painter, 15 psi., 3-nozzle','0000-00-00 00:00:00',8,5,109.99,0,25595),('13-Q2/P2','7.25-in. pwr. saw blade','0000-00-00 00:00:00',32,15,14.99,0.05,21344),('14-Q1/L3','9.00-in. pwr. saw blade','0000-00-00 00:00:00',18,12,17.49,0,21344),('1546-QQ2','Hrd. cloth, 1/4-in., 2x50','0000-00-00 00:00:00',15,8,39.95,0,23119),('1558-QW1','Hrd. cloth, 1/2-in., 3x50','0000-00-00 00:00:00',23,5,43.99,0,23119),('2232/QTY','B&D jigsaw, 12-in. blade','0000-00-00 00:00:00',8,5,109.92,0.05,24288),('2232/QWE','B&D jigsaw, 8-in. blade','0000-00-00 00:00:00',6,5,99.87,0.05,24288),('2238/QPD','B&D cordless drill, 1/2-in.','0000-00-00 00:00:00',12,5,38.95,0.05,25595),('23109-HB','Claw hammer','0000-00-00 00:00:00',23,10,9.95,0.1,21225),('23114-AA','Sledge hammer, 12 lb.','0000-00-00 00:00:00',8,5,14.4,0.05,0),('54778-2T','Rat-tail file, 1/8-in. fine','0000-00-00 00:00:00',43,20,4.99,0,21344),('89-WRE-Q','Hicut chain saw, 16 in.','0000-00-00 00:00:00',11,5,256.99,0.05,24288),('PVC23DRT','PVC pipe, 3.5-in., 8-ft','0000-00-00 00:00:00',188,75,5.87,0,0),('SM-18277','1.25-in. metal screw, 25','0000-00-00 00:00:00',172,75,6.99,0,21225),('SW-23116','2.5-in. wd. screw, 50','0000-00-00 00:00:00',237,100,8.45,0,21231),('WR3/TT3','Steel matting, 4\'x8\'x1/6\", .5\" mesh','0000-00-00 00:00:00',18,5,119.95,0.1,25595);
/*!40000 ALTER TABLE `PRODUCT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VENDOR`
--

DROP TABLE IF EXISTS `VENDOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VENDOR` (
  `V_CODE` int(11) DEFAULT NULL,
  `V_NAME` varchar(15) DEFAULT NULL,
  `V_CONTACT` varchar(50) DEFAULT NULL,
  `V_AREACODE` varchar(3) DEFAULT NULL,
  `V_PHONE` varchar(8) DEFAULT NULL,
  `V_STATE` varchar(2) DEFAULT NULL,
  `V_ORDER` varchar(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VENDOR`
--

LOCK TABLES `VENDOR` WRITE;
/*!40000 ALTER TABLE `VENDOR` DISABLE KEYS */;
INSERT INTO `VENDOR` VALUES (21225,'Bryson, Inc.','Smithson','615','223-3234','TN','Y'),(21226,'SuperLoo, Inc.','Flushing','904','215-8995','FL','N'),(21231,'D&E Supply','Singh','615','228-3245','TN','Y'),(21344,'Gomez Bros.','Ortega','615','889-2546','KY','N'),(22567,'Dome Supply','Smith','901','678-1419','GA','N'),(23119,'Randsets Ltd.','Anderson','901','678-3998','GA','Y'),(24004,'Brackman Bros.','Browning','615','228-1410','TN','N'),(24288,'ORDVA, Inc.','Hakford','615','898-1234','TN','Y'),(25443,'B&K, Inc.','Smith','904','227-0093','FL','N'),(25501,'Damal Supplies','Smythe','615','890-3529','TN','N'),(25595,'Rubicon Systems','Orton','904','456-0092','FL','Y');
/*!40000 ALTER TABLE `VENDOR` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-10 11:42:01
