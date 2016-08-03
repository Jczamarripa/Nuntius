CREATE DATABASE  IF NOT EXISTS `nuntius` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `nuntius`;
-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: localhost    Database: nuntius
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.10-MariaDB

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
-- Table structure for table `Answers_Security_Questions`
--

DROP TABLE IF EXISTS `Answers_Security_Questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Answers_Security_Questions` (
  `answer_question_id` int(11) NOT NULL,
  `answer_user_id` int(11) NOT NULL,
  `answer_text` text NOT NULL,
  PRIMARY KEY (`answer_question_id`,`answer_user_id`),
  KEY `answer_user_id` (`answer_user_id`),
  CONSTRAINT `answers_security_questions_ibfk_1` FOREIGN KEY (`answer_question_id`) REFERENCES `Security_Questions` (`question_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `answers_security_questions_ibfk_2` FOREIGN KEY (`answer_user_id`) REFERENCES `Users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Answers_Security_Questions`
--

LOCK TABLES `Answers_Security_Questions` WRITE;
/*!40000 ALTER TABLE `Answers_Security_Questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `Answers_Security_Questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cities`
--

DROP TABLE IF EXISTS `Cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cities` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(50) NOT NULL,
  `city_state_id` char(2) NOT NULL,
  PRIMARY KEY (`city_id`),
  KEY `city_state_id` (`city_state_id`),
  CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`city_state_id`) REFERENCES `States` (`state_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cities`
--

LOCK TABLES `Cities` WRITE;
/*!40000 ALTER TABLE `Cities` DISABLE KEYS */;
INSERT INTO `Cities` VALUES (1,'Tijuana','BC'),(2,'Rosarito','BC');
/*!40000 ALTER TABLE `Cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Countries`
--

DROP TABLE IF EXISTS `Countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Countries` (
  `country_id` char(2) NOT NULL,
  `country_name` varchar(50) NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Countries`
--

LOCK TABLES `Countries` WRITE;
/*!40000 ALTER TABLE `Countries` DISABLE KEYS */;
INSERT INTO `Countries` VALUES ('MX','México'),('US','United Statates');
/*!40000 ALTER TABLE `Countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Evaluations_Places`
--

DROP TABLE IF EXISTS `Evaluations_Places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Evaluations_Places` (
  `evaluation_place_id` int(11) NOT NULL AUTO_INCREMENT,
  `evaluation_place_place_id` int(11) NOT NULL,
  `evaluation_place_user_id` int(11) NOT NULL,
  `evaluation_place_raiting` tinyint(4) NOT NULL,
  `evaluation_place_text` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`evaluation_place_id`),
  KEY `evaluation_place_place_id` (`evaluation_place_place_id`),
  KEY `evaluation_place_user_id` (`evaluation_place_user_id`),
  CONSTRAINT `evaluations_places_ibfk_1` FOREIGN KEY (`evaluation_place_place_id`) REFERENCES `Places` (`place_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `evaluations_places_ibfk_2` FOREIGN KEY (`evaluation_place_user_id`) REFERENCES `Users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Evaluations_Places`
--

LOCK TABLES `Evaluations_Places` WRITE;
/*!40000 ALTER TABLE `Evaluations_Places` DISABLE KEYS */;
/*!40000 ALTER TABLE `Evaluations_Places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Evaluations_Promotions`
--

DROP TABLE IF EXISTS `Evaluations_Promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Evaluations_Promotions` (
  `evaluation_promotion_id` int(11) NOT NULL AUTO_INCREMENT,
  `evaluation_promotion_promotion` int(11) NOT NULL,
  `evaluation_promotion_user` int(11) NOT NULL,
  `evaluation_promotion_raiting` tinyint(4) NOT NULL,
  `evaluation_promotion_text` varchar(300) DEFAULT NULL,
  `evaluation_promotion_posted_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`evaluation_promotion_id`),
  KEY `evaluation_promotion_promotion` (`evaluation_promotion_promotion`),
  KEY `evaluation_promotion_user` (`evaluation_promotion_user`),
  CONSTRAINT `evaluations_promotions_ibfk_1` FOREIGN KEY (`evaluation_promotion_promotion`) REFERENCES `Promotions` (`promotion_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `evaluations_promotions_ibfk_2` FOREIGN KEY (`evaluation_promotion_user`) REFERENCES `USers` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Evaluations_Promotions`
--

LOCK TABLES `Evaluations_Promotions` WRITE;
/*!40000 ALTER TABLE `Evaluations_Promotions` DISABLE KEYS */;
/*!40000 ALTER TABLE `Evaluations_Promotions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Franchises`
--

DROP TABLE IF EXISTS `Franchises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Franchises` (
  `franchise_id` int(11) NOT NULL AUTO_INCREMENT,
  `franchise_name` varchar(50) NOT NULL,
  `franchise_address_line` varchar(50) NOT NULL,
  `franchise_zip` char(5) NOT NULL,
  `franchise_city_id` int(11) NOT NULL,
  `franchise_phone` char(10) DEFAULT NULL,
  `franchise_email` varchar(50) DEFAULT NULL,
  `franchise_web_page` varchar(50) DEFAULT NULL,
  `franchise_type_place_id` int(11) NOT NULL,
  PRIMARY KEY (`franchise_id`),
  KEY `fk_franchise_city` (`franchise_city_id`),
  KEY `fk_franchise_typePlace` (`franchise_type_place_id`),
  CONSTRAINT `fk_franchise_city` FOREIGN KEY (`franchise_city_id`) REFERENCES `Cities` (`city_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_franchise_typePlace` FOREIGN KEY (`franchise_type_place_id`) REFERENCES `Types_Places` (`type_place_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Franchises`
--

LOCK TABLES `Franchises` WRITE;
/*!40000 ALTER TABLE `Franchises` DISABLE KEYS */;
INSERT INTO `Franchises` VALUES (1,'Sport Bar Mamitas','Calle Primera','22253',1,NULL,NULL,NULL,1),(2,'Sushi Yang','Calle Primera','22253',1,NULL,NULL,NULL,3),(3,'Las Alitas','Calle Primera','22253',1,NULL,NULL,NULL,1),(4,'Los Comales','Calle Primera','22253',1,NULL,NULL,NULL,2),(5,'Beverly Burguers','Calle Primera','22253',1,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `Franchises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Franchises_Owners`
--

DROP TABLE IF EXISTS `Franchises_Owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Franchises_Owners` (
  `franchise_owner_user_id` int(11) NOT NULL,
  `franchise_owner_franchise_id` int(11) NOT NULL,
  `franchise_owner_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`franchise_owner_user_id`,`franchise_owner_franchise_id`),
  KEY `franchise_owner_franchise_id` (`franchise_owner_franchise_id`),
  CONSTRAINT `franchises_owners_ibfk_1` FOREIGN KEY (`franchise_owner_user_id`) REFERENCES `Users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `franchises_owners_ibfk_2` FOREIGN KEY (`franchise_owner_franchise_id`) REFERENCES `Franchises` (`franchise_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Franchises_Owners`
--

LOCK TABLES `Franchises_Owners` WRITE;
/*!40000 ALTER TABLE `Franchises_Owners` DISABLE KEYS */;
/*!40000 ALTER TABLE `Franchises_Owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Franchises_Sucursals_Owners`
--

DROP TABLE IF EXISTS `Franchises_Sucursals_Owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Franchises_Sucursals_Owners` (
  `sucursal_owner_user_id` int(11) NOT NULL,
  `sucursal_owner_place_id` int(11) NOT NULL,
  `sucursal_owner_status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`sucursal_owner_user_id`,`sucursal_owner_place_id`),
  KEY `sucursal_owner_place_id` (`sucursal_owner_place_id`),
  CONSTRAINT `franchises_sucursals_owners_ibfk_1` FOREIGN KEY (`sucursal_owner_user_id`) REFERENCES `Users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `franchises_sucursals_owners_ibfk_2` FOREIGN KEY (`sucursal_owner_place_id`) REFERENCES `Places` (`place_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Franchises_Sucursals_Owners`
--

LOCK TABLES `Franchises_Sucursals_Owners` WRITE;
/*!40000 ALTER TABLE `Franchises_Sucursals_Owners` DISABLE KEYS */;
/*!40000 ALTER TABLE `Franchises_Sucursals_Owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Friends`
--

DROP TABLE IF EXISTS `Friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Friends` (
  `friend_user_id` int(11) NOT NULL,
  `friend_friend_id` int(11) NOT NULL,
  `freindship_status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`friend_user_id`,`friend_friend_id`),
  KEY `friend_friend_id` (`friend_friend_id`),
  CONSTRAINT `friends_ibfk_1` FOREIGN KEY (`friend_user_id`) REFERENCES `Users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `friends_ibfk_2` FOREIGN KEY (`friend_friend_id`) REFERENCES `Users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Friends`
--

LOCK TABLES `Friends` WRITE;
/*!40000 ALTER TABLE `Friends` DISABLE KEYS */;
/*!40000 ALTER TABLE `Friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Images_Places`
--

DROP TABLE IF EXISTS `Images_Places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Images_Places` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `image_name` varchar(50) NOT NULL,
  `image_place_id` int(11) NOT NULL,
  PRIMARY KEY (`image_id`),
  KEY `image_place_id` (`image_place_id`),
  CONSTRAINT `images_places_ibfk_1` FOREIGN KEY (`image_place_id`) REFERENCES `Places` (`place_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Images_Places`
--

LOCK TABLES `Images_Places` WRITE;
/*!40000 ALTER TABLE `Images_Places` DISABLE KEYS */;
/*!40000 ALTER TABLE `Images_Places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Obtains_Promotions`
--

DROP TABLE IF EXISTS `Obtains_Promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Obtains_Promotions` (
  `obtain_promotion_user_id` int(11) NOT NULL,
  `obtain_promotion_promotion_id` int(11) NOT NULL,
  `obtain_promotion_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`obtain_promotion_user_id`,`obtain_promotion_promotion_id`),
  KEY `obtain_promotion_promotion_id` (`obtain_promotion_promotion_id`),
  CONSTRAINT `obtains_promotions_ibfk_1` FOREIGN KEY (`obtain_promotion_user_id`) REFERENCES `Users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `obtains_promotions_ibfk_2` FOREIGN KEY (`obtain_promotion_promotion_id`) REFERENCES `Promotions` (`promotion_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Obtains_Promotions`
--

LOCK TABLES `Obtains_Promotions` WRITE;
/*!40000 ALTER TABLE `Obtains_Promotions` DISABLE KEYS */;
/*!40000 ALTER TABLE `Obtains_Promotions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Places`
--

DROP TABLE IF EXISTS `Places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Places` (
  `place_id` int(11) NOT NULL AUTO_INCREMENT,
  `place_logo` varchar(50) DEFAULT NULL,
  `place_name` varchar(50) NOT NULL,
  `place_latitude` float DEFAULT NULL,
  `place_longitude` float DEFAULT NULL,
  `place_address_line` varchar(50) NOT NULL,
  `place_zip` char(5) NOT NULL,
  `place_city_id` int(11) NOT NULL,
  `place_email` varchar(50) DEFAULT NULL,
  `place_phone` char(10) DEFAULT NULL,
  `place_web_page` varchar(50) DEFAULT NULL,
  `place_franchise_id` int(11) NOT NULL,
  PRIMARY KEY (`place_id`),
  KEY `place_city_id` (`place_city_id`),
  KEY `place_franchise_id` (`place_franchise_id`),
  CONSTRAINT `places_ibfk_1` FOREIGN KEY (`place_city_id`) REFERENCES `Cities` (`city_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `places_ibfk_2` FOREIGN KEY (`place_franchise_id`) REFERENCES `Franchises` (`franchise_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Places`
--

LOCK TABLES `Places` WRITE;
/*!40000 ALTER TABLE `Places` DISABLE KEYS */;
INSERT INTO `Places` VALUES (1,'place01.png','Sport Bar Mamitas Rio',32.458,-118.828,'Zona rio','22253',1,NULL,NULL,NULL,1),(2,'place02.png','Sushi Japones',32.458,-116.828,'Zona rio','22253',1,NULL,NULL,NULL,2),(3,'place03.png','Las Alitas Macro',32.458,-116.828,'Zona rio','22253',1,NULL,NULL,NULL,3),(4,'place04.png','Los Comales Rio',32.458,-116.828,'Zona rio','22253',1,NULL,NULL,NULL,4),(5,'place05.png','Beverly Burguers Rio',32.458,-116.828,'Zona rio','22253',1,NULL,NULL,NULL,5);
/*!40000 ALTER TABLE `Places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Promotions`
--

DROP TABLE IF EXISTS `Promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Promotions` (
  `promotion_id` int(11) NOT NULL AUTO_INCREMENT,
  `promotion_photo` varchar(50) DEFAULT NULL,
  `promotion_title` varchar(50) NOT NULL,
  `promotion_description` text NOT NULL,
  `promotion_begin_hour` varchar(30) NOT NULL,
  `promotion_end_hour` varchar(30) NOT NULL,
  `promotion_begin_date` date NOT NULL,
  `promotion_end_date` date NOT NULL,
  `promotion_posted_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`promotion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Promotions`
--

LOCK TABLES `Promotions` WRITE;
/*!40000 ALTER TABLE `Promotions` DISABLE KEYS */;
INSERT INTO `Promotions` VALUES (1,'promo01.jpg','Miercoles de 2x1','Ven con tu pareja este miercoles y llevate 2 rollas de sushi por el precio de 1 ...!!!','10:00','21:00','2016-03-12','2016-03-28','2016-03-03 05:40:02'),(2,'promo02.jpg','Todo lo que te quepa...','Ven y come todas las alitas que puedas comer durante 3 horas por solo $80.00','16:00','19:00','2016-03-12','2016-03-28','2016-03-03 05:40:02'),(3,'promo03.jpg','¿Muy salsa?','Ven y prueba nuestra nueva salsa casera de Ciruela con Habanero, y en la compra de una botella de 1lt llevate una de medio litro gratis','09:00','21:00','2016-03-12','2016-03-28','2016-03-03 05:40:02'),(4,'promo04.jpg','Vamos Xolos','Ven y disfruta con toda la jauria el partido de los Xolos, y si traes una playera del equipo mas perron te regalamos una cubeta','20:00','22:00','2016-03-12','2016-03-28','2016-03-03 05:40:02'),(5,'promo05.jpg','Descubre...Beverly Burguers','Ven y prueba nuestra nueva hamburguesa La perrona a precio de una Hamburguesa Sencilla','10:00','21:00','2016-03-12','2016-03-28','2016-03-03 05:40:02');
/*!40000 ALTER TABLE `Promotions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Promotions_Places`
--

DROP TABLE IF EXISTS `Promotions_Places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Promotions_Places` (
  `promotion_place_promotion_id` int(11) NOT NULL,
  `promotion_place_place_id` int(11) NOT NULL,
  `promotion_place_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`promotion_place_promotion_id`,`promotion_place_place_id`),
  KEY `promotion_place_place_id` (`promotion_place_place_id`),
  CONSTRAINT `promotions_places_ibfk_1` FOREIGN KEY (`promotion_place_promotion_id`) REFERENCES `Promotions` (`promotion_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `promotions_places_ibfk_2` FOREIGN KEY (`promotion_place_place_id`) REFERENCES `Places` (`place_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Promotions_Places`
--

LOCK TABLES `Promotions_Places` WRITE;
/*!40000 ALTER TABLE `Promotions_Places` DISABLE KEYS */;
INSERT INTO `Promotions_Places` VALUES (1,1,'2016-03-03 05:40:03'),(2,2,'2016-03-03 05:40:03'),(3,3,'2016-03-03 05:40:03'),(4,4,'2016-03-03 05:40:03'),(5,5,'2016-03-03 05:40:03');
/*!40000 ALTER TABLE `Promotions_Places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Roles`
--

DROP TABLE IF EXISTS `Roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Roles`
--

LOCK TABLES `Roles` WRITE;
/*!40000 ALTER TABLE `Roles` DISABLE KEYS */;
INSERT INTO `Roles` VALUES (1,'root'),(2,'Franchise Owner'),(3,'Place_Owner'),(4,'User');
/*!40000 ALTER TABLE `Roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Security_Questions`
--

DROP TABLE IF EXISTS `Security_Questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Security_Questions` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_text` varchar(50) NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Security_Questions`
--

LOCK TABLES `Security_Questions` WRITE;
/*!40000 ALTER TABLE `Security_Questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `Security_Questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `States`
--

DROP TABLE IF EXISTS `States`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `States` (
  `state_id` char(2) NOT NULL,
  `state_name` varchar(50) NOT NULL,
  `state_country_id` char(2) NOT NULL,
  PRIMARY KEY (`state_id`),
  KEY `state_country_id` (`state_country_id`),
  CONSTRAINT `states_ibfk_1` FOREIGN KEY (`state_country_id`) REFERENCES `Countries` (`country_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `States`
--

LOCK TABLES `States` WRITE;
/*!40000 ALTER TABLE `States` DISABLE KEYS */;
INSERT INTO `States` VALUES ('AS','Aguascalientes','MX'),('BC','Baja California','MX'),('BS','Baja California Sur','MX'),('CC','Campeche','MX'),('CH','Chihuahua','MX'),('CL','Coahuila','MX'),('CS','Chiapas','MX');
/*!40000 ALTER TABLE `States` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Types_Places`
--

DROP TABLE IF EXISTS `Types_Places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Types_Places` (
  `type_place_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_place_title` varchar(50) NOT NULL,
  PRIMARY KEY (`type_place_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Types_Places`
--

LOCK TABLES `Types_Places` WRITE;
/*!40000 ALTER TABLE `Types_Places` DISABLE KEYS */;
INSERT INTO `Types_Places` VALUES (1,'SportBar'),(2,'Comida Mexicana'),(3,'Comida Japonesa'),(4,'Hamburguesas');
/*!40000 ALTER TABLE `Types_Places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_Likes`
--

DROP TABLE IF EXISTS `User_Likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Likes` (
  `user_like_user_id` int(11) NOT NULL,
  `user_like_place_id` int(11) NOT NULL,
  `user_like_status` tinyint(1) NOT NULL,
  `user_like_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `user_like_user_id` (`user_like_user_id`),
  KEY `user_like_place_id` (`user_like_place_id`),
  CONSTRAINT `user_likes_ibfk_1` FOREIGN KEY (`user_like_user_id`) REFERENCES `Users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_likes_ibfk_2` FOREIGN KEY (`user_like_place_id`) REFERENCES `Places` (`place_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Likes`
--

LOCK TABLES `User_Likes` WRITE;
/*!40000 ALTER TABLE `User_Likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `User_Likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_Roles`
--

DROP TABLE IF EXISTS `User_Roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Roles` (
  `user_role_role_id` int(11) NOT NULL,
  `user_role_user_id` int(11) NOT NULL,
  PRIMARY KEY (`user_role_role_id`,`user_role_user_id`),
  KEY `user_role_user_id` (`user_role_user_id`),
  CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`user_role_role_id`) REFERENCES `Roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`user_role_user_id`) REFERENCES `Users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Roles`
--

LOCK TABLES `User_Roles` WRITE;
/*!40000 ALTER TABLE `User_Roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `User_Roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_photo` varchar(50) DEFAULT NULL,
  `user_first_name` varchar(50) NOT NULL,
  `user_last_name` varchar(50) NOT NULL,
  `user_date_of_birth` date NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `user_cellphone` char(10) DEFAULT NULL,
  `user_gender` char(1) DEFAULT NULL,
  `user_status` tinyint(1) NOT NULL DEFAULT '1',
  `user_city_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_city_id` (`user_city_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`user_city_id`) REFERENCES `Cities` (`city_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (2,'user01.jpg','Hogilber','Quintana','1993-06-29','hogi@gmail.com','hogi','6651219387','M',0,1);
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-28 16:31:06
