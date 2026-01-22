-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 17, 2021 at 01:43 PM
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
-- Table structure for table `PledgeBalanceDisclosures`
--

CREATE TABLE `PledgeBalanceDisclosures` (
  `id` int(11) NOT NULL,
  `client` int(11) NOT NULL,
  `declarationDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `creationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `invocationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `releaseDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isin` int(11) NOT NULL,
  `balance` int(11) NOT NULL,
  `pledgeDisclosureDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `iagree` tinyint(4) DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `createdBy` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `PledgeBalanceDisclosures`
--
ALTER TABLE `PledgeBalanceDisclosures`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `PledgeBalanceDisclosures`
--
ALTER TABLE `PledgeBalanceDisclosures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
