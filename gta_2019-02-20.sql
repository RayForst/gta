# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.19)
# Database: gta
# Generation Time: 2019-02-20 14:07:06 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table AboutCompanies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `AboutCompanies`;

CREATE TABLE `AboutCompanies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `AboutCompanies` WRITE;
/*!40000 ALTER TABLE `AboutCompanies` DISABLE KEYS */;

INSERT INTO `AboutCompanies` (`id`, `text`, `createdAt`, `updatedAt`)
VALUES
	(1,'A Toronto based marketing company that specializes in Signs, promotional items and printing to meet the needs of its small, mid size and large corporations. \n\nWe specialize in custom made designs to suit any special marketing needs of our clients.','2018-11-27 14:59:57','2018-11-27 14:59:57');

/*!40000 ALTER TABLE `AboutCompanies` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Abouts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Abouts`;

CREATE TABLE `Abouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gallery` text,
  `gallery2` text,
  `description` text,
  `shortDescription` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Abouts` WRITE;
/*!40000 ALTER TABLE `Abouts` DISABLE KEYS */;

INSERT INTO `Abouts` (`id`, `gallery`, `gallery2`, `description`, `shortDescription`, `createdAt`, `updatedAt`)
VALUES
	(1,NULL,NULL,'<p>Today GTA Image Solutions is a Toronto based marketing company that specializes in the production of signs, promotional items and printing to satisfy the needs of all small, average size and large companies. We specialize in custom made designs to meet any special marketing requirements of our clients. We have 200 square meters filled with our own equipment which is sometimes loaded from dawn to dusk. Even our boss participate in the process. From the very beginning of GTA till now.</p><p>We are <strong>proud</strong> <i>to</i> <a href=\"\">call</a> ourselves a team of professionals because this is how our clients present us when recommending.</p><blockquote><p>Signage, decals, branded caps – whichever sign or display product you need, we can manage it. Can’t find a phone case of your dreams? Ask us to create it. Building a new shopping mall in Toronto? We will produce channel letters for it!</p></blockquote><p>There are more than 500 signs you might have seen in the city that have been designed by our specialists and produced in our manufactory. But the quantity of stickers and decals is just impossible to imagine.</p><ol><li>nnjjafnjasf</li><li>afsakfklamfa</li><li>afkma</li></ol><p>So whether you have just launched your small business or you are a CEO of a big international corporation, you are welcome at GTA Image Solutions! Feel free to contact us any time of the day, just fill in the form on our Contacts page, and we will respond as soon as we read it.</p><ul><li>asnfkjfankjsasfnsjkaa</li><li>ankjsnflaanfl</li><li>makasmfa</li></ul><p>So whether you have just launched your small business or you are a CEO of a big international corporation, you are welcome at GTA Image Solutions! Feel free to contact us any time of the day, just fill in the form on our Contacts page, and we will respond as soon as we read it.</p>','Our team believes that successful businesses are a result of hard work, dedication, vision and above all passion. \n\nWe not only contribute to your success by making your vision a reality but also provide quality that is a class apart.','2018-11-29 01:52:06','2019-02-18 06:13:31');

/*!40000 ALTER TABLE `Abouts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table BlockInfos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `BlockInfos`;

CREATE TABLE `BlockInfos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `buttonText` varchar(255) DEFAULT NULL,
  `page` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page` (`page`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `BlockInfos` WRITE;
/*!40000 ALTER TABLE `BlockInfos` DISABLE KEYS */;

INSERT INTO `BlockInfos` (`id`, `title`, `caption`, `buttonText`, `page`, `createdAt`, `updatedAt`)
VALUES
	(1,'High quality prints, every time.',NULL,'What we do','what-we-do','2018-11-25 14:17:04','2018-11-25 14:17:53'),
	(2,'What do our customers think?','We want you to feel assured that your shirts are being printed by the best of the best.','Show all works','customer-review','2018-11-25 20:41:55','2018-11-25 20:41:55'),
	(3,'We are awesome, young and great','We want you to feel assured that your shirts are being printed by the best of the best.',NULL,'about-company','2018-11-26 15:09:23','2018-12-29 18:05:29'),
	(4,'Why us','We want you to feel assured that your shirts are being printed by the best of the best.',NULL,'why-us','2018-11-27 21:14:40','2018-11-27 21:14:40'),
	(5,'We’re a collection of more than 900 full-service sign stores located across the globe – a fact that truly makes us “where the world goes for signs.”',NULL,NULL,'works','2018-11-28 23:15:40','2018-11-28 23:15:40'),
	(6,'In 2017, we proudly launched GTA Image Solutions. ',NULL,NULL,'about','2018-11-29 01:41:45','2018-11-29 01:41:45'),
	(7,'Team','We want you to feel assured that your shirts are being printed by the best of the best.',NULL,'team','2018-11-29 03:47:50','2018-11-29 03:47:50');

/*!40000 ALTER TABLE `BlockInfos` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ContactRequests
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ContactRequests`;

CREATE TABLE `ContactRequests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `message` text,
  `readed` tinyint(1) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ContactRequests` WRITE;
/*!40000 ALTER TABLE `ContactRequests` DISABLE KEYS */;

INSERT INTO `ContactRequests` (`id`, `type`, `phone`, `fullname`, `email`, `message`, `readed`, `createdAt`, `updatedAt`)
VALUES
	(1,'Subject 1','+371 28 897 234','Sergey Kolpakov','sergeikalpakov@gmail.com','For general queries, including partnership opportunities, please email use the form below to ask us questions or contact us.\n\nFor general queries, including partnership opportunities, please email use the form below to ask us questions or contact us.\n\n',1,'2019-01-23 16:43:17','2019-01-23 16:43:17'),
	(2,'Subject 2','+371 28 897 234','Sergey Kolpakov','sergeikalpakov@gmail.com','For general queries, including partnership opportunities, please email use the form below to ask us questions or contact us.\n\n',1,'2019-01-23 16:43:26','2019-01-24 10:04:20'),
	(3,'Subject 3','+371 28 897 234','Сергей Колпаков','sergeikalpakov@gmail.com','qrqwr',1,'2019-01-23 22:25:38','2019-01-24 10:05:24'),
	(4,'Subject 3','+371 28 897 234','Sergey Kolpakov','sergeikalpakov@gmail.com','classList.removeclassList.removeclassList.removeclassList.removeclassList.removeclassList.removeclassList.removeclassList.remove',1,'2019-01-23 22:25:51','2019-01-24 10:05:55'),
	(5,'Subject 1','+371 28 897 234','Sergey Kolpakov','sergeikalpakov@gmail.com','asasafsfa',1,'2019-01-24 10:06:33','2019-01-24 10:07:16'),
	(6,'Subject 1','+371 28 897 234','aasfafa','sergeikalpakov@gmail.com','afsaf',1,'2019-01-24 10:06:40','2019-01-24 10:07:18'),
	(7,'Subject 1','+371 28 897 234','Sergey Kolpakov','sergeikalpakov@gmail.com','asffaf',1,'2019-01-24 10:06:48','2019-01-24 10:09:08'),
	(8,'Subject 1','+371 28 897 234','Sergey Kolpakov','sergeikalpakov@gmail.com','ssafaa',1,'2019-01-24 10:08:49','2019-01-24 10:09:11'),
	(9,'Subject 1','+371 28 897 234','Sergey Kolpakov','sergeikalpakov@gmail.com','asfsaasfaf',1,'2019-01-24 10:08:54','2019-01-24 10:09:14'),
	(10,'Subject 1','+371 28 897 234','Сергей Колпаков','sergeikalpakov@gmail.com','aasfafa',1,'2019-01-24 10:09:01','2019-01-24 10:09:32'),
	(11,'Subject 1','+371 28 897 234','Sergey Kolpakov','sergeikalpakov@gmail.com','fa',1,'2019-01-24 10:09:25','2019-01-24 10:09:41'),
	(12,'Subject 1','+371 28 897 234','Sergey Kolpakov','sergeikalpakov@gmail.com','asfasf',1,'2019-01-24 10:10:11','2019-01-24 10:10:15'),
	(13,'Subject 1','+371 28 897 234','Sergey Kolpakov','sergeikalpakov@gmail.com','ffaf',1,'2019-01-24 16:34:19','2019-01-25 21:32:18'),
	(14,'Subject 1','+371 28 897 234','Sergey Kolpakov','sergeikalpakov@gmail.com','afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a ',1,'2019-01-24 16:36:59','2019-01-25 21:32:17');

/*!40000 ALTER TABLE `ContactRequests` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table CustomerReviews
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CustomerReviews`;

CREATE TABLE `CustomerReviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_name` varchar(255) DEFAULT NULL,
  `person_position` varchar(255) DEFAULT NULL,
  `comment` text,
  `work_url` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `CustomerReviews` WRITE;
/*!40000 ALTER TABLE `CustomerReviews` DISABLE KEYS */;

INSERT INTO `CustomerReviews` (`id`, `person_name`, `person_position`, `comment`, `work_url`, `createdAt`, `updatedAt`)
VALUES
	(1,'Arakat Bank','International Bank Ltd.','Fusce vehicula dolor arcu, sit amet blandit dolor mollis nec. Donec viverra eleifend lacus, vitae ullamcorper metus.','test','2018-11-27 19:03:04','2018-11-27 19:03:04'),
	(2,'Arakat Bank','International Bank Ltd.','Fusce vehicula dolor arcu, sit amet blandit dolor mollis nec. Donec viverra eleifend lacus, vitae ullamcorper metus.','test','2018-11-27 19:03:04','2018-11-27 19:03:04'),
	(3,'Arakat Bank','International Bank Ltd.','Fusce vehicula dolor arcu, sit amet blandit dolor mollis nec. Donec viverra eleifend lacus, vitae ullamcorper metus.','test','2018-11-27 19:03:04','2018-11-27 19:03:04'),
	(4,'Arakat Bank','International Bank Ltd.','Fusce vehicula dolor arcu, sit amet blandit dolor mollis nec. Donec viverra eleifend lacus, vitae ullamcorper metus.','test','2018-11-27 19:03:04','2018-11-27 19:03:04'),
	(5,'Arakat Bank','International Bank Ltd.','Fusce vehicula dolor arcu, sit amet blandit dolor mollis nec. Donec viverra eleifend lacus, vitae ullamcorper metus.','test','2018-11-27 19:03:04','2018-11-27 19:03:04'),
	(6,'Arakat Bank','International Bank Ltd.','Fusce vehicula dolor arcu, sit amet blandit dolor mollis nec. Donec viverra eleifend lacus, vitae ullamcorper metus.','test','2018-11-27 19:03:04','2018-11-27 19:03:04'),
	(7,'Arakat Bank','International Bank Ltd.','Fusce vehicula dolor arcu, sit amet blandit dolor mollis nec. Donec viverra eleifend lacus, vitae ullamcorper metus.','test','2018-11-27 19:03:04','2018-11-27 19:03:04');

/*!40000 ALTER TABLE `CustomerReviews` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Heads
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Heads`;

CREATE TABLE `Heads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `page` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `caption` (`caption`),
  UNIQUE KEY `page` (`page`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Heads` WRITE;
/*!40000 ALTER TABLE `Heads` DISABLE KEYS */;

INSERT INTO `Heads` (`id`, `title`, `caption`, `page`, `createdAt`, `updatedAt`)
VALUES
	(1,'Need a sign for your business?  We can help.','It can be frustrating to get the right t-shirt for your brand. We believe it should be easy to get high-quality custom t-shirts that represent you and your brand.','index','2018-11-26 19:22:55','2018-12-29 18:02:16'),
	(2,'What we do check',NULL,'what-we-do','2018-11-26 21:26:25','2018-11-26 21:26:25'),
	(3,'Check our works',NULL,'works','2018-11-26 21:29:06','2018-11-26 21:29:06'),
	(4,'About our company',NULL,'about','2018-11-26 21:32:29','2018-11-26 21:32:29'),
	(5,'Contact us page title','For general queries, including partnership opportunities, please email use the form below to ask us questions or contact us.','contacts','2018-11-26 21:33:46','2018-11-26 21:33:46');

/*!40000 ALTER TABLE `Heads` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ImageGalleries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ImageGalleries`;

CREATE TABLE `ImageGalleries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) DEFAULT NULL,
  `images` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ImageGalleries` WRITE;
/*!40000 ALTER TABLE `ImageGalleries` DISABLE KEYS */;

INSERT INTO `ImageGalleries` (`id`, `keyword`, `images`, `createdAt`, `updatedAt`)
VALUES
	(1,'what-we-do-','','2019-02-13 19:18:20','2019-02-17 04:53:13'),
	(2,'what-we-do-1','a7b023809f4073e7c9c69fc2db9614f21550214736143.jpg,67c923395050f95ecc5f0762c58ce6ee1550379394563.jpg','2019-02-13 22:20:50','2019-02-17 04:56:34'),
	(3,'what-we-do-10','d27982101956c2c9c012e3a1d843f7c71550379363947.jpg,a16d2b1b9df5ca8169ad98da2e3b5b4f1550379372064.jpg,8e5e1235fb6895f093c6d43a22160a591550379375829.jpg','2019-02-17 04:56:03','2019-02-17 04:56:15'),
	(4,'what-we-do-2','85fee34153ca9aaff20c64a042274a0a1550382206671.jpg,e68e844be4723802927c45d952907dff1550382254165.jpg','2019-02-17 05:43:26','2019-02-17 05:44:14'),
	(5,'what-we-do-3','042f191b29acd48bf2a7c802e02c1b5f1550382219777.jpg','2019-02-17 05:43:39','2019-02-17 05:43:39'),
	(6,'what-we-do-4','66ecd34d4a8693f4ebd5da249023cc781550382231555.jpeg','2019-02-17 05:43:51','2019-02-17 05:43:51'),
	(7,'work-','','2019-02-17 06:18:53','2019-02-17 18:01:11'),
	(8,'work-2','d558ee8ef5ef0b2eb693b30aa4eae3411550384528125.jpg','2019-02-17 06:22:08','2019-02-17 06:22:08'),
	(9,'work-1','3f75aa30f1582cb84e6faee6994858431550384570514.jpg,214b95ddd723c9cf14e9d7fa1b8180041550384575305.jpg','2019-02-17 06:22:50','2019-02-17 06:22:55'),
	(10,'about-gallery-2','c5552587aebd6ffbab2ff0df26854f381550469696850.jpg,6ed07471977e86c6199c78d805fea0621550469700472.jpg','2019-02-18 05:50:44','2019-02-18 06:01:40'),
	(11,'about-gallery','82a2bcc019d39fa5c17bf0522963b20e1550469672594.jpg,38da7ef2951549985a5ef6dfda175fe61550469689193.jpg','2019-02-18 06:01:12','2019-02-18 06:01:29'),
	(12,'work-3','2442d7cf8036742b0dd6ba5a4dec1fea1550666233869.jpg,ef978399342d2990bbc23fa7d5efe8e31550666239952.jpg,2657b6bd6a6c2b2c187e646d4c2921471550666243613.png','2019-02-20 12:37:13','2019-02-20 12:37:23');

/*!40000 ALTER TABLE `ImageGalleries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Meta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Meta`;

CREATE TABLE `Meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `page` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `description` (`description`),
  UNIQUE KEY `page` (`page`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Meta` WRITE;
/*!40000 ALTER TABLE `Meta` DISABLE KEYS */;

INSERT INTO `Meta` (`id`, `title`, `description`, `keywords`, `page`, `createdAt`, `updatedAt`)
VALUES
	(1,'What we do','asfsasfa','test, one more, third','what-we-do','2018-11-25 14:12:23','2018-12-10 04:31:48'),
	(2,'Index','this is a perfect descriptionn','test, one more, third','index','2018-12-09 23:22:20','2018-12-29 14:01:03'),
	(3,'What we do - GTA','asffasff','test, one more, third',NULL,'2018-12-09 23:44:09','2018-12-09 23:44:09'),
	(4,'What we do - GTA','asfasfa','test, one more, third',NULL,'2018-12-09 23:44:34','2018-12-09 23:44:34'),
	(5,'Our works','asfafa','test, one more, third','works','2018-12-10 05:34:57','2018-12-10 05:34:57'),
	(6,'About us','asssfaf','test, one more, third','about','2018-12-10 05:41:21','2018-12-10 05:41:21'),
	(7,'Contacts','asfafasf','test, one more, third','contacts','2018-12-10 05:41:33','2018-12-10 05:41:33');

/*!40000 ALTER TABLE `Meta` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Services
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Services`;

CREATE TABLE `Services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `articleTitle` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `shortDescription` varchar(255) DEFAULT NULL,
  `description` text,
  `description2` text,
  `icon` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Services` WRITE;
/*!40000 ALTER TABLE `Services` DISABLE KEYS */;

INSERT INTO `Services` (`id`, `title`, `articleTitle`, `slug`, `shortDescription`, `description`, `description2`, `icon`, `createdAt`, `updatedAt`)
VALUES
	(1,'asfffasfaAFAFAFasas A B C S','We offer custom cut vinyl decal stickers.','decals','We want you to feel assured that your shirts are being printed by the best of the best. We print all orders in-house by our team of t-shirts pros. The quality doesn\'t change, just the design.','<p>p.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px \'Helvetica Neue\'}&nbsp;</p><p><strong>We specialize in making custom decals that are either vinyl die cut or printed in any shape, size or color.</strong></p><p><br>&nbsp;</p><p>From gloss finish to a variety of specialty finishes a wide range of possibilities are available. We can custom manufacture a wide variety of highly durable and custom contoured decals using a variety of materials, including high-grade vinyl in many different styles. They are easily removable and can be reverse printed, if required, for use inside a window. They are perfect where short quantities of stickers are required. We also provide installation services for large intricate jobs.</p><p><br>&nbsp;</p><p><strong>Decals are the easiest way to promote your company logo or promotion.</strong></p><p><br>&nbsp;</p><p>On a wall, a window or a point of sale display, or even your vehicle. They increase visibility and fortify brand identity while stimulating awareness.</p><p><br>&nbsp;</p><p><strong>Our Decals are perfect for use on walls, windows, floors, vehicles and other surfaces.</strong></p><p><br>&nbsp;</p><p>p.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 13.0px \'Helvetica Neue\'; color: #433c44} p.p2 {margin: 0.0px 0.0px 0.0px 0.0px; font: 13.0px \'Helvetica Neue\'; color: #433c44; min-height: 15.0px} span.s1 {text-decoration: underline}&nbsp;</p><p>Whether you are located in Toronto or anywhere in the GTA get in touch with our capable team today to discuss your requirements and have your decals customized according to your needs.</p>','<p>We specialize in making custom decals that are either vinyl die cut or printed in any shape, size or color.</p><p>From gloss finish to a variety of specialty finishes a wide range of possibilities are available. We can custom manufacture a wide variety of highly durable and custom contoured decals using a variety of materials, including high-grade vinyl in many different styles. They are easily removable and can be reverse printed, if required, for use inside a window. They are perfect where short quantities of stickers are required. We also provide installation services for large intricate jobs.</p><p>Decals are the easiest way to promote your company logo or promotion.</p><p>On a wall, a window or a point of sale display, or even your vehicle. They increase visibility and fortify brand identity while stimulating awareness.</p><p>Our Decals are perfect for use on walls, windows, floors, vehicles and other surfaces.</p><p>Whether you are located in Toronto or anywhere in the GTA get in touch with our capable team today to discuss your requirements and have your decals customized according to your needs.</p><ol><li>Test list</li><li>Super listt</li><li>Third</li><li>Testik</li></ol><p>Our Decals are perfect for use on walls, windows, floors, vehicles and other surfaces.</p><p>Whether you are located in Toronto or anywhere in the GTA get in touch with our capable team today to discuss your requirements and have your decals customized according to your needs.</p><ul><li>One item</li><li>One item</li><li>One item</li><li>One item</li></ul><p>Test here&nbsp;</p><p>and link&nbsp;<a href=\"https://www.youtube.com/watch?v=hE5zeEiVqpw\">Test</a></p><p>Our Decals are perfect for use on walls, windows, floors, vehicles and other surfaces.</p><p>&nbsp;</p><p>Whether you are located in Toronto or anywhere in the GTA get in touch with our capable team today to discuss your requirements and have your decals customized according to your needs.</p>','large','2018-11-25 12:56:09','2019-02-20 10:36:08'),
	(2,'Large Format Graphics (printing)','We offer custom cut vinyl decal stickers.','printing','We want you to feel assured that your shirts are being printed by the best of the best. We print all orders in-house by our team of t-shirts pros. The quality doesn\'t change, just the design.','\n\n\n\n\n<style type=\"text/css\">\np.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 13.0px \'Helvetica Neue\'; color: #433c44}\np.p2 {margin: 0.0px 0.0px 0.0px 0.0px; font: 13.0px \'Helvetica Neue\'; color: #433c44; min-height: 15.0px}\nspan.s1 {text-decoration: underline}\n</style>\n\n\n<p class=\"p1\">\n\n\n\n\n<style type=\"text/css\">\np.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px \'Helvetica Neue\'}\n</style>\n\n\n</p><p class=\"p1\"><b>We specialize in making custom decals that are either vinyl die cut or printed in any shape, size or color.</b></p><p class=\"p1\"><br></p>\n<p class=\"p1\">From gloss finish to a variety of specialty finishes a wide range of possibilities are available. We can custom manufacture a wide variety of highly durable and custom contoured decals using a variety of materials, including high-grade vinyl in many different styles. They are easily removable and can be reverse printed, if required, for use inside a window. They are perfect where short quantities of stickers are required. We also provide installation services for large intricate jobs.</p><p class=\"p1\"><br></p><p class=\"p1\"><b><span class=\"s1\">Decals are the easiest way to promote your company logo or promotion.</span>&nbsp;</b></p><p class=\"p2\"><br></p><p class=\"p1\">On a wall, a window or a point of sale display, or even your vehicle. They increase visibility and fortify brand identity while stimulating awareness.</p><p class=\"p2\"><br></p><p class=\"p1\"><b><span class=\"s1\">Our Decals are perfect for use on walls, windows, floors, vehicles and other surfaces.</span>&nbsp;</b></p><p class=\"p2\"><br></p><p class=\"p1\">\n\n\n\n\n<style type=\"text/css\">\np.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 13.0px \'Helvetica Neue\'; color: #433c44}\np.p2 {margin: 0.0px 0.0px 0.0px 0.0px; font: 13.0px \'Helvetica Neue\'; color: #433c44; min-height: 15.0px}\nspan.s1 {text-decoration: underline}\n</style>\n\n\n\n\n\n\n\n\n</p><p class=\"p1\">Whether you are located in Toronto or anywhere in the GTA get in touch with our capable team today to discuss your requirements and have your decals customized according to your needs.</p>',NULL,'large','2018-11-25 13:14:16','2018-11-25 13:14:16'),
	(3,'Promotional Items','We offer custom cut vinyl decal stickers.','promotional-items','We want you to feel assured that your shirts are being printed by the best of the best. We print all orders in-house by our team of t-shirts pros. The quality doesn\'t change, just the design.','\n\n\n\n\n<style type=\"text/css\">\np.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 13.0px \'Helvetica Neue\'; color: #433c44}\np.p2 {margin: 0.0px 0.0px 0.0px 0.0px; font: 13.0px \'Helvetica Neue\'; color: #433c44; min-height: 15.0px}\nspan.s1 {text-decoration: underline}\n</style>\n\n\n<p class=\"p1\">\n\n\n\n\n<style type=\"text/css\">\np.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px \'Helvetica Neue\'}\n</style>\n\n\n</p><p class=\"p1\"><b>We specialize in making custom decals that are either vinyl die cut or printed in any shape, size or color.</b></p><p class=\"p1\"><br></p>\n<p class=\"p1\">From gloss finish to a variety of specialty finishes a wide range of possibilities are available. We can custom manufacture a wide variety of highly durable and custom contoured decals using a variety of materials, including high-grade vinyl in many different styles. They are easily removable and can be reverse printed, if required, for use inside a window. They are perfect where short quantities of stickers are required. We also provide installation services for large intricate jobs.</p><p class=\"p1\"><br></p><p class=\"p1\"><b><span class=\"s1\">Decals are the easiest way to promote your company logo or promotion.</span>&nbsp;</b></p><p class=\"p2\"><br></p><p class=\"p1\">On a wall, a window or a point of sale display, or even your vehicle. They increase visibility and fortify brand identity while stimulating awareness.</p><p class=\"p2\"><br></p><p class=\"p1\"><b><span class=\"s1\">Our Decals are perfect for use on walls, windows, floors, vehicles and other surfaces.</span>&nbsp;</b></p><p class=\"p2\"><br></p><p class=\"p1\">\n\n\n\n\n<style type=\"text/css\">\np.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 13.0px \'Helvetica Neue\'; color: #433c44}\np.p2 {margin: 0.0px 0.0px 0.0px 0.0px; font: 13.0px \'Helvetica Neue\'; color: #433c44; min-height: 15.0px}\nspan.s1 {text-decoration: underline}\n</style>\n\n\n\n\n\n\n\n\n</p><p class=\"p1\">Whether you are located in Toronto or anywhere in the GTA get in touch with our capable team today to discuss your requirements and have your decals customized according to your needs.</p>',NULL,'promo','2018-11-25 13:14:57','2018-11-25 13:14:57'),
	(4,'3D Letters','We offer custom cut vinyl decal stickers.','3d-letters','We want you to feel assured that your shirts are being printed by the best of the best. We print all orders in-house by our team of t-shirts pros. The quality doesn\'t change, just the design.','\n\n\n\n\n<style type=\"text/css\">\np.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 13.0px \'Helvetica Neue\'; color: #433c44}\np.p2 {margin: 0.0px 0.0px 0.0px 0.0px; font: 13.0px \'Helvetica Neue\'; color: #433c44; min-height: 15.0px}\nspan.s1 {text-decoration: underline}\n</style>\n\n\n<p class=\"p1\">\n\n\n\n\n<style type=\"text/css\">\np.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px \'Helvetica Neue\'}\n</style>\n\n\n</p><p class=\"p1\"><b>We specialize in making custom decals that are either vinyl die cut or printed in any shape, size or color.</b></p><p class=\"p1\"><br></p>\n<p class=\"p1\">From gloss finish to a variety of specialty finishes a wide range of possibilities are available. We can custom manufacture a wide variety of highly durable and custom contoured decals using a variety of materials, including high-grade vinyl in many different styles. They are easily removable and can be reverse printed, if required, for use inside a window. They are perfect where short quantities of stickers are required. We also provide installation services for large intricate jobs.</p><p class=\"p1\"><br></p><p class=\"p1\"><b><span class=\"s1\">Decals are the easiest way to promote your company logo or promotion.</span>&nbsp;</b></p><p class=\"p2\"><br></p><p class=\"p1\">On a wall, a window or a point of sale display, or even your vehicle. They increase visibility and fortify brand identity while stimulating awareness.</p><p class=\"p2\"><br></p><p class=\"p1\"><b><span class=\"s1\">Our Decals are perfect for use on walls, windows, floors, vehicles and other surfaces.</span>&nbsp;</b></p><p class=\"p2\"><br></p><p class=\"p1\">\n\n\n\n\n<style type=\"text/css\">\np.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 13.0px \'Helvetica Neue\'; color: #433c44}\np.p2 {margin: 0.0px 0.0px 0.0px 0.0px; font: 13.0px \'Helvetica Neue\'; color: #433c44; min-height: 15.0px}\nspan.s1 {text-decoration: underline}\n</style>\n\n\n\n\n\n\n\n\n</p><p class=\"p1\">Whether you are located in Toronto or anywhere in the GTA get in touch with our capable team today to discuss your requirements and have your decals customized according to your needs.</p>',NULL,'3d-letters','2018-11-25 13:15:22','2018-11-25 13:15:22'),
	(10,' dD aFAFF CCC EEE DD','lkkmflkamflk','flkmalkfsml','asfmfl',NULL,'asfkmfakskf','promo','2019-02-07 11:56:08','2019-02-13 22:30:06');

/*!40000 ALTER TABLE `Services` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Settings`;

CREATE TABLE `Settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `contactFormEmail` varchar(255) DEFAULT NULL,
  `contactFormSubject` varchar(255) DEFAULT NULL,
  `lat` varchar(255) DEFAULT NULL,
  `long` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `copyright` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Settings` WRITE;
/*!40000 ALTER TABLE `Settings` DISABLE KEYS */;

INSERT INTO `Settings` (`id`, `email`, `contactFormEmail`, `contactFormSubject`, `lat`, `long`, `phone`, `address`, `copyright`, `facebook`, `twitter`, `instagram`, `youtube`, `createdAt`, `updatedAt`)
VALUES
	(4,'hello@gtaimagesolutions.com','sergeikalpako@gmail.com','Subject 1, Subject 2, Subject 3, Else 4','43.7132796','-79.36697800000002','+1 (416) 522-4501','790 Eglinton Ave East Toronto, ON M4G 2L1','2018 GTA Image solutions Inc','https://www.facebook.com/','https://twitter.com/','https://www.instagram.com/','https://www.youtube.com/','2019-01-24 11:38:50','2019-01-24 14:07:44');

/*!40000 ALTER TABLE `Settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Teams
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Teams`;

CREATE TABLE `Teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Teams` WRITE;
/*!40000 ALTER TABLE `Teams` DISABLE KEYS */;

INSERT INTO `Teams` (`id`, `fullname`, `position`, `image`, `createdAt`, `updatedAt`)
VALUES
	(2,'fasfsa','sfsfasasfff','54b81bbe40b96aeaea458c942c356ebf1550053948308.jpg','2019-02-13 10:32:28','2019-02-13 10:32:28'),
	(3,'asfasf','asfasfsa','c61483943135a2e62908026ed65601361550053956368.jpg','2019-02-13 10:32:36','2019-02-13 10:32:36'),
	(4,'jkkhhkhkh','jhbjhb','4267ea286f9f026c1f28917e959747751550085472813.jpg','2019-02-13 19:17:52','2019-02-13 19:17:52');

/*!40000 ALTER TABLE `Teams` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Users`;

CREATE TABLE `Users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;

INSERT INTO `Users` (`id`, `name`, `login`, `password`, `createdAt`, `updatedAt`)
VALUES
	(16,'Admin','gtaadmin','$2a$08$2M/m2ch.ajT/UArWuEigwO0.01G56PRa4/chKZ0x1j.EpmhRD1jyy','2018-12-09 03:21:24','2018-12-09 03:21:24');

/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table WhyUs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `WhyUs`;

CREATE TABLE `WhyUs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `WhyUs` WRITE;
/*!40000 ALTER TABLE `WhyUs` DISABLE KEYS */;

INSERT INTO `WhyUs` (`id`, `text`, `icon`, `createdAt`, `updatedAt`)
VALUES
	(1,'We are transforming business printing from start to finish','temporary-img','2018-11-27 21:23:41','2018-11-27 21:23:41'),
	(2,'We are transforming business printing from start to finish','temporary-img','2018-11-27 21:24:01','2018-11-27 21:24:01'),
	(3,'We are transforming business printing from start to finish','temporary-img','2018-11-27 21:24:03','2018-11-27 21:24:03'),
	(9,'We are transforming business printing from start to finish !!!!!!! 123131','temporary-img','2019-02-17 11:35:05','2019-02-17 11:35:58');

/*!40000 ALTER TABLE `WhyUs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Works
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Works`;

CREATE TABLE `Works` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `person_name` varchar(255) DEFAULT NULL,
  `person_position` varchar(255) DEFAULT NULL,
  `comment` text,
  `shortDescription` text,
  `description` text,
  `description2` text,
  `image` varchar(255) DEFAULT NULL,
  `image2` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Works` WRITE;
/*!40000 ALTER TABLE `Works` DISABLE KEYS */;

INSERT INTO `Works` (`id`, `title`, `slug`, `category`, `person_name`, `person_position`, `comment`, `shortDescription`, `description`, `description2`, `image`, `image2`, `createdAt`, `updatedAt`)
VALUES
	(1,'Design Idea','ssasad','Billboards','asdaa','sadsdasd','assdadaad',NULL,'sdsdasda','sdasdasad','6aac86e09b65343cbf7d2ced20053a0a1550384577263.jpg',NULL,'2019-02-17 06:19:02','2019-02-17 06:22:57'),
	(2,'Design Idea 2','tesstt','Billboards','Billboards','boards','hjjhhjhhjj',NULL,'jhjhhhhjjh','kjjkjkjkk','de18556cdde0c657d18b82e2318725ad1550384559609.jpg',NULL,'2019-02-17 06:21:14','2019-02-17 06:22:39'),
	(3,'asfaalifoi','fioajfoisjf','fjoiajfsoi','afsafsf','asfsfafsfs','fsfassfaff',NULL,'<p><i>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</i></p><p>&nbsp;</p><p><i>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</i></p><p>&nbsp;</p><p><i>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</i></p>','<p><i>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</i></p><p><i>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</i></p><p><i>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</i></p>','4f1e8e08e87750db32a39ba0d876246d1550666245044.jpg','aff6d629b0bc2dfffdc908c6c85ce1a31550666245052.jpg','2019-02-20 12:37:00','2019-02-20 12:45:10');

/*!40000 ALTER TABLE `Works` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
