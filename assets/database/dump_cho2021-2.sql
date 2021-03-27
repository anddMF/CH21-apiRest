CREATE DATABASE  IF NOT EXISTS `develop2020` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `develop2020`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: develop2020
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `cho2021_arc_profile`
--

DROP TABLE IF EXISTS `cho2021_arc_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cho2021_arc_profile` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(60) NOT NULL,
  `DESCRIPTION` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cho2021_arc_profile`
--

LOCK TABLES `cho2021_arc_profile` WRITE;
/*!40000 ALTER TABLE `cho2021_arc_profile` DISABLE KEYS */;
INSERT INTO `cho2021_arc_profile` VALUES (1,'Industrial','Visuais mais crus no acabamento, canos expostos, cimento, etc.'),(2,'Moderno','Linhas retas, pontudas kkkkk sei la');
/*!40000 ALTER TABLE `cho2021_arc_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cho2021_company`
--

DROP TABLE IF EXISTS `cho2021_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cho2021_company` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(60) NOT NULL,
  `CNPJ` varchar(20) DEFAULT NULL,
  `AVATAR` blob,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cho2021_company`
--

LOCK TABLES `cho2021_company` WRITE;
/*!40000 ALTER TABLE `cho2021_company` DISABLE KEYS */;
INSERT INTO `cho2021_company` VALUES (1,'Vitt Arch','11111-111',NULL);
/*!40000 ALTER TABLE `cho2021_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cho2021_customer`
--

DROP TABLE IF EXISTS `cho2021_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cho2021_customer` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_USER_ADMIN` int NOT NULL,
  `ID_USER_WORKER` int DEFAULT NULL,
  `NAME` varchar(60) NOT NULL,
  `EMAIL` varchar(60) DEFAULT NULL,
  `DT_BIRTH` date DEFAULT NULL,
  `DT_REGISTER` datetime DEFAULT NULL,
  `CHILDREN` int DEFAULT NULL,
  `KID` bit(1) DEFAULT NULL,
  `DEAL` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_USER_ADMIN` (`ID_USER_ADMIN`),
  KEY `ID_USER_WORKER` (`ID_USER_WORKER`),
  CONSTRAINT `cho2021_customer_fkuser1` FOREIGN KEY (`ID_USER_ADMIN`) REFERENCES `cho2021_user` (`ID`),
  CONSTRAINT `cho2021_customer_fkuser2` FOREIGN KEY (`ID_USER_WORKER`) REFERENCES `cho2021_user` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cho2021_customer`
--

LOCK TABLES `cho2021_customer` WRITE;
/*!40000 ALTER TABLE `cho2021_customer` DISABLE KEYS */;
INSERT INTO `cho2021_customer` VALUES (2,1,NULL,'Testando','teste@email.com','0001-01-01','2021-01-30 11:25:31',NULL,NULL,_binary '\0'),(3,1,NULL,'José','jjose@email.com','0001-01-01','2021-01-30 11:47:06',NULL,NULL,_binary ''),(6,1,NULL,'Post Teste','post@email.com','2021-01-30','2021-01-30 15:06:16',NULL,NULL,_binary '\0'),(7,1,NULL,'Teste E2E','testee2e@email.com','2021-02-07','2021-02-07 19:20:45',NULL,NULL,_binary '\0'),(8,1,NULL,'Teste e2e 2','teste@email.com.br','2021-02-07','2021-02-07 19:25:54',NULL,NULL,_binary '\0'),(9,1,NULL,'Teste','testes@email.com','2021-02-21','2021-02-21 11:31:10',NULL,NULL,_binary '\0');
/*!40000 ALTER TABLE `cho2021_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cho2021_image`
--

DROP TABLE IF EXISTS `cho2021_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cho2021_image` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_ARC_PROFILE` int NOT NULL,
  `ID_ROOM_TYPE` int NOT NULL,
  `BASE_IMAGE` varchar(500) NOT NULL,
  `NAME` varchar(60) DEFAULT NULL,
  `COLOR_1` varchar(8) DEFAULT NULL,
  `COLOR_2` varchar(9) DEFAULT NULL,
  `DT_REGISTER` datetime DEFAULT NULL,
  `ID_COMPANY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_ARC_PROFILE` (`ID_ARC_PROFILE`),
  KEY `ID_ROOM_TYPE` (`ID_ROOM_TYPE`),
  KEY `ID_COMPANY` (`ID_COMPANY`),
  CONSTRAINT `cho2021_image_ibfk_1` FOREIGN KEY (`ID_COMPANY`) REFERENCES `cho2021_company` (`ID`),
  CONSTRAINT `cho2021_images_fkarcprofile` FOREIGN KEY (`ID_ARC_PROFILE`) REFERENCES `cho2021_arc_profile` (`ID`),
  CONSTRAINT `cho2021_images_fkroomrype` FOREIGN KEY (`ID_ROOM_TYPE`) REFERENCES `cho2021_room_type` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cho2021_image`
--

LOCK TABLES `cho2021_image` WRITE;
/*!40000 ALTER TABLE `cho2021_image` DISABLE KEYS */;
INSERT INTO `cho2021_image` VALUES (1,1,1,'https://i.pinimg.com/564x/6c/20/1f/6c201f873362ab42866a4aa0b38dcc25.jpg','Sala tijolo','','','2021-01-09 20:07:05',NULL),(2,2,1,'https://i.pinimg.com/originals/ad/90/b0/ad90b043948eb42839ef3b50d1a3188a.jpg','Sala ripada','','','2021-01-29 11:52:47',NULL),(3,2,1,'https://i.pinimg.com/564x/df/79/5b/df795b4b1722a8cdebdd3d8f4d7fc35c.jpg','Modernoza','','','2021-01-29 14:59:17',NULL),(4,1,1,'https://i.pinimg.com/564x/ce/d3/7e/ced37ecedbbc9339e3edc6c110a12f3c.jpg','Sala ampla, trilho','','','2021-01-29 15:38:23',NULL),(5,1,1,'https://i.pinimg.com/564x/31/e8/8e/31e88e2dd36de355af7c354e560aafad.jpg','Sala canos','','','2021-01-29 15:40:59',NULL),(6,2,1,'https://i.pinimg.com/564x/48/b7/00/48b700a98c1ac97369137852ed35d9d2.jpg','Sala mega moderna','','','2021-01-29 15:43:08',NULL),(7,1,2,'https://i.pinimg.com/564x/bb/4f/3d/bb4f3d0194411873442322a1f0768b49.jpg','Cozinha tampo cimento','','','2021-01-29 16:40:45',NULL),(8,1,2,'https://i.pinimg.com/564x/b9/8a/bd/b98abd2806d3c6c54b1f2dc7e00bbea1.jpg','Cozinha','','','2021-01-29 16:41:44',NULL),(9,1,3,'https://i.pinimg.com/564x/75/78/b7/7578b77866c02ff7bb47a82e604fb573.jpg','Banheiro','','','2021-01-29 16:44:17',NULL),(10,1,3,'https://i.pinimg.com/564x/00/59/93/0059932cb8454b1ca61fc47d71a09388.jpg','Banheiro','','','2021-01-29 16:45:12',NULL),(11,2,2,'https://i.pinimg.com/564x/1a/aa/24/1aaa24b1cd6b179715c58a0dc7485c50.jpg','Cozinha moderna',NULL,NULL,'2021-01-29 16:45:12',NULL),(12,2,2,'https://i.pinimg.com/564x/cd/bb/80/cdbb8024466a93dc78a2916bf6a4813a.jpg','Banheiro moderna',NULL,NULL,'2021-01-29 16:45:12',NULL),(13,2,2,'https://i.pinimg.com/564x/cd/bb/80/cdbb8024466a93dc78a2916bf6a4813a.jpg','Banheiro moderna',NULL,NULL,'2021-01-29 16:45:12',NULL),(14,2,3,'https://i.pinimg.com/564x/cd/bb/80/cdbb8024466a93dc78a2916bf6a4813a.jpg','Banheiro moderno',NULL,NULL,'2021-01-29 16:45:12',NULL);
/*!40000 ALTER TABLE `cho2021_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cho2021_report`
--

DROP TABLE IF EXISTS `cho2021_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cho2021_report` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_CUSTOMER` int NOT NULL,
  `DT_REGISTER` datetime DEFAULT NULL,
  `DEAL` bit(1) DEFAULT NULL,
  `R_READ` bit(1) DEFAULT NULL,
  `TITLE` varchar(60) DEFAULT NULL,
  `R_DESCRIPTION` varchar(200) DEFAULT NULL,
  `R_KEY` varchar(255) DEFAULT NULL,
  `R1_PIC1` int DEFAULT NULL,
  `R1_PIC2` int DEFAULT NULL,
  `R2_PIC1` int DEFAULT NULL,
  `R2_PIC2` int DEFAULT NULL,
  `R3_PIC1` int DEFAULT NULL,
  `R3_PIC2` int DEFAULT NULL,
  `R4_PIC1` int DEFAULT NULL,
  `R4_PIC2` int DEFAULT NULL,
  `R5_PIC1` int DEFAULT NULL,
  `R5_PIC2` int DEFAULT NULL,
  `R6_PIC1` int DEFAULT NULL,
  `R6_PIC2` int DEFAULT NULL,
  `R7_PIC1` int DEFAULT NULL,
  `R7_PIC2` int DEFAULT NULL,
  `R8_PIC1` int DEFAULT NULL,
  `R8_PIC2` int DEFAULT NULL,
  `ID_USER_ADMIN` int NOT NULL,
  `ID_USER_WORKER` int DEFAULT NULL,
  `ID_COMPANY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_CUSTOMER` (`ID_CUSTOMER`),
  KEY `cho2021_report_fkuser1` (`ID_USER_ADMIN`),
  KEY `cho2021_report_fkuser2` (`ID_USER_WORKER`),
  KEY `ID_COMPANY` (`ID_COMPANY`),
  CONSTRAINT `cho2021_report_fkcustomer` FOREIGN KEY (`ID_CUSTOMER`) REFERENCES `cho2021_customer` (`ID`),
  CONSTRAINT `cho2021_report_fkuser1` FOREIGN KEY (`ID_USER_ADMIN`) REFERENCES `cho2021_customer` (`ID`),
  CONSTRAINT `cho2021_report_fkuser2` FOREIGN KEY (`ID_USER_WORKER`) REFERENCES `cho2021_customer` (`ID`),
  CONSTRAINT `cho2021_report_ibfk_1` FOREIGN KEY (`ID_COMPANY`) REFERENCES `cho2021_company` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cho2021_report`
--

LOCK TABLES `cho2021_report` WRITE;
/*!40000 ALTER TABLE `cho2021_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `cho2021_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cho2021_room_type`
--

DROP TABLE IF EXISTS `cho2021_room_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cho2021_room_type` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(60) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cho2021_room_type`
--

LOCK TABLES `cho2021_room_type` WRITE;
/*!40000 ALTER TABLE `cho2021_room_type` DISABLE KEYS */;
INSERT INTO `cho2021_room_type` VALUES (1,'sala'),(2,'cozinha'),(3,'banheiro');
/*!40000 ALTER TABLE `cho2021_room_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cho2021_user`
--

DROP TABLE IF EXISTS `cho2021_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cho2021_user` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_COMPANY` int NOT NULL,
  `ID_USER_TYPE` int NOT NULL,
  `NAME` varchar(60) NOT NULL,
  `EMAIL` varchar(230) NOT NULL,
  `PASSWORD` varchar(22) NOT NULL,
  `DT_BIRTH` date DEFAULT NULL,
  `DT_REGISTER` datetime DEFAULT NULL,
  `AVATAR` blob,
  PRIMARY KEY (`ID`),
  KEY `ID_COMPANY` (`ID_COMPANY`),
  KEY `ID_USER_TYPE` (`ID_USER_TYPE`),
  CONSTRAINT `cho2021_user_fkcompany` FOREIGN KEY (`ID_COMPANY`) REFERENCES `cho2021_company` (`ID`),
  CONSTRAINT `cho2021_user_fkusertype` FOREIGN KEY (`ID_USER_TYPE`) REFERENCES `cho2021_user_type` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cho2021_user`
--

LOCK TABLES `cho2021_user` WRITE;
/*!40000 ALTER TABLE `cho2021_user` DISABLE KEYS */;
INSERT INTO `cho2021_user` VALUES (1,1,1,'Andrew','and@email.com','teste','1998-08-04','2021-01-09 19:09:48',NULL);
/*!40000 ALTER TABLE `cho2021_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cho2021_user_type`
--

DROP TABLE IF EXISTS `cho2021_user_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cho2021_user_type` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(60) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cho2021_user_type`
--

LOCK TABLES `cho2021_user_type` WRITE;
/*!40000 ALTER TABLE `cho2021_user_type` DISABLE KEYS */;
INSERT INTO `cho2021_user_type` VALUES (1,'admin'),(2,'worker');
/*!40000 ALTER TABLE `cho2021_user_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shared_country`
--

DROP TABLE IF EXISTS `shared_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shared_country` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME_COUNTRY` varchar(40) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shared_country`
--

LOCK TABLES `shared_country` WRITE;
/*!40000 ALTER TABLE `shared_country` DISABLE KEYS */;
INSERT INTO `shared_country` VALUES (1,'Brasil');
/*!40000 ALTER TABLE `shared_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'develop2020'
--
/*!50003 DROP PROCEDURE IF EXISTS `STP_CHO2021_ARCPROFILE_GET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `STP_CHO2021_ARCPROFILE_GET`()
BEGIN
		SELECT * FROM cho2021_arc_profile
	END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `STP_CHO2021_COMPANY_GET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `STP_CHO2021_COMPANY_GET`()
BEGIN
		SELECT * FROM develop2020.cho2021_company
	END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `STP_CHO2021_CUSTOMER_GET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `STP_CHO2021_CUSTOMER_GET`(Pid_admin int, Pid_customer int)
BEGIN
		IF Pid_admin > 0 && Pid_customer = 0 THEN
			SELECT cu.ID, cu.ID_USER_ADMIN, us.NAME as 'USER_NAME', us.EMAIL AS 'USER_EMAIL', cu.ID_USER_WORKER, cu.NAME, cu.EMAIL, cu.DT_BIRTH, cu.DT_REGISTER, cu.CHILDREN, cu.KID, cu.DEAL
            FROM cho2021_customer cu
            LEFT JOIN cho2021_user us on cu.ID_USER_ADMIN = us.ID
			WHERE ID_USER_ADMIN = Pid_admin;
        END IF;
        
        IF Pid_customer > 0 THEN
			SELECT cu.ID, cu.ID_USER_ADMIN, us.NAME AS 'USER_NAME', us.EMAIL AS 'USER_EMAIL', cu.ID_USER_WORKER, cu.NAME, cu.EMAIL, cu.DT_BIRTH, cu.DT_REGISTER, cu.CHILDREN, cu.KID, cu.DEAL
            FROM cho2021_customer cu
            LEFT JOIN cho2021_user us on cu.ID_USER_ADMIN = us.ID
			WHERE ID = Pid_customer;
        END IF;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `STP_CHO2021_CUSTOMER_INSERT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `STP_CHO2021_CUSTOMER_INSERT`(Pid int, Pid_admin int, Pname varchar(60), Pemail varchar(60), Pdt_birth date, Pdt_register datetime, Pdeal bit)
BEGIN
		if Pid = 0 THEN
			INSERT INTO develop2020.cho2021_customer (ID_USER_ADMIN, NAME, EMAIL, DT_BIRTH, DT_REGISTER, DEAL)
		VALUES
			(Pid_admin, Pname, Pemail, Pdt_birth, Pdt_register, Pdeal);
        END IF;
        
        if Pid > 0 THEN
			UPDATE develop2020.cho2021_customer
            SET ID_USER_ADMIN = Pid_admin, NAME = Pname, EMAIL = Pemail, DT_BIRTH = Pdt_birth, DT_REGISTER = Pdt_register, DEAL = Pdeal
            WHERE ID = Pid;
        END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `STP_CHO2021_IMAGE_GET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `STP_CHO2021_IMAGE_GET`()
BEGIN
		SELECT * FROM develop2020.cho2021_image
	END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `STP_CHO2021_IMAGE_INSERT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `STP_CHO2021_IMAGE_INSERT`(Pid int, Pid_arcprofile int, Pid_roomtype int, Pbase_image VARCHAR(500), Pname varchar(60), Pcolor1 varchar(8), Pcolor2 varchar(8), Pdt_register datetime)
BEGIN
		if Pid = 0 THEN
			INSERT INTO develop2020.cho2021_image (ID_ARC_PROFILE, ID_ROOM_TYPE, BASE_IMAGE, NAME, COLOR_1, COLOR_2, DT_REGISTER)
		VALUES
			(Pid_arcprofile, Pid_roomtype, Pbase_image, Pname, Pcolor1 , Pcolor2, Pdt_register);
        END IF;
        
        if Pid > 0 THEN
			UPDATE develop2020.cho2021_image
            SET ID_ARC_PROFILE = Pid_arcprofile, ID_ROOM_TYPE = Pid_roomtype, BASE_IMAGE = Pbase_image, NAME = Pname, COLOR_1 = Pcolor1, COLOR_2 = Pcolor2, DT_REGISTER = Pdt_register
            WHERE ID = Pid;
        END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `STP_CHO2021_REPORT_GET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `STP_CHO2021_REPORT_GET`(Pid_company int, Pid_report int)
BEGIN        
        IF Pid_company > 0 THEN
			SELECT re.ID, re.ID_CUSTOMER, cu.NAME, cu.DT_BIRTH, cu.CHILDREN, cu.KID, cu.EMAIL, re.DT_REGISTER, re.DEAL, re.R_READ, re.TITLE, re.R_DESCRIPTION, re.R_KEY, re.R1_PIC1, re.R1_PIC2, re.R2_PIC1, re.R2_PIC2, re.R3_PIC1, re.R3_PIC2, re.R4_PIC1, re.R4_PIC2, re.R5_PIC1, re.R5_PIC2, re.R6_PIC1, re.R6_PIC2, re.R7_PIC1, re.R7_PIC2, re.R8_PIC1, re.R8_PIC2
            FROM cho2021_report re
            LEFT JOIN cho2021_customer cu on re.ID_CUSTOMER = cu.ID
			WHERE re.ID_COMPANY = Pid_company;
        END IF;
        
       IF Pid_report > 0 THEN
			SELECT re.ID, re.ID_CUSTOMER, cu.NAME, cu.DT_BIRTH, cu.CHILDREN, cu.KID, cu.EMAIL, re.DT_REGISTER, re.DEAL, re.R_READ, re.TITLE, re.R_DESCRIPTION, re.R_KEY, re.R1_PIC1, re.R1_PIC2, re.R2_PIC1, re.R2_PIC2, re.R3_PIC1, re.R3_PIC2, re.R4_PIC1, re.R4_PIC2, re.R5_PIC1, re.R5_PIC2, re.R6_PIC1, re.R6_PIC2, re.R7_PIC1, re.R7_PIC2, re.R8_PIC1, re.R8_PIC2
            FROM cho2021_report re
            LEFT JOIN cho2021_customer cu on re.ID_CUSTOMER = cu.ID
			WHERE ID = Pid_report;
        END IF;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `STP_CHO2021_REPORT_INSERT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `STP_CHO2021_REPORT_INSERT`(Pid int, Pid_customer int, Pid_admin int, Pid_worker int, Pid_company int, Pdt_register datetime, Pdeal bit, Pread bit, Ptitle varchar(6), Pdescription varchar(200), Pkey varchar(255), Pr1_pic1 int, Pr1_pic2 int, Pr2_pic1 int, Pr2_pic2 int, Pr3_pic1 int, Pr3_pic2 int, Pr4_pic1 int, Pr4_pic2 int, Pr5_pic1 int, Pr5_pic2 int, Pr6_pic1 int, Pr6_pic2 int, Pr7_pic1 int, Pr7_pic2 int, Pr8_pic1 int, Pr8_pic2 int)
BEGIN
		if Pid = 0 THEN
			INSERT INTO develop2020.cho2021_report (ID_CUSTOMER, ID_USER_ADMIN, ID_USER_WORKER, ID_COMPANY, DT_REGISTER, DEAL, R_READ, TITLE, R_DESCRIPTION, R_KEY, R1_PIC1, R1_PIC2, R2_PIC1, R2_PIC2, R3_PIC1, R3_PIC2, R4_PIC1, R4_PIC2, R5_PIC1, R5_PIC2, R6_PIC1, R6_PIC2, R7_PIC1, R7_PIC2, R8_PIC1, R8_PIC2)
		VALUES
			(Pid_customer, Pid_admin, Pid_worker, Pid_company, Pdt_register, Pdeal, Pread, Ptitle, Pdescription, Pkey, Pr1_pic1, Pr1_pic2, Pr2_pic1, Pr2_pic2, Pr3_pic1, Pr3_pic2, Pr4_pic1, Pr4_pic2, Pr5_pic1, Pr5_pic2, Pr6_pic1, Pr6_pic2, Pr7_pic1, Pr7_pic2, Pr8_pic1, Pr8_pic2);
        END IF;
        
        if Pid > 0 THEN
			UPDATE develop2020.cho2021_report
            SET ID_CUSTOMER = Pid_customer, ID_USER_ADMIN = Pid_admin, ID_USER_WORKER = Pid_worker, ID_COMPANY = Pid_company, DT_REGISTER = Pdt_register, DEAL = Pdeal, R_READ = Pread, TITLE = Ptitle, R_DESCRIPTION = Pdescription, R_KEY = Pkey, R1_PIC1 = Pr1_pic1, R1_PIC2 = Pr1_pic2, R2_PIC1 = Pr2_pic1, R2_PIC2 = Pr2_pic2, R3_PIC1 = Pr3_pic1, R3_PIC2 = Pr3_pic2, R4_PIC1 = Pr4_pic1, R4_PIC2 = Pr4_pic2, R5_PIC1 = Pr5_pic1, R5_PIC2 = Pr5_pic2, R6_PIC1 = Pr6_pic1, R6_PIC2 = Pr6_pic2, R7_PIC1 = Pr7_pic1, R7_PIC2 = Pr7_pic2, R8_PIC1 = Pr8_pic1, R8_PIC2 = Pr8_pic2
            WHERE ID = Pid;
        END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `STP_CHO2021_ROOMTYPE_GET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `STP_CHO2021_ROOMTYPE_GET`()
BEGIN
		SELECT * FROM cho2021_room_type
	END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `STP_CHO2021_USER_GET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `STP_CHO2021_USER_GET`(Pid int, Pid_company int)
BEGIN
    IF Pid > 0 && Pid_company = 0 THEN
		SELECT us.ID, us.ID_COMPANY, us.ID_USER_TYPE, us.NAME, us.EMAIL, us.PASSWORD, us.DT_BIRTH, us.DT_REGISTER, us.AVATAR
        FROM develop2020.cho2021_user us
        LEFT JOIN develop2020.cho2021_company co on us.ID_COMPANY = co.ID
        WHERE ID = Pid;
	END IF;
    
	IF Pid = 0 && Pid_company > 0 THEN
		SELECT us.ID, us.ID_COMPANY, us.ID_USER_TYPE, us.NAME, us.EMAIL, us.PASSWORD, us.DT_BIRTH, us.DT_REGISTER, us.AVATAR
        FROM develop2020.cho2021_user us
        LEFT JOIN develop2020.cho2021_company co on us.ID_COMPANY = co.ID
        WHERE ID_COMPANY = Pid_company;
	END IF;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `STP_CHO2021_USER_INSERT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `STP_CHO2021_USER_INSERT`(Pid int, Pid_company int, Pid_user_type int, Pname varchar(60), Pemail varchar(230), Ppassword varchar(22), Pdt_birth date, Pdt_register datetime, Pavatar blob)
BEGIN
		if Pid = 0 THEN
			INSERT INTO develop2020.cho2021_user (ID_COMPANY, ID_USER_TYPE, NAME, EMAIL, PASSWORD, DT_BIRTH, DT_REGISTER, AVATAR)
		VALUES
			(Pid_company, Pid_user_type, Pname, Pemail, Ppassword, Pdt_birth, Pdt_register, Pavatar);
        END IF;
        
        if Pid > 0 THEN
			UPDATE develop2020.cho2021_user
            SET ID_COMPANY = Pid_company, ID_USER_TYPE = Pid_user_type, NAME = Pname, EMAIL = Pemail, PASSWORD = Ppassword, DT_BIRTH = Pdt_birth, DT_REGISTER = Pdt_register, AVATAR = Pavatar
            WHERE ID = Pid;
        END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `STP_JJ2020_NOTE_GET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `STP_JJ2020_NOTE_GET`(pid_user integer, pid integer)
BEGIN
		IF pid = 0 THEN
			select nt.ID, nt.ID_USER, nt.ID_USER_SHARED, nt.TITLE, nt.NOTE_TEXT, nt.ACTIVE, nt.FAVORITE, nt.TAG, nt.DT_CREATION, nt.DT_EDIT
			from JJ2020_TB_NOTE nt
			where nt.ID_USER = pid_user;
		END IF;

		IF pid != 0 THEN
			select nt.ID, nt.ID_USER, nt.ID_USER_SHARED, nt.TITLE, nt.NOTE_TEXT, nt.ACTIVE, nt.FAVORITE, nt.TAG, nt.DT_CREATION, nt.DT_EDIT
			from JJ2020_TB_NOTE nt
			where nt.ID = @id and nt.ID_USER = pid_user;
		END IF;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `STP_JJ2020_NOTE_INSERT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `STP_JJ2020_NOTE_INSERT`(Pid integer, Pid_user integer, Pid_user_shared integer, Ptitle varchar(60), Pnote_text varchar(16000), Pactive bit, Pfavorite bit, Ptag varchar(40), Pdt_creation datetime, Pdt_edit datetime)
BEGIN
		if Pid = 0 THEN
			INSERT INTO JJ2020_TB_NOTE (ID_USER, ID_USER_SHARED, TITLE, NOTE_TEXT, ACTIVE, FAVORITE, TAG,DT_CREATION, DT_EDIT)
		VALUES
           (Pid_user, Pid_user_shared , Ptitle, Pnote_text, Pactive, Pfavorite, Ptag, Pdt_creation, Pdt_edit);
		END IF;

		if Pid > 0 THEN
			UPDATE JJ2020_TB_NOTE 
			SET ID_USER = Pid_user, ID_USER_SHARED = Pid_user_shared, TITLE = Ptitle, NOTE_TEXT = Pnote_text, ACTIVE = Pactive, FAVORITE = Pfavorite, TAG = Ptag, DT_CREATION = Pdt_creation, DT_EDIT = Pdt_edit
			WHERE ID = Pid;
		END IF;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `STP_JJ2020_USER_GET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `STP_JJ2020_USER_GET`(INOUT pEmail varchar(250), INOUT pPass varchar(20))
BEGIN
		IF (pEmail != '') THEN
			select us.ID, us.ID_THEME, us.ID_COUNTRY, us.EMAIL, us.U_PASSWORD, us.NAME_USER, us.AGE, us.DT_CREATION, us.URL_PHOTO, co.NAME_COUNTRY
			from JJ2020_TB_USER us 
			left join SHARED_COUNTRY co on us.ID_COUNTRY = co.ID
			where us.EMAIL = pEmail AND us.U_PASSWORD = pPass;
		END IF;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `STP_JJ2020_USER_INSERT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `STP_JJ2020_USER_INSERT`(pId integer, pId_theme integer, pId_country integer, pEmail varchar(250), u_password varchar(20), pName_user varchar(60), age date, pActive bit, pDt_creation datetime, pUrl_photo varchar(250))
BEGIN
		if pId = 0 THEN
			INSERT INTO JJ2020_TB_USER
           (ID_THEME,ID_COUNTRY,EMAIL,U_PASSWORD,NAME_USER,AGE,ACTIVE,DT_CREATION,URL_PHOTO)
			VALUES
           (pId_theme, pId_country, pEmail, u_password, pName_user, age, pActive, pDt_creation, pUrl_photo);
		END IF;

		if pId > 0 THEN
			UPDATE JJ2020_TB_USER 
			SET ID_THEME = pId_theme, ID_COUNTRY = pId_country, EMAIL = pEmail, U_PASSWORD = u_password, NAME_USER = pName_user, AGE = age, ACTIVE = pActive, DT_CREATION = pDt_creation, URL_PHOTO = pUrl_photo
			WHERE ID = pId;
		END IF;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-16 18:54:26
