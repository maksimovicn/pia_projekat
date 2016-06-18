-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2016 at 12:16 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `conferences_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_doc`
--

CREATE TABLE IF NOT EXISTS `auth_doc` (
  `idAuthor` bigint(20) NOT NULL,
  `idDocument` bigint(20) NOT NULL,
  PRIMARY KEY (`idAuthor`,`idDocument`),
  KEY `idDocument` (`idDocument`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `conference`
--

CREATE TABLE IF NOT EXISTS `conference` (
  `idConference` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `applyFrom` datetime DEFAULT NULL,
  `applyTo` datetime DEFAULT NULL,
  `maxDocsPerAuthor` int(11) DEFAULT NULL,
  `published` tinyint(1) DEFAULT NULL,
  `idCoordinator` bigint(20) NOT NULL,
  PRIMARY KEY (`idConference`),
  KEY `Conf_Coord` (`idCoordinator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `conf_fld`
--

CREATE TABLE IF NOT EXISTS `conf_fld` (
  `idConference` bigint(20) NOT NULL,
  `idField` bigint(20) NOT NULL,
  PRIMARY KEY (`idConference`,`idField`),
  KEY `idField` (`idField`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `conf_fld_rev`
--

CREATE TABLE IF NOT EXISTS `conf_fld_rev` (
  `idConference` bigint(20) NOT NULL,
  `idField` bigint(20) NOT NULL,
  `idReviewer` bigint(20) NOT NULL,
  `compentency` int(11) DEFAULT NULL,
  PRIMARY KEY (`idConference`,`idField`,`idReviewer`),
  KEY `idField` (`idField`),
  KEY `idReviewer` (`idReviewer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `conf_rev`
--

CREATE TABLE IF NOT EXISTS `conf_rev` (
  `idConference` bigint(20) NOT NULL,
  `idReviewer` bigint(20) NOT NULL,
  `count` int(11) NOT NULL,
  `accepted` tinyint(1) NOT NULL,
  PRIMARY KEY (`idConference`,`idReviewer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `document`
--

CREATE TABLE IF NOT EXISTS `document` (
  `idDocument` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `changesdeadline` datetime DEFAULT NULL,
  PRIMARY KEY (`idDocument`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `field`
--

CREATE TABLE IF NOT EXISTS `field` (
  `idField` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`idField`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `modification`
--

CREATE TABLE IF NOT EXISTS `modification` (
  `idModification` bigint(20) NOT NULL AUTO_INCREMENT,
  `idDocument` bigint(20) DEFAULT NULL,
  `idAuthor` bigint(20) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `file` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idModification`),
  KEY `idDocument` (`idDocument`,`idAuthor`),
  KEY `idAuthor` (`idAuthor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE IF NOT EXISTS `review` (
  `idReview` bigint(20) NOT NULL,
  `idDocument` bigint(20) DEFAULT NULL,
  `idReviewer` bigint(20) DEFAULT NULL,
  `due` datetime DEFAULT NULL,
  `comment` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `done` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idReview`),
  KEY `idDocument` (`idDocument`,`idReviewer`),
  KEY `idReviewer` (`idReviewer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE IF NOT EXISTS `schedule` (
  `idConference` bigint(20) NOT NULL,
  `idDocument` bigint(20) NOT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`idConference`,`idDocument`),
  KEY `schedule_ibfk_2` (`idDocument`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `idUser` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstname` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `org` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `photo` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isAuthor` tinyint(1) NOT NULL DEFAULT '0',
  `isReviewer` tinyint(1) NOT NULL DEFAULT '0',
  `isCoordinator` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_doc`
--
ALTER TABLE `auth_doc`
  ADD CONSTRAINT `auth_doc_ibfk_2` FOREIGN KEY (`idDocument`) REFERENCES `document` (`idDocument`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_doc_ibfk_1` FOREIGN KEY (`idAuthor`) REFERENCES `user` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `conference`
--
ALTER TABLE `conference`
  ADD CONSTRAINT `Conf_Coord` FOREIGN KEY (`idCoordinator`) REFERENCES `user` (`idUser`);

--
-- Constraints for table `conf_fld`
--
ALTER TABLE `conf_fld`
  ADD CONSTRAINT `conf_fld_ibfk_2` FOREIGN KEY (`idField`) REFERENCES `field` (`idField`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `conf_fld_ibfk_1` FOREIGN KEY (`idConference`) REFERENCES `conference` (`idConference`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `conf_fld_rev`
--
ALTER TABLE `conf_fld_rev`
  ADD CONSTRAINT `conf_fld_rev_ibfk_3` FOREIGN KEY (`idReviewer`) REFERENCES `user` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `conf_fld_rev_ibfk_1` FOREIGN KEY (`idConference`) REFERENCES `conference` (`idConference`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `conf_fld_rev_ibfk_2` FOREIGN KEY (`idField`) REFERENCES `field` (`idField`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `modification`
--
ALTER TABLE `modification`
  ADD CONSTRAINT `modification_ibfk_2` FOREIGN KEY (`idAuthor`) REFERENCES `user` (`idUser`),
  ADD CONSTRAINT `modification_ibfk_1` FOREIGN KEY (`idDocument`) REFERENCES `document` (`idDocument`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`idReviewer`) REFERENCES `user` (`idUser`),
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`idDocument`) REFERENCES `document` (`idDocument`);

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`idConference`) REFERENCES `conference` (`idConference`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `schedule_ibfk_2` FOREIGN KEY (`idDocument`) REFERENCES `document` (`idDocument`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
