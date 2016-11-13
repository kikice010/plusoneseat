-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 12, 2016 at 06:26 PM
-- Server version: 5.7.9
-- PHP Version: 5.6.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `plusoneseat`
--

-- --------------------------------------------------------

--
-- Table structure for table `meal_offer`
--

DROP TABLE IF EXISTS `meal_offer`;
CREATE TABLE IF NOT EXISTS `meal_offer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meal_type` varchar(20) NOT NULL,
  `meal_name` varchar(100) NOT NULL,
  `continent_id` varchar(2) NOT NULL,
  `country_id` int(11) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `min_seats` int(11) NOT NULL,
  `max_seats` int(11) NOT NULL,
  `price_per_seat` float NOT NULL,
  `meal_date` varchar(20) NOT NULL,
  `start_time` varchar(10) NOT NULL,
  `course_option` int(11) NOT NULL,
  `end_time` varchar(10) NOT NULL,
  `donation_type` varchar(20) NOT NULL,
  `number_of_donations` int(11) NOT NULL,
  `currency` varchar(10) NOT NULL,
  `host_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`),
  KEY `course_option` (`course_option`),
  KEY `meal_type` (`meal_type`),
  KEY `continent_id` (`continent_id`),
  KEY `host_id` (`host_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `meal_offer`
--
ALTER TABLE `meal_offer`
  ADD CONSTRAINT `meal_offer_ibfk_1` FOREIGN KEY (`continent_id`) REFERENCES `continents` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `meal_offer_ibfk_3` FOREIGN KEY (`course_option`) REFERENCES `course_option` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `meal_offer_ibfk_5` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `meal_offer_ibfk_6` FOREIGN KEY (`host_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
