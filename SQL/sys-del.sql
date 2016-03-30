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
-- Database: `sys-del`
--

-- --------------------------------------------------------

--
-- Table structure for table `deliverylog`
--

CREATE TABLE IF NOT EXISTS `deliverylog` (
  `orderID` varchar(25) NOT NULL,
  `deliveryID` varchar(20) NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`orderID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deliverylog`
--

INSERT INTO `deliverylog` (`orderID`, `deliveryID`, `status`) VALUES
('2CY72508HS414944D', 'delivery-01', 'finished'),
('42R26683M8190554S', 'delivery-01', 'finished'),
('63224529YP0353906', 'delivery-01', 'finished'),
('7248903664855741C', 'delivery-01', 'finished'),
('7TW66046EE7841453', 'delivery-01', 'finished'),
('8P1332371L7620918', 'delivery-01', 'finished'),
('9PE24040BS8828619', 'delivery-01', 'finished'),
('9PH48176KK179023A', 'delivery-01', 'finished');

-- --------------------------------------------------------

--
-- Table structure for table `info`
--

CREATE TABLE IF NOT EXISTS `info` (
  `id` varchar(20) NOT NULL,
  `password` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `info`
--

INSERT INTO `info` (`id`, `password`, `email`) VALUES
('delivery-01', '0001', 'yuan629@msn.com'),
('delivery-02', '0002', 'yuan629@msn.com'),
('delivery-03', '0003', 'yuan629@msn.com');

-- --------------------------------------------------------

--
-- Table structure for table `scope`
--

CREATE TABLE IF NOT EXISTS `scope` (
  `id` varchar(20) NOT NULL,
  `region` varchar(20) NOT NULL,
  PRIMARY KEY (`id`,`region`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `scope`
--

INSERT INTO `scope` (`id`, `region`) VALUES
('delivery-01', 'Novena'),
('delivery-01', 'Rochor'),
('delivery-02', 'Bishan'),
('delivery-02', 'Yishun'),
('delivery-03', 'Kallang');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
