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
  `machine_name` varchar(45) DEFAULT NULL,
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
INSERT INTO `skills` VALUES (1,'photoshop','Photoshop','Use of Adobe Photoshop: raster graphics editor.',NULL),(2,'indesign','Indesign','Use of Adobe InDesign: publishing software application.',NULL),(3,'illustrator','Illustrator','Use of Adobe Illustrator: vector graphics editor.',NULL),(4,'pattern_cutting','Pattern Cutting','Able to make patern template from which the parts of a garment are traced onto fabric before being cut out and assembled.',NULL),(5,'after_effects','After Effects',NULL,NULL),(6,'final_cut_pro','Final Cut Pro',NULL,NULL),(7,'premiere','Premiere',NULL,NULL),(8,'motion','Motion',NULL,NULL),(9,'autocad','Autocad',NULL,NULL),(10,'cinema_4d','Cinema 4D',NULL,NULL),(11,'3d_max','3d Max',NULL,NULL),(12,'sketchup','Sketchup',NULL,NULL),(13,'dreamweaver','Dreamweaver',NULL,NULL),(14,'stop_motion','Stop motion',NULL,NULL),(15,'model_making','Model making',NULL,NULL),(16,'storyboarding','Storyboarding',NULL,NULL),(17,'photo_shoot','Photo-shoot',NULL,NULL),(18,'sewing','Sewing',NULL,NULL),(19,'embroidery','Embroidery',NULL,NULL),(20,'layout','Layout',NULL,NULL),(21,'visual_dentity','Visual Identity',NULL,NULL),(22,'playing_instrument ','Playing an Instrument',NULL,NULL),(23,'electronic_music_creation','Electronic music creation',NULL,NULL),(24,'sound_mixing','Sound Mixing',NULL,NULL),(25,'wood_work','Wood work',NULL,NULL),(26,'pottery','Pottery',NULL,NULL),(27,'poetry','Poetry',NULL,NULL),(28,'metal_work','Metal work',NULL,NULL),(29,'life_drawing','Life drawing',NULL,NULL),(30,'cartoon','Cartoon',NULL,NULL),(31,'php','PHP',NULL,NULL),(32,'css','CSS',NULL,NULL),(33,'java','Java',NULL,NULL),(34,'arduino','Arduino',NULL,NULL),(35,'html','HTML',NULL,NULL),(36,'c','C++',NULL,NULL),(37,'painting','Painting',NULL,NULL),(38,'sculpture','Sculpture',NULL,NULL),(39,'proof_reading','Proof reading',NULL,NULL),(40,'molecular_cooking','Molecular Cooking',NULL,NULL);
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
INSERT INTO `user_skills` VALUES (16,1,3,NULL),(16,2,3,NULL),(16,3,3,NULL),(17,2,1,NULL),(17,6,1,NULL),(17,11,1,NULL),(18,11,1,NULL),(18,17,4,NULL),(17,20,1,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (16,'marielabar','1a1dc91c907325c69271ddf0c944bc72','Barzallo','Mariela','Graphic Designer and Design Informatics stude',NULL,'marielabarzallo@gmail.com',NULL),(17,'anais.mb','1a1dc91c907325c69271ddf0c944bc72','Moisy','Anais','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatem esse nemo nihil temporibus ipsa. Veritatis ut qui, at, sequi accusamus alias iure consequuntur temporibus, sit explicabo excepturi ducimus quaerat laboriosam voluptas quos veniam hic amet! Facilis saepe pariatur totam veritatis cum consequatur, porro. Totam ullam, atque, officia ex expedita fuga alias odio laborum voluptates, minus facere adipisci! Ullam obcaecati, tenetur illum similique et, magnam placeat possimus accusantium neque perspiciatis laudantium beatae velit est voluptatem dolorum nesciunt ea! Beatae doloribus est dicta ratione nulla optio dignissimos, adipisci dolor qui ad culpa explicabo quisquam alias recusandae quasi quod assumenda at, eum sapiente nam, debitis repellat repudiandae dolorum. Fugiat mollitia laborum labore quos quaerat. Temporibus magni, dignissimos corrupti ut animi at facilis ducimus unde quo ullam blanditiis quia, minima sit molestias assumenda totam quibusdam debitis, ipsa fugit culpa impedit quae atque vitae error. Sit doloremque minima, deserunt quaerat repellendus ab porro? Facilis quos ea autem odit. Minima eligendi, cum voluptas, cupiditate inventore dolor cumque quia quisquam facilis labore harum nostrum architecto eveniet reprehenderit beatae hic tempore iste praesentium distinctio amet aperiam iusto magni suscipit. Magnam dolorem excepturi voluptate dolores incidunt nulla, tenetur dolor soluta, molestias recusandae architecto placeat culpa amet alias laudantium obcaecati eveniet non sunt, rerum deserunt maiores sapiente doloremque modi! Sint vitae mollitia et ratione ipsa quod, dicta temporibus aut maxime, molestias delectus sed nostrum ea expedita veniam. Harum dolorem quae quas sequi soluta inventore totam iure animi dignissimos dolorum incidunt repellendus nulla maiores tempora eligendi, debitis, dolor. Vitae architecto similique omnis laudantium repellat corporis et accusantium officia eum aut aspernatur modi maiores odio ratione, dolorum voluptatem aperiam tempora! Itaque quos voluptas, nisi sed qui autem deserunt, tempora soluta totam delectus saepe pariatur a quibusdam? Quisquam, suscipit, nobis. Vel deserunt, rem nisi iusto maiores dignissimos repellat iure laborum tempore magnam ratione autem cupiditate molestiae quibusdam illo doloribus recusandae, sed fuga consectetur est. Maiores at mollitia aut maxime vero perspiciatis totam harum quis officia repellat libero esse id facilis, cum quos dignissimos, ab consectetur porro ducimus odit iusto. Sed nisi aperiam est quidem, temporibus suscipit veritatis deserunt, ratione facilis quae, nulla magni sequi atque et iure fugit error adipisci nostrum excepturi explicabo, expedita tenetur! Natus animi tempore aliquid quo est sunt esse non omnis commodi sit deleniti ipsum explicabo temporibus debitis maiores labore porro distinctio minus beatae enim atque velit, ducimus, ut. Similique, nihil labore cumque consequatur neque maiores! Soluta cum eligendi debitis quas asperiores vero nihil unde, iure itaque temporibus voluptas delectus illo dolorum earum quam officia totam nobis a assumenda. Provident eos eius possimus saepe corrupti sapiente necessitatibus, tempore, laborum. Optio quibusdam omnis unde distinctio praesentium, voluptatibus inventore nulla exercitationem aspernatur deserunt quidem laborum a repellendus enim nostrum debitis, maiores natus, obcaecati fuga quia iure. Voluptatibus inventore labore laboriosam nostrum quae facere dolores repudiandae dolorem, nihil, corrupti esse expedita. Expedita blanditiis enim numquam explicabo dolorum dolores asperiores nulla officiis maiores, fuga saepe perferendis quibusdam eaque dolor ipsum unde molestias inventore, tenetur hic aliquid? Accusantium, repudiandae similique perferendis, illo magnam unde atque in tempore hic sint dicta commodi modi doloribus quod recusandae at possimus vel quas, dignissimos eveniet, odio nulla quae. Ea saepe soluta atque veritatis dolores itaque amet, quas eaque hic nemo eligendi nobis iure at quod, omnis impedit. Repellendus perspiciatis perferendis officia ab voluptas minus suscipit architecto minima expedita consectetur ratione libero dolore ipsum assumenda, temporibus unde, veritatis aperiam adipisci a, sunt cum provident. Fugiat blanditiis doloribus voluptatem, odio numquam quam minus consequuntur. Mollitia magni, hic, a quidem earum praesentium maxime impedit nisi provident eius distinctio libero doloremque, minima temporibus labore molestias, vitae quo ullam molestiae. Dolor in eaque, perspiciatis, neque consectetur, rerum cum quibusdam maxime modi alias quod cumque quae recusandae mollitia eligendi repudiandae aperiam praesentium magni! Corporis, sequi! Et soluta sapiente provident minus sed, voluptatibus ut tempore, saepe incidunt dicta distinctio nobis blanditiis, voluptatum quam. Itaque reiciendis, expedita facilis porro minus ducimus tempora excepturi temporibus! Harum deleniti labore consequuntur velit nesciunt perspiciatis ut ratione voluptates qui excepturi. Laudantium soluta pariatur at voluptate amet, est voluptates rerum ipsum accusantium hic officia ex tempore praesentium nemo itaque, qui neque veritatis perferendis, odio repellat enim voluptatibus eum dolores nesciunt dolor. Quaerat dolore voluptatem, distinctio temporibus quibusdam minus libero iusto error, nostrum esse mollitia aliquam? Soluta assumenda minus aut nobis ratione quasi exercitationem molestiae, deleniti qui. Iure excepturi quaerat aut omnis ex molestiae, cupiditate nihil magnam? Omnis explicabo sapiente odio, vitae culpa, earum inventore quidem laudantium accusamus voluptates suscipit consectetur fugit saepe sed aut minus dicta pariatur odit vero assumenda? Nobis nostrum nisi distinctio rerum. Recusandae adipisci, necessitatibus dolorum expedita sapiente aliquid, facilis vero sequi laboriosam commodi. Debitis tempore ducimus accusamus nisi cum quasi eos dolore ullam beatae alias dolorum, incidunt veritatis laborum vitae ut iusto, modi error, doloribus aliquam blanditiis velit, a minima qui. Soluta harum odit at quo odio expedita autem cumque ipsum nostrum? Culpa odio reiciendis ex quae excepturi architecto voluptatibus, facilis porro iure aliquam ipsum impedit. Quis voluptate, magnam possimus laborum ratione cum rem rerum voluptatum, exercitationem, esse omnis unde velit tenetur explicabo aperiam beatae facere minima quas magni, at officiis sed iure veniam. Porro temporibus accusamus tempora magni sapiente molestias, et officiis soluta modi ratione consequuntur enim dolore dolorem quas laboriosam ad nobis eveniet fugiat, ea! Earum expedita esse deserunt, nostrum autem optio soluta sunt vero, ad delectus explicabo iure fugit. Ipsa vel, neque laudantium sit atque eligendi ex autem recusandae, et deserunt ullam eveniet dolor tempore tenetur doloribus dolores itaque nostrum maxime natus doloremque quis odit quas. Amet quis, ea nostrum aut, expedita accusamus reiciendis quos saepe laudantium asperiores rem maiores deserunt laborum, atque ipsum quasi? Laudantium inventore, optio et magni quibusdam dolores, fugit ea sit soluta! Totam cupiditate provident nesciunt neque sapiente alias distinctio, est cum aspernatur non reprehenderit molestiae ullam pariatur unde aperiam suscipit rerum praesentium, adipisci rem. Velit modi, atque voluptatum amet voluptas similique consectetur inventore quisquam nesciunt perferendis animi suscipit dolorem dignissimos? Distinctio harum minima dolore doloremque quos laboriosam, exercitationem incidunt. Deserunt velit, quam illo commodi consequuntur quibusdam, accusantium animi laboriosam ad nemo corporis autem sit, similique nihil quae placeat cupiditate. Eligendi pariatur assumenda in quidem error voluptatem ipsa sunt ex, nesciunt autem itaque perspiciatis repudiandae at quo incidunt magni, unde, repellendus, quam officia voluptas. Sit repellendus molestiae temporibus earum, optio fuga? Fugiat neque ducimus aspernatur similique, nihil porro, quo necessitatibus incidunt tenetur libero minima, sed dignissimos harum eius in obcaecati, saepe pariatur et eligendi optio illo temporibus animi esse. Quae placeat facilis quasi accusantium quam, nam veniam voluptas asperiores, illo officiis hic ab ipsa, tempora obcaecati sunt minus nemo. Modi quos nam sequi aut ipsa minima provident voluptate, officia. A maiores, dolore ipsam magni deserunt. Commodi, accusantium dicta quod nesciunt odio labore, fugiat, libero rem quibusdam explicabo adipisci aut expedita maxime optio. In quaerat, aliquam illo quidem, voluptas commodi a. Sunt soluta nobis, expedita hic molestias quam, provident consequatur ab minus corrupti, culpa asperiores ipsam repellendus doloribus error aliquid excepturi explicabo voluptates laborum aperiam. Pariatur aut accusantium facere, dolorum est provident saepe. Laboriosam repellat nemo assumenda, corporis, vero est ducimus dolorem blanditiis, quibusdam debitis at. Non eaque ab, laboriosam necessitatibus, ullam dolore ipsum excepturi, maxime quisquam tempore quasi, blanditiis. Itaque neque, suscipit ea molestias sed distinctio nobis quibusdam nostrum vel dolor eaque quasi quos dolorem nihil odit ullam possimus. Officia molestias, similique! Impedit placeat ipsam temporibus dicta quasi quibusdam nemo accusamus fugiat sapiente officiis commodi cum ex labore maiores est fugit ea quas repudiandae, voluptas, qui veniam. Ipsum minus quam modi fuga quidem laborum deserunt possimus illum neque similique magnam ducimus ratione officiis numquam explicabo voluptate rem, provident ab! Iusto soluta, porro aliquam ducimus, neque laboriosam sit incidunt hic eligendi, voluptate, tempore dignissimos at modi corporis quam maxime? Voluptatibus, voluptas perspiciatis non qui ratione a aspernatur. Libero similique cumque alias, exercitationem ab esse at nam ipsam recusandae, modi saepe provident quas amet eum. Ratione illo repellendus ad ut beatae amet sunt rem quasi corporis blanditiis quam inventore quos hic iste est vitae nesciunt necessitatibus tempora voluptatibus, esse pariatur. Soluta consequatur recusandae deleniti qui fugit, delectus vel repellat laudantium non, quibusdam, numquam sequi mollitia dolorem iusto placeat dolor. Nihil soluta voluptatem, optio est deleniti ipsum a eaque iure. Suscipit, quod perferendis! Sequi veritatis provident vel, nam quia impedit debitis fuga commodi nulla quod explicabo rerum, doloremque dolore alias in dolorem atque eaque sit illo dolorum facilis veniam magnam. Rerum quasi, minima laborum odit voluptatum quas iste officia amet, eum, molestiae nihil optio magni numquam pariatur inventore harum consequatur hic? Mollitia quas ratione molestiae laudantium ducimus alias iste aperiam architecto unde animi doloremque dicta assumenda recusandae cum, temporibus quam! Fugit deserunt quisquam dolore hic culpa repellendus officiis odit adipisci optio. Tempore nisi nihil minus, aliquam ipsa excepturi reiciendis aut facere! Illum id mollitia cum assumenda consequatur blanditiis, fugit perspiciatis commodi. Laborum nostrum quos labore sint harum suscipit possimus quam veniam, eaque soluta officiis iste porro optio consequatur molestias adipisci ea nobis repudiandae quidem pariatur facilis, perspiciatis rem sapiente quas beatae. Iste, amet maxime eligendi in! Illum, delectus sint alias, repudiandae consectetur dignissimos!',NULL,'anais.moisy@gmail.com',NULL),(18,'mowglibook','1a1dc91c907325c69271ddf0c944bc72','Mouchet','Clement','sdfdsfsfsdfsdfdsfsd  1111 444',NULL,'clement.mouchet@gmail.com',NULL);
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

-- Dump completed on 2015-02-24 10:54:18
