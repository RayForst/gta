-- MySQL dump 10.13  Distrib 8.0.15, for Linux (x86_64)
--
-- Host: localhost    Database: gta
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `AboutCompanies`
--

DROP TABLE IF EXISTS `AboutCompanies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `AboutCompanies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AboutCompanies`
--

LOCK TABLES `AboutCompanies` WRITE;
/*!40000 ALTER TABLE `AboutCompanies` DISABLE KEYS */;
INSERT INTO `AboutCompanies` VALUES (1,'GTA Image Solutions is a Toronto based marketing company that specializes in the production of signs, promotional items and printing to satisfy the needs of all small, average size and large companies. We specialize in custom made designs to meet any special marketing requirements of our clients. We have 200 square meters filled with our own equipment which is sometimes loaded from dawn to dusk. Even our boss participate in the process. From the very beginning of GTA till now.','2018-11-27 14:59:57','2019-02-21 12:34:28');
/*!40000 ALTER TABLE `AboutCompanies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Abouts`
--

DROP TABLE IF EXISTS `Abouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Abouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gallery` text,
  `gallery2` text,
  `description` text,
  `shortDescription` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Abouts`
--

LOCK TABLES `Abouts` WRITE;
/*!40000 ALTER TABLE `Abouts` DISABLE KEYS */;
INSERT INTO `Abouts` VALUES (1,NULL,NULL,'<p>&nbsp; &nbsp;Today GTA Image Solutions is a Toronto based marketing company that specializes in the production of signs, promotional items and printing to satisfy the needs of all small, average size and large companies. We specialize in custom made designs to meet any special marketing requirements of our clients. We have 200 square meters filled with our own equipment which is sometimes loaded from dawn to dusk. Even our boss participate in the process. From the very beginning of GTA till now.</p><p>&nbsp; &nbsp;We are proud to call ourselves a team of professionals because this is how our clients present us when recommending.</p><p>&nbsp; &nbsp;Signage, decals, branded caps – whichever sign or display product you need, we can manage it. Can’t find a phone case of your dreams? Ask us to create it. Building a new shopping mall in Toronto? We will produce channel letters for it!</p><p>&nbsp; &nbsp;There are more than 500 signs you might have seen in the city that have been designed by our specialists and produced in our manufactory. But the quantity of stickers and decals is just impossible to imagine.</p><p>&nbsp; &nbsp;So whether you have just launched your small business or you are a CEO of a big international corporation, you are welcome at GTA Image Solutions! Feel free to contact us any time of the day, just fill in the form on our Contacts page, and we will respond as soon as we read it.</p>','Whatever you ask us to do, we will do it even better than you expected.\n\nJust tell us how you want it, and we will make the rest.\n\n','2018-11-29 01:52:06','2019-02-21 12:40:42');
/*!40000 ALTER TABLE `Abouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BlockInfos`
--

DROP TABLE IF EXISTS `BlockInfos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BlockInfos`
--

LOCK TABLES `BlockInfos` WRITE;
/*!40000 ALTER TABLE `BlockInfos` DISABLE KEYS */;
INSERT INTO `BlockInfos` VALUES (1,'Topnotch quality, excellent service',NULL,'What we do','what-we-do','2018-11-25 14:17:04','2019-02-21 12:46:19'),(2,'What do our customers think?','We want you to feel assured that your shirts are being printed by the best of the best.','Show all works','customer-review','2018-11-25 20:41:55','2018-11-25 20:41:55'),(3,'Topnotch quality, excellent service.','Trust us your wishes, and we will make them come true.',NULL,'about-company','2018-11-26 15:09:23','2019-02-21 12:25:39'),(4,'Why us','We are satisfied when you are satisfied.',NULL,'why-us','2018-11-27 21:14:40','2019-02-21 12:30:05'),(5,'There are more than 500 signs you might have seen in the city that have been designed by our specialists and produced in our manufactory. But the quantity of stickers and decals is just impossible to imagine.',NULL,NULL,'works','2018-11-28 23:15:40','2019-02-21 12:39:09'),(6,'It all started in year 2007 at the coast of Baltic Sea. Started with a skill that aimed to evolve.',NULL,NULL,'about','2018-11-29 01:41:45','2019-02-21 12:33:46'),(7,'Our dream team.','We are satisfied when you are satisfied.',NULL,'team','2018-11-29 03:47:50','2019-02-21 12:30:23');
/*!40000 ALTER TABLE `BlockInfos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ContactRequests`
--

DROP TABLE IF EXISTS `ContactRequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ContactRequests`
--

LOCK TABLES `ContactRequests` WRITE;
/*!40000 ALTER TABLE `ContactRequests` DISABLE KEYS */;
INSERT INTO `ContactRequests` VALUES (1,'Subject 1','+371 28 897 234','Sergey Kolpakov','sergeikalpakov@gmail.com','For general queries, including partnership opportunities, please email use the form below to ask us questions or contact us.\n\nFor general queries, including partnership opportunities, please email use the form below to ask us questions or contact us.\n\n',1,'2019-01-23 16:43:17','2019-01-23 16:43:17'),(2,'Subject 2','+371 28 897 234','Sergey Kolpakov','sergeikalpakov@gmail.com','For general queries, including partnership opportunities, please email use the form below to ask us questions or contact us.\n\n',1,'2019-01-23 16:43:26','2019-01-24 10:04:20'),(3,'Subject 3','+371 28 897 234','Сергей Колпаков','sergeikalpakov@gmail.com','qrqwr',1,'2019-01-23 22:25:38','2019-01-24 10:05:24'),(4,'Subject 3','+371 28 897 234','Sergey Kolpakov','sergeikalpakov@gmail.com','classList.removeclassList.removeclassList.removeclassList.removeclassList.removeclassList.removeclassList.removeclassList.remove',1,'2019-01-23 22:25:51','2019-01-24 10:05:55'),(5,'Subject 1','+371 28 897 234','Sergey Kolpakov','sergeikalpakov@gmail.com','asasafsfa',1,'2019-01-24 10:06:33','2019-01-24 10:07:16'),(6,'Subject 1','+371 28 897 234','aasfafa','sergeikalpakov@gmail.com','afsaf',1,'2019-01-24 10:06:40','2019-01-24 10:07:18'),(7,'Subject 1','+371 28 897 234','Sergey Kolpakov','sergeikalpakov@gmail.com','asffaf',1,'2019-01-24 10:06:48','2019-01-24 10:09:08'),(8,'Subject 1','+371 28 897 234','Sergey Kolpakov','sergeikalpakov@gmail.com','ssafaa',1,'2019-01-24 10:08:49','2019-01-24 10:09:11'),(9,'Subject 1','+371 28 897 234','Sergey Kolpakov','sergeikalpakov@gmail.com','asfsaasfaf',1,'2019-01-24 10:08:54','2019-01-24 10:09:14'),(10,'Subject 1','+371 28 897 234','Сергей Колпаков','sergeikalpakov@gmail.com','aasfafa',1,'2019-01-24 10:09:01','2019-01-24 10:09:32'),(11,'Subject 1','+371 28 897 234','Sergey Kolpakov','sergeikalpakov@gmail.com','fa',1,'2019-01-24 10:09:25','2019-01-24 10:09:41'),(12,'Subject 1','+371 28 897 234','Sergey Kolpakov','sergeikalpakov@gmail.com','asfasf',1,'2019-01-24 10:10:11','2019-01-24 10:10:15'),(13,'Subject 1','+371 28 897 234','Sergey Kolpakov','sergeikalpakov@gmail.com','ffaf',1,'2019-01-24 16:34:19','2019-01-25 21:32:18'),(14,'Subject 1','+371 28 897 234','Sergey Kolpakov','sergeikalpakov@gmail.com','afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a afasffasff a ',1,'2019-01-24 16:36:59','2019-01-25 21:32:17');
/*!40000 ALTER TABLE `ContactRequests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CustomerReviews`
--

DROP TABLE IF EXISTS `CustomerReviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `CustomerReviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_name` varchar(255) DEFAULT NULL,
  `person_position` varchar(255) DEFAULT NULL,
  `comment` text,
  `work_url` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomerReviews`
--

LOCK TABLES `CustomerReviews` WRITE;
/*!40000 ALTER TABLE `CustomerReviews` DISABLE KEYS */;
INSERT INTO `CustomerReviews` VALUES (1,'Arakat Bank','International Bank Ltd.','Fusce vehicula dolor arcu, sit amet blandit dolor mollis nec. Donec viverra eleifend lacus, vitae ullamcorper metus.','test','2018-11-27 19:03:04','2018-11-27 19:03:04'),(2,'Arakat Bank','International Bank Ltd.','Fusce vehicula dolor arcu, sit amet blandit dolor mollis nec. Donec viverra eleifend lacus, vitae ullamcorper metus.','test','2018-11-27 19:03:04','2018-11-27 19:03:04'),(3,'Arakat Bank','International Bank Ltd.','Fusce vehicula dolor arcu, sit amet blandit dolor mollis nec. Donec viverra eleifend lacus, vitae ullamcorper metus.','test','2018-11-27 19:03:04','2018-11-27 19:03:04'),(4,'Arakat Bank','International Bank Ltd.','Fusce vehicula dolor arcu, sit amet blandit dolor mollis nec. Donec viverra eleifend lacus, vitae ullamcorper metus.','test','2018-11-27 19:03:04','2018-11-27 19:03:04'),(5,'Arakat Bank','International Bank Ltd.','Fusce vehicula dolor arcu, sit amet blandit dolor mollis nec. Donec viverra eleifend lacus, vitae ullamcorper metus.','test','2018-11-27 19:03:04','2018-11-27 19:03:04'),(6,'Arakat Bank','International Bank Ltd.','Fusce vehicula dolor arcu, sit amet blandit dolor mollis nec. Donec viverra eleifend lacus, vitae ullamcorper metus.','test','2018-11-27 19:03:04','2018-11-27 19:03:04'),(7,'Arakat Bank','International Bank Ltd.','Fusce vehicula dolor arcu, sit amet blandit dolor mollis nec. Donec viverra eleifend lacus, vitae ullamcorper metus.','test','2018-11-27 19:03:04','2018-11-27 19:03:04');
/*!40000 ALTER TABLE `CustomerReviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Heads`
--

DROP TABLE IF EXISTS `Heads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Heads`
--

LOCK TABLES `Heads` WRITE;
/*!40000 ALTER TABLE `Heads` DISABLE KEYS */;
INSERT INTO `Heads` VALUES (1,'Need a sign for your business? Be our guest.','Whether you are just opening your business or you already have an international corporation, if you need a sign, branded items or vinyl cut decals, GTA Image Solutions is at your disposal.','index','2018-11-26 19:22:55','2019-02-20 19:53:54'),(2,'Here\'s what we can do for you',NULL,'what-we-do','2018-11-26 21:26:25','2019-02-21 12:46:17'),(3,'Here\'s what we\'ve already done',NULL,'works','2018-11-26 21:29:06','2019-02-21 12:46:25'),(4,'About our company',NULL,'about','2018-11-26 21:32:29','2018-11-26 21:32:29'),(5,'Feel free to contact us any time','For any questions, including partnership, please use the contact form below. ','contacts','2018-11-26 21:33:46','2019-02-21 12:47:22');
/*!40000 ALTER TABLE `Heads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ImageGalleries`
--

DROP TABLE IF EXISTS `ImageGalleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ImageGalleries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) DEFAULT NULL,
  `images` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ImageGalleries`
--

LOCK TABLES `ImageGalleries` WRITE;
/*!40000 ALTER TABLE `ImageGalleries` DISABLE KEYS */;
INSERT INTO `ImageGalleries` VALUES (1,'what-we-do-','','2019-02-13 19:18:20','2019-02-17 04:53:13'),(2,'what-we-do-1','5e883e7bdedba2484c164ec5219455991550746391935.jpg,066251dbcbd33343ea01052191fe40e91550746394668.jpg,58fb92eaf0b37962cd2c4e34496ca0121550746397487.jpg','2019-02-13 22:20:50','2019-02-21 10:53:17'),(3,'what-we-do-10','','2019-02-17 04:56:03','2019-02-21 11:00:52'),(4,'what-we-do-2','71927a9a7b523ce1a39a994f9eb0c88d1550746548777.jpg,2c7c9d89cee79641a2126beb998b811a1550746551259.jpg,835bc36add850020e6bd3ac93c2265081550746554260.jpg','2019-02-17 05:43:26','2019-02-21 10:55:54'),(5,'what-we-do-3','','2019-02-17 05:43:39','2019-02-21 10:57:22'),(6,'what-we-do-4','','2019-02-17 05:43:51','2019-02-21 10:58:25'),(7,'work-','','2019-02-17 06:18:53','2019-02-17 18:01:11'),(8,'work-2','5d60985e785c8ac80aa82ff8d7a306521551284941965.jpg','2019-02-17 06:22:08','2019-02-27 16:29:05'),(9,'work-1','239a233d3901662f958dee91737b9a041551276785228.jpg,b5921287217f9ec5981d96e6075051331551276978599.jpg','2019-02-17 06:22:50','2019-02-27 14:16:18'),(10,'about-gallery-2','','2019-02-18 05:50:44','2019-02-21 11:17:38'),(11,'about-gallery','2275fa652916705044998e01333fddf71550747986036.png','2019-02-18 06:01:12','2019-02-21 11:19:46'),(12,'work-3','c1d159aa9053dc6e5dbc269cbf3f96541551285020648.jpg','2019-02-20 12:37:13','2019-02-27 16:30:20');
/*!40000 ALTER TABLE `ImageGalleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Meta`
--

DROP TABLE IF EXISTS `Meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Meta`
--

LOCK TABLES `Meta` WRITE;
/*!40000 ALTER TABLE `Meta` DISABLE KEYS */;
INSERT INTO `Meta` VALUES (1,'What we do','asfsasfa','test, one more, third','what-we-do','2018-11-25 14:12:23','2018-12-10 04:31:48'),(2,'test','this is a perfect descriptionn','test, one more, third','index','2018-12-09 23:22:20','2019-02-26 11:01:11'),(3,'What we do - GTA','asffasff','test, one more, third',NULL,'2018-12-09 23:44:09','2018-12-09 23:44:09'),(4,'What we do - GTA','asfasfa','test, one more, third',NULL,'2018-12-09 23:44:34','2018-12-09 23:44:34'),(5,'Our works','asfafa','test, one more, third','works','2018-12-10 05:34:57','2018-12-10 05:34:57'),(6,'About us','asssfaf','test, one more, third','about','2018-12-10 05:41:21','2018-12-10 05:41:21'),(7,'Contacts','asfafasf','test, one more, third','contacts','2018-12-10 05:41:33','2018-12-10 05:41:33');
/*!40000 ALTER TABLE `Meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Services`
--

DROP TABLE IF EXISTS `Services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Services`
--

LOCK TABLES `Services` WRITE;
/*!40000 ALTER TABLE `Services` DISABLE KEYS */;
INSERT INTO `Services` VALUES (1,'Decals','Custom cut vinyl decals to make everybody remember you.','decals','GTA Image Solutions offer custom cut vinyl decal stickers. All of our decal stickers are outdoor durable and include your choice of gloss or matte finish at no extra cost.','<p>Decals cut with your logo will add a professional&nbsp;touch to any storefront, office, car window or restaurant. A 100% customizable and available in any size or shape you require!</p><p><strong>Decals are the most evident way to make others see you.</strong></p><p>Put your company’s logo or campaign on a window, wall, car or any other surface, and let your audience see it again and again, memorizing the message and getting more and more interested. Because little strokes fell great oaks, right?</p>','<p><strong>We will make a plotter cut vinyl decal or the one of any shape, color and size you wish. And if we can’t make red in blue, we say it at once.</strong></p><p>Choose a glossy or any other finish from a wide range of possibilities. We can manufacture you a highly durable decal that will look just the way you want it to. There are many materials available, in different styles, including a variety of high-grade vinyl.</p><p>Decals are easily removable, can be printed reverse to applied on a window from the inside.</p><p>For a large complex work we provide installation services as well.</p><p>&nbsp;</p><p><strong>Our decals fit any wall, floor, window, vehicle or other surfaces in Toronto. Well, almost any.</strong></p><p>So wherever you are located in Toronto, call or write our team of professionals to find the best solution for your needs, terms and budget.</p>','decals','2018-11-25 12:56:09','2019-02-21 12:21:50'),(2,'Large Format Graphics Printing','Large Format Graphics Printing with no limits.','printing','If you need to install a new wallpaper or mural in any room of your house or business, we will make it happen! \nWe are very thorough, patient and particular about the details with more than 10 years of experience in this industry. ','<p>No matter if it’s a photo of your dog you want to see in your living room or a peaceful landscape in a SPA room, we provide a large custom format printing for any need.</p><p>Photo wallpaper or mural adds texture and life to plain walls and sometimes may be preferable to other interior painting ideas!</p><p><strong>Big, bigger, the biggest! There are no size limits for us! Want it giant? Want it colossal? Be our guest.</strong></p><p>Large Format Media is an inspiring thing. Whether it is a storefront of your shop, a custom signage for the café or a shopping mall, we are here to make your huge ideas come true.</p><p>&nbsp;</p><p><strong>Need a full window and wall graphics in high resolution with full color that do not fade and are scratch resistant? We can offer this.</strong></p><p>Window and wall graphics can be performed in a diversity of cut vinyl’s – from semitransparent to metallic, or it can be high quality printed graphics.</p><p>We work with advanced vinyl adhesives, as well as specialized substrates in order to turn your surface into an advertising tool.</p><p>Your location’s walls and windows have an inborn talent to promote your corporate identity, your special offers, to create a certain ambiance or motivate your team. A wall painting is something that distinguish you from masses, it is an author’s stroke that catches attention and remains in memory.</p><p>Don’t bother about the size, our professionals can make a mural at the lowest price per square foot, and our installation team will make it seamless in appearance.</p>','<p>In order to protect your wall graphics there is a wide range of scratch resistant and anti graffiti over-lamination films available.</p><p>&nbsp;</p><p><strong>Hoardings. A cost-effective solution if you seek for a large-scale advertising.</strong></p><p>We are glad to offer you hoardings made of different materials (ultraflex, dibond, crezon, aluminium). We own printers which create clear graphics and guarantee a consistent saturated color.</p><p>Your hoarding will be effectively and safely erected by our installation team so that your advertisement looks outstanding!</p><p>&nbsp;</p><p><strong>Man can everything, bet with latest equipment he can more. Especially when it comes to printing.</strong></p><p>Team of experts along with the latest techniques and equipment allow us to fulfill of our customer’s (printing) wishes in the best way possible. Signs that we produce are durable and require either little or no maintenance at all.</p><p>Now take into account our tolerance to your budget, terms and quality requirements, pick up the phone and call us today!</p>','large','2018-11-25 13:14:16','2019-02-21 12:22:07'),(3,'Promotional Items','Caps, phone cases, pens. Any item can become a promotional item.','promotional-items','Promotional items are petty but powerful things which help to popularize your brand, product or strengthen your corporate identity.','<p>These are stickers, pens, key chains, mouse pads, t-shirts, caps, cosmetic bags etc. with your company’s name or logo. Almost anything can be branded for being given away at events (presentations, exhibitions), in the office to be used by your team or as a gift for purchase.</p><p>We have an offer even for those who prefer eco-friendly solutions, for example, items made of recycled or biodegradable materials.</p><p>Isn’t it awesome to spread your word through simple things people use daily?</p>','<p>&nbsp;</p>','promo','2018-11-25 13:14:57','2019-02-21 11:14:27'),(4,'3D Letters','3D Letters just like you imagine.','3d-letters','Make your reception sign even more showy by adding 3D letters. \nWe can offer you 3D letters in a variety of sizes, shapes and colors using such materials as wood, aluminum, PVC, foam or acrylic.','<p>Illuminate your inscription to make it more notable or combine with plaques to add some notes of sophistication. If you are not planning to change your interior for a long time or just want it solid, order a permanent installation. But if you want to achieve a floating effect, we will use pins and spacers on the backside of the letters. Just say.</p>','<p>&nbsp;</p>','3d-letters','2018-11-25 13:15:22','2019-02-21 12:22:42'),(11,'Reception signs','Communicate your professionalism with high-grade Reception Signs.','Reception signs','Reception sign is your indirect advocate. Being so obvious it leaves a powerful impression on your client, giving you his trust in advance.','<p>Your reception sign communicates your professionalism, values and an overall culture of your company. Silently, but effectively.From design to installation. Need a reception, office or lobby signage? We are at your service.</p>','<p>If you are tired of hearing a phrase “individual approach”, so do we, however we can do nothing but to work this way. Manufacturing a signage is a process of embodiment of your brand’s visual elements into 3-dimensionsional reality. Your brand becomes tangible in some sense. Now you transmit not only a color, curve of lines, but also a material which adds its own zest. Choose from a wide range of acrylic, aluminum, glass, wood, foam, vinyl, laminate in different colors, styles and finishes, and get your unique reception, office or lobby signage to meet and impress your clients from the first glance!</p>','reception-sign','2019-02-21 11:02:06','2019-02-21 12:24:09'),(12,'Acrylic and glass signs','Let Acrylic and Glass Signs speak of you.','Acrylic and glass signs','Acrylic and glass signs that meet and guide your clients, as well as make one of the first impressions. ','<p>You come across them everywhere – outdoors and indoors, at the entrance and behind the reception bar both of big and small companies. They should be laconic but meaningful. Reach it by selecting appropriate shape, color, finish and additional effects. We can make you a laser cut acrylic lettering, adhesive vinyl cut artwork, digitally printed one or a combination of them all.</p>','<p>&nbsp;</p>','glass','2019-02-21 11:03:17','2019-02-21 12:22:56'),(13,'Sandwich boards / A-frame','Attention catching Sandwich Boards/ A-Frames','Sandwich boards / A-frame','Sandwich boards or A-frame signs is a mobile and cost-effective way of promoting your offer or provide direction to the clients passing by your location.','<p>An attention catching outdoor advertising which is hard not to notice. No matter what you are intended to promote – a new shoe line, opening hours or a daily menu specials, a sandwich board is a simple still working tool to spark your potential clients’ interest and get them inside.</p>','<p><strong>There is a wide range of substrates your board can be made of</strong><i><strong> </strong>–<strong> </strong></i>plywood, aluminum, corrugated. Just choose what better fits your aesthetic requirements and budget. We can offer you an A-frame with changeable letters or snap open frame that allows to change graphics quickly. Choose wooden, plastic or aluminum frame for use both indoor and outdoor, no matter what weather is there today.</p><p>Foldable and transportable, available in different sizes, quantities, with durable handles and wheels – we have what you need.</p>','sandvich','2019-02-21 11:05:10','2019-02-21 11:15:26'),(14,'Illuminated Signs','Illuminated Signs','Illuminated Signs','Make it impossible not to notice you! Become a lighthouse in the sea of endless gloomy signs.','<p>Order an illuminated outdoor sign that will attract and lure inside or an indoor one to set the mood for your shop or office.<br>Our illuminated signs are durable and cost-effective. You can choose from a wide range of signs – from Pylon to Channel Letters. Especially popular nowadays is LED signage. LED (Light Emitting Diodes) ensure a wonderful illumination while being economical and undemanding in maintenance.<br>Rely on us and we will make you shine!</p>','<p>&nbsp;</p>','led-panels','2019-02-21 11:06:55','2019-02-21 11:06:55'),(15,'Sign Boxes/ Sign  Cabinets','Sign Boxes/ Sign Cabinets for your shop to be seen round-the-clock.','Sign Boxes/ Sign  Cabinets','Sign Boxes also knows as Sign Cabinets, as well as Fascia signage is an effective solution for attracting your clients round-the-clock.','<p>You can order either illuminated or non-illuminated sign box that will show your storefront off. We can manufacture you a sign that will perfectly go with your store, making it more visible and inviting. Moreover, these signs require minimum maintenance.</p>','<p>&nbsp;</p>','sign-boxes','2019-02-21 11:08:21','2019-02-21 12:23:12'),(16,'Channel Letters','Just look at those Channel Letters!','Channel Letters','These individual letters are playful, aren’t they? They spice up any building and make your business visible around the clock.','<p>You can choose standard letters, open faced, with reverse halo or front/back lit ones. We can make your channel letters of plastic or metal, in any color, and then either attach the construction right to the building facade or use a raceway or a wireway. Everything is up to you!</p>','<p>&nbsp;</p>','channel-letters','2019-02-21 11:09:14','2019-02-21 12:23:25'),(17,'Thin LED Panels','Catch attention and engage with our thin LED Panels.','Thin LED Panels','A perfect indoor tool for making your promotions more attention catching and engaging.','<p>Put a LED panel sign in your shop window to let each passerby know about your current promotion or just adorn an interior with witty texts. These panels perfectly complement financial institution, a retail store or café.&nbsp;<br>We offer panels that ensure an excellent true-color rendering without casting a shadow. There are many sizes of LED panels available, they come in a set with all electrical components, moreover LEDs are 75% more energy efficient than common fluorescent lamps.</p>','<p>&nbsp;</p>','led-panels','2019-02-21 11:10:01','2019-02-21 12:23:41'),(18,'Window Frosting','Need some privacy? Need Window Frosting.','Window Frosting','If you want to achieve an all-day privacy or hide an unpleasant view out of the window, frosted window film might be one of the best solutions.','<p>It’s<strong> </strong>a&nbsp;thin self-cling or self-adhesive back plastic which makes your glass look frosted and opaque as a result. These films add an individual touch to your room and require no special maintenance.</p><p>There are several options of window frosting if privacy is an issue:</p><p><strong>- Plain frosted film.</strong> Extra thin and colorless. Perfect for home and office.</p><p><strong>- White frost film.</strong> Denser than plain frosted film. The best option for bathrooms.</p><p>- <strong>Etch effect film</strong>. Usually used as a decoration. Come in four colors, has a sparky finish.</p>','<p>&nbsp;</p>','window-frosting','2019-02-21 11:12:29','2019-02-21 12:23:54');
/*!40000 ALTER TABLE `Services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Settings`
--

DROP TABLE IF EXISTS `Settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Settings`
--

LOCK TABLES `Settings` WRITE;
/*!40000 ALTER TABLE `Settings` DISABLE KEYS */;
INSERT INTO `Settings` VALUES (4,'hello@gtaimagesolutions.com','sergeikalpako@gmail.com, raywilhelm@yandex.ru','Subject 1, Subject 2, Subject 3, Else 4','43.7132796','-79.36697800000002','+1 (416) 522-4501','790 Eglinton Ave East Toronto, ON M4G 2L1','2018 GTA Image solutions Inc','https://www.facebook.com/','https://twitter.com/','https://www.instagram.com/','https://www.youtube.com/','2019-01-24 11:38:50','2019-02-27 16:09:22');
/*!40000 ALTER TABLE `Settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Teams`
--

DROP TABLE IF EXISTS `Teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Teams`
--

LOCK TABLES `Teams` WRITE;
/*!40000 ALTER TABLE `Teams` DISABLE KEYS */;
INSERT INTO `Teams` VALUES (2,'Nicolas Cage','Testing','57dd4ec94d36fa33ceb0583af7d03eaa1551286648219.jpg','2019-02-13 10:32:28','2019-02-27 16:57:28'),(3,'Nicolas Cage','Testing','8f2afdc6ff5ede7457881e9850e9d81e1551286692861.jpg','2019-02-13 10:32:36','2019-02-27 16:58:12'),(4,'Nicolas Cage','Testing','ab04d10ad5ac46752669dc243df9e75f1551286741536.jpg','2019-02-13 19:17:52','2019-02-27 16:59:01'),(5,'Nicolas Cage','Testing','b3871fa4f2e40e5c76c3b2dea4b942731551286762407.jpg','2019-02-27 16:59:22','2019-02-27 16:59:22');
/*!40000 ALTER TABLE `Teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (16,'Admin','gtaadmin','$2a$08$2M/m2ch.ajT/UArWuEigwO0.01G56PRa4/chKZ0x1j.EpmhRD1jyy','2018-12-09 03:21:24','2018-12-09 03:21:24');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WhyUs`
--

DROP TABLE IF EXISTS `WhyUs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `WhyUs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WhyUs`
--

LOCK TABLES `WhyUs` WRITE;
/*!40000 ALTER TABLE `WhyUs` DISABLE KEYS */;
INSERT INTO `WhyUs` VALUES (1,'We have a truly big experience in the industry, we know how things are done','experience','2019-02-21 16:24:01','2019-02-21 16:26:24'),(2,'We always do our best in order to help your business do its best','do-our-best','2019-02-21 16:24:10','2019-02-21 16:26:42'),(3,'We care about your time, comfort and budget','care','2019-02-21 16:24:16','2019-02-21 16:29:23'),(4,'We respect your vision even if it differs from ours','vision','2019-02-21 16:28:42','2019-02-21 16:28:57');
/*!40000 ALTER TABLE `WhyUs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Works`
--

DROP TABLE IF EXISTS `Works`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Works`
--

LOCK TABLES `Works` WRITE;
/*!40000 ALTER TABLE `Works` DISABLE KEYS */;
INSERT INTO `Works` VALUES (1,'Design Idea','design-idea','Billboards','Nicolas Cage','Testing','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\n',NULL,'<p><i>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</i></p>','<p><i>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</i></p>','084fdc77b134534dd91de95b4a98c3b91551276979676.jpg','32bb7e98337586db19dd60546efcf9bd1551276979789.jpg','2019-02-17 06:19:02','2019-02-27 16:27:09'),(2,'Design Idea 2','design-idea-2','Billboards','Billboards','Test company','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n',NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br>&nbsp;</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br>&nbsp;</p>','70e3cabb2ae96b336c655e91c4faeaaf1551284946373.jpg','8844d200191cbf1ed9bf0530f6b0db531551284946565.jpg','2019-02-17 06:21:14','2019-02-27 16:29:06'),(3,'Other','other','Other','Nick Cage','Test','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',NULL,'<p><i>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</i></p><p>&nbsp;</p><p><i>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</i></p><p>&nbsp;</p><p><i>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</i></p>','<p><i>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</i></p><p><i>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</i></p><p><i>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</i></p>','849dd12fc830b3e518f2a1aa6ef144221551285062170.jpg','a438fdbef54483f3f55812b6ca1380b51551285062318.jpg','2019-02-20 12:37:00','2019-02-27 16:31:02');
/*!40000 ALTER TABLE `Works` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-28 11:46:27
