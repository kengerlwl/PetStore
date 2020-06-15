-- MariaDB dump 10.17  Distrib 10.4.13-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	10.4.13-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `userid` varchar(80) NOT NULL,
  `email` varchar(80) NOT NULL,
  `firstname` varchar(80) NOT NULL,
  `lastname` varchar(80) NOT NULL,
  `status` varchar(2) DEFAULT NULL,
  `addr1` varchar(80) NOT NULL,
  `addr2` varchar(40) DEFAULT NULL,
  `city` varchar(80) NOT NULL,
  `state` varchar(80) NOT NULL,
  `zip` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  `phone` varchar(80) NOT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('','z','z','z','OK','z','z','z','z','z','z','z'),('12','12','777','888','OK','jjj2','lll2','Tokyo','WWF','zero','Japan','1530080'),('123','123','777','888','OK','jjj2','lll2','Tokyo','WWF','zero','Japan','1530080'),('2134','1234','777','888','OK','jjj2','lll2','Tokyo','WWF','zero','Japan','1530080'),('ACID','acid@yourdomain.com','ABC','XYX','OK','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','555-555-5555'),('b','b','777','888','OK','jjj2','lll2','Tokyo','WWF','zero','Japan','1530080'),('j','','','','OK','','','','','','',''),('j2ee','b','b','b',NULL,'a','a','a','a','a','a','a'),('lwl','666','777','888','OK','jjj2','lll2','Tokyo','WWF','zero','Japan','1530080'),('q','q','777','888','OK','jjj2','lll2','Tokyo','WWF','zero','Japan','1530080'),('t','t','777','888','OK','jjj2','lll2','Tokyo','WWF','zero','Japan','1530080'),('x','x@asdf234234','x','x','OK','x','lll2','Tokyo','WWF','zero','Japan','x');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bannerdata`
--

DROP TABLE IF EXISTS `bannerdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bannerdata` (
  `favcategory` varchar(80) NOT NULL,
  `bannername` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`favcategory`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bannerdata`
--

LOCK TABLES `bannerdata` WRITE;
/*!40000 ALTER TABLE `bannerdata` DISABLE KEYS */;
INSERT INTO `bannerdata` VALUES ('BIRDS','<image src=\"../images/banner_birds.gif\">'),('CATS','<image src=\"../images/banner_cats.gif\">'),('DOGS','<image src=\"../images/banner_dogs.gif\">'),('FISH','<image src=\"../images/banner_fish.gif\">'),('REPTILES','<image src=\"../images/banner_reptiles.gif\">');
/*!40000 ALTER TABLE `bannerdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `userid` varchar(80) NOT NULL,
  `itemid` varchar(10) NOT NULL,
  `productid` varchar(10) DEFAULT NULL,
  `name` varchar(80) DEFAULT NULL,
  `instock` tinyint(1) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `listprice` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`userid`,`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES ('','EST-19','AV-SB-02','EST-19',1,12,15.50,186.00),('','EST-9','K9-DL-01','EST-9',1,10,18.50,185.00),('1','1','1','1',1,23,2.00,2.00),('1','2','2','2',1,3,4.00,12.00),('j2ee','EST-13','RP-LI-02','Iguana',1,3,18.50,55.50),('j2ee','EST-19','AV-SB-02','Finch',1,1,15.50,15.50);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `catid` varchar(10) NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `descn` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`catid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('BIRDS','Birds','/images/birds/bird1.jpeg'),('CATS','Cats','/images/cats/cat1.jpeg'),('DOGS','Dogs','/images/dogs/dog1.jpeg'),('FISH','Fish','/images/fishs/fish1.jpeg'),('REPTILES','Reptiles','/images/reptiles/reptiles1.jpeg');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory` (
  `itemid` varchar(10) NOT NULL,
  `qty` int(11) NOT NULL,
  PRIMARY KEY (`itemid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES ('1',1),('12',12),('123',123),('1234',0),('ads',0),('asdf',123),('asdfkasdf',0),('Bbb-312',0),('Bbb-32',67),('Bbb-b3112',90),('Bbb-b31132',0),('EST-1',9998),('EST-10',10000),('EST-11',9997),('EST-12',10000),('EST-13',9998),('EST-14',9988),('EST-15',10000),('EST-16',10000),('EST-17',10000),('EST-18',9965),('EST-19',9940),('EST-2',10000),('EST-20',10000),('EST-21',10000),('EST-22',10000),('EST-23',10000),('EST-24',10000),('EST-25',123),('EST-26',9996),('EST-27',9983),('EST-28',10000),('EST-3',10000),('EST-4',9992),('EST-5',10000),('EST-6',9997),('EST-7',9944),('EST-8',10000),('EST-9',10000),('test',0),('商品名字1',12),('商品名字2',0),('商品名字3',12),('商品名字test',100);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `itemid` varchar(10) NOT NULL,
  `productid` varchar(10) NOT NULL,
  `listprice` decimal(10,2) DEFAULT NULL,
  `unitcost` decimal(10,2) DEFAULT NULL,
  `supplier` varchar(80) DEFAULT NULL,
  `status` varchar(2) DEFAULT NULL,
  `attr1` varchar(80) DEFAULT NULL,
  `attr2` varchar(80) DEFAULT NULL,
  `attr3` varchar(80) DEFAULT NULL,
  `attr4` varchar(80) DEFAULT NULL,
  `attr5` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`itemid`) USING BTREE,
  KEY `fk_item_2` (`supplier`) USING BTREE,
  KEY `itemProd` (`productid`) USING BTREE,
  CONSTRAINT `fk_item_1` FOREIGN KEY (`productid`) REFERENCES `product` (`productid`),
  CONSTRAINT `item_fk` FOREIGN KEY (`supplier`) REFERENCES `supplier` (`suppid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES ('asdf','K9-CW-01',123.00,1.00,'2','S3','test13','test23','test33','test43','test53'),('Bbb-312','FL-DLH-02',1.00,1.00,'1','S3','test13','test233','test33','test43','test53'),('Bbb-32','FL-DLH-02',1.00,1.00,'1','S3','test13','test233','test33','test43','test53'),('dogs_test','K9-CW-01',90.00,1.00,'1','S3','test13','test23','test33','test43','test53'),('EST-1','FI-SW-01',16.50,10.00,'1','P','Large',NULL,NULL,NULL,NULL),('EST-10','K9-DL-01',18.50,12.00,'1','P','Spotted Adult Female',NULL,NULL,NULL,NULL),('EST-11','RP-SN-01',18.50,12.00,'1','P','Venomless',NULL,NULL,NULL,NULL),('EST-28','K9-RT-01',155.29,90.00,'1','P','Adult Female',NULL,NULL,NULL,NULL),('EST-3','FI-SW-02',18.50,12.00,'1','P','Toothless',NULL,NULL,NULL,NULL),('EST-7','K9-BD-01',18.50,12.00,'1','P','Female Puppy',NULL,NULL,NULL,NULL),('EST-8','K9-PO-02',18.50,12.00,'1','P','Male Puppy',NULL,NULL,NULL,NULL),('EST-9','K9-DL-01',18.50,12.00,'1','P','Spotless Male Puppy',NULL,NULL,NULL,NULL),('test','K9-CW-01',1234.00,1.00,'2','S3','test13','test23','test33','test43','test53'),('test_shop','FI-FW-02',123.00,1.00,'1','S3','test13','test23','test33','test43','test53'),('商品名字1','K9-CW-01',12.00,1.00,'1','S3','test13','test23','test33','test43','test53'),('商品名字3','K9-CW-01',12.00,1.00,'1','S3','test13','test23','test33','test43','test53'),('商品名字test','K9-CW-01',90.00,1.00,'1','S3','test13','test23','test33','test43','test53');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lineitem`
--

DROP TABLE IF EXISTS `lineitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lineitem` (
  `orderid` int(11) NOT NULL,
  `linenum` int(11) NOT NULL,
  `itemid` varchar(10) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unitprice` decimal(10,2) NOT NULL,
  PRIMARY KEY (`orderid`,`linenum`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lineitem`
--

LOCK TABLES `lineitem` WRITE;
/*!40000 ALTER TABLE `lineitem` DISABLE KEYS */;
INSERT INTO `lineitem` VALUES (1005,1,'EST-18',1,193.50),(1006,1,'EST-18',1,193.50),(1007,1,'EST-18',1,193.50),(1008,1,'EST-18',1,193.50),(1008,2,'EST-4',1,18.50),(1009,1,'EST-1',1,16.50),(1009,2,'EST-6',2,18.50),(1009,3,'EST-27',1,155.29),(1010,1,'EST-19',1,15.50),(1010,2,'EST-1',1,16.50),(1011,1,'EST-4',3,18.50),(1012,1,'EST-19',1,15.50),(1013,1,'EST-19',1,15.50),(1014,1,'EST-19',1,15.50),(1020,1,'EST-18',1,193.50),(1021,1,'EST-18',1,193.50),(1022,1,'EST-18',1,193.50),(1023,1,'EST-18',1,193.50),(1024,1,'EST-18',1,193.50),(1025,1,'EST-18',1,193.50),(1026,1,'EST-18',1,193.50),(1027,1,'EST-4',1,18.50),(1028,1,'EST-19',1,15.50),(1029,1,'EST-19',1,15.50),(1030,1,'EST-26',3,125.50),(1030,2,'EST-19',1,15.50),(1031,1,'EST-19',5,15.50),(1032,1,'EST-19',5,15.50),(1033,1,'EST-19',5,15.50),(1034,1,'EST-19',5,15.50),(1035,1,'EST-19',5,15.50),(1036,1,'EST-19',5,15.50),(1037,1,'EST-19',5,15.50),(1038,1,'EST-19',5,15.50),(1039,1,'EST-19',5,15.50),(1040,1,'EST-27',4,155.29),(1041,1,'EST-27',4,155.29),(1042,1,'EST-27',4,155.29),(1043,1,'EST-27',4,155.29),(1044,1,'EST-18',4,193.50),(1044,2,'EST-11',1,18.50),(1045,1,'EST-18',2,193.50),(1046,1,'EST-18',1,193.50),(1047,1,'EST-4',3,18.50),(1048,1,'EST-19',3,15.50),(1048,2,'EST-13',1,18.50),(1049,1,'EST-13',1,18.50),(1050,1,'EST-19',1,15.50),(1051,1,'EST-19',1,15.50),(1052,1,'EST-19',1,15.50),(1053,1,'EST-19',1,15.50),(1054,1,'EST-26',1,125.50),(1055,1,'EST-6',1,18.50),(1056,1,'EST-18',1,193.50),(1057,1,'EST-19',1,15.50),(1057,2,'EST-11',2,18.50),(1062,1,'1',2,2.00),(1063,1,'1',2,2.00),(1064,1,'EST-18',12,193.50),(1065,1,'EST-14',12,58.50),(1065,2,'EST-7',56,18.50),(1069,1,'Bbb-b3112',10,1.00),(1070,1,'Bbb-32',12,1.00),(1071,1,'Bbb-32',21,1.00);
/*!40000 ALTER TABLE `lineitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main`
--

DROP TABLE IF EXISTS `main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main` (
  `mainT` varchar(100) DEFAULT NULL,
  `littleT` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main`
--

LOCK TABLES `main` WRITE;
/*!40000 ALTER TABLE `main` DISABLE KEYS */;
INSERT INTO `main` VALUES ('This is your petstore','provide by lwl'),('打造专属于你的宠物商店','provide by lgx');
/*!40000 ALTER TABLE `main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `orderid` int(11) NOT NULL,
  `userid` varchar(80) NOT NULL,
  `orderdate` date NOT NULL,
  `shipaddr1` varchar(80) NOT NULL,
  `shipaddr2` varchar(80) DEFAULT NULL,
  `shipcity` varchar(80) NOT NULL,
  `shipstate` varchar(80) NOT NULL,
  `shipzip` varchar(20) NOT NULL,
  `shipcountry` varchar(20) NOT NULL,
  `billaddr1` varchar(80) NOT NULL,
  `billaddr2` varchar(80) DEFAULT NULL,
  `billcity` varchar(80) NOT NULL,
  `billstate` varchar(80) NOT NULL,
  `billzip` varchar(20) NOT NULL,
  `billcountry` varchar(20) NOT NULL,
  `courier` varchar(80) NOT NULL,
  `totalprice` decimal(10,2) NOT NULL,
  `billtofirstname` varchar(80) NOT NULL,
  `billtolastname` varchar(80) NOT NULL,
  `shiptofirstname` varchar(80) NOT NULL,
  `shiptolastname` varchar(80) NOT NULL,
  `creditcard` varchar(80) NOT NULL,
  `exprdate` varchar(7) NOT NULL,
  `cardtype` varchar(80) NOT NULL,
  `locale` varchar(80) NOT NULL,
  PRIMARY KEY (`orderid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1003,'j2ee','2019-08-17','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','UPS',193.50,'AB','XYX','AB','XYX','6666666666666','11/11','Visa','CA'),(1004,'j2ee','2019-08-17','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','UPS',193.50,'AB','XYX','AB','XYX','6666666666666','11/11','Visa','CA'),(1005,'j2ee','2019-08-17','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','UPS',193.50,'AB','XYX','AB','XYX','6666666666666','11/11','Visa','CA'),(1006,'j2ee','2019-08-17','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','UPS',193.50,'AB','XYX','AB','XYX','6666666666666','11/11','Visa','CA'),(1007,'j2ee','2019-08-17','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','UPS',193.50,'AB','XYX','AB','XYX','6666666666666','11/11','Visa','CA'),(1008,'j2ee','2019-08-17','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','UPS',212.00,'AB1111','XYX','AB1111','XYX','6666666666666','11/11','Visa','CA'),(1009,'j2ee','2019-08-17','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','UPS',208.79,'AB','XYX','AB','XYX','6666666666666','11/11','Visa','CA'),(1010,'j2ee','2019-08-17','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','UPS',32.00,'AB','XYX','AB2222','XYX','6666666666666','11/11','Visa','CA'),(1011,'j2ee','2019-08-17','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','UPS',55.50,'AB','XYX','AB','XYX','6666666666666','11/11','Visa','CA'),(1012,'j2ee','2019-08-17','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','UPS',15.50,'AB','XYX','AB','XYX','6666666666666','11/11','Visa','CA'),(1013,'j2ee','2019-08-17','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','UPS',15.50,'AB','XYX','AB','XYX','6666666666666','11/11','Visa','CA'),(1014,'j2ee','2019-08-17','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','UPS',15.50,'AB','XYX','AB','XYX','6666666666666','11/11','Visa','CA'),(1020,'j2ee','2019-08-18','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','UPS',193.50,'AB','XYX','AB','XYX','6666666666666','11/11','Visa','CA'),(1021,'j2ee','2019-08-18','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','UPS',193.50,'AB','XYX','AB','XYX','6666666666666','11/11','Visa','CA'),(1022,'j2ee','2019-08-18','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','UPS',193.50,'AB','XYX','AB','XYX','6666666666666','11/11','Visa','CA'),(1023,'j2ee','2019-08-18','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','UPS',193.50,'AB','XYX','AB','XYX','6666666666666','11/11','Visa','CA'),(1024,'j2ee','2019-08-18','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','UPS',193.50,'AB','XYX','AB','XYX','6666666666666','11/11','Visa','CA'),(1025,'j2ee','2019-08-18','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','UPS',193.50,'AB','XYX','AB','XYX','6666666666666','11/11','Visa','CA'),(1026,'j2ee','2019-08-18','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','UPS',193.50,'AB','XYX','AB','XYX','6666666666666','11/11','Visa','CA'),(1027,'j2ee','2019-08-18','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','UPS',18.50,'AB','XYX','AB','XYX','6666666666666','11/11','Visa','CA'),(1028,'j2ee','2019-08-19','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','UPS',15.50,'AB','XYX','AB','XYX','6666666666666','11/11','Visa','CA'),(1029,'j2ee','2019-08-19','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','UPS',15.50,'AB','XYX','AB','XYX','6666666666666','11/11','Visa','CA'),(1030,'j2ee','2019-08-25','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','UPS',392.00,'AB675','XYX777','AB675777','XYX777888','6666666666666','11/11','Visa','CA'),(1031,'j2ee','2019-08-27','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','UPS',77.50,'AB1','XYX','AB1','XYX','6666666666666','11/11','Visa','CA'),(1032,'j2ee','2019-08-27','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','UPS',77.50,'AB1','XYX','AB1','XYX','6666666666666','11/11','Visa','CA'),(1033,'j2ee','2019-08-27','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','UPS',77.50,'AB1','XYX','AB1','XYX','6666666666666','11/11','Visa','CA'),(1034,'j2ee','2019-08-27','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','UPS',77.50,'AB1','XYX','AB1','XYX','6666666666666','11/11','Visa','CA'),(1035,'j2ee','2019-08-27','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','UPS',77.50,'AB1','XYX','AB1','XYX','6666666666666','11/11','Visa','CA'),(1036,'j2ee','2019-08-27','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','UPS',77.50,'AB1','XYX','AB1','XYX','6666666666666','11/11','Visa','CA'),(1037,'j2ee','2019-08-27','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','UPS',77.50,'AB1','XYX','AB1','XYX','6666666666666','11/11','Visa','CA'),(1038,'j2ee','2019-08-27','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','UPS',77.50,'AB1','XYX','AB1','XYX','6666666666666','11/11','Visa','CA'),(1039,'j2ee','2019-08-27','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','UPS',77.50,'AB1','XYX','AB1','XYX','6666666666666','11/11','Visa','CA'),(1040,'j2ee','2019-08-27','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','UPS',621.16,'AB1','XYX','AB1','XYX','6666666666666','11/11','Visa','CA'),(1041,'j2ee','2019-08-27','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','UPS',621.16,'AB1','XYX','AB1','XYX','6666666666666','11/11','Visa','CA'),(1042,'j2ee','2019-08-27','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','UPS',621.16,'AB1','XYX','AB1','XYX','6666666666666','11/11','Visa','CA'),(1043,'j2ee','2019-08-27','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','UPS',621.16,'AB1','XYX','AB1','XYX','6666666666666','11/11','Visa','CA'),(1044,'j2ee','2019-08-29','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','UPS',792.50,'AB122222','XYX33333','AB122222','XYX33','6666666666666','11/11','Visa','CA'),(1045,'j2ee','2019-09-07','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','UPS',387.00,'AB1','XYX','AB1','XYX','6666666666666','11/11','Visa','CA'),(1046,'j2ee','2019-09-07','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','UPS',193.50,'AB1','XYX','AB1','XYX','6666666666666','11/11','Visa','CA'),(1047,'j2ee','2019-09-18','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','UPS',55.50,'AB1','XYX','AB1','XYX','6666666666666','11/11','Visa','CA'),(1048,'j2ee','2019-09-29','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','UPS',65.00,'AB1','XYX','AB1','XYX','6666666666666','11/11','Visa','CA'),(1049,'j2ee','2019-09-30','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','UPS',18.50,'AB1','XYX','AB1','XYX','6666666666666','11/11','Visa','CA'),(1050,'j2ee','2019-10-05','a','a','a','a','a','a','a','a','a','a','a','a','UPS',15.50,'b','b','b','b','6666666666666','11/11','Visa','CA'),(1051,'j2ee','2019-10-05','a','a','a','a','a','a','a','a','a','a','a','a','UPS',15.50,'b','b','b','b','6666666666666','11/11','Visa','CA'),(1052,'j2ee','2019-10-05','a','a','a','a','a','a','a','a','a','a','a','a','UPS',15.50,'b','b','b','b','6666666666666','11/11','Visa','CA'),(1053,'j2ee','2019-10-05','a','a','a','a','a','a','a','a','a','a','a','a','UPS',15.50,'b','b','b','b','6666666666666','11/11','Visa','CA'),(1054,'j2ee','2019-10-05','a','a','a','a','a','a','a','a','a','a','a','a','UPS',125.50,'b','b','b','b','6666666666666','11/11','Visa','CA'),(1055,'j2ee','2019-10-05','a','a','a','a','a','a','a','a','a','a','a','a','UPS',18.50,'b','b','b','b','6666666666666','11/11','Visa','CA'),(1056,'j2ee','2019-10-05','a','a','a','a','a','a','a','a','a','a','a','a','UPS',193.50,'b','b','b','b','6666666666666','11/11','Visa','CA'),(1057,'j2ee','2019-10-06','a','a','a','a','a','a','a','a','a','a','a','a','UPS',52.50,'b','b','b','b','6666666666666','11/11','Visa','CA'),(1063,'2','2020-06-14','ChangSha1','Beijing1','NewYork','NYC','88888','USA','West Rode','East Rode','Tokyo','JPN','99999','China','WPS',4.00,'Li','GX','Liu','WL','77777777777','03/27','PayPay','DA'),(1064,'x','2020-06-15','ChangSha1','Beijing1','NewYork','NYC','2322','USA','West Rode','East Rode','Tokyo','JPN','2322','China','WPS',2322.00,'Li','GX','Liu','WL','77777777777','03/27','PayPay','DA'),(1065,'x','2020-06-15','ChangSha1','Beijing1','NewYork','NYC','1738','USA','West Rode','East Rode','Tokyo','JPN','1738','China','WPS',1738.00,'Li','GX','Liu','WL','77777777777','03/27','PayPay','DA'),(1069,'x','2020-06-15','ChangSha1','Beijing1','NewYork','NYC','10','USA','West Rode','East Rode','Tokyo','JPN','10','China','WPS',10.00,'Li','GX','Liu','WL','77777777777','03/27','PayPay','DA'),(1070,'x','2020-06-15','ChangSha1','Beijing1','NewYork','NYC','12','USA','West Rode','East Rode','Tokyo','JPN','12','China','WPS',12.00,'Li','GX','Liu','WL','77777777777','03/27','PayPay','DA'),(1071,'x','2020-06-15','ChangSha1','Beijing1','NewYork','NYC','21','USA','West Rode','East Rode','Tokyo','JPN','21','China','WPS',21.00,'Li','GX','Liu','WL','77777777777','03/27','PayPay','DA');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderstatus`
--

DROP TABLE IF EXISTS `orderstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderstatus` (
  `orderid` int(11) NOT NULL,
  `linenum` int(11) NOT NULL,
  `timestamp` date NOT NULL,
  `status` varchar(2) NOT NULL,
  PRIMARY KEY (`orderid`,`linenum`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderstatus`
--

LOCK TABLES `orderstatus` WRITE;
/*!40000 ALTER TABLE `orderstatus` DISABLE KEYS */;
INSERT INTO `orderstatus` VALUES (1004,1004,'2019-08-17','P'),(1005,1005,'2019-08-17','P'),(1006,1006,'2019-08-17','P'),(1007,1007,'2019-08-17','P'),(1008,1008,'2019-08-17','P'),(1009,1009,'2019-08-17','P'),(1010,1010,'2019-08-17','P'),(1011,1011,'2019-08-17','P'),(1012,1012,'2019-08-17','P'),(1013,1013,'2019-08-17','P'),(1014,1014,'2019-08-17','P'),(1020,1020,'2019-08-18','P'),(1021,1021,'2019-08-18','P'),(1022,1022,'2019-08-18','P'),(1023,1023,'2019-08-18','P'),(1024,1024,'2019-08-18','P'),(1025,1025,'2019-08-18','P'),(1026,1026,'2019-08-18','P'),(1027,1027,'2019-08-18','P'),(1028,1028,'2019-08-19','P'),(1029,1029,'2019-08-19','P'),(1030,1030,'2019-08-25','P'),(1031,1031,'2019-08-27','P'),(1032,1032,'2019-08-27','P'),(1033,1033,'2019-08-27','P'),(1034,1034,'2019-08-27','P'),(1035,1035,'2019-08-27','P'),(1036,1036,'2019-08-27','P'),(1037,1037,'2019-08-27','P'),(1038,1038,'2019-08-27','P'),(1039,1039,'2019-08-27','P'),(1040,1040,'2019-08-27','P'),(1041,1041,'2019-08-27','P'),(1042,1042,'2019-08-27','P'),(1043,1043,'2019-08-27','P'),(1044,1044,'2019-08-29','P'),(1045,1045,'2019-09-07','P'),(1046,1046,'2019-09-07','P'),(1047,1047,'2019-09-18','P'),(1048,1048,'2019-09-29','P'),(1049,1049,'2019-09-30','P'),(1050,1050,'2019-10-05','P'),(1051,1051,'2019-10-05','P'),(1052,1052,'2019-10-05','P'),(1053,1053,'2019-10-05','P'),(1054,1054,'2019-10-05','P'),(1055,1055,'2019-10-05','P'),(1056,1056,'2019-10-05','P'),(1057,1057,'2019-10-06','P'),(1063,1,'2020-06-14','P'),(1064,1,'2020-06-15','P'),(1065,1,'2020-06-15','P'),(1065,2,'2020-06-15','P'),(1069,1,'2020-06-15','P'),(1070,1,'2020-06-15','P'),(1071,1,'2020-06-15','P');
/*!40000 ALTER TABLE `orderstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `productid` varchar(10) NOT NULL,
  `category` varchar(10) NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `descn` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`productid`) USING BTREE,
  KEY `productCat` (`category`) USING BTREE,
  KEY `productName` (`name`) USING BTREE,
  CONSTRAINT `fk_product_1` FOREIGN KEY (`category`) REFERENCES `category` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('AV-CB-01','BIRDS','Amazon Parrot1','/images/birds/bird1.jpeg'),('AV-SB-02','BIRDS','Finch','/images/birds/bird2.jpeg'),('FI-FW-01','FISH','Koi','/images/fishs/fish1.jpeg'),('FI-FW-02','FISH','Goldfish','/images/fishs/fish2.jpeg'),('FI-SW-01','FISH','Angelfish','/images/fishs/fish3.jpeg'),('FI-SW-02','FISH','Tiger Shark','/images/fishs/fish4.jpeg'),('FL-DLH-02','CATS','Persian','/images/cats/cat1.jpeg'),('FL-DSH-01','CATS','Manx','/images/cats/cat2.jpeg'),('K9-BD-01','DOGS','Bulldog','/images/dogs/dog1.jpeg'),('K9-CW-01','DOGS','Chihuahua','/images/dogs/dog2.jpeg'),('K9-DL-01','DOGS','Dalmation','/images/dogs/dog3.jpeg'),('K9-PO-02','DOGS','Poodle','/images/dogs/dog4.jpeg'),('K9-RT-01','DOGS','Golden Retriever','/images/dogs/dog6.jpeg'),('K9-RT-02','DOGS','Labrador Retriever','/images/dogs/dog5.jpeg'),('RP-LI-02','REPTILES','Iguana','/images/reptiles/reptiles1.jpeg'),('RP-SN-01','REPTILES','Rattlesnake','/images/reptiles/reptiles2.jpeg');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `userid` varchar(80) NOT NULL,
  `langpref` varchar(80) NOT NULL,
  `favcategory` varchar(30) DEFAULT NULL,
  `mylistopt` int(11) DEFAULT NULL,
  `banneropt` int(11) DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES ('','japanese','CATS',NULL,NULL),('12','chinese6','fish',2,3),('123','chinese6','fish',2,3),('2134','chinese6','fish',2,3),('ACID','english','CATS',1,1),('b','chinese6','fish',2,3),('j','english','FISH',NULL,NULL),('j2ee','english','DOGS',0,0),('lwl','chinese6','fish',2,3),('q','chinese6','fish',2,3),('t','chinese6','fish',2,3),('x','chinese6','fish',2,3);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence`
--

DROP TABLE IF EXISTS `sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence` (
  `name` varchar(30) NOT NULL,
  `nextid` int(11) NOT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence`
--

LOCK TABLES `sequence` WRITE;
/*!40000 ALTER TABLE `sequence` DISABLE KEYS */;
INSERT INTO `sequence` VALUES ('ordernum',1071);
/*!40000 ALTER TABLE `sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signon`
--

DROP TABLE IF EXISTS `signon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `signon` (
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signon`
--

LOCK TABLES `signon` WRITE;
/*!40000 ALTER TABLE `signon` DISABLE KEYS */;
INSERT INTO `signon` VALUES ('',''),('12','999'),('123','999'),('2','x'),('2134','1234'),('ACID','ACID'),('b','b'),('j',''),('j2ee','j2ee'),('lwl','999'),('q','q'),('t','t'),('x','x');
/*!40000 ALTER TABLE `signon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `suppid` varchar(80) NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `status` varchar(2) NOT NULL,
  `addr1` varchar(80) DEFAULT NULL,
  `addr2` varchar(80) DEFAULT NULL,
  `city` varchar(80) DEFAULT NULL,
  `state` varchar(80) DEFAULT NULL,
  `zip` varchar(5) DEFAULT NULL,
  `phone` varchar(80) DEFAULT NULL,
  `supplier` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`suppid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES ('0','ABC Pets','AC','700 Abalone Way','','San Francisco ','CA','94024','415-947-0797',NULL),('1','XYZ Pets','AC','600 Avon Way','','Los Angeles','CA','94024','212-947-0797',NULL),('2','x','x','x','x','x','x','x','x','x');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `syslog`
--

DROP TABLE IF EXISTS `syslog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `syslog` (
  `username` varchar(64) DEFAULT NULL,
  `operation` varchar(64) DEFAULT NULL,
  `method` varchar(64) DEFAULT NULL,
  `params` varchar(64) DEFAULT NULL,
  `createdate` date DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `syslog`
--

LOCK TABLES `syslog` WRITE;
/*!40000 ALTER TABLE `syslog` DISABLE KEYS */;
INSERT INTO `syslog` VALUES ('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-08-27','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-08-27','localhost'),('username','根据productID查询单一产品','getProduct','productId','2019-08-27','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-08-27','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-08-27','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-08-27','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-08-27','localhost'),('username','根据productID查询单一产品','getProduct','productId','2019-08-27','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-08-27','localhost'),('username','根据productID查询单一产品','getProduct','productId','2019-08-27','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-08-27','localhost'),('username','根据productID查询单一产品','getProduct','productId','2019-08-27','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-08-29','localhost'),('username','根据productID查询单一产品','getProduct','productId','2019-08-29','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-08-29','localhost'),('username','根据productID查询单一产品','getProduct','productId','2019-08-29','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-09-07','localhost'),('username','根据productID查询单一产品','getProduct','productId','2019-09-07','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-09-07','localhost'),('username','根据productID查询单一产品','getProduct','productId','2019-09-07','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-09-07','localhost'),('username','根据productID查询单一产品','getProduct','productId','2019-09-07','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-09-10','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-09-18','localhost'),('username','根据productID查询单一产品','getProduct','productId','2019-09-18','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-09-29','localhost'),('username','根据productID查询单一产品','getProduct','productId','2019-09-29','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-09-29','localhost'),('username','根据productID查询单一产品','getProduct','productId','2019-09-29','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-09-29','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-09-29','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-09-29','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-09-29','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-09-29','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-09-29','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-09-29','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-09-29','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-09-29','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-09-29','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-09-29','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-09-29','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-09-29','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-09-29','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-09-30','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-09-30','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-09-30','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-09-30','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-09-30','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-09-30','localhost'),('username','根据productID查询单一产品','getProduct','productId','2019-09-30','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-09-30','localhost'),('username','根据productID查询单一产品','getProduct','productId','2019-09-30','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-10-03','localhost'),('username','根据productID查询单一产品','getProduct','productId','2019-10-03','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-10-03','localhost'),('username','根据productID查询单一产品','getProduct','productId','2019-10-03','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-10-03','localhost'),('username','根据productID查询单一产品','getProduct','productId','2019-10-03','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-10-03','localhost'),('username','根据productID查询单一产品','getProduct','productId','2019-10-03','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-10-03','localhost'),('username','根据productID查询单一产品','getProduct','productId','2019-10-03','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-10-03','localhost'),('username','根据productID查询单一产品','getProduct','productId','2019-10-03','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-10-03','localhost'),('username','根据productID查询单一产品','getProduct','productId','2019-10-03','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-10-03','localhost'),('username','根据productID查询单一产品','getProduct','productId','2019-10-03','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-10-05','localhost'),('username','根据productID查询单一产品','getProduct','productId','2019-10-05','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-10-05','localhost'),('username','根据productID查询单一产品','getProduct','productId','2019-10-05','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-10-05','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-10-05','localhost'),('username','根据productID查询单一产品','getProduct','productId','2019-10-05','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-10-05','localhost'),('username','根据productID查询单一产品','getProduct','productId','2019-10-05','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-10-05','localhost'),('username','根据productID查询单一产品','getProduct','productId','2019-10-05','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-10-05','localhost'),('username','根据productID查询单一产品','getProduct','productId','2019-10-05','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-10-05','localhost'),('username','根据productID查询单一产品','getProduct','productId','2019-10-05','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-10-06','localhost'),('username','根据productID查询单一产品','getProduct','productId','2019-10-06','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-10-06','localhost'),('username','根据productID查询单一产品','getProduct','productId','2019-10-06','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-10-06','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-10-06','localhost'),('username','根据productID查询单一产品','getProduct','productId','2019-10-06','localhost'),('username','根据大类查询产品列表','getProductListByCategory','categoryId','2019-10-06','localhost'),('username','根据productID查询单一产品','getProduct','productId','2019-10-06','localhost');
/*!40000 ALTER TABLE `syslog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'test'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-15 19:29:53
