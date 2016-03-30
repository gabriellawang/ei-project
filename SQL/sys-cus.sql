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
-- Database: `sys-cus`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `username` varchar(25) NOT NULL,
  `password` varchar(16) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`username`, `password`, `name`, `phone`, `email`) VALUES
('jason', 'ei0001', 'Jason Wu Jia Wei', '6582679805', 'jason.wu.2014@sis.smu.edu.sg'),
('kwan', 'ei0005', 'Yu Kwan Ho', '6597966535', 'kwanho.yu.2014@sis.smu.edu.sg'),
('shuwei', 'ei0003', 'Wang Shuwei', '6594467316', 'sw.wang.2014@sis.smu.edu.sg'),
('zhengyuan', 'ei0004', 'Yu Zheng Yuan', '6598752805', 'zyyu.2014@sis.smu.edu.sg'),
('ziyu', 'ei0002', 'Zhou Ziyu', '6582888469', 'ziyu.zhou.2014@sis.smu.edu.sg');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
