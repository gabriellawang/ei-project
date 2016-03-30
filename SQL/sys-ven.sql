-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2016 at 10:38 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sys-ven`
--

-- --------------------------------------------------------

--
-- Table structure for table `deliveryscope`
--

CREATE TABLE IF NOT EXISTS `deliveryscope` (
  `region` varchar(20) NOT NULL,
  `vendor` varchar(20) NOT NULL,
  PRIMARY KEY (`region`,`vendor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deliveryscope`
--

INSERT INTO `deliveryscope` (`region`, `vendor`) VALUES
('Bishan', 'ven2'),
('Kallang', 'ven1'),
('Novena', 'ven3'),
('Rochor', 'ven2'),
('Rochor', 'ven3'),
('Yishun', 'ven4');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE IF NOT EXISTS `menus` (
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `vendor` varchar(20) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`name`, `description`, `vendor`, `price`) VALUES
('Cape Red Seedless Grapes 500G', 'Class 1 Crimson Seedless type. Country Of Origin: South Africa', 'ven2', 3.85),
('China Premium Fuji Apple 4S', 'Storage: Ambient. Country Of Origin: China', 'ven3', 4.65),
('Korean Fuji Apples 1KG', 'Country Of Origin: South Korea', 'ven1', 4.95),
('S&W Sweet 16 Pineapple (L)', 'High on the fertile plateaus of Bukidnon, S&W grows the best pineapples.', 'ven4', 2.8),
('Sunkist USA Lemon Bag 500G', 'Sunkist''s low sodium solution. The healthy and flavourful salt alternative.', 'ven3', 3.65),
('Thailand Young Coconut 1S', 'Country Of Origin: Thailand', 'ven2', 1.75),
('Zespri SunGold Kiwis 5S', '3 times Vitamin C of oranges. 10 times nutrition of apples. Sweet and juicy', 'ven1', 6.95);

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE IF NOT EXISTS `vendors` (
  `id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `name`, `address`) VALUES
('ven1', 'Fruit Tea', '5 Stadium Walk Singapore 397693'),
('ven2', 'Fruit Paradise', '53 Ang Mo Kio Ave 3 Singapore 569933'),
('ven3', 'Thai Fruits', '275 Thomson Road Novena Regency Singapore 307645'),
('ven4', 'Lim Poh Seng Fruits Store', '747 Yishun Street 72 Singapore 760747');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
