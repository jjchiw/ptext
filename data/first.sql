-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.36-community-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema ptext
--

CREATE DATABASE IF NOT EXISTS ptext;
USE ptext;

--
-- Definition of table `acos`
--

DROP TABLE IF EXISTS `acos`;
CREATE TABLE `acos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `foreign_key` int(10) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `lft` int(10) DEFAULT NULL,
  `rght` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `acos`
--

/*!40000 ALTER TABLE `acos` DISABLE KEYS */;
/*!40000 ALTER TABLE `acos` ENABLE KEYS */;


--
-- Definition of table `aros`
--

DROP TABLE IF EXISTS `aros`;
CREATE TABLE `aros` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `foreign_key` int(10) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `lft` int(10) DEFAULT NULL,
  `rght` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aros`
--

/*!40000 ALTER TABLE `aros` DISABLE KEYS */;
INSERT INTO `aros` (`id`,`parent_id`,`model`,`foreign_key`,`alias`,`lft`,`rght`) VALUES 
 (1,NULL,'Group',1,NULL,1,4),
 (2,1,'User',1,NULL,2,3);
/*!40000 ALTER TABLE `aros` ENABLE KEYS */;


--
-- Definition of table `aros_acos`
--

DROP TABLE IF EXISTS `aros_acos`;
CREATE TABLE `aros_acos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `aro_id` int(10) NOT NULL,
  `aco_id` int(10) NOT NULL,
  `_create` varchar(2) NOT NULL DEFAULT '0',
  `_read` varchar(2) NOT NULL DEFAULT '0',
  `_update` varchar(2) NOT NULL DEFAULT '0',
  `_delete` varchar(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ARO_ACO_KEY` (`aro_id`,`aco_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aros_acos`
--

/*!40000 ALTER TABLE `aros_acos` DISABLE KEYS */;
/*!40000 ALTER TABLE `aros_acos` ENABLE KEYS */;


--
-- Definition of table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pretext_id` int(10) unsigned NOT NULL,
  `text` text NOT NULL,
  `created` varchar(45) NOT NULL,
  `lat` float NOT NULL,
  `lng` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_comment_1` (`pretext_id`),
  CONSTRAINT `FK_comment_1` FOREIGN KEY (`pretext_id`) REFERENCES `pretexts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;


--
-- Definition of table `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groups`
--

/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` (`id`,`name`,`created`,`modified`) VALUES 
 (1,'administrators','2011-06-13 05:19:31','2011-06-13 05:19:31');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;


--
-- Definition of table `multimedias`
--

DROP TABLE IF EXISTS `multimedias`;
CREATE TABLE `multimedias` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pretext_id` int(10) unsigned NOT NULL,
  `type` varchar(45) NOT NULL,
  `url` varchar(45) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_multimedia_1` (`pretext_id`),
  CONSTRAINT `FK_multimedia_1` FOREIGN KEY (`pretext_id`) REFERENCES `pretexts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `multimedias`
--

/*!40000 ALTER TABLE `multimedias` DISABLE KEYS */;
INSERT INTO `multimedias` (`id`,`pretext_id`,`type`,`url`,`description`) VALUES 
 (1,1,'image','http://30pre-textos.tuerco.com/img/5-1.jpg','pre-texto 5 ubicado en caja de luz afuera del teatro lliure en el barrio de Gracia'),
 (2,1,'image','http://30pre-textos.tuerco.com/img/5-2.jpg','Close up pre-texto 5 ubicado en caja de luz afuera del teatro lliure en el barrio de Gracia');
/*!40000 ALTER TABLE `multimedias` ENABLE KEYS */;


--
-- Definition of table `pretexts`
--

DROP TABLE IF EXISTS `pretexts`;
CREATE TABLE `pretexts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) CHARACTER SET latin1 NOT NULL,
  `text` text CHARACTER SET latin1 NOT NULL,
  `created` varchar(45) CHARACTER SET latin1 NOT NULL,
  `lat` float NOT NULL,
  `lng` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pretexts`
--

/*!40000 ALTER TABLE `pretexts` DISABLE KEYS */;
INSERT INTO `pretexts` (`id`,`title`,`text`,`created`,`lat`,`lng`) VALUES 
 (1,'5-si-es-que','<p>Si es que hay personajes debemos agradecerle a Sheakespeare...</p>\r\n\r\n<p>Si es que hay Sheakspeare es gracias a que habemos personajes.</p>','2011-01-01',0,0);
/*!40000 ALTER TABLE `pretexts` ENABLE KEYS */;


--
-- Definition of table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` char(40) NOT NULL,
  `group_id` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`,`username`,`password`,`group_id`,`created`,`modified`) VALUES 
 (1,'admin','2e6f526bfb49939a5c25862898a3c01afa9cd2ca',1,'2011-06-13 05:19:39','2011-06-13 05:19:39');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
