-- phpMyAdmin SQL Dump
-- version 4.6.5.1
-- https://www.phpmyadmin.net/
--
-- Host: sql-10.proxgroup.fr:3306
-- Generation Time: Jan 15, 2017 at 05:38 PM
-- Server version: 10.0.28-MariaDB-1~jessie-wsrep
-- PHP Version: 5.6.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `anaismoi_helppy`
--

-- --------------------------------------------------------

--
-- Table structure for table `availability_day`
--

CREATE TABLE `availability_day` (
  `dayID` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `availability_day`
--

INSERT INTO `availability_day` (`dayID`, `name`) VALUES
(1, 'Monday'),
(2, 'Tuesday'),
(3, 'Wednesday'),
(4, 'Thursday'),
(5, 'Friday'),
(6, 'Saturday'),
(7, 'Sunday');

-- --------------------------------------------------------

--
-- Table structure for table `availability_hour`
--

CREATE TABLE `availability_hour` (
  `hourID` int(11) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `availability_hour`
--

INSERT INTO `availability_hour` (`hourID`, `description`, `name`) VALUES
(1, '12am-6am', 'night'),
(2, '6am-9am', 'early morning'),
(3, '9am-12pm', 'morning'),
(4, '12pm-3pm', 'early afternoon'),
(5, '3pm-6pm', 'afternoon'),
(6, '6pm-9pm', 'evening'),
(7, '9pm-12am', 'late evening');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categoryID` int(11) NOT NULL,
  `machine_name` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `color` varchar(45) NOT NULL DEFAULT 'default'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categoryID`, `machine_name`, `name`, `description`, `color`) VALUES
(1, 'animation', 'Animation', 'Process of creating motion and shape change illusion by means of the rapid display of a sequence of static images that minimally differ from each other. ', 'green'),
(2, 'architecture', 'Architecture', 'The process and the product of planning, designing, and constructing buildings and other physical structures.', 'purple'),
(3, 'graphic-design', 'Graphic Design', 'Visual communication, and problem-solving through the use of type, space and image. ', 'orange'),
(4, 'film-tv', 'Film & TV', 'Interrogating and learning how to evolve a personal filmmaking language and approach to visual storytelling in its broadest sense.', 'green'),
(5, 'fashion', 'Fashion', 'Style or practice, especially in clothing, footwear, accessories, makeup, body piercing, or furniture.', 'purple'),
(6, 'crafts', 'Crafts', 'Artistic practices within the family decorative arts that traditionally are defined by their relationship to functional or utilitarian products or by their use of such natural media as wood, clay, cer', 'blue'),
(7, 'culinary-art', 'Culinary Art', 'The art of the preparation, cooking and presentation of food, usually in the form of meals.', 'red'),
(8, 'photography', 'Photography', 'Science, art and practice of creating durable images by recording light or other electromagnetic radiation.', 'orange'),
(9, 'drawing-illustration', 'Drawing & Illustration', 'Visualization or a depiction made by an artist, such as a drawing, sketch, painting, photograph, or other kind of image of things seen, remembered or imagined, using a graphical representation. ', 'orange'),
(10, 'interior-product-design', 'Interior & Product Design', 'Art or process of designing the interior decoration of a room or building & process of creating a new product to be sold by a business to its customers.', 'purple'),
(11, 'music-sound-design', 'Music & Sound Design', 'Process of specifying, acquiring, manipulating or generating audio elements.', 'green'),
(12, 'software-engineering', 'Software & Engineering', 'Making software for the world to use & fields of engineering, each with a more specific emphasis on particular areas of applied science, technology and types of application.', 'darkpp'),
(13, 'art', 'Art', 'Activities include the production of works of art, the criticism of art, the study of the history of art, and the aesthetic dissemination of art.', 'blue'),
(14, 'ux-design', 'UX Design', 'Process of enhancing user satisfaction by improving the usability, ease of use, and pleasure provided in the interaction between the user and the product.', 'orange'),
(15, 'web-design', 'Web Design', 'Skills and disciplines in the production and maintenance of websites. ', 'darkpp'),
(16, 'writting', 'Writting', 'Medium of communication that represents language through the inscription of signs and symbols.', 'red');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedbackID` int(11) NOT NULL,
  `requestID` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `body` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedbackID`, `requestID`, `duration`, `rating`, `body`) VALUES
(40, 12, 2, 4, 'Morbi ac felis. Phasellus dolor. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc, quis gravida magna mi a libero. Vestibulum suscipit nulla quis orci. In hac habitasse platea dictumst.\\r\\n\\r\\nNam at tortor in tellus interdum sagittis. Vivamus elementum semper nisi. Fusce a quam. Fusce fermentum odio nec arcu. Vestibulum fringilla pede sit amet augue.\\r\\n\\r\\nPraesent porttitor, nulla vitae posuere iaculis, arcu nisl dignissim dolor, a pretium mi sem ut ipsum. Quisque rutrum. Suspendisse faucibus, nunc et pellentesque egestas, lacus ante convallis tellus, vitae iaculis lacus elit id tortor. Donec orci lectus, aliquam ut, faucibus non, euismod id, nulla. Nunc egestas, augue at pellentesque laoreet, felis eros vehicula leo, at malesuada velit leo quis pede.\\r\\n\\r\\nIn ut quam vitae odio lacinia tincidunt. Aenean viverra rhoncus pede. Vestibulum purus quam, scelerisque ut, mollis sed, nonummy id, metus. Etiam sit amet orci eget eros faucibus tincidunt. Nam at tortor in tellus interdum sagittis.\\r\\n\\r\\nUt id nisl quis enim dignissim sagittis. Pellentesque posuere. Curabitur turpis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In ac dui quis mi consectetuer lacinia. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Fusce id purus.'),
(45, 8, 8, 3, 'Nam commodo suscipit quam. Pellentesque auctor neque nec urna. Ut leo. Vestibulum volutpat pretium libero. Nullam vel sem.'),
(46, 6, 6, 4, 'Maecenas egestas arcu quis ligula mattis placerat. Phasellus leo dolor, tempus non, auctor et, hendrerit quis, nisi. Etiam sit amet orci eget eros faucibus tincidunt. Curabitur nisi. Quisque rutrum.'),
(47, 14, 3, 3, 'it was good'),
(48, 17, 5, 3, 'Good');

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `levelID` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `level` varchar(45) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`levelID`, `name`, `description`, `level`, `color`, `disabled`) VALUES
(1, 'Beginner', 'Little knowledge of the topic', '1', 'green', NULL),
(2, 'Basic', 'Very basic knowledge of the topic but no prof', '2', 'blue', NULL),
(3, 'Intermediate', 'Basic knowledge of the topic but no regular p', '3', 'purple', NULL),
(4, 'Advanced', 'Good knowledge of the topic and a regular pro', '4', 'orange', NULL),
(5, 'Expert', 'Perfect knowledge of the topic and a daily pr', '5', 'red', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `locationID` int(11) NOT NULL,
  `postcode` varchar(45) DEFAULT NULL,
  `spatial` mediumtext,
  `point` point DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`locationID`, `postcode`, `spatial`, `point`, `disabled`) VALUES
(26, 'EH1 2HP', '{\"type\": \"Feature\",\"geometry\": {\"type\": \"Point\",\"coordinates\": [-3.1971218999999564, 55.9468781]}}', '\\0\\0\\0\\0\\0\\0\\0\\0šŽ¥´“	À9f4M3ùK@', NULL),
(27, 'EH3 9DF', '{\"type\": \"Feature\",\"geometry\": {\"type\": \"Point\",\"coordinates\": [-3.199603799999977, 55.9458386]}}', '\\0\\0\\0\\0\\0\\0\\0\\0B‰àÉ˜	À°%?=ùK@', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `messageID` int(11) NOT NULL,
  `requestID` int(11) DEFAULT NULL,
  `from` int(11) DEFAULT NULL,
  `to` int(11) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `body` mediumtext,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`messageID`, `requestID`, `from`, `to`, `subject`, `body`, `date`, `status`) VALUES
(11, 14, 17, 46, '[helppy] anais.mb needs your help', 'Mauris sollicitudin fermentum libero. Praesent adipiscing. Fusce ac felis sit amet ligula pharetra condimentum. Praesent porttitor, nulla vitae posuere iaculis, arcu nisl dignissim dolor, a pretium mi sem ut ipsum. Sed libero.\\r\\n\\r\\nPraesent turpis. Phasellus leo dolor, tempus non, auctor et, hendrerit quis, nisi. Cras id dui. Morbi mollis tellus ac sapien. Duis vel nibh at velit scelerisque suscipit.\\r\\n\\r\\nSed a libero. Suspendisse enim turpis, dictum sed, iaculis a, condimentum nec, nisi. Fusce neque. Curabitur blandit mollis lacus. Donec orci lectus, aliquam ut, faucibus non, euismod id, nulla.\\r\\n\\r\\nSed lectus. Morbi mattis ullamcorper velit. Quisque libero metus, condimentum nec, tempor a, commodo mollis, magna. Vestibulum fringilla pede sit amet augue. Phasellus volutpat, metus eget egestas mollis, lacus lacus blandit dui, id egestas quam mauris ut lacus.\\r\\n\\r\\nQuisque malesuada placerat nisl. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce ac felis sit amet ligula pharetra condimentum. Aenean viverra rhoncus pede. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.', '2015-03-21 17:46:20', 0),
(12, 15, 18, 17, '[helppy] mowglibook needs your help', 'hhhhhhhh', '2015-03-22 13:23:10', 0),
(13, 12, 17, 43, 'Discussion', 'test reply', '2015-03-22 15:48:53', 0),
(14, 12, 17, 43, 'Discussion', 'test reply 2', '2015-03-22 15:52:52', 0),
(15, 12, 17, 43, 'Discussion', 'Phasellus leo dolor, tempus non, auctor et, hendrerit quis, nisi. Phasellus a est. Fusce commodo aliquam arcu. Nullam nulla eros, ultricies sit amet, nonummy id, imperdiet feugiat, pede. Ut a nisl id ante tempus hendrerit.\\r\\n\\r\\nSed magna purus, fermentum eu, tincidunt eu, varius ut, felis. Quisque id mi. Maecenas egestas arcu quis ligula mattis placerat. Maecenas egestas arcu quis ligula mattis placerat. In ut quam vitae odio lacinia tincidunt.\\r\\n\\r\\nPhasellus viverra nulla ut metus varius laoreet. Quisque id mi. Fusce commodo aliquam arcu. Aenean ut eros et nisl sagittis vestibulum. Cras dapibus.\\r\\n\\r\\nNulla facilisi. Maecenas egestas arcu quis ligula mattis placerat. Vestibulum turpis sem, aliquet eget, lobortis pellentesque, rutrum eu, nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed libero.\\r\\n\\r\\nDonec vitae orci sed dolor rutrum auctor. Vestibulum volutpat pretium libero. Curabitur blandit mollis lacus. Praesent nec nisl a purus blandit viverra. Vestibulum rutrum, mi nec elementum vehicula, eros quam gravida nisl, id fringilla neque ante vel mi.', '2015-03-22 16:25:18', 0),
(16, 15, 18, 17, 'Discussion', 'hello help me please', '2015-03-22 17:04:42', 0),
(17, 13, 18, 17, 'Discussion', 'ok might be possible', '2015-03-22 17:05:01', 0),
(18, 13, 18, 17, 'Discussion', 'when ?', '2015-03-22 17:05:13', 0),
(19, 15, 18, 17, 'Discussion', 'when could you', '2015-03-22 17:05:26', 0),
(20, 16, 18, 16, '[helppy] mowglibook needs your help', 'could you help me please ?', '2015-03-22 17:06:14', 0),
(31, 8, 17, 44, 'Discussion', 'coucou', '2015-03-24 22:35:15', 0),
(37, 8, 17, 44, 'Discussion', 'helo', '2015-03-24 22:51:16', 0),
(38, 8, 17, 44, 'Discussion', 'coucou', '2015-03-24 22:52:28', 0),
(39, 8, 17, 44, 'Discussion', 'helo 1', '2015-03-24 22:52:52', 0),
(40, 12, 17, 43, 'Discussion', 'Thanks a lot for your help', '2015-03-25 10:56:09', 0),
(41, 8, 17, 44, 'Discussion', 'helo 1', '2015-03-25 16:41:44', 0),
(42, 8, 17, 44, 'Discussion', 'helo 13', '2015-03-25 16:42:13', 0),
(43, 11, 17, 46, 'Discussion', 'hello', '2015-03-25 16:42:57', 0),
(44, 13, 17, 18, 'Discussion', 'hello', '2015-03-25 16:44:21', 0),
(45, 13, 17, 18, 'Discussion', 'hello', '2015-03-25 19:33:12', 0),
(46, 10, 17, 44, 'Discussion', 'coucou', '2015-03-25 19:34:14', 0),
(47, 10, 17, 44, 'Discussion', 'coucou 1', '2015-03-25 19:35:02', 0),
(48, 17, 46, 17, '[helppy] Nias needs your help', 'help', '2015-03-25 20:34:30', 0),
(49, 18, 17, 46, '[helppy] anais.mb needs your help', 'In hac habitasse platea dictumst. Donec vitae orci sed dolor rutrum auctor. Pellentesque commodo eros a enim. Fusce vel dui. Morbi mollis tellus ac sapien.', '2015-03-25 21:42:28', 0),
(50, 9, 17, 16, 'Discussion', 'Donec mollis hendrerit risus', '2015-03-25 21:43:08', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pictures`
--

CREATE TABLE `pictures` (
  `pictureID` int(11) NOT NULL,
  `picturefile` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `requestID` int(11) NOT NULL,
  `from` int(11) DEFAULT NULL,
  `to` int(11) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `statusID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`requestID`, `from`, `to`, `start_date`, `end_date`, `statusID`) VALUES
(4, 17, 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1),
(5, 17, 43, '2015-03-11 00:00:00', '2015-04-02 00:00:00', 3),
(6, 17, 43, '2015-03-26 00:00:00', '2015-03-26 00:00:00', 4),
(7, 17, 43, '2015-03-26 00:00:00', '2015-03-26 00:00:00', 1),
(8, 17, 44, '2015-03-18 00:00:00', '2015-03-25 00:00:00', 4),
(9, 17, 16, '2015-03-19 00:00:00', '2015-03-11 00:00:00', 1),
(10, 17, 44, '2015-03-25 00:00:00', '2015-03-30 00:00:00', 1),
(11, 17, 46, '2015-03-30 00:00:00', '2015-04-04 00:00:00', 3),
(12, 17, 43, '2015-02-25 00:00:00', '2015-03-31 00:00:00', 4),
(13, 17, 18, '2015-03-22 00:00:00', '2015-03-31 00:00:00', 1),
(14, 17, 46, '2015-03-21 00:00:00', '2015-03-23 00:00:00', 4),
(15, 18, 17, '2015-03-25 00:00:00', '2015-03-27 00:00:00', 2),
(16, 18, 16, '2015-03-23 00:00:00', '2015-04-01 00:00:00', 2),
(17, 46, 17, '2015-03-27 00:00:00', '2015-03-30 00:00:00', 4),
(18, 17, 46, '2015-03-26 00:00:00', '2015-03-27 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `request_locations`
--

CREATE TABLE `request_locations` (
  `requestID` int(11) NOT NULL,
  `locationID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `request_skills`
--

CREATE TABLE `request_skills` (
  `requestID` int(11) NOT NULL,
  `skillID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `request_skills`
--

INSERT INTO `request_skills` (`requestID`, `skillID`) VALUES
(6, 4),
(7, 10),
(8, 10),
(9, 1),
(10, 15),
(11, 15),
(12, 20),
(13, 17),
(14, 23),
(15, 1),
(16, 1),
(17, 9),
(18, 12);

-- --------------------------------------------------------

--
-- Table structure for table `request_status`
--

CREATE TABLE `request_status` (
  `statusID` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `request_status`
--

INSERT INTO `request_status` (`statusID`, `name`) VALUES
(1, 'Pending'),
(2, 'Accepted'),
(3, 'Refused'),
(4, 'Closed');

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `skillID` int(11) NOT NULL,
  `machine_name` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`skillID`, `machine_name`, `name`, `description`, `disabled`) VALUES
(1, 'photoshop', 'Photoshop', 'Use of Adobe Photoshop: raster graphics editor.', NULL),
(2, 'indesign', 'Indesign', 'Use of Adobe InDesign: publishing software application.', NULL),
(3, 'illustrator', 'Illustrator', 'Use of Adobe Illustrator: vector graphics editor.', NULL),
(4, 'pattern-cutting', 'Pattern Cutting', 'Able to make patern template from which the parts of a garment are traced onto fabric before being cut out and assembled.', NULL),
(5, 'after-effects', 'After Effects', NULL, NULL),
(6, 'final-cut-pro', 'Final Cut Pro', NULL, NULL),
(7, 'premiere', 'Premiere', NULL, NULL),
(8, 'motion', 'Motion', NULL, NULL),
(9, 'autocad', 'Autocad', NULL, NULL),
(10, 'cinema-4d', 'Cinema 4D', NULL, NULL),
(11, '3d-max', '3d Max', NULL, NULL),
(12, 'sketchup', 'Sketchup', NULL, NULL),
(13, 'dreamweaver', 'Dreamweaver', NULL, NULL),
(14, 'stop-motion', 'Stop motion', NULL, NULL),
(15, 'model-making', 'Model making', NULL, NULL),
(16, 'storyboarding', 'Storyboarding', NULL, NULL),
(17, 'photo-shoot', 'Photo-shoot', NULL, NULL),
(18, 'sewing', 'Sewing', NULL, NULL),
(19, 'embroidery', 'Embroidery', NULL, NULL),
(20, 'layout', 'Layout', NULL, NULL),
(21, 'visual-dentity', 'Visual Identity', NULL, NULL),
(22, 'playing-instrument ', 'Playing Instrument', NULL, NULL),
(23, 'electronic-music', 'Electronic music', NULL, NULL),
(24, 'sound-mixing', 'Sound Mixing', NULL, NULL),
(25, 'wood-work', 'Wood work', NULL, NULL),
(26, 'pottery', 'Pottery', NULL, NULL),
(27, 'poetry', 'Poetry', NULL, NULL),
(28, 'metal-work', 'Metal work', NULL, NULL),
(29, 'life-drawing', 'Life drawing', NULL, NULL),
(30, 'cartoon', 'Cartoon', NULL, NULL),
(31, 'php', 'PHP', NULL, NULL),
(32, 'css', 'CSS', NULL, NULL),
(33, 'java', 'Java', NULL, NULL),
(34, 'arduino', 'Arduino', NULL, NULL),
(35, 'html', 'HTML', NULL, NULL),
(36, 'c', 'C++', NULL, NULL),
(37, 'painting', 'Painting', NULL, NULL),
(38, 'sculpture', 'Sculpture', NULL, NULL),
(39, 'proof-reading', 'Proof reading', NULL, NULL),
(40, 'molecular-cooking', 'Molecular Cooking', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `skill_categories`
--

CREATE TABLE `skill_categories` (
  `skillID` int(11) NOT NULL,
  `categoryID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `skill_categories`
--

INSERT INTO `skill_categories` (`skillID`, `categoryID`) VALUES
(1, 3),
(2, 3),
(3, 3),
(4, 5),
(6, 1),
(6, 4),
(7, 1),
(7, 4),
(8, 1),
(8, 4),
(9, 2),
(10, 1),
(10, 2),
(10, 4),
(11, 1),
(11, 2),
(11, 4),
(12, 2),
(13, 15),
(9, 10),
(10, 10),
(11, 10),
(12, 10),
(13, 15),
(14, 1),
(15, 2),
(15, 1),
(15, 10),
(15, 6),
(16, 1),
(16, 4),
(16, 9),
(17, 8),
(17, 1),
(17, 4),
(17, 5),
(18, 5),
(18, 6),
(19, 5),
(19, 6),
(20, 3),
(20, 14),
(21, 3),
(22, 11),
(24, 11),
(23, 11),
(25, 6),
(26, 6),
(26, 13),
(27, 16),
(28, 6),
(30, 9),
(31, 15),
(31, 15),
(32, 15),
(32, 15),
(32, 15),
(33, 12),
(34, 12),
(35, 15),
(35, 15),
(36, 12),
(37, 13),
(38, 13),
(39, 16),
(40, 7),
(1, 8),
(29, 9);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `tagID` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `forename` varchar(255) DEFAULT NULL,
  `description` mediumtext,
  `pictureID` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `disabled` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `username`, `password`, `surname`, `forename`, `description`, `pictureID`, `email`, `disabled`) VALUES
(16, 'marielabar', '1a1dc91c907325c69271ddf0c944bc72', 'Barzallo', 'Mariela', 'Graphic Designer and Design Informatics stude', NULL, 'marielabarzallo@gmail.com', NULL),
(17, 'anais.mb', 'e68db1356377a0f0328248255bd9a930', 'Moisy', 'Anais', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatem esse nemo nihil temporibus ipsa. Veritatis ut qui, at, sequi accusamus alias iure consequuntur temporibus, sit explicabo excepturi ducimus quaerat laboriosam voluptas quos veniam hic amet! Facilis saepe pariatur totam veritatis cum consequatur, porro. Totam ullam, atque, officia ex expedita fuga alias odio laborum voluptates, minus facere adipisci! Ullam obcaecati, tenetur illum similique et, magnam placeat possimus accusantium neque perspiciatis laudantium beatae velit est voluptatem dolorum nesciunt ea! Beatae doloribus est dicta ratione nulla optio dignissimos, adipisci dolor qui ad culpa explicabo quisquam alias recusandae quasi quod assumenda at, eum sapiente nam, debitis repellat repudiandae dolorum. Fugiat mollitia laborum labore quos quaerat. Temporibus magni, dignissimos corrupti ut animi at facilis ducimus unde quo ullam blanditiis quia, minima sit molestias assumenda totam quibusdam debitis, ipsa fugit culpa impedit quae atque vitae error. Sit doloremque minima, deserunt quaerat repellendus ab porro? Facilis quos ea autem odit. Minima eligendi, cum voluptas, cupiditate inventore dolor cumque quia quisquam facilis labore harum nostrum architecto eveniet reprehenderit beatae hic tempore iste praesentium distinctio amet aperiam iusto magni suscipit. Magnam dolorem excepturi voluptate dolores incidunt nulla, tenetur dolor soluta, molestias recusandae architecto placeat culpa amet alias laudantium obcaecati eveniet non sunt, rerum deserunt maiores sapiente doloremque modi! Sint vitae mollitia et ratione ipsa quod, dicta temporibus aut maxime, molestias delectus sed nostrum ea expedita veniam. Harum dolorem quae quas sequi soluta inventore totam iure animi dignissimos dolorum incidunt repellendus nulla maiores tempora eligendi, debitis, dolor. Vitae architecto similique omnis laudantium repellat corporis et accusantium officia eum aut aspernatur modi maiores odio ratione, dolorum voluptatem aperiam tempora! Itaque quos voluptas, nisi sed qui autem deserunt, tempora soluta totam delectus saepe pariatur a quibusdam? ', NULL, 'anais.moisy@gmail.com', NULL),
(18, 'mowglibook', '1a1dc91c907325c69271ddf0c944bc72', 'Mouchet', 'Clement', 'Lorem ipsum dolor sit amet, adhuc possit imperdiet te pro, enim discere minimum mea et, habemus hendrerit nam no. Case pertinacia adipiscing quo ut, at per quando homero diceret, nam ex dissentiunt intellegebat. Has ludus consequuntur id. Vis at quot antiopam inciderint, id ullum facete concludaturque mel. His no posse mundi. Dicant primis rationibus id qui, vim facer virtute deseruisse id.\\r\\n\\r\\nTollit luptatum accusata an quo, eu vim lorem regione. Ei vel scaevola erroribus, eu pro omnium apeirian, eruditi explicari scriptorem ex quo. Vis ei tota fuisset, ne aliquam civibus sit, ne malis nostrud equidem pri. Animal omnesque eos an. Vix quod soleat vituperatoribus ad, an quando offendit eum, copiosae persequeris eam cu.\\r\\n', NULL, 'clement.mouchet@gmail.com', NULL),
(43, 'Namanis', '1a1dc91c907325c69271ddf0c944bc72', 'Bihannic', 'Anna', 'Hello Hello. Lorem ipsum dolor sit amet, adhuc possit imperdiet te pro, enim discere minimum mea et, habemus hendrerit nam no. Case pertinacia adipiscing quo ut, at per quando homero diceret, nam ex dissentiunt intellegebat. Has ludus consequuntur id. Vis at quot antiopam inciderint, id ullum facete concludaturque mel. His no posse mundi. Dicant primis rationibus id qui, vim facer virtute deseruisse id.\\r\\n\\r\\nTollit luptatum accusata an quo, eu vim lorem regione. Ei vel scaevola erroribus, eu pro omnium apeirian, eruditi explicari scriptorem ex quo. Vis ei tota fuisset, ne aliquam civibus sit, ne malis nostrud equidem pri. Animal omnesque eos an. Vix quod soleat vituperatoribus ad, an quando offendit eum, copiosae persequeris eam cu.\\r\\n', NULL, 'namanis@gmail.com', NULL),
(44, 'Cowcow', '1a1dc91c907325c69271ddf0c944bc72', 'Mouchet', 'Marie', 'Lorem ipsum dolor sit amet, adhuc possit imperdiet te pro, enim discere minimum mea et, habemus hendrerit nam no. Case pertinacia adipiscing quo ut, at per quando homero diceret, nam ex dissentiunt intellegebat. Has ludus consequuntur id. Vis at quot antiopam inciderint, id ullum facete concludaturque mel. His no posse mundi. Dicant primis rationibus id qui, vim facer virtute deseruisse id. Tollit luptatum accusata an quo, eu vim lorem regione. Ei vel scaevola erroribus, eu pro omnium apeirian, eruditi explicari scriptorem ex quo. Vis ei tota fuisset, ne aliquam civibus sit, ne malis nostrud equidem pri. Animal omnesque eos an. Vix quod soleat vituperatoribus ad, an quando offendit eum, copiosae persequeris eam cu.\\r\\n', NULL, 'anais.moisy@mac.com', NULL),
(45, 'tania ortega', '007b4262dace4b392bb7e6bac2cdff71', 'Ortega', 'Tania', '', NULL, 'caliel.169@gmail.com', NULL),
(46, 'Nias', '1a1dc91c907325c69271ddf0c944bc72', 'Huaume', 'Solen', 'Hello World, I am a happy person :-)', NULL, 's1156107@sms.ed.ac.uk', NULL),
(48, 'Honguito', '1a1dc91c907325c69271ddf0c944bc72', 'fungi', 'Honguito', 'I just like to move around and sometimes i fall over people\'s heads and make them powerful ', NULL, 'mbarzallowebdesign@gmail.com', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_availability`
--

CREATE TABLE `user_availability` (
  `userID` int(11) NOT NULL,
  `dayID` int(11) NOT NULL,
  `hourID` int(11) NOT NULL,
  `disabled` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_availability`
--

INSERT INTO `user_availability` (`userID`, `dayID`, `hourID`, `disabled`) VALUES
(16, 1, 6, NULL),
(16, 3, 3, NULL),
(16, 3, 6, NULL),
(16, 4, 7, NULL),
(17, 5, 6, NULL),
(17, 5, 5, NULL),
(17, 4, 5, NULL),
(17, 3, 2, NULL),
(18, 6, 6, NULL),
(18, 3, 7, NULL),
(18, 6, 3, NULL),
(17, 3, 4, NULL),
(17, 5, 7, NULL),
(17, 1, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_locations`
--

CREATE TABLE `user_locations` (
  `userID` int(11) NOT NULL,
  `locationID` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_locations`
--

INSERT INTO `user_locations` (`userID`, `locationID`, `name`, `disabled`) VALUES
(17, 26, 'Home', NULL),
(17, 27, 'Work', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_requests`
--

CREATE TABLE `user_requests` (
  `userID` int(11) NOT NULL,
  `requestID` int(11) NOT NULL,
  `disabled` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_requests`
--

INSERT INTO `user_requests` (`userID`, `requestID`, `disabled`) VALUES
(17, 4, NULL),
(17, 5, NULL),
(17, 6, NULL),
(17, 7, NULL),
(17, 8, NULL),
(17, 9, NULL),
(17, 10, NULL),
(17, 11, NULL),
(17, 12, NULL),
(17, 13, NULL),
(17, 14, NULL),
(18, 15, NULL),
(18, 16, NULL),
(46, 17, NULL),
(17, 18, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_skills`
--

CREATE TABLE `user_skills` (
  `userID` int(11) NOT NULL,
  `skillID` int(11) NOT NULL,
  `levelID` int(11) NOT NULL,
  `disabled` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_skills`
--

INSERT INTO `user_skills` (`userID`, `skillID`, `levelID`, `disabled`) VALUES
(16, 1, 3, NULL),
(16, 2, 3, NULL),
(16, 3, 3, NULL),
(17, 6, 1, NULL),
(17, 10, 1, NULL),
(17, 15, 3, NULL),
(17, 14, 2, NULL),
(17, 17, 2, NULL),
(17, 9, 2, NULL),
(17, 12, 2, NULL),
(17, 1, 3, NULL),
(17, 2, 3, NULL),
(17, 3, 2, NULL),
(17, 20, 4, NULL),
(17, 32, 1, NULL),
(17, 35, 1, NULL),
(18, 6, 1, NULL),
(18, 17, 2, NULL),
(18, 14, 3, NULL),
(18, 20, 3, NULL),
(18, 35, 5, NULL),
(18, 32, 5, NULL),
(18, 31, 4, NULL),
(16, 13, 1, NULL),
(16, 20, 4, NULL),
(43, 16, 2, NULL),
(43, 15, 3, NULL),
(43, 20, 4, NULL),
(43, 10, 1, NULL),
(43, 4, 4, NULL),
(43, 11, 3, NULL),
(44, 4, 3, NULL),
(45, 11, 2, NULL),
(45, 1, 3, NULL),
(44, 10, 1, NULL),
(44, 15, 3, NULL),
(44, 6, 4, NULL),
(44, 26, 3, NULL),
(44, 18, 2, NULL),
(44, 25, 4, NULL),
(44, 32, 1, NULL),
(46, 29, 2, NULL),
(46, 15, 2, NULL),
(46, 14, 4, NULL),
(46, 10, 4, NULL),
(46, 26, 3, NULL),
(46, 34, 1, NULL),
(46, 12, 1, NULL),
(46, 23, 1, NULL),
(48, 8, 5, NULL),
(48, 11, 4, NULL),
(48, 39, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_tags`
--

CREATE TABLE `user_tags` (
  `userID` int(11) NOT NULL,
  `tagID` int(11) NOT NULL,
  `disabled` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `availability_day`
--
ALTER TABLE `availability_day`
  ADD PRIMARY KEY (`dayID`);

--
-- Indexes for table `availability_hour`
--
ALTER TABLE `availability_hour`
  ADD PRIMARY KEY (`hourID`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categoryID`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedbackID`),
  ADD KEY `requestID_feedback_idx` (`requestID`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`levelID`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`locationID`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`messageID`),
  ADD KEY `requestID_message_idx` (`requestID`);

--
-- Indexes for table `pictures`
--
ALTER TABLE `pictures`
  ADD PRIMARY KEY (`pictureID`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`requestID`),
  ADD KEY `statusID_requests_idx` (`statusID`),
  ADD KEY `from_user_requests.userID_idx` (`from`),
  ADD KEY `to_users.userID_idx` (`to`);

--
-- Indexes for table `request_locations`
--
ALTER TABLE `request_locations`
  ADD KEY `requestID_request_locations_idx` (`requestID`),
  ADD KEY `locationID_request_locations_idx` (`locationID`);

--
-- Indexes for table `request_skills`
--
ALTER TABLE `request_skills`
  ADD KEY `requestID_request_skills_idx` (`requestID`),
  ADD KEY `skillID_request_skills_idx` (`skillID`);

--
-- Indexes for table `request_status`
--
ALTER TABLE `request_status`
  ADD PRIMARY KEY (`statusID`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`skillID`);

--
-- Indexes for table `skill_categories`
--
ALTER TABLE `skill_categories`
  ADD KEY `skillID_skill_categories_idx` (`skillID`),
  ADD KEY `categoryID_skill_categories_idx` (`categoryID`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`tagID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`);

--
-- Indexes for table `user_availability`
--
ALTER TABLE `user_availability`
  ADD KEY `userID_user_availability_idx` (`userID`),
  ADD KEY `dayID_user_availability_idx` (`dayID`),
  ADD KEY `hourID_user_availability_idx` (`hourID`);

--
-- Indexes for table `user_locations`
--
ALTER TABLE `user_locations`
  ADD KEY `userID_user_locations_idx` (`userID`),
  ADD KEY `locationID_user_locations_idx` (`locationID`);

--
-- Indexes for table `user_requests`
--
ALTER TABLE `user_requests`
  ADD KEY `userID_user_requests_idx` (`userID`),
  ADD KEY `requestID_user_requests_idx` (`requestID`);

--
-- Indexes for table `user_skills`
--
ALTER TABLE `user_skills`
  ADD KEY `userid_user_skills_idx` (`userID`),
  ADD KEY `skillID_user_skills_idx` (`skillID`),
  ADD KEY `levelID_user_skills_idx` (`levelID`);

--
-- Indexes for table `user_tags`
--
ALTER TABLE `user_tags`
  ADD KEY `userID_user_tags_idx` (`userID`),
  ADD KEY `tagID_user_tags_idx` (`tagID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `availability_day`
--
ALTER TABLE `availability_day`
  MODIFY `dayID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `availability_hour`
--
ALTER TABLE `availability_hour`
  MODIFY `hourID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedbackID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `levelID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `locationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `messageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `pictures`
--
ALTER TABLE `pictures`
  MODIFY `pictureID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `requestID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `request_status`
--
ALTER TABLE `request_status`
  MODIFY `statusID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `skillID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `tagID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `requestID_feedback` FOREIGN KEY (`requestID`) REFERENCES `requests` (`requestID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `requestID_message` FOREIGN KEY (`requestID`) REFERENCES `requests` (`requestID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `requests`
--
ALTER TABLE `requests`
  ADD CONSTRAINT `from_user_requests.userID` FOREIGN KEY (`from`) REFERENCES `users` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `statusID_requests` FOREIGN KEY (`statusID`) REFERENCES `request_status` (`statusID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `to_user_requests.userID` FOREIGN KEY (`to`) REFERENCES `users` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `request_locations`
--
ALTER TABLE `request_locations`
  ADD CONSTRAINT `locationID_request_locations` FOREIGN KEY (`locationID`) REFERENCES `locations` (`locationID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `requestID_request_locations` FOREIGN KEY (`requestID`) REFERENCES `requests` (`requestID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `request_skills`
--
ALTER TABLE `request_skills`
  ADD CONSTRAINT `requestID_request_skills` FOREIGN KEY (`requestID`) REFERENCES `requests` (`requestID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `skillID_request_skills` FOREIGN KEY (`skillID`) REFERENCES `skills` (`skillID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `skill_categories`
--
ALTER TABLE `skill_categories`
  ADD CONSTRAINT `categoryID_skill_categories` FOREIGN KEY (`categoryID`) REFERENCES `categories` (`categoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `skillID_skill_categories` FOREIGN KEY (`skillID`) REFERENCES `skills` (`skillID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_availability`
--
ALTER TABLE `user_availability`
  ADD CONSTRAINT `dayID_user_availability` FOREIGN KEY (`dayID`) REFERENCES `availability_day` (`dayID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hourID_user_availability` FOREIGN KEY (`hourID`) REFERENCES `availability_hour` (`hourID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `userID_user_availability` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_locations`
--
ALTER TABLE `user_locations`
  ADD CONSTRAINT `locationID_user_locations` FOREIGN KEY (`locationID`) REFERENCES `locations` (`locationID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `userID_user_locations` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_requests`
--
ALTER TABLE `user_requests`
  ADD CONSTRAINT `requestID_user_requests` FOREIGN KEY (`requestID`) REFERENCES `requests` (`requestID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `userID_user_requests` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_skills`
--
ALTER TABLE `user_skills`
  ADD CONSTRAINT `levelID_user_skills` FOREIGN KEY (`levelID`) REFERENCES `level` (`levelID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `skillID_user_skills` FOREIGN KEY (`skillID`) REFERENCES `skills` (`skillID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `userID_user_skills` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_tags`
--
ALTER TABLE `user_tags`
  ADD CONSTRAINT `tagID_user_tags` FOREIGN KEY (`tagID`) REFERENCES `tags` (`tagID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `userID_user_tags` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
