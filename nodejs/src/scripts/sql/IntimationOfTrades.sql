-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 07, 2021 at 01:03 PM
-- Server version: 10.2.10-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ili`
--

-- --------------------------------------------------------

--
-- Table structure for table `IntimationOfTrades`
--

CREATE TABLE `IntimationOfTrades` (
  `id` int(11) NOT NULL,
  `cmId` int(11) NOT NULL,
  `tradeIntimationFor` int(11) NOT NULL,
  `tradeDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `intimationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `tradingType` int(11) NOT NULL,
  `transactionForAddition` int(11) NOT NULL,
  `transactionForDeduction` int(11) NOT NULL,
  `isin` int(11) NOT NULL,
  `preClearanceObtained` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `openingBalance` int(11) NOT NULL,
  `closingBalance` int(11) NOT NULL,
  `reason` int(11) NOT NULL,
  `regulation` int(11) NOT NULL,
  `createdBy` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifyBy` int(11) DEFAULT NULL,
  `modifyAt` timestamp NULL DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `iagree` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `IntimationOfTrades`
--
ALTER TABLE `IntimationOfTrades`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `IntimationOfTrades`
--
ALTER TABLE `IntimationOfTrades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
