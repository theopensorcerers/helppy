# create schema

CREATE SCHEMA `helppy` DEFAULT CHARACTER SET utf8 ;

use `helppy`;


CREATE TABLE `availability_day` (
  `dayID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`dayID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `availability_hour` (
  `hourID` int(11) NOT NULL AUTO_INCREMENT,
  `name` int(11) DEFAULT NULL,
  PRIMARY KEY (`hourID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `categories` (
  `categoryID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`categoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `level` (
  `levelID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `level` varchar(45) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`levelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `locations` (
  `locationID` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `postcode` varchar(45) DEFAULT NULL,
  `spatial` varchar(45) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`locationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `pictures` (
  `pictureID` int(11) NOT NULL AUTO_INCREMENT,
  `picturefile` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`pictureID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `request_locations` (
  `requestID` int(11) NOT NULL,
  `locationID` int(11) NOT NULL,
  KEY `requestID_request_locations_idx` (`requestID`),
  KEY `locationID_request_locations_idx` (`locationID`),
  CONSTRAINT `locationID_request_locations` FOREIGN KEY (`locationID`) REFERENCES `locations` (`locationID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `requestID_request_locations` FOREIGN KEY (`requestID`) REFERENCES `requests` (`requestID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `request_skills` (
  `requestID` int(11) NOT NULL,
  `skillID` int(11) NOT NULL,
  KEY `requestID_request_skills_idx` (`requestID`),
  KEY `skillID_request_skills_idx` (`skillID`),
  CONSTRAINT `requestID_request_skills` FOREIGN KEY (`requestID`) REFERENCES `requests` (`requestID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `skillID_request_skills` FOREIGN KEY (`skillID`) REFERENCES `skills` (`skillID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `request_status` (
  `statusID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`statusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `skill_categories` (
  `skillID` int(11) NOT NULL,
  `categoryID` int(11) NOT NULL,
  KEY `skillID_skill_categories_idx` (`skillID`),
  KEY `categoryID_skill_categories_idx` (`categoryID`),
  CONSTRAINT `categoryID_skill_categories` FOREIGN KEY (`categoryID`) REFERENCES `categories` (`categoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `skillID_skill_categories` FOREIGN KEY (`skillID`) REFERENCES `skills` (`skillID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `skills` (
  `skillID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`skillID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tags` (
  `tagID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`tagID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `user_locations` (
  `userID` int(11) NOT NULL,
  `locationID` int(11) NOT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  KEY `userID_user_locations_idx` (`userID`),
  KEY `locationID_user_locations_idx` (`locationID`),
  CONSTRAINT `locationID_user_locations` FOREIGN KEY (`locationID`) REFERENCES `locations` (`locationID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `userID_user_locations` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `user_requests` (
  `userID` int(11) NOT NULL,
  `requestID` int(11) NOT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  KEY `userID_user_requests_idx` (`userID`),
  KEY `requestID_user_requests_idx` (`requestID`),
  CONSTRAINT `requestID_user_requests` FOREIGN KEY (`requestID`) REFERENCES `requests` (`requestID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `userID_user_requests` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

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

CREATE TABLE `user_tags` (
  `userID` int(11) NOT NULL,
  `tagID` int(11) NOT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  KEY `userID_user_tags_idx` (`userID`),
  KEY `tagID_user_tags_idx` (`tagID`),
  CONSTRAINT `tagID_user_tags` FOREIGN KEY (`tagID`) REFERENCES `tags` (`tagID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `userID_user_tags` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
