CREATE DATABASE  IF NOT EXISTS `helppy` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `helppy`;
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
INSERT INTO `availability_day` VALUES (1,'MONDAY'),(2,'TUESDAY'),(3,'WEDNESDAY'),(4,'THURSDAY'),(5,'FRIDAY'),(6,'SATURDAY'),(7,'SUNDAY');
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
  `machine_name` varchar(45) NOT NULL,
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
INSERT INTO `categories` VALUES (1,'animation','Animation','Process of creating motion and shape change illusion by means of the rapid display of a sequence of static images that minimally differ from each other. ','green'),(2,'architecture','Architecture','The process and the product of planning, designing, and constructing buildings and other physical structures.','purple'),(3,'graphic_design','Graphic Design','Visual communication, and problem-solving through the use of type, space and image. ','orange'),(4,'film_tv','Film & TV','Interrogating and learning how to evolve a personal filmmaking language and approach to visual storytelling in its broadest sense.','green'),(5,'fashion','Fashion','Style or practice, especially in clothing, footwear, accessories, makeup, body piercing, or furniture.','purple'),(6,'crafts','Crafts','Artistic practices within the family decorative arts that traditionally are defined by their relationship to functional or utilitarian products or by their use of such natural media as wood, clay, cer','blue'),(7,'culinary_art','Culinary Art','The art of the preparation, cooking and presentation of food, usually in the form of meals.','red'),(8,'photography','Photography','Science, art and practice of creating durable images by recording light or other electromagnetic radiation.','orange'),(9,'drawing_illustration','Drawing & Illustration','Visualization or a depiction made by an artist, such as a drawing, sketch, painting, photograph, or other kind of image of things seen, remembered or imagined, using a graphical representation. ','orange'),(10,'interior_product_design','Interior & Product Design','Art or process of designing the interior decoration of a room or building & process of creating a new product to be sold by a business to its customers.','purple'),(11,'music_sound_design','Music & Sound Design','Process of specifying, acquiring, manipulating or generating audio elements.','green'),(12,'software_developer_engineering','Software Developer & Engineering','Making software for the world to use & fields of engineering, each with a more specific emphasis on particular areas of applied science, technology and types of application.','darkpp'),(13,'art','Art','Activities include the production of works of art, the criticism of art, the study of the history of art, and the aesthetic dissemination of art.','blue'),(14,'ux_design','UX Design','Process of enhancing user satisfaction by improving the usability, ease of use, and pleasure provided in the interaction between the user and the product.','orange'),(15,'web_design','Web Design','Skills and disciplines in the production and maintenance of websites. ','darkpp'),(16,'writting','Writting','Medium of communication that represents language through the inscription of signs and symbols.','red');
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
  `body` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`feedbackID`),
  KEY `requestID_feedback_idx` (`requestID`),
  CONSTRAINT `requestID_feedback` FOREIGN KEY (`requestID`) REFERENCES `requests` (`requestID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
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
  `disabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`levelID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level`
--

LOCK TABLES `level` WRITE;
/*!40000 ALTER TABLE `level` DISABLE KEYS */;
INSERT INTO `level` VALUES (1,'Beginner','Little knowledge of the topic','1',NULL),(2,'Basic','Very basic knowledge of the topic but no prof','2',NULL),(3,'Intermediate','Basic knowledge of the topic but no regular p','3',NULL),(4,'Advanced','Good knowledge of the topic and a regular pro','4',NULL),(5,'Expert','Perfect knowledge of the topic and a daily pr','5',NULL);
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
  `name` varchar(45) DEFAULT NULL,
  `postcode` varchar(45) DEFAULT NULL,
  `spatial` varchar(45) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`locationID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,NULL,'EH1 2HP','55.951011, -3.176581',NULL),(2,NULL,'EH8 8FH','55.950972, -3.176351',NULL);
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
  `subject` varchar(45) DEFAULT NULL,
  `body` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`messageID`),
  KEY `requestID_message_idx` (`requestID`),
  CONSTRAINT `requestID_message` FOREIGN KEY (`requestID`) REFERENCES `requests` (`requestID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_status`
--

LOCK TABLES `request_status` WRITE;
/*!40000 ALTER TABLE `request_status` DISABLE KEYS */;
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
  CONSTRAINT `from_user_requests.userID` FOREIGN KEY (`from`) REFERENCES `user_requests` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `statusID_requests` FOREIGN KEY (`statusID`) REFERENCES `request_status` (`statusID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `to_users.userID` FOREIGN KEY (`to`) REFERENCES `users` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
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
  `machine_name` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`skillID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES (1,'photoshop','Photoshop',NULL,NULL),(2,'indesign','Indesign',NULL,NULL),(3,'illustrator','Illustrator',NULL,NULL),(4,'pattern_cutting','Pattern Cutting',NULL,NULL),(5,'after_effects','After Effects',NULL,NULL),(6,'final_cut_pro','Final Cut Pro',NULL,NULL),(7,'premiere','Premiere',NULL,NULL),(8,'motion','Motion',NULL,NULL),(9,'autocad','Autocad',NULL,NULL),(10,'cinema_4d','Cinema 4D',NULL,NULL),(11,'3d_max','3d Max',NULL,NULL),(12,'sketchup','Sketchup',NULL,NULL),(13,'dreamweaver','Dreamweaver',NULL,NULL),(14,'stop_motion','Stop motion',NULL,NULL),(15,'model_making','Model making',NULL,NULL),(16,'storyboarding','Storyboarding',NULL,NULL),(17,'photo_shoot','Photo-shoot',NULL,NULL),(18,'sewing','Sewing',NULL,NULL),(19,'embroidery','Embroidery',NULL,NULL),(20,'layout','Layout',NULL,NULL),(21,'visual_dentity','Visual Identity',NULL,NULL),(22,'playing_instrument ','Playing an Instrument',NULL,NULL),(23,'electronic_music_creation','Electronic music creation',NULL,NULL),(24,'sound_mixing','Sound Mixing',NULL,NULL),(25,'wood_work','Wood work',NULL,NULL),(26,'pottery','Pottery',NULL,NULL),(27,'poetry','Poetry',NULL,NULL),(28,'metal_work','Metal work',NULL,NULL),(29,'life_drawing','Life drawing',NULL,NULL),(30,'cartoon','Cartoon',NULL,NULL),(31,'php','PHP',NULL,NULL),(32,'css','CSS',NULL,NULL),(33,'java','Java',NULL,NULL),(34,'arduino','Arduino',NULL,NULL),(35,'html','HTML',NULL,NULL),(36,'c','C++',NULL,NULL),(37,'painting','Painting',NULL,NULL),(38,'sculpture','Sculpture',NULL,NULL),(39,'proof_reading','Proof reading',NULL,NULL),(40,'molecular_cooking','Molecular Cooking',NULL,NULL);
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
INSERT INTO `user_availability` VALUES (16,1,6,NULL),(16,3,3,NULL),(16,3,6,NULL),(16,4,7,NULL),(17,5,6,NULL),(17,5,5,NULL),(17,4,5,NULL),(17,3,2,NULL),(18,6,6,NULL),(18,3,7,NULL),(18,6,3,NULL);
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
INSERT INTO `user_locations` VALUES (16,2,NULL),(17,1,NULL),(18,1,NULL);
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
INSERT INTO `user_skills` VALUES (16,1,3,NULL),(16,2,3,NULL),(16,3,3,NULL),(17,1,3,NULL),(17,2,3,NULL),(17,3,2,NULL),(17,6,3,NULL),(17,8,1,NULL),(17,9,3,NULL),(17,10,1,NULL),(17,12,3,NULL),(18,6,2,NULL);
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
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `surname` varchar(45) DEFAULT NULL,
  `forename` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `pictureID` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (12,'test03','1a1dc91c907325c69271ddf0c944bc72',NULL,NULL,NULL,NULL,'test03@test.com',NULL),(13,'test4','1a1dc91c907325c69271ddf0c944bc72',NULL,NULL,NULL,NULL,'test04@test.com',NULL),(15,'blabla','1a1dc91c907325c69271ddf0c944bc72',NULL,NULL,NULL,NULL,'blaashkh@haha.com',NULL),(16,'marielabar','1a1dc91c907325c69271ddf0c944bc72','Barzallo','Mariela','Graphic Designer and Design Informatics stude',NULL,'marielabarzallo@gmail.com',NULL),(17,'anais.mb','1a1dc91c907325c69271ddf0c944bc72','Moisy','Anais','Designer, design informatics student',NULL,'anais.moisy@gmail.com',NULL),(18,'mowglibook','1a1dc91c907325c69271ddf0c944bc72','Mouchet','Clement','sdfdsfsfsdfsdfdsfsd',NULL,'clement.mouchet@gmail.com',NULL),(19,'test01','1a1dc91c907325c69271ddf0c944bc72',NULL,NULL,NULL,NULL,'test@test.com',NULL),(20,'test02','1a1dc91c907325c69271ddf0c944bc72',NULL,NULL,NULL,NULL,'test2@test.com',NULL),(21,'test04','1a1dc91c907325c69271ddf0c944bc72','lafrite','joe','sdfdsfdsfdsffs',NULL,'test4@test.com',NULL),(22,'test06','1a1dc91c907325c69271ddf0c944bc72',NULL,NULL,NULL,NULL,'test06@test.com',NULL),(23,'test07','1a1dc91c907325c69271ddf0c944bc72',NULL,NULL,NULL,NULL,'test07@test.com',NULL),(24,'test08','1a1dc91c907325c69271ddf0c944bc72',NULL,NULL,NULL,NULL,'test08@test.com',NULL),(25,'test09','1a1dc91c907325c69271ddf0c944bc72',NULL,NULL,NULL,NULL,'test9@test',NULL),(26,'test10','1a1dc91c907325c69271ddf0c944bc72',NULL,NULL,NULL,NULL,'test10@test.com',NULL),(27,'test11','1a1dc91c907325c69271ddf0c944bc72',NULL,NULL,NULL,NULL,'test11@gmail.com',NULL),(28,'test12','1a1dc91c907325c69271ddf0c944bc72',NULL,NULL,NULL,NULL,'test12@test.com',NULL),(29,'test13','1a1dc91c907325c69271ddf0c944bc72',NULL,NULL,NULL,NULL,'test@test.com13',NULL),(30,'test14','1a1dc91c907325c69271ddf0c944bc72',NULL,NULL,NULL,NULL,'test14@test.com',NULL),(31,'test19','1a1dc91c907325c69271ddf0c944bc72',NULL,NULL,NULL,NULL,'test19@test.com',NULL),(32,'test20','1a1dc91c907325c69271ddf0c944bc72',NULL,NULL,NULL,NULL,'test20@test.com',NULL),(33,'test21','1a1dc91c907325c69271ddf0c944bc72',NULL,NULL,NULL,NULL,'test21@test.com',NULL),(34,'test22','1a1dc91c907325c69271ddf0c944bc72',NULL,NULL,NULL,NULL,'test22@test.com',NULL),(35,'test23','1a1dc91c907325c69271ddf0c944bc72',NULL,NULL,NULL,NULL,'test23@test.com',NULL),(36,'test24','1a1dc91c907325c69271ddf0c944bc72',NULL,NULL,NULL,NULL,'test24@tes.com',NULL),(37,'test25','1a1dc91c907325c69271ddf0c944bc72',NULL,NULL,NULL,NULL,'test25@test.com',NULL),(38,'test26','1a1dc91c907325c69271ddf0c944bc72',NULL,NULL,NULL,NULL,'test26@test.com',NULL),(39,'test27','1a1dc91c907325c69271ddf0c944bc72',NULL,NULL,NULL,NULL,'test27@test.com',NULL);
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

-- Dump completed on 2015-02-23 10:40:51
