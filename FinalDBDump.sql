CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `AddressId` int(11) NOT NULL,
  `AddressType` varchar(45) NOT NULL,
  `ApartmentNumber` varchar(45) NOT NULL,
  `StreetName` varchar(45) NOT NULL,
  `City` varchar(45) NOT NULL,
  `State` varchar(45) NOT NULL,
  `ZipCode` varchar(45) NOT NULL,
  `OrderId` int(11) NOT NULL,
  PRIMARY KEY (`AddressId`),
  KEY `fk_Address_CustomerOrder1_idx` (`OrderId`),
  CONSTRAINT `fk_Address_CustomerOrder1` FOREIGN KEY (`OrderId`) REFERENCES `customerorder` (`OrderId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'home','3','saint germain','boston','ma','2115',1),(2,'work','6','saint germain','boston','ma','2115',2);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `CategoryId` int(11) NOT NULL,
  `CategoryName` varchar(45) NOT NULL,
  `CategoryType` varchar(45) DEFAULT NULL,
  `Department_Id` int(11) NOT NULL,
  PRIMARY KEY (`CategoryId`),
  KEY `fk_Category_Department1_idx` (`Department_Id`),
  CONSTRAINT `fk_Category_Department1` FOREIGN KEY (`Department_Id`) REFERENCES `department` (`Department_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'books','new arrival',1),(2,'books','half price',1),(3,'Electronics','new arrival',2),(4,'Electronics','half price',2),(5,'clothing','new arrival',3),(6,'clothing','halfprice',3),(7,'Baby Care','new arrival',4),(8,'babycare','halfprice',4);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger add_product
after insert on category
for each row
begin
insert into products
select 7,'babycare','halfprice',10,20,'not good','cc';
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `category_has_products`
--

DROP TABLE IF EXISTS `category_has_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_has_products` (
  `CategoryId` int(11) NOT NULL,
  `ProductId` int(11) NOT NULL,
  KEY `fk_Category_has_Products_Products1_idx` (`ProductId`),
  KEY `fk_Category_has_Products_Category1_idx` (`CategoryId`),
  CONSTRAINT `fk_Category_has_Products_Category1` FOREIGN KEY (`CategoryId`) REFERENCES `category` (`CategoryId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Category_has_Products_Products1` FOREIGN KEY (`ProductId`) REFERENCES `products` (`ProductId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_has_products`
--

LOCK TABLES `category_has_products` WRITE;
/*!40000 ALTER TABLE `category_has_products` DISABLE KEYS */;
INSERT INTO `category_has_products` VALUES (1,1),(2,1),(3,2),(4,2),(5,3),(6,3);
/*!40000 ALTER TABLE `category_has_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `customer_order`
--

DROP TABLE IF EXISTS `customer_order`;
/*!50001 DROP VIEW IF EXISTS `customer_order`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `customer_order` AS SELECT 
 1 AS `UserName`,
 1 AS `orderid`,
 1 AS `department_id`,
 1 AS `categoryname`,
 1 AS `productname`,
 1 AS `price`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `customer_order_new`
--

DROP TABLE IF EXISTS `customer_order_new`;
/*!50001 DROP VIEW IF EXISTS `customer_order_new`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `customer_order_new` AS SELECT 
 1 AS `UserName`,
 1 AS `orderid`,
 1 AS `department_id`,
 1 AS `categoryname`,
 1 AS `productname`,
 1 AS `price`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customerorder`
--

DROP TABLE IF EXISTS `customerorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customerorder` (
  `OrderId` int(11) NOT NULL,
  `DateOfOrder` varchar(45) NOT NULL,
  PRIMARY KEY (`OrderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerorder`
--

LOCK TABLES `customerorder` WRITE;
/*!40000 ALTER TABLE `customerorder` DISABLE KEYS */;
INSERT INTO `customerorder` VALUES (1,'2017-12-13'),(2,'2017-12-13'),(3,'2017-12-13'),(4,'2017-12-13');
/*!40000 ALTER TABLE `customerorder` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger productup
after insert 
on customerorder
for each row
begin
update products set availability= Availablility-1 where productid in 
(select distinct A.ProductId from customerorder_has_products AS A 
INNER JOIN customerorder AS B ON A.OrderId=B.OrderId
inner join products p on p.ProductId=A.ProductId);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `customerorder_has_products`
--

DROP TABLE IF EXISTS `customerorder_has_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customerorder_has_products` (
  `OrderId` int(11) NOT NULL,
  `ProductId` int(11) NOT NULL,
  KEY `fk_CustomerOrder_has_Products_Products1_idx` (`ProductId`),
  KEY `fk_CustomerOrder_has_Products_CustomerOrder1_idx` (`OrderId`),
  CONSTRAINT `fk_CustomerOrder_has_Products_CustomerOrder1` FOREIGN KEY (`OrderId`) REFERENCES `customerorder` (`OrderId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CustomerOrder_has_Products_Products1` FOREIGN KEY (`ProductId`) REFERENCES `products` (`ProductId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerorder_has_products`
--

LOCK TABLES `customerorder_has_products` WRITE;
/*!40000 ALTER TABLE `customerorder_has_products` DISABLE KEYS */;
INSERT INTO `customerorder_has_products` VALUES (1,1),(2,1),(3,2),(4,3);
/*!40000 ALTER TABLE `customerorder_has_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `Department_Id` int(11) NOT NULL,
  `DepartmentName` varchar(45) NOT NULL,
  `DepartmentType` varchar(45) NOT NULL,
  `DepartmentDescription` varchar(45) DEFAULT NULL,
  `OrganizationId` int(11) NOT NULL,
  PRIMARY KEY (`Department_Id`),
  KEY `fk_Department_Organization2_idx` (`OrganizationId`),
  CONSTRAINT `fk_Department_Organization2` FOREIGN KEY (`OrganizationId`) REFERENCES `organization` (`OrganizationId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Books','Highrated Books','Bestseller',1),(2,'Electronics','Daily Usage','Bestseller',1),(3,'clothing','Men and women','Bestseller',1),(4,'Baby Care','Personal Care','New Arrival',1);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger add_a_category
after insert on department
for each row 
begin
insert into category
select 7,'Baby Care',
(select CategoryType from category where CategoryId=1),
4;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice` (
  `InvoiceId` int(11) NOT NULL,
  `PaymentMethod_PaymentId` int(11) NOT NULL,
  `CustomerOrder_OrderId` int(11) NOT NULL,
  `WarehouseId` int(11) NOT NULL,
  PRIMARY KEY (`InvoiceId`),
  KEY `fk_Invoice_PaymentMethod1_idx` (`PaymentMethod_PaymentId`),
  KEY `fk_Invoice_CustomerOrder1_idx` (`CustomerOrder_OrderId`),
  KEY `fk_Invoice_Warehouse1_idx` (`WarehouseId`),
  CONSTRAINT `fk_Invoice_CustomerOrder1` FOREIGN KEY (`CustomerOrder_OrderId`) REFERENCES `customerorder` (`OrderId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoice_PaymentMethod1` FOREIGN KEY (`PaymentMethod_PaymentId`) REFERENCES `paymentmethod` (`PaymentId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoice_Warehouse1` FOREIGN KEY (`WarehouseId`) REFERENCES `warehouse` (`WarehouseId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES (1,1,1,1);
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `invoice_new`
--

DROP TABLE IF EXISTS `invoice_new`;
/*!50001 DROP VIEW IF EXISTS `invoice_new`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `invoice_new` AS SELECT 
 1 AS `UserName`,
 1 AS `orderid`,
 1 AS `department_id`,
 1 AS `categoryname`,
 1 AS `productname`,
 1 AS `price`,
 1 AS `addresstype`,
 1 AS `apartmentnumber`,
 1 AS `streetname`,
 1 AS `city`,
 1 AS `zipcode`,
 1 AS `paymenttype`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!50001 DROP VIEW IF EXISTS `orderdetails`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `orderdetails` AS SELECT 
 1 AS `orderid`,
 1 AS `productname`,
 1 AS `price`,
 1 AS `categoryname`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization` (
  `OrganizationId` int(11) NOT NULL,
  `OrganizationName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`OrganizationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
INSERT INTO `organization` VALUES (1,'amazon');
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentmethod`
--

DROP TABLE IF EXISTS `paymentmethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymentmethod` (
  `PaymentId` int(11) NOT NULL,
  `PaymentType` varchar(45) NOT NULL,
  `CardNumber` varchar(45) NOT NULL,
  `ValidTill` varchar(45) NOT NULL,
  `CVV` varchar(45) NOT NULL,
  `OrderId` int(11) NOT NULL,
  PRIMARY KEY (`PaymentId`),
  KEY `fk_PaymentMethod_CustomerOrder1_idx` (`OrderId`),
  CONSTRAINT `fk_PaymentMethod_CustomerOrder1` FOREIGN KEY (`OrderId`) REFERENCES `customerorder` (`OrderId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentmethod`
--

LOCK TABLES `paymentmethod` WRITE;
/*!40000 ALTER TABLE `paymentmethod` DISABLE KEYS */;
INSERT INTO `paymentmethod` VALUES (1,'credit card','123456789','0.476190476','234',1),(2,'debit card','987654321','0.523809523','432',2);
/*!40000 ALTER TABLE `paymentmethod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `FullName` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Username` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `ConfirmPassword` varchar(45) NOT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES ('Dharit','d@gmail.com','dharit','dharit','dharit'),('Raj','raj@gmail.com','raj','raj','raj'),('SysAdmin','sysadmin@gmail.com','sysadmin','admin','admin'),('Dharit shah','dharits3@gmail.com','Yusuf','password','password');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger add_user
after insert on person
for each row
begin
insert into useraccount 
select 4,'password','Yusuf',1;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `ProductId` int(11) NOT NULL,
  `ProductName` varchar(45) NOT NULL,
  `ProductDescription` varchar(45) NOT NULL,
  `Price` varchar(45) NOT NULL,
  `Availablility` varchar(45) NOT NULL,
  `Reviews` varchar(45) DEFAULT NULL,
  `SupplierName` varchar(45) NOT NULL,
  PRIMARY KEY (`ProductId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'half girlfriend','new','10','20','ng','cb'),(2,'full girlfriend','old','20','30','nm','rr'),(3,'computer','new','40','50','vb','rr'),(4,'laptop','old','30','30','vb','rr'),(5,'clothing','Newarrival','30','10','not good','bb'),(6,'clothing','halfprice','20','10','Bestseller','cc'),(7,'babycare','halfprice','10','20','not good','cc');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipment`
--

DROP TABLE IF EXISTS `shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipment` (
  `ShipmentId` int(11) NOT NULL,
  `ShipperName` varchar(45) NOT NULL,
  `Address` varchar(45) NOT NULL,
  `Date` varchar(45) NOT NULL,
  PRIMARY KEY (`ShipmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipment`
--

LOCK TABLES `shipment` WRITE;
/*!40000 ALTER TABLE `shipment` DISABLE KEYS */;
INSERT INTO `shipment` VALUES (1,'dhl','usa','2017-12-13');
/*!40000 ALTER TABLE `shipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `shipment_details`
--

DROP TABLE IF EXISTS `shipment_details`;
/*!50001 DROP VIEW IF EXISTS `shipment_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `shipment_details` AS SELECT 
 1 AS `CustomerOrder_OrderId`,
 1 AS `warehousename`,
 1 AS `suppliername`,
 1 AS `shippername`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `shipment_details_final`
--

DROP TABLE IF EXISTS `shipment_details_final`;
/*!50001 DROP VIEW IF EXISTS `shipment_details_final`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `shipment_details_final` AS SELECT 
 1 AS `UserName`,
 1 AS `orderid`,
 1 AS `department_id`,
 1 AS `categoryname`,
 1 AS `productname`,
 1 AS `price`,
 1 AS `addresstype`,
 1 AS `apartmentnumber`,
 1 AS `streetname`,
 1 AS `city`,
 1 AS `zipcode`,
 1 AS `paymenttype`,
 1 AS `WarehouseName`,
 1 AS `SupplierName`,
 1 AS `ShipperName`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `SupplierId` int(11) NOT NULL,
  `SupplierName` varchar(45) NOT NULL,
  `WarehouseId` int(11) NOT NULL,
  `ShipmentId` int(11) NOT NULL,
  PRIMARY KEY (`SupplierId`),
  KEY `fk_Supplier_Warehouse1_idx` (`WarehouseId`),
  KEY `fk_Supplier_Shipment1_idx` (`ShipmentId`),
  CONSTRAINT `fk_Supplier_Shipment1` FOREIGN KEY (`ShipmentId`) REFERENCES `shipment` (`ShipmentId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Supplier_Warehouse1` FOREIGN KEY (`WarehouseId`) REFERENCES `warehouse` (`WarehouseId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'dharits3',1,1);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraccount`
--

DROP TABLE IF EXISTS `useraccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useraccount` (
  `UserId` int(11) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Username` varchar(45) NOT NULL,
  `OrganizationId` int(11) NOT NULL,
  PRIMARY KEY (`UserId`),
  KEY `fk_UserAccount_Person1_idx` (`Username`),
  KEY `fk_UserAccount_Organization1_idx` (`OrganizationId`),
  CONSTRAINT `fk_UserAccount_Organization1` FOREIGN KEY (`OrganizationId`) REFERENCES `organization` (`OrganizationId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_UserAccount_Person1` FOREIGN KEY (`Username`) REFERENCES `person` (`Username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccount`
--

LOCK TABLES `useraccount` WRITE;
/*!40000 ALTER TABLE `useraccount` DISABLE KEYS */;
INSERT INTO `useraccount` VALUES (1,'dharit','dharit',1),(2,'raj','raj',1),(4,'password','Yusuf',1);
/*!40000 ALTER TABLE `useraccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warehouse` (
  `WarehouseId` int(11) NOT NULL,
  `WarehouseName` varchar(45) NOT NULL,
  PRIMARY KEY (`WarehouseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
INSERT INTO `warehouse` VALUES (1,'Amazon warehouse');
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mydb'
--

--
-- Dumping routines for database 'mydb'
--
/*!50003 DROP PROCEDURE IF EXISTS `product_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `product_details`(in val int)
begin 
select p.productName,p.Price,p.SupplierName
from products as p inner join CustomerOrder_has_Products as c 
on p.ProductId = c.ProductId
inner join customerorder cd
on c.orderid=cd.OrderId
where cd.OrderId=val;


end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `shipment_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `shipment_details`(in val int)
begin
select distinct u.UserName,c.orderid,d.department_id,cm.categoryname,p.productname,p.price,
a.addresstype,a.apartmentnumber,a.streetname,a.city,a.zipcode,pm.paymenttype,w.WarehouseName,s.SupplierName,sp.ShipperName
from customerorder c inner join customerorder_has_products cp
on c.orderid=cp.orderid
inner join products p
on cp.productid=p.productid
inner join category cm
on p.productid=cm.categoryid
inner join department d
on cm.Department_Id=d.Department_Id
inner join organization op
on d.OrganizationId=op.OrganizationId
inner join useraccount u
on op.OrganizationId=u.OrganizationId
inner join address a
on c.OrderId=a.OrderId
inner join paymentmethod pm
on c.OrderId=pm.OrderId
inner join invoice i
on c.OrderId=i.CustomerOrder_OrderId
inner join warehouse w
on i.WarehouseId=w.WarehouseId
inner join supplier s
on w.WarehouseId=s.WarehouseId
inner join shipment sp
on s.ShipmentId=sp.ShipmentId
where s.ShipmentId=1;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_details`(in val int)
begin 
select p.productName,p.Price,p.SupplierName
from products p where p.ProductId=val; 
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_product_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_product_details`(in val int)
begin 
select p.productName,p.Price,p.SupplierName
from products as p inner join CustomerOrder_has_Products as c inner join CustomerOrder as co
on p.productID=c.productId and c.OrderId=co.OrderId;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_product_details_1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_product_details_1`(in val int)
begin 
select p.productName,p.Price,p.SupplierName
from products as p inner join CustomerOrder_has_Products as c inner join CustomerOrder as co
on p.productID=c.productId and c.OrderId=co.OrderId where customerorder.OrderId=val;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `customer_order`
--

/*!50001 DROP VIEW IF EXISTS `customer_order`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_order` AS select distinct `u`.`Username` AS `UserName`,`c`.`OrderId` AS `orderid`,`d`.`Department_Id` AS `department_id`,`cm`.`CategoryName` AS `categoryname`,`p`.`ProductName` AS `productname`,`p`.`Price` AS `price` from ((((((`customerorder` `c` join `customerorder_has_products` `cp` on((`c`.`OrderId` = `cp`.`OrderId`))) join `products` `p` on((`cp`.`ProductId` = `p`.`ProductId`))) join `category` `cm` on((`p`.`ProductId` = `cm`.`CategoryId`))) join `department` `d` on((`cm`.`Department_Id` = `d`.`Department_Id`))) join `organization` `op` on((`d`.`OrganizationId` = `op`.`OrganizationId`))) join `useraccount` `u` on((`op`.`OrganizationId` = `u`.`OrganizationId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customer_order_new`
--

/*!50001 DROP VIEW IF EXISTS `customer_order_new`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_order_new` AS select distinct `u`.`Username` AS `UserName`,`c`.`OrderId` AS `orderid`,`d`.`Department_Id` AS `department_id`,`cm`.`CategoryName` AS `categoryname`,`p`.`ProductName` AS `productname`,`p`.`Price` AS `price` from ((((((`customerorder` `c` join `customerorder_has_products` `cp` on((`c`.`OrderId` = `cp`.`OrderId`))) join `products` `p` on((`cp`.`ProductId` = `p`.`ProductId`))) join `category` `cm` on((`p`.`ProductId` = `cm`.`CategoryId`))) join `department` `d` on((`cm`.`Department_Id` = `d`.`Department_Id`))) join `organization` `op` on((`d`.`OrganizationId` = `op`.`OrganizationId`))) join `useraccount` `u` on((`op`.`OrganizationId` = `u`.`OrganizationId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `invoice_new`
--

/*!50001 DROP VIEW IF EXISTS `invoice_new`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `invoice_new` AS select distinct `u`.`Username` AS `UserName`,`c`.`OrderId` AS `orderid`,`d`.`Department_Id` AS `department_id`,`cm`.`CategoryName` AS `categoryname`,`p`.`ProductName` AS `productname`,`p`.`Price` AS `price`,`a`.`AddressType` AS `addresstype`,`a`.`ApartmentNumber` AS `apartmentnumber`,`a`.`StreetName` AS `streetname`,`a`.`City` AS `city`,`a`.`ZipCode` AS `zipcode`,`pm`.`PaymentType` AS `paymenttype` from ((((((((`customerorder` `c` join `customerorder_has_products` `cp` on((`c`.`OrderId` = `cp`.`OrderId`))) join `products` `p` on((`cp`.`ProductId` = `p`.`ProductId`))) join `category` `cm` on((`p`.`ProductId` = `cm`.`CategoryId`))) join `department` `d` on((`cm`.`Department_Id` = `d`.`Department_Id`))) join `organization` `op` on((`d`.`OrganizationId` = `op`.`OrganizationId`))) join `useraccount` `u` on((`op`.`OrganizationId` = `u`.`OrganizationId`))) join `address` `a` on((`c`.`OrderId` = `a`.`OrderId`))) join `paymentmethod` `pm` on((`c`.`OrderId` = `pm`.`OrderId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `orderdetails`
--

/*!50001 DROP VIEW IF EXISTS `orderdetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `orderdetails` AS select `c`.`OrderId` AS `orderid`,`p`.`ProductName` AS `productname`,`p`.`Price` AS `price`,`cm`.`CategoryName` AS `categoryname` from (((`customerorder` `c` join `customerorder_has_products` `cp` on((`c`.`OrderId` = `cp`.`OrderId`))) join `products` `p` on((`cp`.`ProductId` = `p`.`ProductId`))) join `category` `cm` on((`p`.`ProductId` = `cm`.`CategoryId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `shipment_details`
--

/*!50001 DROP VIEW IF EXISTS `shipment_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `shipment_details` AS select `i`.`CustomerOrder_OrderId` AS `CustomerOrder_OrderId`,`w`.`WarehouseName` AS `warehousename`,`s`.`SupplierName` AS `suppliername`,`spm`.`ShipperName` AS `shippername` from ((((`invoice` `i` join `customerorder` `c` on((`c`.`OrderId` = `i`.`CustomerOrder_OrderId`))) join `warehouse` `w` on((`i`.`WarehouseId` = `w`.`WarehouseId`))) join `supplier` `s` on((`w`.`WarehouseId` = `s`.`WarehouseId`))) join `shipment` `spm` on((`s`.`ShipmentId` = `spm`.`ShipmentId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `shipment_details_final`
--

/*!50001 DROP VIEW IF EXISTS `shipment_details_final`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `shipment_details_final` AS select distinct `u`.`Username` AS `UserName`,`c`.`OrderId` AS `orderid`,`d`.`Department_Id` AS `department_id`,`cm`.`CategoryName` AS `categoryname`,`p`.`ProductName` AS `productname`,`p`.`Price` AS `price`,`a`.`AddressType` AS `addresstype`,`a`.`ApartmentNumber` AS `apartmentnumber`,`a`.`StreetName` AS `streetname`,`a`.`City` AS `city`,`a`.`ZipCode` AS `zipcode`,`pm`.`PaymentType` AS `paymenttype`,`w`.`WarehouseName` AS `WarehouseName`,`s`.`SupplierName` AS `SupplierName`,`sp`.`ShipperName` AS `ShipperName` from ((((((((((((`customerorder` `c` join `customerorder_has_products` `cp` on((`c`.`OrderId` = `cp`.`OrderId`))) join `products` `p` on((`cp`.`ProductId` = `p`.`ProductId`))) join `category` `cm` on((`p`.`ProductId` = `cm`.`CategoryId`))) join `department` `d` on((`cm`.`Department_Id` = `d`.`Department_Id`))) join `organization` `op` on((`d`.`OrganizationId` = `op`.`OrganizationId`))) join `useraccount` `u` on((`op`.`OrganizationId` = `u`.`OrganizationId`))) join `address` `a` on((`c`.`OrderId` = `a`.`OrderId`))) join `paymentmethod` `pm` on((`c`.`OrderId` = `pm`.`OrderId`))) join `invoice` `i` on((`c`.`OrderId` = `i`.`CustomerOrder_OrderId`))) join `warehouse` `w` on((`i`.`WarehouseId` = `w`.`WarehouseId`))) join `supplier` `s` on((`w`.`WarehouseId` = `s`.`WarehouseId`))) join `shipment` `sp` on((`s`.`ShipmentId` = `sp`.`ShipmentId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-13 19:13:45
