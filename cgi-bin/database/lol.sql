-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2014 at 05:24 PM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `lol`
--

-- --------------------------------------------------------

--
-- Table structure for table `ebay`
--

CREATE TABLE IF NOT EXISTS `ebay` (
  `item_id` bigint(20) NOT NULL,
  `item_title` varchar(200) NOT NULL,
  `item_quan` int(5) NOT NULL,
  `item_price` float DEFAULT NULL,
  `item_desc` text,
  `item_ship_price` float DEFAULT NULL,
  `item_pic_url` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ebay`
--

INSERT INTO `ebay` (`item_id`, `item_title`, `item_quan`, `item_price`, `item_desc`, `item_ship_price`, `item_pic_url`) VALUES
(78435456, 'item testing', 4, 90, 'this is a descriptionb testing', 4.5, 'http://multi-medium.net/wp-content/uploads/2008/06/d90.jpg'),
(110152474949, 'Laptop AUS', 4, 12.9, 'this is just testing', 5.5, 'http://multi-medium.net/wp-content/uploads/2008/06/d90.jpg'),
(110152475103, 'Laptop AUS342', 4, 12.9, 'this is just testing', 5.5, 'http://multi-medium.net/wp-content/uploads/2008/06/d90.jpg'),
(110152475111, 'Laptop AUS333', 4, 12.9, 'this is just testing', 5.5, 'http://multi-medium.net/wp-content/uploads/2008/06/d90.jpg'),
(110152475120, 'Laptop AUS22243', 4, 12.9, 'this is just testing', 5.5, 'http://multi-medium.net/wp-content/uploads/2008/06/d90.jpg'),
(301364396024, 'test listing 9090', 4, 90, 'this is a descriptionb testing', 4.5, 'http://multi-medium.net/wp-content/uploads/2008/06/d90.jpg'),
(301364834601, 'Laptop AUS111', 4, 12.9, 'this is just testing', 5.5, 'http://multi-medium.net/wp-content/uploads/2008/06/d90.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ebay`
--
ALTER TABLE `ebay`
 ADD PRIMARY KEY (`item_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
