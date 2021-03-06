-- MySQL dump 10.13  Distrib 5.6.19, for osx10.7 (i386)
--
-- Host: localhost    Database: helppy
-- ------------------------------------------------------
-- Server version	5.5.38

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
-- Table structure for table `availability_day`
--

DROP TABLE IF EXISTS `availability_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `availability_day` (
  `dayID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`dayID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `availability_day`
--

LOCK TABLES `availability_day` WRITE;
/*!40000 ALTER TABLE `availability_day` DISABLE KEYS */;
INSERT INTO `availability_day` VALUES (1,'Monday'),(2,'Tuesday'),(3,'Wednesday'),(4,'Thursday'),(5,'Friday'),(6,'Saturday'),(7,'Sunday');
/*!40000 ALTER TABLE `availability_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `availability_hour`
--

DROP TABLE IF EXISTS `availability_hour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `availability_hour` (
  `hourID` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`hourID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `availability_hour`
--

LOCK TABLES `availability_hour` WRITE;
/*!40000 ALTER TABLE `availability_hour` DISABLE KEYS */;
INSERT INTO `availability_hour` VALUES (1,'12am-6am','night'),(2,'6am-9am','early morning'),(3,'9am-12pm','morning'),(4,'12pm-3pm','early afternoon'),(5,'3pm-6pm','afternoon'),(6,'6pm-9pm','evening'),(7,'9pm-12am','late evening');
/*!40000 ALTER TABLE `availability_hour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `categoryID` int(11) NOT NULL AUTO_INCREMENT,
  `machine_name` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `color` varchar(45) NOT NULL DEFAULT 'default',
  PRIMARY KEY (`categoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'animation','Animation','Process of creating motion and shape change illusion by means of the rapid display of a sequence of static images that minimally differ from each other. ','green'),(2,'architecture','Architecture','The process and the product of planning, designing, and constructing buildings and other physical structures.','purple'),(3,'graphic_design','Graphic Design','Visual communication, and problem-solving through the use of type, space and image. ','orange'),(4,'film_tv','Film & TV','Interrogating and learning how to evolve a personal filmmaking language and approach to visual storytelling in its broadest sense.','green'),(5,'fashion','Fashion','Style or practice, especially in clothing, footwear, accessories, makeup, body piercing, or furniture.','purple'),(6,'crafts','Crafts','Artistic practices within the family decorative arts that traditionally are defined by their relationship to functional or utilitarian products or by their use of such natural media as wood, clay, cer','blue'),(7,'culinary_art','Culinary Art','The art of the preparation, cooking and presentation of food, usually in the form of meals.','red'),(8,'photography','Photography','Science, art and practice of creating durable images by recording light or other electromagnetic radiation.','orange'),(9,'drawing_illustration','Drawing & Illustration','Visualization or a depiction made by an artist, such as a drawing, sketch, painting, photograph, or other kind of image of things seen, remembered or imagined, using a graphical representation. ','orange'),(10,'interior_product_design','Interior & Product Design','Art or process of designing the interior decoration of a room or building & process of creating a new product to be sold by a business to its customers.','purple'),(11,'music_sound_design','Music & Sound Design','Process of specifying, acquiring, manipulating or generating audio elements.','green'),(12,'software_engineering','Software & Engineering','Making software for the world to use & fields of engineering, each with a more specific emphasis on particular areas of applied science, technology and types of application.','darkpp'),(13,'art','Art','Activities include the production of works of art, the criticism of art, the study of the history of art, and the aesthetic dissemination of art.','blue'),(14,'ux_design','UX Design','Process of enhancing user satisfaction by improving the usability, ease of use, and pleasure provided in the interaction between the user and the product.','orange'),(15,'web_design','Web Design','Skills and disciplines in the production and maintenance of websites. ','darkpp'),(16,'writting','Writting','Medium of communication that represents language through the inscription of signs and symbols.','red');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `feedbackID` int(11) NOT NULL AUTO_INCREMENT,
  `requestID` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `body` mediumtext,
  PRIMARY KEY (`feedbackID`),
  KEY `requestID_feedback_idx` (`requestID`),
  CONSTRAINT `requestID_feedback` FOREIGN KEY (`requestID`) REFERENCES `requests` (`requestID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (40,12,2,4,'Morbi ac felis. Phasellus dolor. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc, quis gravida magna mi a libero. Vestibulum suscipit nulla quis orci. In hac habitasse platea dictumst.\r\n\r\nNam at tortor in tellus interdum sagittis. Vivamus elementum semper nisi. Fusce a quam. Fusce fermentum odio nec arcu. Vestibulum fringilla pede sit amet augue.\r\n\r\nPraesent porttitor, nulla vitae posuere iaculis, arcu nisl dignissim dolor, a pretium mi sem ut ipsum. Quisque rutrum. Suspendisse faucibus, nunc et pellentesque egestas, lacus ante convallis tellus, vitae iaculis lacus elit id tortor. Donec orci lectus, aliquam ut, faucibus non, euismod id, nulla. Nunc egestas, augue at pellentesque laoreet, felis eros vehicula leo, at malesuada velit leo quis pede.\r\n\r\nIn ut quam vitae odio lacinia tincidunt. Aenean viverra rhoncus pede. Vestibulum purus quam, scelerisque ut, mollis sed, nonummy id, metus. Etiam sit amet orci eget eros faucibus tincidunt. Nam at tortor in tellus interdum sagittis.\r\n\r\nUt id nisl quis enim dignissim sagittis. Pellentesque posuere. Curabitur turpis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In ac dui quis mi consectetuer lacinia. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Fusce id purus.'),(45,8,8,3,'Nam commodo suscipit quam. Pellentesque auctor neque nec urna. Ut leo. Vestibulum volutpat pretium libero. Nullam vel sem.'),(46,6,6,4,'Maecenas egestas arcu quis ligula mattis placerat. Phasellus leo dolor, tempus non, auctor et, hendrerit quis, nisi. Etiam sit amet orci eget eros faucibus tincidunt. Curabitur nisi. Quisque rutrum.'),(47,14,3,3,'it was good'),(48,17,5,3,'Good');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `level`
--

DROP TABLE IF EXISTS `level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `level` (
  `levelID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `level` varchar(45) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`levelID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level`
--

LOCK TABLES `level` WRITE;
/*!40000 ALTER TABLE `level` DISABLE KEYS */;
INSERT INTO `level` VALUES (1,'Beginner','Little knowledge of the topic','1','green',NULL),(2,'Basic','Very basic knowledge of the topic but no prof','2','blue',NULL),(3,'Intermediate','Basic knowledge of the topic but no regular p','3','purple',NULL),(4,'Advanced','Good knowledge of the topic and a regular pro','4','orange',NULL),(5,'Expert','Perfect knowledge of the topic and a daily pr','5','red',NULL);
/*!40000 ALTER TABLE `level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `locationID` int(11) NOT NULL AUTO_INCREMENT,
  `postcode` varchar(45) DEFAULT NULL,
  `spatial` mediumtext,
  `point` point DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`locationID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (26,'EH1 2HP','{\"type\": \"Feature\",\"geometry\": {\"type\": \"Point\",\"coordinates\": [-3.1971218999999564, 55.9468781]}}','\0\0\0\0\0\0\0\0�����	�9f4M3�K@',NULL),(27,'EH3 9DF','{\"type\": \"Feature\",\"geometry\": {\"type\": \"Point\",\"coordinates\": [-3.199603799999977, 55.9458386]}}','\0\0\0\0\0\0\0\0B��ɘ	��%?=�K@',NULL);
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `messageID` int(11) NOT NULL AUTO_INCREMENT,
  `requestID` int(11) DEFAULT NULL,
  `from` int(11) DEFAULT NULL,
  `to` int(11) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `body` mediumtext,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`messageID`),
  KEY `requestID_message_idx` (`requestID`),
  CONSTRAINT `requestID_message` FOREIGN KEY (`requestID`) REFERENCES `requests` (`requestID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (11,14,17,46,'[helppy] anais.mb needs your help','Mauris sollicitudin fermentum libero. Praesent adipiscing. Fusce ac felis sit amet ligula pharetra condimentum. Praesent porttitor, nulla vitae posuere iaculis, arcu nisl dignissim dolor, a pretium mi sem ut ipsum. Sed libero.\r\n\r\nPraesent turpis. Phasellus leo dolor, tempus non, auctor et, hendrerit quis, nisi. Cras id dui. Morbi mollis tellus ac sapien. Duis vel nibh at velit scelerisque suscipit.\r\n\r\nSed a libero. Suspendisse enim turpis, dictum sed, iaculis a, condimentum nec, nisi. Fusce neque. Curabitur blandit mollis lacus. Donec orci lectus, aliquam ut, faucibus non, euismod id, nulla.\r\n\r\nSed lectus. Morbi mattis ullamcorper velit. Quisque libero metus, condimentum nec, tempor a, commodo mollis, magna. Vestibulum fringilla pede sit amet augue. Phasellus volutpat, metus eget egestas mollis, lacus lacus blandit dui, id egestas quam mauris ut lacus.\r\n\r\nQuisque malesuada placerat nisl. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce ac felis sit amet ligula pharetra condimentum. Aenean viverra rhoncus pede. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.','2015-03-21 17:46:20',0),(12,15,18,17,'[helppy] mowglibook needs your help','hhhhhhhh','2015-03-22 13:23:10',0),(13,12,17,43,'Discussion','test reply','2015-03-22 15:48:53',0),(14,12,17,43,'Discussion','test reply 2','2015-03-22 15:52:52',0),(15,12,17,43,'Discussion','Phasellus leo dolor, tempus non, auctor et, hendrerit quis, nisi. Phasellus a est. Fusce commodo aliquam arcu. Nullam nulla eros, ultricies sit amet, nonummy id, imperdiet feugiat, pede. Ut a nisl id ante tempus hendrerit.\r\n\r\nSed magna purus, fermentum eu, tincidunt eu, varius ut, felis. Quisque id mi. Maecenas egestas arcu quis ligula mattis placerat. Maecenas egestas arcu quis ligula mattis placerat. In ut quam vitae odio lacinia tincidunt.\r\n\r\nPhasellus viverra nulla ut metus varius laoreet. Quisque id mi. Fusce commodo aliquam arcu. Aenean ut eros et nisl sagittis vestibulum. Cras dapibus.\r\n\r\nNulla facilisi. Maecenas egestas arcu quis ligula mattis placerat. Vestibulum turpis sem, aliquet eget, lobortis pellentesque, rutrum eu, nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed libero.\r\n\r\nDonec vitae orci sed dolor rutrum auctor. Vestibulum volutpat pretium libero. Curabitur blandit mollis lacus. Praesent nec nisl a purus blandit viverra. Vestibulum rutrum, mi nec elementum vehicula, eros quam gravida nisl, id fringilla neque ante vel mi.','2015-03-22 16:25:18',0),(16,15,18,17,'Discussion','hello help me please','2015-03-22 17:04:42',0),(17,13,18,17,'Discussion','ok might be possible','2015-03-22 17:05:01',0),(18,13,18,17,'Discussion','when ?','2015-03-22 17:05:13',0),(19,15,18,17,'Discussion','when could you','2015-03-22 17:05:26',0),(20,16,18,16,'[helppy] mowglibook needs your help','could you help me please ?','2015-03-22 17:06:14',0),(31,8,17,44,'Discussion','coucou','2015-03-24 22:35:15',0),(37,8,17,44,'Discussion','helo','2015-03-24 22:51:16',0),(38,8,17,44,'Discussion','coucou','2015-03-24 22:52:28',0),(39,8,17,44,'Discussion','helo 1','2015-03-24 22:52:52',0),(40,12,17,43,'Discussion','Thanks a lot for your help','2015-03-25 10:56:09',0),(41,8,17,44,'Discussion','helo 1','2015-03-25 16:41:44',0),(42,8,17,44,'Discussion','helo 13','2015-03-25 16:42:13',0),(43,11,17,46,'Discussion','hello','2015-03-25 16:42:57',0),(44,13,17,18,'Discussion','hello','2015-03-25 16:44:21',0),(45,13,17,18,'Discussion','hello','2015-03-25 19:33:12',0),(46,10,17,44,'Discussion','coucou','2015-03-25 19:34:14',0),(47,10,17,44,'Discussion','coucou 1','2015-03-25 19:35:02',0),(48,17,46,17,'[helppy] Nias needs your help','help','2015-03-25 20:34:30',0),(49,18,17,46,'[helppy] anais.mb needs your help','In hac habitasse platea dictumst. Donec vitae orci sed dolor rutrum auctor. Pellentesque commodo eros a enim. Fusce vel dui. Morbi mollis tellus ac sapien.','2015-03-25 21:42:28',0),(50,9,17,16,'Discussion','Donec mollis hendrerit risus','2015-03-25 21:43:08',0);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pictures`
--

DROP TABLE IF EXISTS `pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pictures` (
  `pictureID` int(11) NOT NULL AUTO_INCREMENT,
  `picturefile` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`pictureID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pictures`
--

LOCK TABLES `pictures` WRITE;
/*!40000 ALTER TABLE `pictures` DISABLE KEYS */;
/*!40000 ALTER TABLE `pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_locations`
--

DROP TABLE IF EXISTS `request_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_locations` (
  `requestID` int(11) NOT NULL,
  `locationID` int(11) NOT NULL,
  KEY `requestID_request_locations_idx` (`requestID`),
  KEY `locationID_request_locations_idx` (`locationID`),
  CONSTRAINT `locationID_request_locations` FOREIGN KEY (`locationID`) REFERENCES `locations` (`locationID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `requestID_request_locations` FOREIGN KEY (`requestID`) REFERENCES `requests` (`requestID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_locations`
--

LOCK TABLES `request_locations` WRITE;
/*!40000 ALTER TABLE `request_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `request_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_skills`
--

DROP TABLE IF EXISTS `request_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_skills` (
  `requestID` int(11) NOT NULL,
  `skillID` int(11) NOT NULL,
  KEY `requestID_request_skills_idx` (`requestID`),
  KEY `skillID_request_skills_idx` (`skillID`),
  CONSTRAINT `requestID_request_skills` FOREIGN KEY (`requestID`) REFERENCES `requests` (`requestID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `skillID_request_skills` FOREIGN KEY (`skillID`) REFERENCES `skills` (`skillID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_skills`
--

LOCK TABLES `request_skills` WRITE;
/*!40000 ALTER TABLE `request_skills` DISABLE KEYS */;
INSERT INTO `request_skills` VALUES (6,4),(7,10),(8,10),(9,1),(10,15),(11,15),(12,20),(13,17),(14,23),(15,1),(16,1),(17,9),(18,12);
/*!40000 ALTER TABLE `request_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_status`
--

DROP TABLE IF EXISTS `request_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_status` (
  `statusID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`statusID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_status`
--

LOCK TABLES `request_status` WRITE;
/*!40000 ALTER TABLE `request_status` DISABLE KEYS */;
INSERT INTO `request_status` VALUES (1,'Pending'),(2,'Accepted'),(3,'Refused'),(4,'Closed');
/*!40000 ALTER TABLE `request_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requests` (
  `requestID` int(11) NOT NULL AUTO_INCREMENT,
  `from` int(11) DEFAULT NULL,
  `to` int(11) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `statusID` int(11) DEFAULT NULL,
  PRIMARY KEY (`requestID`),
  KEY `statusID_requests_idx` (`statusID`),
  KEY `from_user_requests.userID_idx` (`from`),
  KEY `to_users.userID_idx` (`to`),
  CONSTRAINT `from_user_requests.userID` FOREIGN KEY (`from`) REFERENCES `users` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `statusID_requests` FOREIGN KEY (`statusID`) REFERENCES `request_status` (`statusID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `to_user_requests.userID` FOREIGN KEY (`to`) REFERENCES `users` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
INSERT INTO `requests` VALUES (4,17,43,'0000-00-00 00:00:00','0000-00-00 00:00:00',1),(5,17,43,'2015-03-11 00:00:00','2015-04-02 00:00:00',3),(6,17,43,'2015-03-26 00:00:00','2015-03-26 00:00:00',4),(7,17,43,'2015-03-26 00:00:00','2015-03-26 00:00:00',1),(8,17,44,'2015-03-18 00:00:00','2015-03-25 00:00:00',4),(9,17,16,'2015-03-19 00:00:00','2015-03-11 00:00:00',1),(10,17,44,'2015-03-25 00:00:00','2015-03-30 00:00:00',1),(11,17,46,'2015-03-30 00:00:00','2015-04-04 00:00:00',3),(12,17,43,'2015-02-25 00:00:00','2015-03-31 00:00:00',4),(13,17,18,'2015-03-22 00:00:00','2015-03-31 00:00:00',1),(14,17,46,'2015-03-21 00:00:00','2015-03-23 00:00:00',4),(15,18,17,'2015-03-25 00:00:00','2015-03-27 00:00:00',2),(16,18,16,'2015-03-23 00:00:00','2015-04-01 00:00:00',2),(17,46,17,'2015-03-27 00:00:00','2015-03-30 00:00:00',4),(18,17,46,'2015-03-26 00:00:00','2015-03-27 00:00:00',1);
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill_categories`
--

DROP TABLE IF EXISTS `skill_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill_categories` (
  `skillID` int(11) NOT NULL,
  `categoryID` int(11) NOT NULL,
  KEY `skillID_skill_categories_idx` (`skillID`),
  KEY `categoryID_skill_categories_idx` (`categoryID`),
  CONSTRAINT `categoryID_skill_categories` FOREIGN KEY (`categoryID`) REFERENCES `categories` (`categoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `skillID_skill_categories` FOREIGN KEY (`skillID`) REFERENCES `skills` (`skillID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill_categories`
--

LOCK TABLES `skill_categories` WRITE;
/*!40000 ALTER TABLE `skill_categories` DISABLE KEYS */;
INSERT INTO `skill_categories` VALUES (1,3),(2,3),(3,3),(4,5),(6,1),(6,4),(7,1),(7,4),(8,1),(8,4),(9,2),(10,1),(10,2),(10,4),(11,1),(11,2),(11,4),(12,2),(13,15),(9,10),(10,10),(11,10),(12,10),(13,15),(14,1),(15,2),(15,1),(15,10),(15,6),(16,1),(16,4),(16,9),(17,8),(17,1),(17,4),(17,5),(18,5),(18,6),(19,5),(19,6),(20,3),(20,14),(21,3),(22,11),(24,11),(23,11),(25,6),(26,6),(26,13),(27,16),(28,6),(30,9),(31,15),(31,15),(32,15),(32,15),(32,15),(33,12),(34,12),(35,15),(35,15),(36,12),(37,13),(38,13),(39,16),(40,7),(1,8),(29,9);
/*!40000 ALTER TABLE `skill_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skills` (
  `skillID` int(11) NOT NULL AUTO_INCREMENT,
  `machine_name` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`skillID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES (1,'photoshop','Photoshop','Use of Adobe Photoshop: raster graphics editor.',NULL),(2,'indesign','Indesign','Use of Adobe InDesign: publishing software application.',NULL),(3,'illustrator','Illustrator','Use of Adobe Illustrator: vector graphics editor.',NULL),(4,'pattern_cutting','Pattern Cutting','Able to make patern template from which the parts of a garment are traced onto fabric before being cut out and assembled.',NULL),(5,'after_effects','After Effects',NULL,NULL),(6,'final_cut_pro','Final Cut Pro',NULL,NULL),(7,'premiere','Premiere',NULL,NULL),(8,'motion','Motion',NULL,NULL),(9,'autocad','Autocad',NULL,NULL),(10,'cinema_4d','Cinema 4D',NULL,NULL),(11,'3d_max','3d Max',NULL,NULL),(12,'sketchup','Sketchup',NULL,NULL),(13,'dreamweaver','Dreamweaver',NULL,NULL),(14,'stop_motion','Stop motion',NULL,NULL),(15,'model_making','Model making',NULL,NULL),(16,'storyboarding','Storyboarding',NULL,NULL),(17,'photo_shoot','Photo-shoot',NULL,NULL),(18,'sewing','Sewing',NULL,NULL),(19,'embroidery','Embroidery',NULL,NULL),(20,'layout','Layout',NULL,NULL),(21,'visual_dentity','Visual Identity',NULL,NULL),(22,'playing_instrument ','Playing Instrument',NULL,NULL),(23,'electronic_music','Electronic music',NULL,NULL),(24,'sound_mixing','Sound Mixing',NULL,NULL),(25,'wood_work','Wood work',NULL,NULL),(26,'pottery','Pottery',NULL,NULL),(27,'poetry','Poetry',NULL,NULL),(28,'metal_work','Metal work',NULL,NULL),(29,'life_drawing','Life drawing',NULL,NULL),(30,'cartoon','Cartoon',NULL,NULL),(31,'php','PHP',NULL,NULL),(32,'css','CSS',NULL,NULL),(33,'java','Java',NULL,NULL),(34,'arduino','Arduino',NULL,NULL),(35,'html','HTML',NULL,NULL),(36,'c','C++',NULL,NULL),(37,'painting','Painting',NULL,NULL),(38,'sculpture','Sculpture',NULL,NULL),(39,'proof_reading','Proof reading',NULL,NULL),(40,'molecular_cooking','Molecular Cooking',NULL,NULL);
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `tagID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`tagID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_availability`
--

DROP TABLE IF EXISTS `user_availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_availability` (
  `userID` int(11) NOT NULL,
  `dayID` int(11) NOT NULL,
  `hourID` int(11) NOT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  KEY `userID_user_availability_idx` (`userID`),
  KEY `dayID_user_availability_idx` (`dayID`),
  KEY `hourID_user_availability_idx` (`hourID`),
  CONSTRAINT `dayID_user_availability` FOREIGN KEY (`dayID`) REFERENCES `availability_day` (`dayID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `hourID_user_availability` FOREIGN KEY (`hourID`) REFERENCES `availability_hour` (`hourID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `userID_user_availability` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_availability`
--

LOCK TABLES `user_availability` WRITE;
/*!40000 ALTER TABLE `user_availability` DISABLE KEYS */;
INSERT INTO `user_availability` VALUES (16,1,6,NULL),(16,3,3,NULL),(16,3,6,NULL),(16,4,7,NULL),(17,5,6,NULL),(17,5,5,NULL),(17,4,5,NULL),(17,3,2,NULL),(18,6,6,NULL),(18,3,7,NULL),(18,6,3,NULL),(17,3,4,NULL),(17,5,7,NULL),(17,1,3,NULL);
/*!40000 ALTER TABLE `user_availability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_locations`
--

DROP TABLE IF EXISTS `user_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_locations` (
  `userID` int(11) NOT NULL,
  `locationID` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  KEY `userID_user_locations_idx` (`userID`),
  KEY `locationID_user_locations_idx` (`locationID`),
  CONSTRAINT `locationID_user_locations` FOREIGN KEY (`locationID`) REFERENCES `locations` (`locationID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `userID_user_locations` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_locations`
--

LOCK TABLES `user_locations` WRITE;
/*!40000 ALTER TABLE `user_locations` DISABLE KEYS */;
INSERT INTO `user_locations` VALUES (17,26,'Home',NULL),(17,27,'Work',NULL);
/*!40000 ALTER TABLE `user_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_requests`
--

DROP TABLE IF EXISTS `user_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_requests` (
  `userID` int(11) NOT NULL,
  `requestID` int(11) NOT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  KEY `userID_user_requests_idx` (`userID`),
  KEY `requestID_user_requests_idx` (`requestID`),
  CONSTRAINT `requestID_user_requests` FOREIGN KEY (`requestID`) REFERENCES `requests` (`requestID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `userID_user_requests` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_requests`
--

LOCK TABLES `user_requests` WRITE;
/*!40000 ALTER TABLE `user_requests` DISABLE KEYS */;
INSERT INTO `user_requests` VALUES (17,4,NULL),(17,5,NULL),(17,6,NULL),(17,7,NULL),(17,8,NULL),(17,9,NULL),(17,10,NULL),(17,11,NULL),(17,12,NULL),(17,13,NULL),(17,14,NULL),(18,15,NULL),(18,16,NULL),(46,17,NULL),(17,18,NULL);
/*!40000 ALTER TABLE `user_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_skills`
--

DROP TABLE IF EXISTS `user_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_skills` (
  `userID` int(11) NOT NULL,
  `skillID` int(11) NOT NULL,
  `levelID` int(11) NOT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  KEY `userid_user_skills_idx` (`userID`),
  KEY `skillID_user_skills_idx` (`skillID`),
  KEY `levelID_user_skills_idx` (`levelID`),
  CONSTRAINT `levelID_user_skills` FOREIGN KEY (`levelID`) REFERENCES `level` (`levelID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `skillID_user_skills` FOREIGN KEY (`skillID`) REFERENCES `skills` (`skillID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `userID_user_skills` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_skills`
--

LOCK TABLES `user_skills` WRITE;
/*!40000 ALTER TABLE `user_skills` DISABLE KEYS */;
INSERT INTO `user_skills` VALUES (16,1,3,NULL),(16,2,3,NULL),(16,3,3,NULL),(17,6,1,NULL),(17,10,1,NULL),(17,15,3,NULL),(17,14,2,NULL),(17,17,2,NULL),(17,9,2,NULL),(17,12,2,NULL),(17,1,3,NULL),(17,2,3,NULL),(17,3,2,NULL),(17,20,4,NULL),(17,32,1,NULL),(17,35,1,NULL),(18,6,1,NULL),(18,17,2,NULL),(18,14,3,NULL),(18,20,3,NULL),(18,35,5,NULL),(18,32,5,NULL),(18,31,4,NULL),(16,13,1,NULL),(16,20,4,NULL),(43,16,2,NULL),(43,15,3,NULL),(43,20,4,NULL),(43,10,1,NULL),(43,4,4,NULL),(43,11,3,NULL),(44,4,3,NULL),(45,11,2,NULL),(45,1,3,NULL),(44,10,1,NULL),(44,15,3,NULL),(44,6,4,NULL),(44,26,3,NULL),(44,18,2,NULL),(44,25,4,NULL),(44,32,1,NULL),(46,29,2,NULL),(46,15,2,NULL),(46,14,4,NULL),(46,10,4,NULL),(46,26,3,NULL),(46,34,1,NULL),(46,12,1,NULL),(46,23,1,NULL),(48,8,5,NULL),(48,11,4,NULL),(48,39,1,NULL);
/*!40000 ALTER TABLE `user_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tags`
--

DROP TABLE IF EXISTS `user_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_tags` (
  `userID` int(11) NOT NULL,
  `tagID` int(11) NOT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  KEY `userID_user_tags_idx` (`userID`),
  KEY `tagID_user_tags_idx` (`tagID`),
  CONSTRAINT `tagID_user_tags` FOREIGN KEY (`tagID`) REFERENCES `tags` (`tagID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `userID_user_tags` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tags`
--

LOCK TABLES `user_tags` WRITE;
/*!40000 ALTER TABLE `user_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `forename` varchar(255) DEFAULT NULL,
  `description` mediumtext,
  `pictureID` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (16,'marielabar','1a1dc91c907325c69271ddf0c944bc72','Barzallo','Mariela','Graphic Designer and Design Informatics stude',NULL,'marielabarzallo@gmail.com',NULL),(17,'anais.mb','1a1dc91c907325c69271ddf0c944bc72','Moisy','Anais','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatem esse nemo nihil temporibus ipsa. Veritatis ut qui, at, sequi accusamus alias iure consequuntur temporibus, sit explicabo excepturi ducimus quaerat laboriosam voluptas quos veniam hic amet! Facilis saepe pariatur totam veritatis cum consequatur, porro. Totam ullam, atque, officia ex expedita fuga alias odio laborum voluptates, minus facere adipisci! Ullam obcaecati, tenetur illum similique et, magnam placeat possimus accusantium neque perspiciatis laudantium beatae velit est voluptatem dolorum nesciunt ea! Beatae doloribus est dicta ratione nulla optio dignissimos, adipisci dolor qui ad culpa explicabo quisquam alias recusandae quasi quod assumenda at, eum sapiente nam, debitis repellat repudiandae dolorum. Fugiat mollitia laborum labore quos quaerat. Temporibus magni, dignissimos corrupti ut animi at facilis ducimus unde quo ullam blanditiis quia, minima sit molestias assumenda totam quibusdam debitis, ipsa fugit culpa impedit quae atque vitae error. Sit doloremque minima, deserunt quaerat repellendus ab porro? Facilis quos ea autem odit. Minima eligendi, cum voluptas, cupiditate inventore dolor cumque quia quisquam facilis labore harum nostrum architecto eveniet reprehenderit beatae hic tempore iste praesentium distinctio amet aperiam iusto magni suscipit. Magnam dolorem excepturi voluptate dolores incidunt nulla, tenetur dolor soluta, molestias recusandae architecto placeat culpa amet alias laudantium obcaecati eveniet non sunt, rerum deserunt maiores sapiente doloremque modi! Sint vitae mollitia et ratione ipsa quod, dicta temporibus aut maxime, molestias delectus sed nostrum ea expedita veniam. Harum dolorem quae quas sequi soluta inventore totam iure animi dignissimos dolorum incidunt repellendus nulla maiores tempora eligendi, debitis, dolor. Vitae architecto similique omnis laudantium repellat corporis et accusantium officia eum aut aspernatur modi maiores odio ratione, dolorum voluptatem aperiam tempora! Itaque quos voluptas, nisi sed qui autem deserunt, tempora soluta totam delectus saepe pariatur a quibusdam? ',NULL,'anais.moisy@gmail.com',NULL),(18,'mowglibook','1a1dc91c907325c69271ddf0c944bc72','Mouchet','Clement','Lorem ipsum dolor sit amet, adhuc possit imperdiet te pro, enim discere minimum mea et, habemus hendrerit nam no. Case pertinacia adipiscing quo ut, at per quando homero diceret, nam ex dissentiunt intellegebat. Has ludus consequuntur id. Vis at quot antiopam inciderint, id ullum facete concludaturque mel. His no posse mundi. Dicant primis rationibus id qui, vim facer virtute deseruisse id.\r\n\r\nTollit luptatum accusata an quo, eu vim lorem regione. Ei vel scaevola erroribus, eu pro omnium apeirian, eruditi explicari scriptorem ex quo. Vis ei tota fuisset, ne aliquam civibus sit, ne malis nostrud equidem pri. Animal omnesque eos an. Vix quod soleat vituperatoribus ad, an quando offendit eum, copiosae persequeris eam cu.\r\n',NULL,'clement.mouchet@gmail.com',NULL),(43,'Namanis','1a1dc91c907325c69271ddf0c944bc72','Bihannic','Anna','Hello Hello. Lorem ipsum dolor sit amet, adhuc possit imperdiet te pro, enim discere minimum mea et, habemus hendrerit nam no. Case pertinacia adipiscing quo ut, at per quando homero diceret, nam ex dissentiunt intellegebat. Has ludus consequuntur id. Vis at quot antiopam inciderint, id ullum facete concludaturque mel. His no posse mundi. Dicant primis rationibus id qui, vim facer virtute deseruisse id.\r\n\r\nTollit luptatum accusata an quo, eu vim lorem regione. Ei vel scaevola erroribus, eu pro omnium apeirian, eruditi explicari scriptorem ex quo. Vis ei tota fuisset, ne aliquam civibus sit, ne malis nostrud equidem pri. Animal omnesque eos an. Vix quod soleat vituperatoribus ad, an quando offendit eum, copiosae persequeris eam cu.\r\n',NULL,'namanis@gmail.com',NULL),(44,'Cowcow','1a1dc91c907325c69271ddf0c944bc72','Mouchet','Marie','Lorem ipsum dolor sit amet, adhuc possit imperdiet te pro, enim discere minimum mea et, habemus hendrerit nam no. Case pertinacia adipiscing quo ut, at per quando homero diceret, nam ex dissentiunt intellegebat. Has ludus consequuntur id. Vis at quot antiopam inciderint, id ullum facete concludaturque mel. His no posse mundi. Dicant primis rationibus id qui, vim facer virtute deseruisse id. Tollit luptatum accusata an quo, eu vim lorem regione. Ei vel scaevola erroribus, eu pro omnium apeirian, eruditi explicari scriptorem ex quo. Vis ei tota fuisset, ne aliquam civibus sit, ne malis nostrud equidem pri. Animal omnesque eos an. Vix quod soleat vituperatoribus ad, an quando offendit eum, copiosae persequeris eam cu.\r\n',NULL,'anais.moisy@mac.com',NULL),(45,'tania ortega','007b4262dace4b392bb7e6bac2cdff71','Ortega','Tania','',NULL,'caliel.169@gmail.com',NULL),(46,'Nias','1a1dc91c907325c69271ddf0c944bc72','Huaume','Solen','Hello World, I am a happy person :-)',NULL,'s1156107@sms.ed.ac.uk',NULL),(48,'Honguito','1a1dc91c907325c69271ddf0c944bc72','fungi','Honguito','I just like to move around and sometimes i fall over people\'s heads and make them powerful ',NULL,'mbarzallowebdesign@gmail.com',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-25 22:32:53
