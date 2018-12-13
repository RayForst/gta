# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.19)
# Database: gta
# Generation Time: 2018-12-13 13:10:33 +0000
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
  `description` text,
  `shortDescription` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Abouts` WRITE;
/*!40000 ALTER TABLE `Abouts` DISABLE KEYS */;

INSERT INTO `Abouts` (`id`, `description`, `shortDescription`, `createdAt`, `updatedAt`)
VALUES
	(1,'\n\n\n\n\n<style type=\"text/css\">\np.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 13.0px \'Helvetica Neue\'; color: #433c44}\np.p2 {margin: 0.0px 0.0px 0.0px 0.0px; font: 13.0px \'Helvetica Neue\'; color: #433c44; min-height: 15.0px}\nspan.s1 {text-decoration: underline}\n</style>\n\n\n<p class=\"p1\"><span class=\"s1\"><b>We did not fancy becoming another ‘sort-by’ registry that gets quickly outdated and barely provides any useful information.<span class=\"Apple-converted-space\">&nbsp;</span></b></span></p>\n<p class=\"p2\"><span class=\"s1\"></span><br></p>\n<p class=\"p1\"><span class=\"s1\"><b>Instead, Sewport combines all services in one place and removes complexity around creating a piece of clothing.</b></span></p>\n<p class=\"p2\"><br></p>\n<p class=\"p1\">The tools that we offer to the Brands allow completing each stage of production without constraints. To contact the right manufacturers, Brands are encouraged to create a Project where they can upload all the necessary information including their sketches, CADs, Tech Packs, order quantities and more. Our IT team worked hard developing smart algorithms that match the projects to the appropriate manufacturers based on their Project information and capabilities of the service providers.</p><style type=\"text/css\">\np.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 13.0px \'Helvetica Neue\'; color: #433c44}\np.p2 {margin: 0.0px 0.0px 0.0px 0.0px; font: 13.0px \'Helvetica Neue\'; color: #433c44; min-height: 15.0px}\nspan.s1 {text-decoration: underline}\n</style>','Our team believes that successful businesses are a result of hard work, dedication, vision and above all passion. \n\nWe not only contribute to your success by making your vision a reality but also provide quality that is a class apart.','2018-11-29 01:52:06','2018-11-29 01:52:51');

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
	(3,'We are awesome, young and great','We want you to feel assured that your shirts are being printed by the best of the best.',NULL,'about-company','2018-11-26 15:09:23','2018-11-26 15:09:23'),
	(4,'Why us','We want you to feel assured that your shirts are being printed by the best of the best.',NULL,'why-us','2018-11-27 21:14:40','2018-11-27 21:14:40'),
	(5,'We’re a collection of more than 900 full-service sign stores located across the globe – a fact that truly makes us “where the world goes for signs.”',NULL,NULL,'works','2018-11-28 23:15:40','2018-11-28 23:15:40'),
	(6,'In 2017, we proudly launched GTA Image Solutions. ',NULL,NULL,'about','2018-11-29 01:41:45','2018-11-29 01:41:45'),
	(7,'Team','We want you to feel assured that your shirts are being printed by the best of the best.',NULL,'team','2018-11-29 03:47:50','2018-11-29 03:47:50');

/*!40000 ALTER TABLE `BlockInfos` ENABLE KEYS */;
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
	(1,'Need a sign for your business?  We can help.','It can be frustrating to get the right t-shirt for your brand. We believe it should be easy to get high-quality custom t-shirts that represent you and your brand.','index','2018-11-26 19:22:55','2018-11-26 19:22:55'),
	(2,'What we do check',NULL,'what-we-do','2018-11-26 21:26:25','2018-11-26 21:26:25'),
	(3,'Check our works',NULL,'works','2018-11-26 21:29:06','2018-11-26 21:29:06'),
	(4,'About our company',NULL,'about','2018-11-26 21:32:29','2018-11-26 21:32:29'),
	(5,'Contact us page title','For general queries, including partnership opportunities, please email use the form below to ask us questions or contact us.','contacts','2018-11-26 21:33:46','2018-11-26 21:33:46');

/*!40000 ALTER TABLE `Heads` ENABLE KEYS */;
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
	(2,'Index','this is a perfect descriptionn','test, one more, third','index','2018-12-09 23:22:20','2018-12-10 03:11:00'),
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
  `icon` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Services` WRITE;
/*!40000 ALTER TABLE `Services` DISABLE KEYS */;

INSERT INTO `Services` (`id`, `title`, `articleTitle`, `slug`, `shortDescription`, `description`, `icon`, `createdAt`, `updatedAt`)
VALUES
	(1,'Decals (Vinyl plotter cutting)s','We offer custom cut vinyl decal stickers.','decals','We want you to feel assured that your shirts are being printed by the best of the best. We print all orders in-house by our team of t-shirts pros. The quality doesn\'t change, just the design.','\n\n\n\n\n<style type=\"text/css\">\np.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 13.0px \'Helvetica Neue\'; color: #433c44}\np.p2 {margin: 0.0px 0.0px 0.0px 0.0px; font: 13.0px \'Helvetica Neue\'; color: #433c44; min-height: 15.0px}\nspan.s1 {text-decoration: underline}\n</style>\n\n\n<p class=\"p1\">\n\n\n\n\n<style type=\"text/css\">\np.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px \'Helvetica Neue\'}\n</style>\n\n\n</p><p class=\"p1\"><b>We specialize in making custom decals that are either vinyl die cut or printed in any shape, size or color.</b></p><p class=\"p1\"><br></p>\n<p class=\"p1\">From gloss finish to a variety of specialty finishes a wide range of possibilities are available. We can custom manufacture a wide variety of highly durable and custom contoured decals using a variety of materials, including high-grade vinyl in many different styles. They are easily removable and can be reverse printed, if required, for use inside a window. They are perfect where short quantities of stickers are required. We also provide installation services for large intricate jobs.</p><p class=\"p1\"><br></p><p class=\"p1\"><b><span class=\"s1\">Decals are the easiest way to promote your company logo or promotion.</span>&nbsp;</b></p><p class=\"p2\"><br></p><p class=\"p1\">On a wall, a window or a point of sale display, or even your vehicle. They increase visibility and fortify brand identity while stimulating awareness.</p><p class=\"p2\"><br></p><p class=\"p1\"><b><span class=\"s1\">Our Decals are perfect for use on walls, windows, floors, vehicles and other surfaces.</span>&nbsp;</b></p><p class=\"p2\"><br></p><p class=\"p1\">\n\n\n\n\n<style type=\"text/css\">\np.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 13.0px \'Helvetica Neue\'; color: #433c44}\np.p2 {margin: 0.0px 0.0px 0.0px 0.0px; font: 13.0px \'Helvetica Neue\'; color: #433c44; min-height: 15.0px}\nspan.s1 {text-decoration: underline}\n</style>\n\n\n\n\n\n\n\n\n</p><p class=\"p1\">Whether you are located in Toronto or anywhere in the GTA get in touch with our capable team today to discuss your requirements and have your decals customized according to your needs.</p>','decals','2018-11-25 12:56:09','2018-11-28 20:25:36'),
	(2,'Large Format Graphics (printing)',NULL,'printing','We want you to feel assured that your shirts are being printed by the best of the best. We print all orders in-house by our team of t-shirts pros. The quality doesn\'t change, just the design.',NULL,'large','2018-11-25 13:14:16','2018-11-25 13:14:16'),
	(3,'Promotional Items',NULL,'promotional-items','We want you to feel assured that your shirts are being printed by the best of the best. We print all orders in-house by our team of t-shirts pros. The quality doesn\'t change, just the design.',NULL,'promo','2018-11-25 13:14:57','2018-11-25 13:14:57'),
	(4,'3D Letters',NULL,'3d-letters','We want you to feel assured that your shirts are being printed by the best of the best. We print all orders in-house by our team of t-shirts pros. The quality doesn\'t change, just the design.',NULL,'3d-letters','2018-11-25 13:15:22','2018-11-25 13:15:22'),
	(5,'Acrylicand Glass Signs',NULL,'signs','We want you to feel assured that your shirts are being printed by the best of the best. We print all orders in-house by our team of t-shirts pros. The quality doesn\'t change, just the design.',NULL,'glass','2018-11-25 13:15:49','2018-11-25 13:15:49'),
	(6,'Sandwich Boards/A-Frames',NULL,'boards','We want you to feel assured that your shirts are being printed by the best of the best. We print all orders in-house by our team of t-shirts pros. The quality doesn\'t change, just the design.','safaf','sandvich','2018-11-25 13:16:15','2018-11-28 16:18:27');

/*!40000 ALTER TABLE `Services` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Teams
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Teams`;

CREATE TABLE `Teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Teams` WRITE;
/*!40000 ALTER TABLE `Teams` DISABLE KEYS */;

INSERT INTO `Teams` (`id`, `fullname`, `position`, `createdAt`, `updatedAt`)
VALUES
	(1,'Sunstra Maneerattana','CEO','2018-11-29 03:41:01','2018-11-29 03:41:01'),
	(2,'Sunstra Maneerattana','CEO','2018-11-29 03:41:01','2018-11-29 03:41:01'),
	(3,'Sunstra Maneerattana','CEO','2018-11-29 03:41:01','2018-11-29 03:41:01'),
	(4,'Sunstra Maneerattana','CEO','2018-11-29 03:41:01','2018-11-29 03:41:01'),
	(5,'Sunstra Maneerattana','CEO','2018-11-29 03:41:01','2018-11-29 03:41:01'),
	(6,'Sunstra Maneerattana','CEO','2018-11-29 03:41:01','2018-11-29 03:41:01'),
	(7,'Sunstra Maneerattana','CEO','2018-11-29 03:41:01','2018-11-29 03:41:01'),
	(8,'Sunstra Maneerattana','CEO','2018-11-29 03:41:01','2018-11-29 03:41:01');

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
	(1,'We are transforming business printing from start to finish',NULL,'2018-11-27 21:23:41','2018-11-27 21:23:41'),
	(2,'We are transforming business printing from start to finish',NULL,'2018-11-27 21:24:01','2018-11-27 21:24:01'),
	(3,'We are transforming business printing from start to finish',NULL,'2018-11-27 21:24:03','2018-11-27 21:24:03'),
	(4,'We are transforming business printing from start to finish',NULL,'2018-11-27 21:24:04','2018-11-27 21:24:04');

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
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Works` WRITE;
/*!40000 ALTER TABLE `Works` DISABLE KEYS */;

INSERT INTO `Works` (`id`, `title`, `slug`, `category`, `person_name`, `person_position`, `comment`, `shortDescription`, `description`, `createdAt`, `updatedAt`)
VALUES
	(1,'Design Idea','design-idea','Billboards','Arakat Bank','International Bank Ltd.','All of our decal stickers are outdoor durable and include your choice of gloss or matte finish at no extra cost. \n\nDecals cut with your logo will add a professional  touch to any storefront, office, car window or restaurant. A 100% customizable and available in any size or shape you require. ','Fusce vehicula dolor arcu, sit amet blandit dolor mollis nec. Donec viverra eleifend lacus, vitae ullamcorper metus.','\n\n\n\n\n<style type=\"text/css\">\np.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 13.0px \'Helvetica Neue\'; color: #433c44}\np.p2 {margin: 0.0px 0.0px 0.0px 0.0px; font: 13.0px \'Helvetica Neue\'; color: #433c44; min-height: 15.0px}\nspan.s1 {text-decoration: underline}\n</style>\n\n\n<p class=\"p1\"><b><span class=\"s1\">We specialize in making custom decals that are either vinyl die cut or printed in any shape, size or color.</span>&nbsp;</b></p>\n<p class=\"p2\"><br></p>\n<p class=\"p1\">From gloss finish to a variety of specialty finishes a wide range of possibilities are available. We can custom manufacture a wide variety of highly durable and custom contoured decals using a variety of materials, including high-grade vinyl in many different styles. They are easily removable and can be reverse printed, if required, for use inside a window. They are perfect where short quantities of stickers are required. We also provide installation services for large intricate jobs.</p><p class=\"p1\"><br></p><p class=\"p1\"><b><span class=\"s1\">Decals are the easiest way to promote your company logo or promotion.</span>&nbsp;</b></p><p class=\"p2\"><br></p><p class=\"p1\">On a wall, a window or a point of sale display, or even your vehicle. They increase visibility and fortify brand identity while stimulating awareness.</p><p class=\"p2\"><br></p><p class=\"p1\"><b><span class=\"s1\">Our Decals are perfect for use on walls, windows, floors, vehicles and other surfaces.</span>&nbsp;</b></p><p class=\"p2\"><br></p><p class=\"p1\">\n\n\n\n\n<style type=\"text/css\">\np.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 13.0px \'Helvetica Neue\'; color: #433c44}\np.p2 {margin: 0.0px 0.0px 0.0px 0.0px; font: 13.0px \'Helvetica Neue\'; color: #433c44; min-height: 15.0px}\nspan.s1 {text-decoration: underline}\n</style>\n\n\n\n\n\n\n\n\n</p><p class=\"p1\">Whether you are located in Toronto or anywhere in the GTA get in touch with our capable team today to discuss your requirements and have your decals customized according to your needs.</p>','2018-11-28 23:10:03','2018-11-29 00:54:50'),
	(2,'Creative Earth 3D Model','3d-model','Signs','Arakat Bank','International Bank Ltd.','All of our decal stickers are outdoor durable and include your choice of gloss or matte finish at no extra cost. \n\nDecals cut with your logo will add a professional  touch to any storefront, office, car window or restaurant. A 100% customizable and available in any size or shape you require. ','Fusce vehicula dolor arcu, sit amet blandit dolor mollis nec. Donec viverra eleifend lacus, vitae ullamcorper metus.',NULL,'2018-11-28 23:10:37','2018-11-28 23:29:35'),
	(3,'Paper Cut Style Illustration','paper','Decals','Arakat Bank','International Bank Ltd.','All of our decal stickers are outdoor durable and include your choice of gloss or matte finish at no extra cost. \n\nDecals cut with your logo will add a professional  touch to any storefront, office, car window or restaurant. A 100% customizable and available in any size or shape you require. ','Fusce vehicula dolor arcu, sit amet blandit dolor mollis nec. Donec viverra eleifend lacus, vitae ullamcorper metus.',NULL,'2018-11-28 23:10:51','2018-11-28 23:29:46'),
	(4,'Creative Ideas','bilboards','Billboards','Arakat Bank','International Bank Ltd.','All of our decal stickers are outdoor durable and include your choice of gloss or matte finish at no extra cost. \n\nDecals cut with your logo will add a professional  touch to any storefront, office, car window or restaurant. A 100% customizable and available in any size or shape you require. ','Fusce vehicula dolor arcu, sit amet blandit dolor mollis nec. Donec viverra eleifend lacus, vitae ullamcorper metus.',NULL,'2018-11-28 23:11:02','2018-11-28 23:29:52'),
	(5,'Flowers Artwork','flowers','Billboards','Arakat Bank','International Bank Ltd.','All of our decal stickers are outdoor durable and include your choice of gloss or matte finish at no extra cost. \n\nDecals cut with your logo will add a professional  touch to any storefront, office, car window or restaurant. A 100% customizable and available in any size or shape you require. ','Fusce vehicula dolor arcu, sit amet blandit dolor mollis nec. Donec viverra eleifend lacus, vitae ullamcorper metus.',NULL,'2018-11-28 23:11:08','2018-11-28 23:29:56');

/*!40000 ALTER TABLE `Works` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
