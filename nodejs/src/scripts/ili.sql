-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 04, 2021 at 04:24 AM
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
-- Table structure for table `ClientCompanies`
--

CREATE TABLE `ClientCompanies` (
  `id` int(11) NOT NULL,
  `companyName` varchar(255) DEFAULT NULL,
  `nseCode` varchar(45) NOT NULL,
  `bseCode` varchar(45) NOT NULL,
  `registrationDate` date DEFAULT NULL,
  `businessNature` int(10) UNSIGNED DEFAULT NULL,
  `companyClass` tinyint(4) NOT NULL,
  `companyWebsite` varchar(50) NOT NULL,
  `securityListedClass` varchar(255) DEFAULT NULL,
  `tradingAllow` tinyint(1) DEFAULT 0,
  `thresholdPeriodicity` int(11) DEFAULT NULL,
  `thresholdValue` varchar(50) DEFAULT NULL,
  `thresholdQuantity` varchar(50) DEFAULT NULL,
  `approvalStatus` int(11) DEFAULT 0,
  `createdBy` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) NOT NULL,
  `modifiedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `reasonFor` varchar(255) DEFAULT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ClientCompanies`
--

INSERT INTO `ClientCompanies` (`id`, `companyName`, `nseCode`, `bseCode`, `registrationDate`, `businessNature`, `companyClass`, `companyWebsite`, `securityListedClass`, `tradingAllow`, `thresholdPeriodicity`, `thresholdValue`, `thresholdQuantity`, `approvalStatus`, `createdBy`, `createdAt`, `modifiedBy`, `modifiedAt`, `reasonFor`, `isDeleted`) VALUES
(1, 'Zota Health Care LImited', 'ZOTA', 'Null', '2021-05-02', 16, 2, 'www.zota.com', 'Equity shares', 0, NULL, NULL, NULL, 1, 1, '2021-05-03 12:31:40', 1, '2021-05-03 12:31:40', NULL, 0),
(2, 'Aegis Logistics Ltd.', 'AEGISCHEM', '500003', '2021-05-03', 2, 2, 'www.aegis.com', 'Equity shares,Debentures', 0, NULL, NULL, NULL, 0, 245, '2021-05-03 12:42:28', 245, '2021-05-03 12:42:28', NULL, 0),
(3, 'Atul Ltd.', 'ATUL', '500027', '2021-05-02', 5, 2, 'www.atul.com', 'Equity shares,Redeemable preference shares', 0, NULL, NULL, NULL, 0, 245, '2021-05-03 12:46:48', 245, '2021-05-03 12:46:48', NULL, 0),
(4, 'Exide Industries Ltd.', 'EXIDEIND', '500086', '2021-04-30', 20, 2, 'www.exide.com', 'Equity shares,Other securities', 0, NULL, NULL, NULL, 1, 245, '2021-05-03 12:49:28', 245, '2021-05-03 12:49:28', NULL, 0),
(5, 'IFCI Ltd.', 'IFCI', '500106', '2021-05-02', 15, 2, 'www.fmcg.com', 'Debentures', 0, NULL, NULL, NULL, 1, 245, '2021-05-03 13:12:36', 245, '2021-05-03 13:12:36', NULL, 0),
(6, 'N. B. I. Industrial Finance Company Limited', 'NBIFIN', 'Null', '2021-05-02', 14, 2, 'www.financial.com', 'Redeemable preference shares', 0, NULL, NULL, NULL, 1, 1, '2021-05-03 13:24:40', 1, '2021-05-03 13:24:40', NULL, 0),
(7, 'Bajaj Finance Limited', 'BAJFINANCE', '500034', '2021-05-02', 1, 2, 'https://asasasa.casa', 'Equity shares', 0, NULL, NULL, NULL, 1, 1, '2021-05-03 14:02:29', 1, '2021-05-03 14:02:29', NULL, 0),
(8, 'Wardwizard Innovations And Mobility Limited', 'Null', '538970', '2021-05-02', 1, 1, 'www.creenxa.com', 'Equity shares', 0, NULL, NULL, NULL, 0, 1, '2021-05-03 14:18:52', 1, '2021-05-03 14:18:52', NULL, 0),
(9, 'Cipla Ltd.', 'CIPLA', '500087', '2021-05-03', 16, 2, 'www.cipla.com', 'Equity shares,Debentures', 0, NULL, NULL, NULL, 1, 1, '2021-05-04 03:58:16', 1, '2021-05-04 03:58:16', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ClientCompanyAddressMaps`
--

CREATE TABLE `ClientCompanyAddressMaps` (
  `id` int(11) NOT NULL,
  `clientCompanyId` int(11) NOT NULL,
  `addressType` enum('Registered Office','Corporate Office','Sales Office') DEFAULT 'Registered Office',
  `address1` text DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `pin` int(11) DEFAULT NULL,
  `landlineNumber` varchar(45) DEFAULT NULL,
  `faxNumber` varchar(45) DEFAULT NULL,
  `emailId` varchar(45) DEFAULT NULL,
  `isDeleted` varchar(45) NOT NULL DEFAULT '0',
  `createdBy` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedAt` timestamp NULL DEFAULT NULL,
  `address2` text DEFAULT NULL,
  `address3` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ClientCompanyAddressMaps`
--

INSERT INTO `ClientCompanyAddressMaps` (`id`, `clientCompanyId`, `addressType`, `address1`, `country`, `state`, `city`, `pin`, `landlineNumber`, `faxNumber`, `emailId`, `isDeleted`, `createdBy`, `createdAt`, `modifiedBy`, `modifiedAt`, `address2`, `address3`) VALUES
(1, 1, 'Registered Office', 'Baner', NULL, 35, 'Kolkata', 700006, '0222786321', '7896547896', NULL, '0', 1, '2021-05-03 12:31:40', 1, '2021-05-03 12:31:40', '234', 'Regent'),
(2, 2, 'Registered Office', 'Baner', NULL, 21, 'Pune', 411021, '0222136547', '8974872315', NULL, '0', 245, '2021-05-03 12:42:28', 245, '2021-05-03 12:42:28', '21', 'Petrolpump'),
(3, 3, 'Registered Office', 'Pashan', NULL, 21, 'Mumbai', 411025, '0337412365', '9877896547', NULL, '0', 245, '2021-05-03 12:46:48', 245, '2021-05-03 12:46:48', 'regent', '309'),
(4, 4, 'Registered Office', 'Bavdhan', NULL, 21, 'Nasik', 422012, '0117563214', '9877845213', NULL, '0', 245, '2021-05-03 12:49:28', 245, '2021-05-03 12:49:28', '098', 'IT park'),
(5, 5, 'Registered Office', 'Dumdum', NULL, 35, 'kolkata', 700125, '0331245789', '8794521365', NULL, '0', 245, '2021-05-03 13:12:36', 245, '2021-05-03 13:12:36', 'metro station', 'Regent'),
(6, 6, 'Registered Office', 'A-type', NULL, 21, 'Pune', 700154, '0112457896', '7896321458', NULL, '0', 1, '2021-05-03 13:24:40', 1, '2021-05-03 13:24:40', '64/8', 'Regent'),
(7, 7, 'Registered Office', 'pune', NULL, 1, 'nashik', 422606, NULL, NULL, NULL, '0', 1, '2021-05-03 14:02:29', 1, '2021-05-03 14:02:29', NULL, NULL),
(8, 8, 'Registered Office', 'pune', NULL, 1, 'pune', 422606, NULL, NULL, NULL, '0', 1, '2021-05-03 14:18:52', 1, '2021-05-03 14:18:52', NULL, NULL),
(9, 9, 'Registered Office', 'Lane 1', NULL, 21, 'Pune', 411021, '0221458796', '7894563217', NULL, '0', 1, '2021-05-04 03:58:16', 1, '2021-05-04 03:58:16', 'T-16', 'Baner');

-- --------------------------------------------------------

--
-- Table structure for table `ClientCompanyApprovals`
--

CREATE TABLE `ClientCompanyApprovals` (
  `id` int(11) NOT NULL,
  `companyName` varchar(400) NOT NULL,
  `nseCode` varchar(200) NOT NULL,
  `bseCode` varchar(200) NOT NULL,
  `status` int(11) NOT NULL,
  `createdBy` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ClientCompanyUserMappings`
--

CREATE TABLE `ClientCompanyUserMappings` (
  `id` int(11) NOT NULL,
  `cmId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `isDeleted` tinyint(1) DEFAULT 0,
  `createdBy` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ClientCompanyUserMappings`
--

INSERT INTO `ClientCompanyUserMappings` (`id`, `cmId`, `userId`, `isDeleted`, `createdBy`, `createdAt`, `modifiedBy`, `modifiedAt`) VALUES
(1, 5, 265, 0, 245, '2021-05-03 13:15:30', 245, '2021-05-03 13:15:30'),
(2, 5, 266, 0, 245, '2021-05-03 13:15:30', 245, '2021-05-03 13:15:30'),
(3, 5, 267, 0, 245, '2021-05-03 13:15:30', 245, '2021-05-03 13:15:30'),
(4, 5, 268, 0, 245, '2021-05-03 13:15:30', 245, '2021-05-03 13:15:30'),
(5, 9, 245, 0, 1, '2021-05-04 03:59:13', 1, '2021-05-04 03:59:13');

-- --------------------------------------------------------

--
-- Table structure for table `Companies`
--

CREATE TABLE `Companies` (
  `id` int(11) NOT NULL,
  `companyLogo` varchar(255) DEFAULT NULL,
  `companyName` varchar(255) DEFAULT NULL,
  `nseCode` varchar(45) NOT NULL,
  `bseCode` varchar(45) NOT NULL,
  `registrationDate` date NOT NULL,
  `regularDisclosure` varchar(50) NOT NULL,
  `previousDisclosureDate` date NOT NULL,
  `nextDisclosureDate` date NOT NULL,
  `businessNature` int(10) UNSIGNED NOT NULL,
  `companyClass` tinyint(4) NOT NULL,
  `financialYearFrom` date NOT NULL,
  `financialYearTo` date NOT NULL,
  `companyWebsite` varchar(50) NOT NULL,
  `securityListedClass` varchar(255) NOT NULL,
  `thresholdPeriodicity` int(11) DEFAULT NULL,
  `thresholdValue` varchar(50) DEFAULT NULL,
  `thresholdQuantity` varchar(50) DEFAULT NULL,
  `tradingAllowdInClient` tinyint(4) DEFAULT NULL,
  `tradingAllowdInNonClient` tinyint(4) DEFAULT NULL,
  `createdBy` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) NOT NULL,
  `modifiedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `reasonFor` text DEFAULT NULL,
  `connectedPeriodicity` int(11) DEFAULT NULL,
  `connectedRupees` varchar(50) DEFAULT NULL,
  `connectedShares` varchar(50) DEFAULT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Companies`
--

INSERT INTO `Companies` (`id`, `companyLogo`, `companyName`, `nseCode`, `bseCode`, `registrationDate`, `regularDisclosure`, `previousDisclosureDate`, `nextDisclosureDate`, `businessNature`, `companyClass`, `financialYearFrom`, `financialYearTo`, `companyWebsite`, `securityListedClass`, `thresholdPeriodicity`, `thresholdValue`, `thresholdQuantity`, `tradingAllowdInClient`, `tradingAllowdInNonClient`, `createdBy`, `createdAt`, `modifiedBy`, `modifiedAt`, `reasonFor`, `connectedPeriodicity`, `connectedRupees`, `connectedShares`, `isDeleted`) VALUES
(6, 'logo.png', 'VORBITECH', 'VOR', '789654', '2021-05-02', '1', '2020-12-31', '2021-12-30', 3, 2, '2019-12-31', '2020-12-31', 'www.vorbitech.com', 'Equity shares,Redeemable preference shares', NULL, '', '', 2, 2, 1, '2021-05-03 12:29:56', 1, '2021-05-03 12:29:56', '', NULL, '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `CompanyAddressMaps`
--

CREATE TABLE `CompanyAddressMaps` (
  `id` int(11) NOT NULL,
  `companyId` int(11) NOT NULL,
  `addressType` enum('Registered Office','Corporate Office','Sales Office') DEFAULT 'Registered Office',
  `address` text DEFAULT NULL,
  `address1` text NOT NULL,
  `address2` text NOT NULL,
  `address3` text NOT NULL,
  `country` int(11) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `pin` int(11) DEFAULT NULL,
  `landlineNumber` varchar(45) DEFAULT NULL,
  `faxNumber` varchar(45) DEFAULT NULL,
  `emailId` varchar(45) DEFAULT NULL,
  `isDeleted` varchar(45) NOT NULL DEFAULT '0',
  `createdBy` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `lastModifiedBy` int(11) DEFAULT NULL,
  `lastUpdatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CompanyAddressMaps`
--

INSERT INTO `CompanyAddressMaps` (`id`, `companyId`, `addressType`, `address`, `address1`, `address2`, `address3`, `country`, `state`, `city`, `pin`, `landlineNumber`, `faxNumber`, `emailId`, `isDeleted`, `createdBy`, `createdAt`, `lastModifiedBy`, `lastUpdatedAt`) VALUES
(10, 4, 'Registered Office', NULL, 'Baner', '', '', NULL, '21', 'Pune', 411041, '08338254566', '9922016773', NULL, '0', 1, '2021-04-14 12:02:26', NULL, NULL),
(26, 5, 'Registered Office', NULL, 'Crenexa', 'Baner', 'pune', NULL, '27', 'pune', 422606, '1234567890', '9860105202', NULL, '0', 1, '2021-04-29 17:52:47', NULL, NULL),
(29, 6, 'Registered Office', NULL, 'T-16', '307', 'Baner', NULL, '21', 'Pune', 411021, '0222789213', '7894785632', NULL, '0', 1, '2021-05-03 12:29:56', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `company_Companies`
--

CREATE TABLE `company_Companies` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company_Companies`
--

INSERT INTO `company_Companies` (`id`, `name`) VALUES
(1, 'Material Subsidiary Company'),
(2, 'Non Material Subsidiary Company'),
(3, 'Associate Company'),
(4, 'Holding Company'),
(5, 'Joint Venture Company'),
(6, 'NA');

-- --------------------------------------------------------

--
-- Table structure for table `ConnectedPersons`
--

CREATE TABLE `ConnectedPersons` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `organizationName` varchar(200) DEFAULT NULL,
  `orgPANNo` text DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `isMinor` varchar(50) DEFAULT NULL,
  `gardianPANNo` text DEFAULT NULL,
  `panNo` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `mobileNo` bigint(20) DEFAULT NULL,
  `alternateMobNo` bigint(20) DEFAULT NULL,
  `landlineNo` bigint(20) DEFAULT NULL,
  `emailId` varchar(200) DEFAULT NULL,
  `dateOfAddition` timestamp NULL DEFAULT NULL,
  `dateOfCessation` timestamp NULL DEFAULT NULL,
  `relationship` varchar(200) DEFAULT NULL,
  `isEmployee` tinyint(1) DEFAULT NULL,
  `idInfo` varchar(200) DEFAULT NULL,
  `idNumber` varchar(400) DEFAULT NULL,
  `effectiveFrom` timestamp NULL DEFAULT NULL,
  `effectiveTo` timestamp NULL DEFAULT NULL,
  `attachment` varchar(200) DEFAULT NULL,
  `designation` varchar(200) DEFAULT NULL,
  `desigEffectiveFrom` timestamp NULL DEFAULT NULL,
  `desigEffectiveTo` timestamp NULL DEFAULT NULL,
  `department` varchar(200) DEFAULT NULL,
  `deptEffectiveFrom` timestamp NULL DEFAULT NULL,
  `deptEffectiveTo` timestamp NULL DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `createdBy` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) NOT NULL,
  `modifiedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ConnectedPersons`
--

INSERT INTO `ConnectedPersons` (`id`, `name`, `organizationName`, `orgPANNo`, `category`, `isMinor`, `gardianPANNo`, `panNo`, `address`, `mobileNo`, `alternateMobNo`, `landlineNo`, `emailId`, `dateOfAddition`, `dateOfCessation`, `relationship`, `isEmployee`, `idInfo`, `idNumber`, `effectiveFrom`, `effectiveTo`, `attachment`, `designation`, `desigEffectiveFrom`, `desigEffectiveTo`, `department`, `deptEffectiveFrom`, `deptEffectiveTo`, `deleted`, `createdBy`, `createdAt`, `modifiedBy`, `modifiedAt`, `status`) VALUES
(1, 'Diya Gupta', 'Crenexa', 'ASDFG2341W', 1, '0', 'SEDRFW3432Q', 'ZXCVB1211W', 'Pune', 7489784512, NULL, NULL, 'Pooja.gupta@crenexa.com', NULL, NULL, NULL, 1, '3', '7896541239', '2021-05-02 18:30:00', NULL, NULL, 'Business Analytics', '2021-05-02 18:30:00', '2021-05-02 18:30:00', 'PM', '2021-05-02 18:30:00', '2021-05-02 18:30:00', 0, 245, '2021-05-03 12:51:50', 245, '2021-05-03 12:51:50', 0),
(2, 'Priya Gupta', NULL, NULL, 2, NULL, NULL, 'ASDFG2312W', 'Mumbai', 9874587489, NULL, NULL, 'Pooja.gupta@crenexa.com', '2021-05-01 18:30:00', NULL, 'Sister', 1, '2', NULL, '2021-05-02 18:30:00', NULL, NULL, 'HR', '2021-05-02 18:30:00', '2021-05-02 18:30:00', 'IT', '2021-05-02 18:30:00', '2021-05-02 18:30:00', 0, 245, '2021-05-03 12:55:07', 245, '2021-05-03 12:55:07', 0),
(3, 'Ganesh Bhabad', NULL, NULL, 2, NULL, NULL, 'ABE1234566', 'Pune', 7719827827, NULL, NULL, 'ganesh.bhabad@crenexa.com', '2021-05-02 18:30:00', '2021-05-01 18:30:00', 'Brother', 0, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 267, '2021-05-03 12:57:45', 267, '2021-05-03 12:57:45', 0),
(4, 'Aman Verma', 'Vorbicon', NULL, 3, NULL, NULL, 'QAZXS1900Q', 'Mumbai', 8794174123, NULL, NULL, 'Pooja.gupta@crenexa.com', '2021-05-02 18:30:00', NULL, 'other', 1, '3', NULL, '2021-05-02 18:30:00', NULL, NULL, 'CM', '2021-05-02 18:30:00', NULL, 'DM', '2021-05-02 18:30:00', NULL, 0, 245, '2021-05-03 13:10:43', 245, '2021-05-03 13:10:43', 0),
(5, 'Nupur', NULL, 'AAAPZ1234C', 2, NULL, NULL, 'AAAPZ1234C', 'Pune', 7719827827, NULL, NULL, 'nrshinkar@gmail.com', '2021-05-01 18:30:00', '2021-05-02 18:30:00', 'Sister', 0, '2', 'AAAPZ1234C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '2021-05-03 14:55:02', 1, '2021-05-03 14:55:02', 0);

-- --------------------------------------------------------

--
-- Table structure for table `Countries`
--

CREATE TABLE `Countries` (
  `id` int(11) NOT NULL,
  `country` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Countries`
--

INSERT INTO `Countries` (`id`, `country`) VALUES
(1, 'Afghanistan'),
(2, 'Albania'),
(3, 'Algeria'),
(4, 'Andorra'),
(5, 'Angola'),
(6, 'Antigua and Barbuda'),
(7, 'Argentina'),
(8, 'Armenia'),
(9, 'Australia'),
(10, 'Austria'),
(11, 'Austrian Empire'),
(12, 'Azerbaijan'),
(13, 'Baden*'),
(14, 'Bahamas, The'),
(15, 'Bahrain'),
(16, 'Bangladesh'),
(17, 'Barbados'),
(18, 'Bavaria*'),
(19, 'Belarus'),
(20, 'Belgium'),
(21, 'Belize'),
(22, 'Benin (Dahomey)'),
(23, 'Bolivia'),
(24, 'Bosnia and Herzegovina'),
(25, 'Botswana'),
(26, 'Brazil'),
(27, 'Brunei'),
(28, 'Brunswick and Lüneburg'),
(29, 'Bulgaria'),
(30, 'Burkina Faso (Upper Volta)'),
(31, 'Burma'),
(32, 'Burundi'),
(33, 'Cabo Verde'),
(34, 'Cambodia'),
(35, 'Cameroon'),
(36, 'Canada'),
(37, 'Cayman Islands, The'),
(38, 'Central African Republic'),
(39, 'Central American Federation*'),
(40, 'Chad'),
(41, 'Chile'),
(42, 'China'),
(43, 'Colombia'),
(44, 'Comoros'),
(45, 'Congo Free State, The'),
(46, 'Costa Rica'),
(47, 'Cote d’Ivoire (Ivory Coast)'),
(48, 'Croatia'),
(49, 'Cuba'),
(50, 'Cyprus'),
(51, 'Czechia'),
(52, 'Czechoslovakia'),
(53, 'Democratic Republic of the Congo'),
(54, 'Denmark'),
(55, 'Djibouti'),
(56, 'Dominica'),
(57, 'Dominican Republic'),
(58, 'Duchy of Parma, The*'),
(59, 'East Germany (German Democratic Republic)'),
(60, 'Ecuador'),
(61, 'Egypt'),
(62, 'El Salvador'),
(63, 'Equatorial Guinea'),
(64, 'Eritrea'),
(65, 'Estonia'),
(66, 'Eswatini'),
(67, 'Ethiopia'),
(68, 'Federal Government of Germany (1848-49)*'),
(69, 'Fiji'),
(70, 'Finland'),
(71, 'France'),
(72, 'Gabon'),
(73, 'Gambia, The'),
(74, 'Georgia'),
(75, 'Germany'),
(76, 'Ghana'),
(77, 'Grand Duchy of Tuscany, The*'),
(78, 'Greece'),
(79, 'Grenada'),
(80, 'Guatemala'),
(81, 'Guinea'),
(82, 'Guinea-Bissau'),
(83, 'Guyana'),
(84, 'Haiti'),
(85, 'Hanover*'),
(86, 'Hanseatic Republics*'),
(87, 'Hawaii*'),
(88, 'Hesse*'),
(89, 'Holy See'),
(90, 'Honduras'),
(91, 'Hungary'),
(92, 'Iceland'),
(93, 'India'),
(94, 'Indonesia'),
(95, 'Iran'),
(96, 'Iraq'),
(97, 'Ireland'),
(98, 'Israel'),
(99, 'Italy'),
(100, 'Jamaica'),
(101, 'Japan'),
(102, 'Jordan'),
(103, 'Kazakhstan'),
(104, 'Kenya'),
(105, 'Kingdom of Serbia/Yugoslavia*'),
(106, 'Kiribati'),
(107, 'Korea'),
(108, 'Kosovo'),
(109, 'Kuwait'),
(110, 'Kyrgyzstan'),
(111, 'Laos'),
(112, 'Latvia'),
(113, 'Lebanon'),
(114, 'Lesotho'),
(115, 'Lew Chew (Loochoo)*'),
(116, 'Liberia'),
(117, 'Libya'),
(118, 'Liechtenstein'),
(119, 'Lithuania'),
(120, 'Luxembourg'),
(121, 'Madagascar'),
(122, 'Malawi'),
(123, 'Malaysia'),
(124, 'Maldives'),
(125, 'Mali'),
(126, 'Malta'),
(127, 'Marshall Islands'),
(128, 'Mauritania'),
(129, 'Mauritius'),
(130, 'Mecklenburg-Schwerin*'),
(131, 'Mecklenburg-Strelitz*'),
(132, 'Mexico'),
(133, 'Micronesia'),
(134, 'Moldova'),
(135, 'Monaco'),
(136, 'Mongolia'),
(137, 'Montenegro'),
(138, 'Morocco'),
(139, 'Mozambique'),
(140, 'Namibia'),
(141, 'Nassau*'),
(142, 'Nauru'),
(143, 'Nepal'),
(144, 'Netherlands, The'),
(145, 'New Zealand'),
(146, 'Nicaragua'),
(147, 'Niger'),
(148, 'Nigeria'),
(149, 'North German Confederation*'),
(150, 'North German Union*'),
(151, 'North Macedonia'),
(152, 'Norway'),
(153, 'Oldenburg*'),
(154, 'Oman'),
(155, 'Orange Free State*'),
(156, 'Pakistan'),
(157, 'Palau'),
(158, 'Panama'),
(159, 'Papal States*'),
(160, 'Papua New Guinea'),
(161, 'Paraguay'),
(162, 'Peru'),
(163, 'Philippines'),
(164, 'Piedmont-Sardinia*'),
(165, 'Poland'),
(166, 'Portugal'),
(167, 'Qatar'),
(168, 'Republic of Genoa*'),
(169, 'Republic of Korea (South Korea)'),
(170, 'Republic of the Congo'),
(171, 'Romania'),
(172, 'Russia'),
(173, 'Rwanda'),
(174, 'Saint Kitts and Nevis'),
(175, 'Saint Lucia'),
(176, 'Saint Vincent and the Grenadines'),
(177, 'Samoa'),
(178, 'San Marino'),
(179, 'Sao Tome and Principe'),
(180, 'Saudi Arabia'),
(181, 'Schaumburg-Lippe*'),
(182, 'Senegal'),
(183, 'Serbia'),
(184, 'Seychelles'),
(185, 'Sierra Leone'),
(186, 'Singapore'),
(187, 'Slovakia'),
(188, 'Slovenia'),
(189, 'Solomon Islands, The'),
(190, 'Somalia'),
(191, 'South Africa'),
(192, 'South Sudan'),
(193, 'Spain'),
(194, 'Sri Lanka'),
(195, 'Sudan'),
(196, 'Suriname'),
(197, 'Sweden'),
(198, 'Switzerland'),
(199, 'Syria'),
(200, 'Tajikistan'),
(201, 'Tanzania'),
(202, 'Texas*'),
(203, 'Thailand'),
(204, 'Timor-Leste'),
(205, 'Togo'),
(206, 'Tonga'),
(207, 'Trinidad and Tobago'),
(208, 'Tunisia'),
(209, 'Turkey'),
(210, 'Turkmenistan'),
(211, 'Tuvalu'),
(212, 'Two Sicilies*'),
(213, 'Uganda'),
(214, 'Ukraine'),
(215, 'Union of Soviet Socialist'),
(216, 'Republics*'),
(217, 'United Arab Emirates, The'),
(218, 'United Kingdom, The'),
(219, 'Uruguay'),
(220, 'Uzbekistan'),
(221, 'Vanuatu'),
(222, 'Venezuela'),
(223, 'Vietnam'),
(224, 'Württemberg*'),
(225, 'Yemen'),
(226, 'Zambia'),
(227, 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `Departments`
--

CREATE TABLE `Departments` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Departments`
--

INSERT INTO `Departments` (`id`, `name`, `status`) VALUES
(1, 'IT', 0),
(2, 'HR', 0);

-- --------------------------------------------------------

--
-- Table structure for table `DesignatedPersons`
--

CREATE TABLE `DesignatedPersons` (
  `id` int(11) NOT NULL,
  `insiderLensId` int(11) DEFAULT NULL,
  `employeeId` int(11) DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `panNo` bigint(20) NOT NULL,
  `landlineNo` bigint(20) NOT NULL,
  `mobileNo` bigint(20) NOT NULL,
  `alternateNo` bigint(20) DEFAULT NULL,
  `emailId` varchar(200) NOT NULL,
  `nationality` int(11) NOT NULL,
  `additionDate` timestamp NULL DEFAULT NULL,
  `deactivationDate` timestamp NULL DEFAULT NULL,
  `deactivationReason` varchar(200) DEFAULT NULL,
  `relatedCompany` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `idInfo` int(11) NOT NULL,
  `idNumber` int(11) NOT NULL,
  `effectiveFrom` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `effectiveTo` timestamp NULL DEFAULT NULL,
  `attachment` varchar(200) DEFAULT NULL,
  `designation` int(11) NOT NULL,
  `desigEffectiveFrom` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `desigEffectiveTo` timestamp NULL DEFAULT NULL,
  `department` int(11) NOT NULL,
  `deptEffectiveFrom` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deptEffectiveTo` int(11) NOT NULL,
  `instituteName` varchar(400) DEFAULT NULL,
  `qualification` varchar(200) DEFAULT NULL,
  `passingYear` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Designations`
--

CREATE TABLE `Designations` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Designations`
--

INSERT INTO `Designations` (`id`, `name`, `status`) VALUES
(1, 'Associate Software Engineer', 0),
(2, 'Software Engineer', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ISINs`
--

CREATE TABLE `ISINs` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `deleted` tinyint(4) DEFAULT 0,
  `createdBy` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ISINs`
--

INSERT INTO `ISINs` (`id`, `code`, `name`, `deleted`, `createdBy`, `createdAt`, `modifiedBy`, `modifiedAt`) VALUES
(1, 'US0378331005', 'FIRST', 0, 1, '2021-04-26 18:31:52', 1, '2021-04-26 18:31:52'),
(2, 'IN5632428278', 'Equity', 0, 1, '2021-04-27 07:04:45', NULL, '2021-04-27 07:04:45'),
(3, 'INE043C01014', 'Reedemable debentures ', 0, 1, '2021-04-27 07:05:23', 1, '2021-04-27 07:05:23'),
(4, 'AS78925ZSD38', 'Equity', 0, 1, '2021-04-27 08:22:51', NULL, '2021-04-27 08:22:51'),
(5, 'AA1111111111', 'DBAS', 0, 1, '2021-04-28 04:43:44', NULL, '2021-04-28 04:43:44'),
(6, 'QW1234567890', 'Demo', 0, 1, '2021-04-28 11:49:12', NULL, '2021-04-28 11:49:12'),
(7, 'IN3265987412', 'Redeemable debentures', 0, 1, '2021-04-28 13:19:01', NULL, '2021-04-28 13:19:01'),
(8, 'IN6532983232', 'Equity shares', 0, 1, '2021-04-28 13:21:06', 1, '2021-04-28 13:21:06'),
(9, 'INE043C01078', 'Equitytest', 0, 1, '2021-05-01 06:25:39', NULL, '2021-05-01 06:25:39');

-- --------------------------------------------------------

--
-- Table structure for table `Nationalities`
--

CREATE TABLE `Nationalities` (
  `id` int(10) UNSIGNED NOT NULL,
  `nationality` varchar(255) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Nationalities`
--

INSERT INTO `Nationalities` (`id`, `nationality`) VALUES
(2, 'Afgan'),
(3, 'Albanian'),
(4, 'Algerian'),
(5, 'American'),
(6, 'Andorran'),
(7, 'Angolan'),
(8, 'Antiguans'),
(9, 'Argentinean'),
(10, 'Armenian'),
(11, 'Argentinian'),
(12, 'Azerbaijani'),
(13, 'Bahamian'),
(14, 'Bahraini'),
(15, 'Bangladeshi'),
(16, 'Barbadian'),
(17, 'Barbudans'),
(18, 'Batswana'),
(19, 'Belarusian'),
(20, 'Belgian'),
(21, 'Belizean'),
(22, 'Beninese'),
(23, 'Bhutanese'),
(24, 'Bolivian'),
(25, 'Bosnian'),
(26, 'Brazilian'),
(27, 'British'),
(28, 'Bruneian'),
(29, 'Bulgarian'),
(30, 'Burkinabe'),
(31, 'Burmese'),
(32, 'Burundian'),
(33, 'Cambodian'),
(34, 'Cameroonian'),
(35, 'Canadian'),
(36, 'Cape Verdean'),
(37, 'Central African'),
(38, 'Chadian'),
(39, 'Chilean'),
(40, 'Chinese'),
(41, 'Colombian'),
(42, 'Comoran'),
(43, 'Congolese'),
(44, 'Costa Rican'),
(45, 'Croatian'),
(46, 'Cuban'),
(47, 'Cypriot'),
(48, 'Czech'),
(49, 'Danish'),
(50, 'Djibouti'),
(51, 'Dominican'),
(52, 'Dutch'),
(53, 'East Timorese'),
(54, 'Ecuadorean'),
(55, 'Egyptian'),
(56, 'Emirian'),
(57, 'Equatorial Guinean'),
(58, 'Eritrean'),
(59, 'Estonian'),
(60, 'Ethiopian'),
(61, 'Fijian'),
(62, 'Filipino'),
(63, 'Finnish'),
(64, 'French'),
(65, 'Gabonese'),
(66, 'Gambian'),
(67, 'Georgian'),
(68, 'German'),
(69, 'Ghanaian'),
(70, 'Greek'),
(71, 'Grenadian'),
(72, 'Guatemalan'),
(73, 'Guinean'),
(74, 'Guyanese'),
(75, 'Haitian'),
(76, 'Herzegovinian'),
(77, 'Honduran'),
(78, 'Hungarian'),
(79, 'Icelander'),
(80, 'Indian'),
(81, 'Indonesian'),
(82, 'Iranian'),
(83, 'Iraqi'),
(84, 'Irish'),
(85, 'Israeli'),
(86, 'Italian'),
(87, 'Ivorian'),
(88, 'Jamaican'),
(89, 'Japanese'),
(90, 'Jordanian'),
(91, 'Kazakhstani'),
(92, 'Kenyan'),
(93, 'Kittian and Nevisian'),
(94, 'Kuwaiti'),
(95, 'Kyrgyz'),
(96, 'Laotian'),
(97, 'Latvian'),
(98, 'Lebanese'),
(99, 'Liberian'),
(100, 'Libyan'),
(101, 'Liechtensteiner'),
(102, 'Lithuanian'),
(103, 'Luxembourger'),
(104, 'Macedonian'),
(105, 'Malagasy'),
(106, 'Malawian'),
(107, 'Malaysian'),
(108, 'Maldivan'),
(109, 'Malian'),
(110, 'Maltese'),
(111, 'Marshallese'),
(112, 'Mauritanian'),
(113, 'Mauritian'),
(114, 'Mexican'),
(115, 'Micronesian'),
(116, 'Moldovan'),
(117, 'Monacan'),
(118, 'Mongolian'),
(119, 'Moroccan'),
(120, 'Mosotho'),
(121, 'Mozambican'),
(122, 'Namibian'),
(123, 'Nauruan'),
(124, 'Nepalese'),
(125, 'New Zealander'),
(126, 'Nigerien'),
(127, 'North Korean'),
(128, 'Northern Irish'),
(129, 'Norwegian'),
(130, 'Omani'),
(131, 'Pakistani'),
(132, 'Palauan'),
(133, 'Panamanian'),
(134, 'Paraguayan'),
(135, 'Peruvian'),
(136, 'Polish'),
(137, 'Portuguese'),
(138, 'Qatari'),
(139, 'Romanian'),
(140, 'Russian'),
(141, 'Rwandan'),
(142, 'Saint Lucian'),
(143, 'Salvadoran'),
(144, 'Samoan'),
(145, 'San Marinese'),
(146, 'Sao Tomean'),
(147, 'Saudi'),
(148, 'Scottish'),
(149, 'Senegalese'),
(150, 'Serbian'),
(151, 'Seychellois'),
(152, 'Sierra Leonean'),
(153, 'Singaporean'),
(154, 'Slovakian'),
(155, 'Slovenian'),
(156, 'Somali'),
(157, 'South African'),
(158, 'South Korean'),
(159, 'Spanish'),
(160, 'Sri Lankan'),
(161, 'Sudanese'),
(162, 'Surinamer'),
(163, 'Swazi'),
(164, 'Swedish'),
(165, 'Swiss'),
(166, 'Syrian'),
(167, 'Taiwanese'),
(168, 'Tajik'),
(169, 'Tanzanian'),
(170, 'Thai'),
(171, 'Togolese'),
(172, 'Tongan'),
(173, 'Tunisian'),
(174, 'Turkish'),
(175, 'Tuvaluan'),
(176, 'Ugandan'),
(177, 'Ukrainian'),
(178, 'Uruguayan'),
(179, 'Uzbekistani'),
(180, 'Venezuelan'),
(181, 'Vietnamese'),
(182, 'Welsh'),
(183, 'Yemenite'),
(184, 'Zambian'),
(185, 'Zimbabwean');

-- --------------------------------------------------------

--
-- Table structure for table `NatureOfBusinesses`
--

CREATE TABLE `NatureOfBusinesses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `NatureOfBusinesses`
--

INSERT INTO `NatureOfBusinesses` (`id`, `name`) VALUES
(1, 'Agriculture'),
(2, 'Auto'),
(3, 'Automobiles'),
(4, 'Banking'),
(5, 'Biotechnology'),
(6, 'Cement'),
(7, 'Component'),
(8, 'Consumer'),
(9, 'Education'),
(10, 'Engineering'),
(11, 'Entertainment'),
(12, 'Electricity Generation'),
(13, 'Electricity Supply'),
(14, 'Financial'),
(15, 'Food'),
(16, 'Healthcare'),
(17, 'Housing Finance'),
(18, 'Industry Gems'),
(19, 'Infrastructure Insurance IT and ITES Manufacturing'),
(20, 'Insurance'),
(21, 'Jewellery'),
(22, 'Markets'),
(23, 'NBFC'),
(24, 'Oil and Gas'),
(25, 'Pharmaceuticals'),
(26, 'Real Estate'),
(27, 'Research'),
(28, 'Sanitation'),
(29, 'Services'),
(30, 'Training'),
(31, 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `PreClearanceRequests`
--

CREATE TABLE `PreClearanceRequests` (
  `id` int(11) NOT NULL,
  `clientCompany` int(11) NOT NULL,
  `requestDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `quantityRequest` int(11) NOT NULL,
  `tradingType` varchar(100) NOT NULL,
  `securityType` varchar(100) NOT NULL,
  `ISIN` int(11) NOT NULL,
  `lastDateOfProposedTrading` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `estimatedValue` int(11) NOT NULL,
  `isUPSIProcess` int(11) NOT NULL,
  `statusOfRequest` int(11) DEFAULT 0 COMMENT '0.pending, 1.approved, 2.disapproved 3.partiallyApprove',
  `quantityApproved` int(11) DEFAULT NULL,
  `reasonForDisapproved` varchar(200) DEFAULT NULL,
  `approvedBy` int(11) DEFAULT NULL,
  `approvedAt` timestamp NULL DEFAULT current_timestamp(),
  `deleted` int(11) DEFAULT 0,
  `createdBy` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `lastModifiedBy` int(11) DEFAULT NULL,
  `lastModifiedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `lastDateOfApprovedTrading` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `PreClearanceRequests`
--

INSERT INTO `PreClearanceRequests` (`id`, `clientCompany`, `requestDate`, `quantityRequest`, `tradingType`, `securityType`, `ISIN`, `lastDateOfProposedTrading`, `estimatedValue`, `isUPSIProcess`, `statusOfRequest`, `quantityApproved`, `reasonForDisapproved`, `approvedBy`, `approvedAt`, `deleted`, `createdBy`, `createdAt`, `lastModifiedBy`, `lastModifiedAt`, `lastDateOfApprovedTrading`) VALUES
(2, 80, '2021-04-28 10:47:31', 34, '2', '45', 1, '2021-04-05 18:30:00', 56, 1, 2, NULL, NULL, 1, '2021-04-27 05:57:53', 0, 176, '2021-04-23 07:12:46', 1, '2021-04-23 07:12:46', NULL),
(3, 60, '2021-04-28 10:47:31', 5000, '1', '1234', 1, '2021-04-22 18:30:00', 2547894, 1, 1, NULL, NULL, 1, '2021-04-27 06:13:27', 0, 176, '2021-04-23 11:09:22', 1, '2021-04-23 11:09:22', NULL),
(4, 61, '2021-04-28 10:47:31', 2000, '2', '7489', 1, '2021-04-03 18:30:00', 789654, 1, 1, 2000, NULL, 1, '2021-04-28 10:41:13', 0, 176, '2021-04-23 11:17:59', 1, '2021-04-23 11:17:59', '2021-04-27 18:30:00'),
(5, 86, '2021-04-28 10:47:31', 100, '1', 'Equity', 1, '2021-04-26 18:30:00', 100000, 2, 1, 121, NULL, 1, '2021-04-28 10:43:17', 0, 176, '2021-04-27 03:25:03', 1, '2021-04-27 03:25:03', '2021-04-27 18:30:00'),
(6, 73, '2021-04-28 10:48:31', 12, '1', 'equity', 1, '2021-04-26 18:30:00', 12000, 2, 1, 1111, NULL, 1, '2021-04-28 10:48:31', 0, 176, '2021-04-27 05:44:44', 1, '2021-04-27 05:44:44', '2021-04-19 18:30:00'),
(7, 73, '2021-04-28 11:20:35', 12, '1', 'equity', 1, '2021-04-26 18:30:00', 12000, 2, 1, 12, NULL, 1, '2021-04-28 11:20:35', 0, 176, '2021-04-27 05:44:44', 1, '2021-04-27 05:44:44', '2021-04-27 18:30:00'),
(8, 86, '2021-04-28 11:25:21', 20000, '1', '', 1, '2021-06-07 18:30:00', 20, 1, 1, 22, NULL, 1, '2021-04-28 11:25:21', 0, 176, '2021-04-28 07:06:03', 1, '2021-04-28 07:06:03', '2021-04-27 18:30:00'),
(9, 86, '2021-04-28 10:47:31', 2500, '2', '', 1, '2021-05-27 18:30:00', 200, 1, 1, 25000, NULL, 1, '2021-04-28 08:40:33', 0, 176, '2021-04-28 07:11:34', 1, '2021-04-28 07:11:34', '2021-04-24 18:30:00'),
(10, 61, '2021-04-28 11:27:50', 2800, '2', '', 1, '2021-07-07 18:30:00', 233, 1, 1, 111, NULL, 1, '2021-04-28 11:27:50', 0, 176, '2021-04-28 07:14:38', 1, '2021-04-28 07:14:38', '2021-04-27 18:30:00'),
(11, 80, '2021-04-28 11:36:37', 300, '1', '', 1, '2021-05-23 18:30:00', 23, 1, 1, 122, NULL, 1, '2021-04-28 11:36:37', 0, 176, '2021-04-28 07:16:33', 1, '2021-04-28 07:16:33', '2021-04-27 18:30:00'),
(12, 77, '2021-04-28 11:38:23', 3000, '2', '', 1, '2021-06-02 18:30:00', 300, 1, 1, 111, NULL, 1, '2021-04-28 11:38:23', 0, 176, '2021-04-28 07:44:35', 1, '2021-04-28 07:44:35', '2021-04-27 18:30:00'),
(13, 73, '2021-04-28 08:25:50', 2000, '2', '', 5, '2021-05-31 18:30:00', 200, 1, 1, 45, NULL, 1, '2021-04-28 08:25:50', 0, 176, '2021-04-28 08:15:19', 1, '2021-04-28 08:15:19', '2021-04-25 18:30:00'),
(14, 101, '2021-04-28 10:47:31', 67, '2', '23', 1, '2021-04-12 18:30:00', 234, 1, 1, 89, NULL, 1, '2021-04-28 08:32:16', 0, 176, '2021-04-28 08:24:45', 1, '2021-04-28 08:24:45', '2021-04-19 18:30:00'),
(15, 83, '2021-04-28 11:17:31', 56, '3', '67', 3, '2021-04-21 18:30:00', 76, 1, 1, 20, NULL, 1, '2021-04-28 11:17:31', 0, 176, '2021-04-28 08:28:48', 1, '2021-04-28 08:28:48', '2021-04-27 18:30:00'),
(16, 66, '2021-04-29 07:35:17', 4000, '1', '', 5, '2021-05-31 18:30:00', 30, 1, 1, 4000, NULL, 1, '2021-04-29 07:35:17', 0, 176, '2021-04-28 08:32:01', 1, '2021-04-28 08:32:01', '2021-06-07 18:30:00'),
(17, 73, '2021-04-29 07:57:12', 120000, '2', 'FIRST', 1, '2021-05-04 18:30:00', 80000, 1, 1, 120000, NULL, 1, '2021-04-29 07:57:12', 0, 1, '2021-04-28 11:13:42', 1, '2021-04-28 11:13:42', '2021-05-12 18:30:00'),
(18, 84, '2021-05-03 13:50:55', 80, '2', 'Reedemable debentures ', 3, '2021-04-27 18:30:00', 200000, 1, 1, 80, NULL, 267, '2021-05-03 13:50:55', 0, 262, '2021-04-28 11:28:56', 267, '2021-04-28 11:28:56', '2021-04-27 18:30:00'),
(19, 65, '2021-04-29 07:07:28', 200, '1', 'Equity', 2, '2021-05-04 18:30:00', 5000, 2, 1, 200, NULL, 1, '2021-04-29 07:07:28', 0, 176, '2021-04-29 06:56:15', 1, '2021-04-29 06:56:15', '2021-05-09 18:30:00'),
(20, 65, '2021-04-29 07:36:25', 600, '1', 'DBAS', 5, '2021-05-04 18:30:00', 888, 2, 1, 600, NULL, 1, '2021-04-29 07:36:25', 0, 176, '2021-04-29 06:57:53', 1, '2021-04-29 06:57:53', '2021-05-15 18:30:00'),
(21, 73, '2021-05-03 13:52:51', 70, '1', 'DBAS', 5, '2021-04-29 18:30:00', 800, 2, 1, 70, NULL, 267, '2021-05-03 13:52:51', 0, 1, '2021-04-29 07:01:57', 267, '2021-04-29 07:01:57', '2021-04-29 18:30:00'),
(22, 73, '2021-04-28 18:30:00', 100, '1', 'Equity', 2, '2021-05-05 18:30:00', 100000, 2, 0, NULL, NULL, NULL, '2021-04-29 07:39:11', 0, 176, '2021-04-29 07:39:11', NULL, '2021-04-29 07:39:11', NULL),
(23, 73, '2021-04-28 18:30:00', 1200, '1', 'Equity', 2, '2021-05-05 18:30:00', 100000, 2, 0, NULL, NULL, NULL, '2021-04-29 07:47:41', 0, 176, '2021-04-29 07:47:41', NULL, '2021-04-29 07:47:41', NULL),
(24, 60, '2021-04-28 18:30:00', 200, '1', 'Equity shares', 8, '2021-05-05 18:30:00', 10000, 2, 0, NULL, NULL, NULL, '2021-04-29 07:51:58', 0, 1, '2021-04-29 07:51:58', NULL, '2021-04-29 07:51:58', NULL),
(25, 73, '2021-05-01 05:32:14', 400, '1', 'Reedemable debentures ', 3, '2021-05-05 18:30:00', 400000, 2, 1, 400, NULL, 1, '2021-05-01 05:32:14', 0, 259, '2021-04-29 08:59:37', 1, '2021-04-29 08:59:37', '2021-05-05 18:30:00'),
(26, 73, '2021-04-28 18:30:00', 400, '1', 'Equity', 2, '2021-05-05 18:30:00', 400000, 2, 0, NULL, NULL, NULL, '2021-04-29 09:02:01', 0, 259, '2021-04-29 09:02:01', NULL, '2021-04-29 09:02:01', NULL),
(27, 73, '2021-04-28 18:30:00', 100, '1', 'Equity', 2, '2021-05-05 18:30:00', 100000, 2, 0, NULL, NULL, NULL, '2021-04-29 12:26:57', 0, 259, '2021-04-29 12:26:57', NULL, '2021-04-29 12:26:57', NULL),
(28, 86, '2021-04-29 18:30:00', 12, '1', 'Equity', 2, '2021-05-06 18:30:00', 1200, 2, 0, NULL, NULL, NULL, '2021-04-29 12:52:41', 0, 1, '2021-04-29 12:52:41', NULL, '2021-04-29 12:52:41', NULL),
(29, 80, '2021-04-28 18:30:00', 15, '1', 'Reedemable debentures ', 3, '2021-05-05 18:30:00', 15000, 2, 0, NULL, NULL, NULL, '2021-04-29 12:54:51', 0, 1, '2021-04-29 12:54:51', NULL, '2021-04-29 12:54:51', NULL),
(30, 73, '2021-04-28 18:30:00', 16, '1', 'Equity', 2, '2021-05-05 18:30:00', 16000, 2, 0, NULL, NULL, NULL, '2021-04-29 12:56:06', 0, 259, '2021-04-29 12:56:06', NULL, '2021-04-29 12:56:06', NULL),
(31, 87, '2021-04-30 18:30:00', 800, '1', 'Reedemable debentures ', 3, '2021-05-10 18:30:00', 120000, 1, 0, NULL, NULL, NULL, '2021-05-01 11:12:33', 0, 1, '2021-05-01 11:12:33', NULL, '2021-05-01 11:12:33', NULL),
(32, 5, '2021-05-03 13:20:08', 500, '1', 'Equity', 4, '2021-05-12 18:30:00', 100000, 1, 1, 500, NULL, 1, '2021-05-03 13:20:08', 0, 245, '2021-05-03 13:16:13', 1, '2021-05-03 13:16:13', '2021-05-12 18:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `PreClearanceUsers`
--

CREATE TABLE `PreClearanceUsers` (
  `id` int(11) NOT NULL,
  `prcId` int(11) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `PreClearanceUsers`
--

INSERT INTO `PreClearanceUsers` (`id`, `prcId`, `userId`) VALUES
(1, 3, 2),
(2, 11, 2),
(3, 18, 4),
(4, 23, 6);

-- --------------------------------------------------------

--
-- Table structure for table `RelatedClientCompanyMappings`
--

CREATE TABLE `RelatedClientCompanyMappings` (
  `id` int(11) NOT NULL,
  `cmId` int(11) NOT NULL,
  `cmClientCompanyHas` int(11) NOT NULL,
  `clientCompanyName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `isDeleted` tinyint(1) DEFAULT 0,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `RelatedClientCompanyMappings`
--

INSERT INTO `RelatedClientCompanyMappings` (`id`, `cmId`, `cmClientCompanyHas`, `clientCompanyName`, `isDeleted`, `createdBy`, `createdAt`, `modifiedBy`, `modifiedAt`) VALUES
(1, 70, 1, 'def', 0, 179, '2021-04-12 07:06:51', 179, '2021-04-12 07:06:51'),
(2, 70, 1, 'Def2', 0, 179, '2021-04-12 07:06:51', 179, '2021-04-12 07:06:51'),
(5, 77, 4, 'crenexa', 0, NULL, '2021-04-14 12:23:53', NULL, '2021-04-14 12:23:53'),
(6, 79, 1, 'charlie', 0, 1, '2021-04-20 10:30:27', 1, '2021-04-20 10:30:27'),
(7, 79, 1, '', 0, 1, '2021-04-20 10:30:27', 1, '2021-04-20 10:30:27'),
(12, 91, 1, 'mat', 0, NULL, '2021-04-24 07:40:43', NULL, '2021-04-24 07:40:43'),
(13, 91, 2, 'non mat', 0, NULL, '2021-04-24 07:40:43', NULL, '2021-04-24 07:40:43'),
(16, 90, 1, 'mat sub', 0, NULL, '2021-04-24 07:45:00', NULL, '2021-04-24 07:45:00'),
(17, 90, 2, 'non mat sub', 0, NULL, '2021-04-24 07:45:00', NULL, '2021-04-24 07:45:00'),
(19, 112, 1, 'mat client comp 1', 0, 1, '2021-04-28 13:07:09', 1, '2021-04-28 13:07:09'),
(20, 112, 1, 'mat client comp 2', 0, 1, '2021-04-28 13:07:09', 1, '2021-04-28 13:07:09'),
(21, 113, 1, 'mat 1', 0, 1, '2021-04-28 13:12:43', 1, '2021-04-28 13:12:43'),
(22, 113, 1, 'mat2', 0, 1, '2021-04-28 13:12:43', 1, '2021-04-28 13:12:43'),
(23, 113, 1, 'mat3', 0, 1, '2021-04-28 13:12:43', 1, '2021-04-28 13:12:43'),
(24, 62, 4, 'Crenexa', 0, NULL, '2021-04-30 08:03:06', NULL, '2021-04-30 08:03:06');

-- --------------------------------------------------------

--
-- Table structure for table `RelatedCompanyMappings`
--

CREATE TABLE `RelatedCompanyMappings` (
  `id` int(11) NOT NULL,
  `cmId` int(11) NOT NULL,
  `cmCompanyHas` int(11) NOT NULL,
  `companyName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `isDeleted` tinyint(1) DEFAULT 0,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `RelatedCompanyMappings`
--

INSERT INTO `RelatedCompanyMappings` (`id`, `cmId`, `cmCompanyHas`, `companyName`, `isDeleted`, `createdBy`, `createdAt`, `modifiedBy`, `modifiedAt`) VALUES
(97, 5, 1, 'Vorbicon', 0, 1, '2021-04-30 13:50:49', 1, '2021-04-30 13:50:49'),
(98, 5, 2, 'Non-mat sub company 2', 0, 1, '2021-04-30 13:50:49', 1, '2021-04-30 13:50:49'),
(99, 5, 2, ' Non-mat sub company 1', 0, 1, '2021-04-30 13:50:49', 1, '2021-04-30 13:50:49'),
(100, 6, 1, 'Vorbicon', 0, 1, '2021-05-04 03:56:49', 1, '2021-05-04 03:56:49');

-- --------------------------------------------------------

--
-- Table structure for table `RestrictedCompanyMasters`
--

CREATE TABLE `RestrictedCompanyMasters` (
  `id` int(11) NOT NULL,
  `companyName` varchar(255) NOT NULL,
  `nseCode` varchar(45) DEFAULT 'Null',
  `bseCode` varchar(45) DEFAULT 'Null'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `RestrictedCompanyMasters`
--

INSERT INTO `RestrictedCompanyMasters` (`id`, `companyName`, `nseCode`, `bseCode`) VALUES
(1, 'ABB India Limited', 'ABB', '500002'),
(2, 'Aegis Logistics Ltd.', 'AEGISCHEM', '500003'),
(3, 'Arvind Ltd.', 'ARVIND', '500101'),
(4, 'Atul Ltd.', 'ATUL', '500027'),
(5, 'Bajaj Electricals Ltd', 'BAJAJELEC', '500031'),
(6, 'Bajaj Finance Limited', 'BAJFINANCE', '500034'),
(7, 'Balrampur Chini Mills Ltd.', 'BALRAMCHIN', '500038'),
(8, 'BASF India Ltd.', 'BASF', '500042'),
(9, 'Bata India Ltd.', 'BATAINDIA', '500043'),
(10, 'BEML Ltd.', 'BEML', '500048'),
(11, 'Bhansali Engineering Polymers Ltd.', 'BEPL', '500052'),
(12, 'Bharat Heavy Electricals Ltd.', 'BHEL', '500103'),
(13, 'CESC Ltd.', 'CESC', '500084'),
(14, 'Cipla Ltd.', 'CIPLA', '500087'),
(15, 'Crisil Ltd.', 'CRISIL', '500092'),
(16, 'Dabur India Ltd.', 'DABUR', '500096'),
(17, 'Exide Industries Ltd.', 'EXIDEIND', '500086'),
(18, 'Hindustan Petroleum Corporation Ltd.', 'HINDPETRO', '500104'),
(19, 'Housing Development Finance Corp.Ltd.', 'HDFC', '500010'),
(20, 'IFCI Ltd.', 'IFCI', '500106'),
(21, 'Bengal & Assam Company Limited', 'Null', '533095'),
(22, 'Garware Polyesters Ltd', 'Null', '500655'),
(23, 'Kovai Medical Center & Hospital Ltd', 'Null', '523323'),
(24, 'Paushak Limited (Formerly Known As Darshak Limited)', 'Null', '532742'),
(25, 'Wardwizard Innovations And Mobility Limited', 'Null', '538970'),
(26, 'Fairchem Speciality Limited', 'FAIRCHEM', 'Null'),
(27, 'Anant Raj Limited', 'ANANTRAJ', 'Null'),
(28, 'Sirca Paints India Limited', 'SIRCA', 'Null'),
(29, 'N. B. I. Industrial Finance Company Limited', 'NBIFIN', 'Null'),
(30, 'Zota Health Care LImited', 'ZOTA', 'Null');

-- --------------------------------------------------------

--
-- Table structure for table `Roles`
--

CREATE TABLE `Roles` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `code` varchar(25) NOT NULL,
  `createdBy` int(10) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Roles`
--

INSERT INTO `Roles` (`id`, `name`, `code`, `createdBy`, `createdAt`) VALUES
(1, 'Compliance Officer (CO)', 'CO', 5, '2021-01-31 18:30:00'),
(2, 'Secondary Approver (SA)', 'SA', 5, '2021-01-31 18:30:00'),
(3, 'Designated Persons (DP)', 'DP', 5, '2021-01-31 18:30:00'),
(4, 'UPSI Originator (UO)', 'UO', 5, '2021-03-01 08:57:49');

-- --------------------------------------------------------

--
-- Table structure for table `States`
--

CREATE TABLE `States` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `States`
--

INSERT INTO `States` (`id`, `name`) VALUES
(1, 'AndamanAndNicobarIslands'),
(2, 'AndhraPradesh'),
(3, 'ArunachalPradesh'),
(4, 'Assam'),
(5, 'Bihar'),
(6, 'Chattisgarh'),
(7, 'Chandigarh'),
(8, 'DamanAndDiu'),
(9, 'Delhi'),
(10, 'DadraAndNagarHaveli'),
(11, 'Goa'),
(12, 'Gujarat'),
(13, 'HimachalPradesh'),
(14, 'Haryana'),
(15, 'JammuAndKashmir'),
(16, 'Jharkhand'),
(17, 'Kerala'),
(18, 'Karnataka'),
(19, 'Lakshadweep'),
(20, 'Meghalaya'),
(21, 'Maharashtra'),
(22, 'Manipur'),
(23, 'MadhyaPradesh'),
(24, 'Mizoram'),
(25, 'Nagaland'),
(26, 'Orissa'),
(27, 'Punjab'),
(28, 'Pondicherry'),
(29, 'Rajasthan'),
(30, 'Sikkim'),
(31, 'TamilNadu'),
(32, 'Tripura'),
(33, 'Uttarakhand'),
(34, 'UttarPradesh'),
(35, 'WestBengal'),
(36, 'Telangana');

-- --------------------------------------------------------

--
-- Table structure for table `Tokens`
--

CREATE TABLE `Tokens` (
  `id` int(11) NOT NULL,
  `token` varchar(100) NOT NULL,
  `tokenFor` varchar(100) NOT NULL,
  `createdBy` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `expiredAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Tokens`
--

INSERT INTO `Tokens` (`id`, `token`, `tokenFor`, `createdBy`, `createdAt`, `expiredAt`) VALUES
(2, '244104520241112013332', 'ForCreateUser', 173, '2021-04-08 04:58:42', '2021-04-08 21:18:42'),
(4, '40540053202400410014', 'forget', 1, '2021-04-08 05:04:32', '2021-04-08 20:24:32'),
(10, '1000032042134543231322', 'ForCreateUser', 180, '2021-04-12 06:36:36', '2021-04-12 20:56:36'),
(17, '151135540222453324125', 'ForCreateUser', 214, '2021-04-20 10:01:01', '2021-04-20 20:21:01'),
(19, '503151312220105351533', 'ForCreateUser', 218, '2021-04-21 02:44:10', '2021-04-21 21:04:10'),
(30, '31033055523331111353', 'ForCreateUser', 244, '2021-04-23 10:44:28', '2021-04-23 21:04:28'),
(32, '30410220140532215205', 'ForCreateUser', 247, '2021-04-23 12:03:19', '2021-04-23 20:23:19'),
(33, '1224115533201135334002', 'ForCreateUser', 248, '2021-04-23 12:26:00', '2021-04-23 20:46:00'),
(34, '14532134000434452133', 'ForCreateUser', 249, '2021-04-23 12:45:20', '2021-04-23 21:05:20'),
(35, '353230010505050301442', 'ForCreateUser', 250, '2021-04-24 04:43:21', '2021-04-24 21:03:21'),
(36, '5244350142400433101', 'ForCreateUser', 251, '2021-04-24 05:05:18', '2021-04-24 20:25:18'),
(37, '30110413433505411332', 'ForCreateUser', 252, '2021-04-24 12:57:43', '2021-04-24 21:17:43'),
(38, '401554511032050034255', 'ForCreateUser', 253, '2021-04-26 04:15:50', '2021-04-26 20:35:50'),
(39, '5453344551511342004', 'ForCreateUser', 254, '2021-04-26 05:22:10', '2021-04-26 20:42:10'),
(41, '54504253404131032051', 'ForCreateUser', 256, '2021-04-26 07:14:29', '2021-04-26 20:34:29'),
(42, '333551111331431333445', 'ForCreateUser', 257, '2021-04-26 11:10:14', '2021-04-26 20:30:14'),
(46, '355131320214420045325', 'ForCreateUser', 261, '2021-04-27 08:21:42', '2021-04-27 20:41:42'),
(51, '543205110015032211042', 'ForCreateUser', 266, '2021-05-03 11:46:47', '2021-05-03 21:06:47'),
(53, '305414501542405500443', 'ForCreateUser', 268, '2021-05-03 12:02:56', '2021-05-03 20:22:56'),
(54, '221130301221204515152', 'ForCreateUser', 269, '2021-05-04 03:52:06', '2021-05-04 21:12:06');

-- --------------------------------------------------------

--
-- Table structure for table `UPSI`
--

CREATE TABLE `UPSI` (
  `id` int(11) NOT NULL,
  `details` text DEFAULT NULL,
  `clientCompanyId` int(11) NOT NULL,
  `purpose` text DEFAULT NULL,
  `subPurpose` varchar(255) DEFAULT NULL,
  `upsiCategoryId` int(11) NOT NULL,
  `sharedAt` datetime DEFAULT NULL,
  `publishedAt` datetime DEFAULT NULL,
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `modifiedAt` datetime NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `UPSI`
--

INSERT INTO `UPSI` (`id`, `details`, `clientCompanyId`, `purpose`, `subPurpose`, `upsiCategoryId`, `sharedAt`, `publishedAt`, `createdBy`, `modifiedBy`, `createdAt`, `modifiedAt`, `isDeleted`) VALUES
(1, 'the largest company in India as measured by revenue after recently surpassing the government-controlled', 60, 'the largest company in India as measured by revenue after recently surpassing the government-controlled', '', 6, '2021-04-07 18:30:00', NULL, 1, 1, '2021-04-08 05:36:06', '2021-04-08 05:36:06', 1),
(2, 'the largest company in India as measured by revenue after recently surpassing the government-controlled', 61, 'the largest company in India as measured by revenue after recently surpassing the government-controlled', '', 2, '2021-04-07 18:30:00', '2021-04-07 18:30:00', 1, 1, '2021-04-08 05:37:34', '2021-04-08 05:37:34', 0),
(3, 'the largest company in India as measured by revenue after recently surpassing the government-controlled', 63, 'the largest company in India as measured by revenue after recently surpassing the government-controlled', '', 1, '2021-04-07 18:30:00', '2021-04-07 18:30:00', 1, 1, '2021-04-08 05:38:20', '2021-04-08 05:38:20', 0),
(4, 'the largest company in India as measured by revenue after recently surpassing the government-controlled', 62, 'the largest company in India as measured by revenue after recently surpassing the government-controlled', '', 3, '2021-04-13 18:30:00', '2021-04-06 18:30:00', 1, 1, '2021-04-08 05:39:20', '2021-04-08 05:39:20', 0),
(5, 'Details shared must be correct', 64, 'Needed details must be shared', '', 1, '2021-04-06 18:30:00', '2021-04-06 18:30:00', 1, 1, '2021-04-29 14:04:19', '2021-04-29 14:04:19', 0),
(6, 'Dividend', 77, 'Demo', '', 2, '2021-04-09 18:30:00', '2021-04-09 18:30:00', 1, 1, '2021-04-29 14:07:28', '2021-04-29 14:07:28', 0),
(7, 'Dividend', 66, 'Execution', '', 2, '2021-04-07 18:30:00', NULL, 172, 172, '2021-04-08 13:23:04', '2021-04-08 13:23:04', 0),
(8, 'Dividend', 68, 'Equity', '', 2, '2021-04-08 18:30:00', NULL, 176, 176, '2021-04-09 10:56:53', '2021-04-09 10:56:53', 0),
(9, 'Project report', 65, 'Project report', '', 10, '2021-04-11 18:30:00', NULL, 1, 1, '2021-04-12 08:57:23', '2021-04-12 08:57:23', 0),
(10, 'Dividend', 64, 'Dividend', '', 2, '2021-04-10 18:30:00', NULL, 1, 1, '2021-04-12 09:07:52', '2021-04-12 09:07:52', 0),
(11, 'charlie', 73, 'as', 'ASDAS', 1, '2021-04-14 18:30:00', '2021-04-14 18:30:00', 1, 1, '2021-04-15 17:37:45', '2021-04-15 17:37:45', 0),
(12, 'Nothing', 74, 'None', 'None', 6, '2021-04-21 18:30:00', '2021-04-12 18:30:00', 1, 1, '2021-04-20 08:44:24', '2021-04-20 08:44:24', 0),
(13, 'None', 73, 'None', 'None', 6, '2021-04-12 18:30:00', NULL, 1, 1, '2021-04-20 11:05:59', '2021-04-20 11:05:59', 0),
(14, 'None', 64, 'None', 'None', 6, '2021-04-07 18:30:00', NULL, 1, 1, '2021-04-20 11:06:47', '2021-04-20 11:06:47', 0),
(15, 'charlie...', 73, 'charlie...', 'charlieee..', 1, '2021-04-19 18:30:00', '2021-04-19 18:30:00', 1, 1, '2021-04-20 11:13:36', '2021-04-20 11:13:36', 0),
(16, 'good company', 80, 'good', 'good', 1, '2021-04-12 18:30:00', '2021-04-19 18:30:00', 1, 1, '2021-04-20 11:35:52', '2021-04-20 11:35:52', 0),
(17, 'test', 73, 'checkk', 'ass', 1, '2021-04-20 18:30:00', '2021-04-19 18:30:00', 1, 1, '2021-04-20 16:00:01', '2021-04-20 16:00:01', 0),
(18, 'qwerty', 74, 'asdfgh', '', 2, '2021-04-13 18:30:00', NULL, 1, 1, '2021-04-21 05:14:33', '2021-04-21 05:14:33', 0),
(19, 'Good to see', 83, 'Good to have this', '', 2, '2021-04-14 18:30:00', '2021-04-19 18:30:00', 1, 1, '2021-04-21 07:06:49', '2021-04-21 07:06:49', 0),
(20, 'Go to go', 84, 'Setup new', '', 1, '2021-04-21 18:30:00', '2021-04-20 18:30:00', 220, 220, '2021-04-21 07:15:22', '2021-04-21 07:15:22', 0),
(21, 'Dividend', 83, 'Equity', '', 2, '2021-04-21 18:30:00', NULL, 1, 1, '2021-04-22 11:32:54', '2021-04-22 11:32:54', 0),
(22, 'information ', 86, 'relative', '', 3, '2021-04-21 18:30:00', '2021-04-15 18:30:00', 1, 1, '2021-04-22 12:04:56', '2021-04-22 12:04:56', 0),
(23, 'info', 86, 'personal', '', 2, '2021-04-14 18:30:00', NULL, 1, 1, '2021-04-22 12:09:22', '2021-04-22 12:09:22', 1),
(24, 'Hakare', 73, 'ABC', '', 5, '2021-04-25 18:30:00', '2021-04-25 18:30:00', 1, 1, '2021-04-29 15:05:01', '2021-04-29 15:05:01', 0),
(25, 'pp', 79, 'pp', '', 5, '2021-04-19 18:30:00', NULL, 1, 1, '2021-04-26 11:00:34', '2021-04-26 11:00:34', 1),
(26, 'Dividend', 73, 'Equity', '', 18, '2021-04-27 18:30:00', NULL, 1, 1, '2021-04-28 11:09:00', '2021-04-28 11:09:00', 0),
(27, 'test data', 101, 'test data', '', 2, '2021-04-28 18:30:00', '2021-04-28 18:30:00', 176, 176, '2021-04-29 05:46:07', '2021-04-29 05:46:07', 0),
(28, 'test data', 65, 'test data', '', 4, '2021-04-27 18:30:00', '2021-04-27 18:30:00', 176, 176, '2021-04-29 05:51:17', '2021-04-29 05:51:17', 0),
(29, 'Date of sharing UPSI', 73, 'Date of sharing UPSI', '', 8, '2021-04-28 18:30:00', '2021-04-28 18:30:00', 176, 176, '2021-04-29 06:19:56', '2021-04-29 06:19:56', 0),
(30, 'Test2', 73, 'Test', '', 3, '2021-04-28 18:30:00', '2021-04-28 18:30:00', 1, 1, '2021-04-29 15:04:42', '2021-04-29 15:04:42', 0),
(31, 'Marketing deal.', 73, 'Execution', '', 8, '2021-04-28 18:30:00', '2021-04-28 18:30:00', 1, 1, '2021-04-29 08:53:25', '2021-04-29 08:53:25', 0),
(32, 'Demo', 86, 'None', '', 5, '2021-04-28 18:30:00', NULL, 1, 1, '2021-04-29 11:08:53', '2021-04-29 11:08:53', 0),
(33, 'test', 73, 'test', '', 14, '2021-04-29 18:30:00', '2021-05-07 18:30:00', 259, 259, '2021-05-01 05:46:03', '2021-05-01 05:46:03', 0),
(34, 'Devidend', 101, 'Equity', '', 3, '2021-04-30 18:30:00', '2021-05-20 18:30:00', 265, 265, '2021-05-01 12:29:06', '2021-05-01 12:29:06', 0),
(35, 'Dividend', 5, 'Equity', '', 2, '2021-05-02 18:30:00', NULL, 245, 245, '2021-05-03 13:15:30', '2021-05-03 13:15:30', 0);

-- --------------------------------------------------------

--
-- Table structure for table `UPSICategories`
--

CREATE TABLE `UPSICategories` (
  `id` int(11) NOT NULL,
  `category` varchar(400) NOT NULL,
  `isDeleted` tinyint(4) DEFAULT NULL,
  `createdBy` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) NOT NULL,
  `modifiedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `UPSICategories`
--

INSERT INTO `UPSICategories` (`id`, `category`, `isDeleted`, `createdBy`, `createdAt`, `modifiedBy`, `modifiedAt`) VALUES
(1, 'Financial Results', 0, 1, '2021-04-07 10:18:00', 1, '2021-04-07 10:18:00'),
(2, 'Dividends', 0, 1, '2021-04-07 10:18:06', 1, '2021-04-07 10:18:06'),
(3, 'Change in capital structure Results', 0, 1, '2021-04-07 10:18:06', 1, '2021-04-07 10:18:06'),
(4, 'Mergers, De-mergers, Acquisitions, Delistings, Disposals, Expansion of Business and such other transactions', 0, 1, '2021-04-07 10:23:24', 1, '2021-04-07 10:23:24'),
(5, 'Changes In Key Managerial Personnel', 0, 1, '2021-04-07 10:23:24', 1, '2021-04-07 10:23:24'),
(6, 'Material events in accordance with the listing agreement', 0, 1, '2021-04-07 10:23:24', 1, '2021-04-07 10:23:24'),
(7, 'Material events in accordance with the listing agreement', 0, 1, '2021-04-07 10:23:24', 1, '2021-04-07 10:23:24'),
(8, 'Marketing Alliance', 0, 1, '2021-04-07 10:23:24', 1, '2021-04-07 10:23:24'),
(9, 'Bonus Issue', 0, 1, '2021-04-07 10:23:24', 1, '2021-04-07 10:23:24'),
(10, 'Other', 0, 1, '2021-04-07 10:23:24', 1, '2021-04-07 10:23:24'),
(14, 'DEMO', 0, 1, '2021-04-22 11:35:57', 1, '2021-04-22 11:35:57'),
(15, 'test1qwe', 0, 5, '2021-04-24 11:16:56', 5, '2021-04-24 11:16:56'),
(16, 'Demergers', 0, 1, '2021-04-24 13:02:18', 1, '2021-04-24 13:02:18'),
(17, 'Financial results', 0, 5, '2021-04-27 07:02:19', 5, '2021-04-27 07:02:19'),
(18, 'DEMO!', 0, 1, '2021-04-28 11:03:49', 1, '2021-04-28 11:03:49'),
(19, 'Finacial results', 0, 1, '2021-05-01 06:26:46', 1, '2021-05-01 06:26:46');

-- --------------------------------------------------------

--
-- Table structure for table `UPSIUser`
--

CREATE TABLE `UPSIUser` (
  `id` int(11) NOT NULL,
  `upsiId` int(11) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `UPSIUser`
--

INSERT INTO `UPSIUser` (`id`, `upsiId`, `userId`) VALUES
(1, 1, 172),
(2, 1, 173),
(3, 2, 174),
(4, 2, 175),
(5, 3, 173),
(6, 3, 175),
(7, 4, 172),
(8, 4, 175),
(13, 7, 176),
(14, 7, 177),
(15, 8, 172),
(16, 8, 178),
(17, 9, 172),
(18, 9, 173),
(19, 10, 179),
(20, 10, 180),
(21, 11, 172),
(22, 12, 173),
(23, 13, 173),
(24, 13, 175),
(25, 14, 179),
(26, 15, 173),
(27, 15, 174),
(28, 16, 215),
(29, 17, 173),
(30, 17, 174),
(31, 17, 175),
(32, 18, 219),
(33, 19, 175),
(34, 19, 220),
(35, 20, 220),
(36, 21, 231),
(37, 22, 229),
(38, 23, 221),
(40, 25, 175),
(41, 25, 179),
(42, 26, 256),
(43, 26, 257),
(44, 26, 258),
(45, 26, 259),
(49, 27, 174),
(50, 27, 259),
(54, 28, 175),
(65, 29, 215),
(69, 31, 176),
(70, 31, 252),
(71, 32, 173),
(72, 32, 174),
(75, 5, 174),
(76, 6, 175),
(77, 6, 176),
(78, 30, 252),
(79, 24, 173),
(84, 33, 175),
(85, 33, 176),
(86, 33, 179),
(91, 34, 176),
(92, 34, 178),
(93, 34, 265),
(94, 35, 265),
(95, 35, 266),
(96, 35, 267),
(97, 35, 268);

-- --------------------------------------------------------

--
-- Table structure for table `UserDetails`
--

CREATE TABLE `UserDetails` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `middleName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) NOT NULL,
  `dob` date DEFAULT NULL,
  `nationality` int(11) DEFAULT NULL,
  `category` tinyint(4) DEFAULT NULL,
  `isDesignatedPerson` tinyint(4) NOT NULL,
  `email` varchar(45) NOT NULL,
  `secondaryEmail` varchar(100) DEFAULT NULL,
  `profilePicture` varchar(250) DEFAULT NULL,
  `designationId` int(11) DEFAULT NULL,
  `departmentId` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `createdBy` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `addedAt` timestamp NULL DEFAULT NULL,
  `modifiedBy` int(11) NOT NULL,
  `modifiedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `deactivatedAt` timestamp NULL DEFAULT NULL,
  `reasonForDeactivation` varchar(255) DEFAULT NULL,
  `loggedInAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `loggedOutAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `isDeleted` tinyint(1) NOT NULL DEFAULT 0,
  `whetherFromRelatedCompany` varchar(255) DEFAULT NULL,
  `insiderlensId` int(11) DEFAULT NULL,
  `employeeId` int(11) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `PAN` varchar(255) DEFAULT NULL,
  `landlineNo` bigint(20) DEFAULT NULL,
  `MobileNo1` bigint(20) DEFAULT NULL,
  `MobileNo2` bigint(20) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `idInfo` varchar(200) DEFAULT NULL,
  `idNumber` varchar(400) DEFAULT NULL,
  `effectiveFrom` timestamp NULL DEFAULT NULL,
  `effectiveTo` timestamp NULL DEFAULT NULL,
  `attachment` varchar(200) DEFAULT NULL,
  `desigEffectiveFrom` timestamp NULL DEFAULT NULL,
  `desigEffectiveTo` timestamp NULL DEFAULT NULL,
  `deptEffectiveFrom` timestamp NULL DEFAULT NULL,
  `deptEffectiveTo` timestamp NULL DEFAULT NULL,
  `institution` varchar(255) DEFAULT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `passingYear` timestamp NULL DEFAULT NULL,
  `empName` varchar(255) DEFAULT NULL,
  `empDesignation` varchar(255) DEFAULT NULL,
  `empMobileNo` bigint(20) DEFAULT NULL,
  `empEmailId` varchar(45) DEFAULT NULL,
  `empFromDate` timestamp NULL DEFAULT NULL,
  `empToDate` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `UserDetails`
--

INSERT INTO `UserDetails` (`id`, `userId`, `firstName`, `middleName`, `lastName`, `dob`, `nationality`, `category`, `isDesignatedPerson`, `email`, `secondaryEmail`, `profilePicture`, `designationId`, `departmentId`, `status`, `createdBy`, `createdAt`, `addedAt`, `modifiedBy`, `modifiedAt`, `deactivatedAt`, `reasonForDeactivation`, `loggedInAt`, `loggedOutAt`, `isDeleted`, `whetherFromRelatedCompany`, `insiderlensId`, `employeeId`, `city`, `PAN`, `landlineNo`, `MobileNo1`, `MobileNo2`, `position`, `idInfo`, `idNumber`, `effectiveFrom`, `effectiveTo`, `attachment`, `desigEffectiveFrom`, `desigEffectiveTo`, `deptEffectiveFrom`, `deptEffectiveTo`, `institution`, `qualification`, `passingYear`, `empName`, `empDesignation`, `empMobileNo`, `empEmailId`, `empFromDate`, `empToDate`) VALUES
(1, 1, 'Kavita', '', 'Dange', '1988-07-11', 53, 2, 0, 'sadhana.sankpal@axardigital.com', 'aditi12@gmail.com', 'reason', NULL, 2, 0, 1, '2021-03-06 13:15:48', '2021-04-07 00:00:00', 1, '2021-03-06 13:15:48', '2021-04-08 04:55:30', '', '2021-03-06 13:15:48', '2021-03-06 13:15:48', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(57, 172, 'Aditi', '', 'Kulkarni', '1988-07-11', 53, 2, 1, 'aditikulkarni395@gmail.com', 'aditi12@gmail.com', 'reason', NULL, 2, 0, 1, '2021-04-08 04:55:30', '2021-04-07 00:00:00', 1, '2021-04-08 04:55:30', '2021-04-08 04:55:30', '', '2021-04-08 04:55:30', '2021-04-08 04:55:30', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(58, 173, 'Sandesh', '', 'Mahto', '1992-06-10', 53, 1, 1, 'sandeshmahto993@gmail.com', '', 'reason', NULL, 2, 0, 1, '2021-04-08 04:58:42', '2021-04-07 00:00:00', 1, '2021-04-08 04:58:42', '2021-04-08 04:58:42', '', '2021-04-08 04:58:42', '2021-04-08 04:58:42', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(59, 174, 'Mahesh', 'Anil', 'Sawant', '1989-07-24', 53, 1, 1, 'sawantmahesh9011@gmail.com', '', 'reason', NULL, 2, 0, 1, '2021-04-08 05:03:49', '2021-04-07 00:00:00', 1, '2021-04-08 05:03:49', '2021-04-08 05:03:49', '', '2021-04-08 05:03:49', '2021-04-08 05:03:49', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(60, 175, 'Jay', '', 'Yadav', '1995-10-15', 53, 1, 1, 'jayprakash.yadav@crenexa.com', '', 'reason', NULL, 2, 0, 1, '2021-04-08 05:06:45', '2021-04-07 00:00:00', 1, '2021-04-08 05:06:45', '2021-04-08 05:06:45', '', '2021-04-08 05:06:45', '2021-04-08 05:06:45', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(61, 176, 'Pooja', '', 'Gupta', '2002-06-26', 53, 2, 1, 'pooja.gupta@crenexa.com', 'nupur.shinkar@gmail.com', 'reason', NULL, 1, 0, 176, '2021-04-08 06:43:26', '2021-04-06 00:00:00', 176, '2021-04-08 06:43:26', '2021-04-08 06:43:26', '', '2021-04-08 06:43:26', '2021-04-08 06:43:26', 0, 'Yes', NULL, NULL, NULL, 'ASERD4567T', NULL, 9860105202, 7719827827, NULL, '2', 'ASERD4567T', '2021-04-16 18:30:00', NULL, NULL, '2021-04-04 18:30:00', NULL, '2021-04-20 18:30:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(63, 178, 'Pratik', '', 'Mogal', '1998-10-12', 53, 1, 1, 'poojagupta.gupta22@gmail.com', '', 'reason', NULL, 1, 0, 1, '2021-04-09 10:40:44', '2021-04-07 00:00:00', 1, '2021-04-09 10:40:44', '2021-04-09 10:40:44', '', '2021-04-09 10:40:44', '2021-04-09 10:40:44', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(64, 179, 'Pooja', '', 'B', '1992-01-30', 53, 2, 1, 'pooja.benurkar@axardigital.com', 'pooja.benurkar@axardigital.com', 'reason', NULL, 1, 0, 1, '2021-04-12 06:31:40', '2020-12-31 00:00:00', 1, '2021-04-12 06:31:40', '2021-04-12 06:31:40', 'test', '2021-04-12 06:31:40', '2021-04-12 06:31:40', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(65, 180, 'Ram', 'K', 'Patil', NULL, 53, 1, 1, 'ramanand.patil@.com', 'ramanand.patil@.com', 'reason', NULL, 1, 0, 1, '2021-04-12 06:36:36', '2021-03-31 00:00:00', 1, '2021-04-12 06:36:36', '2021-04-12 06:36:36', NULL, '2021-04-12 06:36:36', '2021-04-12 06:36:36', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(72, 214, 'ganesh', 'A', 'bhabd', '2021-04-19', 2, 1, 1, 'charlie@gmail.com', 'bhadg@gmail.com', 'reason', NULL, 1, 0, 1, '2021-04-20 10:01:01', '2021-04-19 00:00:00', 1, '2021-04-20 10:01:01', '2021-04-19 18:30:00', 'charlie', '2021-04-20 10:01:01', '2021-04-20 10:01:01', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(73, 215, 'Preetam', '', 'Patil', '1979-03-14', 53, 2, 0, 'pritam.patil@crenexa.com', 'pritam123@yopmail.com', 'reason', NULL, 1, 0, 1, '2021-04-20 11:23:50', '2021-04-05 00:00:00', 1, '2021-04-20 11:23:50', '2021-04-19 18:30:00', 'Not working properly', '2021-04-20 11:23:50', '2021-04-20 11:23:50', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(74, 218, 'Abheer', '', 'patil', '1999-03-23', 53, 1, 1, 'pritvips@gmail.com', 'prit123@gmail.com', 'reason', NULL, 1, 0, 1, '2021-04-21 02:44:10', '2021-02-28 00:00:00', 1, '2021-04-21 02:44:10', '2021-04-20 18:30:00', 'User no longer required', '2021-04-21 02:44:10', '2021-04-21 02:44:10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(75, 219, 'Ahana', '', 'Gupta', '1998-10-19', 53, 2, 1, 'pooja.gupta@crenexa.com', '', 'reason', NULL, 1, 0, 1, '2021-04-21 05:00:03', '2021-04-20 00:00:00', 1, '2021-04-21 05:00:03', '2021-04-21 05:00:03', '', '2021-04-21 05:00:03', '2021-04-21 05:00:03', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(76, 220, 'Mukesh', '', 'Soni', '1998-03-20', 53, 1, 1, 'jayprakash.yadav@crenexa.com', '', 'reason', NULL, 1, 0, 1, '2021-04-21 06:57:32', '2021-04-13 00:00:00', 1, '2021-04-21 06:57:32', '2021-04-21 06:57:32', '', '2021-04-21 06:57:32', '2021-04-21 06:57:32', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(77, 221, 'priya', '', 'patil', '2021-04-05', NULL, 2, 1, 'pritam.patil@crenexa.com', 'hgdh@gmail.com', 'reason', NULL, 1, 0, 1, '2021-04-22 07:08:40', '2021-04-01 00:00:00', 1, '2021-04-22 07:08:40', '2021-02-15 18:30:00', '', '2021-04-22 07:08:40', '2021-04-22 07:08:40', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(78, 229, 'rushi', '', 'patil', '2021-04-08', NULL, 1, 1, 'pritam.patil@crenexa.com', 'pritam.patil@crenexa.com', 'reason', NULL, 1, 0, 1, '2021-04-22 07:36:30', '2021-04-13 00:00:00', 1, '2021-04-22 07:36:30', '2021-03-31 18:30:00', 'not required', '2021-04-22 07:36:30', '2021-04-22 07:36:30', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(79, 230, 'abheer', '', 'patil', '2021-04-07', NULL, 1, 1, 'pritam.patil@crenexa.com', 'pritam.patil@crenexa.com', 'reason', NULL, 1, 0, 265, '2021-04-22 08:42:05', '2021-04-15 00:00:00', 265, '2021-04-22 08:42:05', '2021-04-22 08:42:05', '', '2021-04-22 08:42:05', '2021-04-22 08:42:05', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '122343212345', '2021-05-02 18:30:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(80, 231, 'Sonu', '', 'Gupta', '2021-04-05', 53, 2, 1, 'pooja.gupta@crenexa.com', '', 'reason', NULL, 1, 0, 1, '2021-04-22 10:59:05', '2021-04-12 00:00:00', 1, '2021-04-22 10:59:05', '2021-04-22 10:59:05', '', '2021-04-22 10:59:05', '2021-04-22 10:59:05', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(81, 242, 'Prachi', '', 'Sapre', '2021-04-20', 53, 2, 1, 'nupur.shinkar@crenexa.com', '', 'reason', NULL, 1, 0, 1, '2021-04-23 10:06:21', '2021-04-20 00:00:00', 1, '2021-04-23 10:06:21', '2021-04-29 18:30:00', 'Nothing', '2021-04-23 10:06:21', '2021-04-23 10:06:21', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(82, 244, 'xxxxxx', 'kbk', 'jbkb', '2021-04-19', 6, 2, 1, 'xxxx@yopmil.com', 'xyxy@yopmail.com', 'reason', NULL, 1, 0, 1, '2021-04-23 10:44:28', '2021-04-20 00:00:00', 1, '2021-04-23 10:44:28', '2021-04-18 18:30:00', 'vewf', '2021-04-23 10:44:28', '2021-04-23 10:44:28', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(83, 245, 'Monu', '', 'Gupta', '2021-04-07', 53, 1, 1, 'pooja.gupta@crenexa.com', '', 'reason', NULL, 1, 0, 1, '2021-04-23 11:17:13', '2021-04-21 00:00:00', 1, '2021-04-23 11:17:13', '2021-04-23 11:17:13', '', '2021-04-23 11:17:13', '2021-04-23 11:17:13', 0, NULL, 789632, 741258, NULL, 'QWERT2132Q', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(84, 247, 'Sumedha', '', 'Shinkar', '2021-04-20', 80, 2, 1, 'nrshinkar@gmail.com', '', 'reason', 1, 1, 0, 1, '2021-04-23 12:03:19', '2021-04-21 00:00:00', 1, '2021-04-23 12:03:19', '2021-04-23 18:30:00', 'Nothing...', '2021-04-23 12:03:19', '2021-04-23 12:03:19', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(85, 248, 'charlie', 'c', 'xc', '2021-04-22', 2, 1, 1, 'rest@gmail.com', '', 'reason', NULL, 1, 0, 1, '2021-04-23 12:26:00', '2021-04-22 00:00:00', 1, '2021-04-23 12:26:00', '2021-04-22 18:30:00', 'test', '2021-04-23 12:26:00', '2021-04-23 12:26:00', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(86, 249, 'asas', 'as', 'as', '2021-04-22', 2, 1, 1, 'charlie@gmail.com', '', 'reason', NULL, 1, 0, 1, '2021-04-23 12:45:20', '2021-04-22 00:00:00', 1, '2021-04-23 12:45:20', '2021-04-22 18:30:00', 'charliee/...', '2021-04-23 12:45:20', '2021-04-23 12:45:20', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(87, 250, 'Avani', 'Vikram', 'Dubay', '1992-01-30', 80, 2, 1, 'pooja.benurkar@axardigital.com', 'pooja.benurkar@axardigital.com', 'reason', 1, 1, 0, 1, '2021-04-24 04:43:21', '2021-01-01 18:30:00', 1, '2021-04-24 04:43:21', '2021-05-30 18:30:00', 'Tenure ends', '2021-04-24 04:43:21', '2021-04-24 04:43:21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(88, 251, 'chaya', 'shankar', 'B', NULL, 80, 1, 1, 'pooja.benurkar@axardigital.com', 'pooja.benurkar@axardigital.com', 'reason', 2, 2, 0, 1, '2021-04-24 05:05:18', '2021-03-31 18:30:00', 1, '2021-04-24 05:05:18', '2021-04-29 18:30:00', 'dffgfd', '2021-04-24 05:05:18', '2021-04-24 05:05:18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(89, 252, 'Sadhana', 'L', 'Sankpal', '1995-02-12', 80, 2, 1, 'sadhana.sankpal@axardigital.com', 'sadhana.sankpal@axardigital.com', 'reason', 1, 1, 0, 1, '2021-04-24 12:57:43', '2020-12-31 18:30:00', 1, '2021-04-24 12:57:43', '2021-05-30 18:30:00', 'test', '2021-04-24 12:57:43', '2021-04-24 12:57:43', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(90, 253, 'Akshay', 'M', 'Hakare', '1996-02-04', 80, 1, 1, 'akshay.hakare@axardigital.com', 'akshay.hakare@axardigital.com', 'reason', 1, 1, 0, 1, '2021-04-26 04:15:50', '2020-12-31 18:30:00', 1, '2021-04-26 04:15:50', NULL, '', '2021-04-26 04:15:50', '2021-04-26 04:15:50', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(91, 254, 'Pooja', '', 'gupta', NULL, 5, 1, 1, 'pooja.gupta@crenexa.com', '', 'reason', 2, 1, 0, 1, '2021-04-26 05:22:10', '2021-04-21 18:30:00', 1, '2021-04-26 05:22:10', NULL, '', '2021-04-26 05:22:10', '2021-04-26 05:22:10', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(92, 255, 'Kajol', '', 'Shah', NULL, 80, 2, 1, 'nrshinkar@gmail.com', '', 'reason', 1, 1, 0, 1, '2021-04-26 05:32:28', '2021-04-19 18:30:00', 1, '2021-04-26 05:32:28', NULL, '', '2021-04-26 05:32:28', '2021-04-26 05:32:28', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(93, 256, 'Samiksha', '', 'Shinkar', '2021-04-20', 80, 2, 1, 'nrshinkar@gmail.com', '', 'reason', 1, 1, 0, 1, '2021-04-26 07:14:29', '2021-04-21 18:30:00', 1, '2021-04-26 07:14:29', NULL, '', '2021-04-26 07:14:29', '2021-04-26 07:14:29', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(94, 257, 'Pratik', '', 'Gupta', '1998-03-18', 7, 1, 1, 'pooja.gupta@crenexa.com', '', 'reason', 1, 1, 0, 1, '2021-04-26 11:10:14', '2021-04-25 18:30:00', 1, '2021-04-26 11:10:14', NULL, '', '2021-04-26 11:10:14', '2021-04-26 11:10:14', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(95, 258, 'Monika', 'R', 'Gupta', '1998-10-28', 4, 1, 1, 'pooja.gupta@crenexa.com', '', 'reason', 1, 1, 0, 1, '2021-04-26 11:34:36', '2021-04-25 18:30:00', 1, '2021-04-26 11:34:36', NULL, '', '2021-04-26 11:34:36', '2021-04-26 11:34:36', 0, NULL, NULL, NULL, NULL, 'QWERT2341Q', NULL, 9148625146, NULL, NULL, '1', '7896541236', '2021-04-25 18:30:00', NULL, NULL, '2021-04-25 18:30:00', NULL, '2021-04-25 18:30:00', NULL, 'MIT', 'MBA', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(96, 259, 'Shreya', '', 'Nimbalkar', '1997-03-05', 80, 2, 1, 'pooja.benurkar@axardigital.com', 'pooja.benurkar1@axardigital.com', 'reason', 2, 2, 0, 1, '2021-04-27 06:31:36', '2021-01-06 18:30:00', 1, '2021-04-27 06:31:36', '2021-07-29 18:30:00', 'Tenure expires', '2021-04-27 06:31:36', '2021-04-27 06:31:36', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(97, 260, 'Chetan', 'Ravi', 'Chopade', NULL, 80, 1, 1, 'pooja.benurkar@axardigital.com', 'pooja.benurkar1@axardigital.com', 'reason', 1, 1, 0, 1, '2021-04-27 06:34:10', '2021-02-03 18:30:00', 1, '2021-04-27 06:34:10', NULL, '', '2021-04-27 06:34:10', '2021-04-27 06:34:10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(98, 261, 'Abhishek', 'P', 'Gupta', '1998-05-04', 80, 1, 1, 'pooja.gupta@crenexa.com', '', 'reason', 1, 1, 0, 1, '2021-04-27 08:21:42', '2021-04-26 18:30:00', 1, '2021-04-27 08:21:42', NULL, '', '2021-04-27 08:21:42', '2021-04-27 08:21:42', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(99, 262, 'Isha', 'A', 'Gupta', '1998-06-29', 80, 2, 1, 'pooja.gupta@crenexa.com', '', 'reason', 1, 1, 0, 262, '2021-04-28 10:43:54', '2021-04-27 18:30:00', 262, '2021-04-28 10:43:54', NULL, '', '2021-04-28 10:43:54', '2021-04-28 10:43:54', 0, NULL, 8965412, 145896, NULL, 'QWERT2341A', NULL, NULL, NULL, NULL, '3', '123658974', '2021-04-27 18:30:00', '2021-04-29 18:30:00', NULL, '2021-04-27 18:30:00', '2021-04-27 18:30:00', '2021-04-27 18:30:00', '2021-04-27 18:30:00', 'MIT', 'MBA', '2016-10-27 18:30:00', NULL, NULL, NULL, NULL, NULL, NULL),
(100, 263, 'Jeeva', 'S', 'Sehgal', NULL, 80, 1, 1, 'pooja.benurkar@axardigital.com', 'pooja.benurkar1@axardigital.com', 'reason', 1, 1, 0, 1, '2021-04-28 12:12:31', '2020-11-30 18:30:00', 1, '2021-04-28 12:12:31', NULL, '', '2021-04-28 12:12:31', '2021-04-28 12:12:31', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(101, 264, 'Arvind', '', 'Krishna', NULL, 80, 1, 1, 'pooja.benurkar@axardigital.com', 'pooja.benurkar1@axardigital.com', 'reason', 1, 1, 0, 1, '2021-04-29 12:35:07', '2021-01-02 18:30:00', 1, '2021-04-29 12:35:07', NULL, '', '2021-04-29 12:35:07', '2021-04-29 12:35:07', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(102, 265, 'Simran', 'A', 'Soni', '1998-11-17', 80, 2, 1, 'pooja.gupta@crenexa.com', 'nrshinkar@gmail.com', 'reason', 1, 1, 0, 265, '2021-05-01 10:44:32', '2021-04-30 18:30:00', 265, '2021-05-01 10:44:32', NULL, '', '2021-05-01 10:44:32', '2021-05-01 10:44:32', 0, 'Material subsidiary', NULL, NULL, 'Pune', 'QWERT1233Q', NULL, 7719827827, NULL, 1, '1', '92379723', '2021-04-30 18:30:00', '2021-05-01 18:30:00', NULL, '2021-04-21 18:30:00', NULL, '2021-04-07 18:30:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(103, 266, 'Riya', '', 'Gupta', '1998-07-29', 80, 3, 1, 'pooja.gupta@crenexa.com', '', 'reason', 1, 1, 0, 1, '2021-05-03 11:46:47', '2021-05-02 18:30:00', 1, '2021-05-03 11:46:47', NULL, '', '2021-05-03 11:46:47', '2021-05-03 11:46:47', 0, NULL, NULL, NULL, NULL, 'QWERT1222A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(104, 267, 'Abhishek', '', 'Wani', NULL, 80, 1, 1, 'nrshinkar@gmail.com', '', 'reason', 1, 1, 0, 1, '2021-05-03 11:48:27', '2021-05-02 18:30:00', 1, '2021-05-03 11:48:27', NULL, '', '2021-05-03 11:48:27', '2021-05-03 11:48:27', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(105, 268, 'Diya', '', 'Soni', '2021-05-02', 5, 3, 1, 'pooja.gupta@crenexa.com', '', 'reason', 2, 1, 0, 1, '2021-05-03 12:02:56', '2021-05-02 18:30:00', 1, '2021-05-03 12:02:56', NULL, '', '2021-05-03 12:02:56', '2021-05-03 12:02:56', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(106, 269, 'Raj', 'A', 'Kapoor', '1998-10-19', 80, 1, 1, 'pooja.gupta@crenexa.com', '', 'reason', 1, 1, 0, 1, '2021-05-04 03:52:06', '2021-05-03 18:30:00', 1, '2021-05-04 03:52:06', NULL, '', '2021-05-04 03:52:06', '2021-05-04 03:52:06', 0, NULL, NULL, NULL, NULL, 'QWERT1234A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `UserRoleMappings`
--

CREATE TABLE `UserRoleMappings` (
  `id` int(11) NOT NULL,
  `umId` int(11) NOT NULL,
  `rmId` int(11) UNSIGNED NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT 0,
  `createdBy` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  `modifiedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `UserRoleMappings`
--

INSERT INTO `UserRoleMappings` (`id`, `umId`, `rmId`, `isDeleted`, `createdBy`, `createdAt`, `modifiedBy`, `modifiedAt`) VALUES
(3, 267, 2, 0, 1, '2021-04-08 04:58:42', 173, '2021-04-08 04:58:42'),
(4, 174, 3, 0, 1, '2021-04-08 05:03:49', 174, '2021-04-08 05:03:49'),
(5, 175, 3, 0, 1, '2021-04-08 05:06:45', 175, '2021-04-08 05:06:45'),
(8, 178, 3, 0, 1, '2021-04-09 10:40:44', 178, '2021-04-09 10:40:44'),
(9, 179, 3, 0, 1, '2021-04-12 06:31:40', 179, '2021-04-12 06:31:40'),
(10, 179, 4, 0, 1, '2021-04-12 06:31:40', 179, '2021-04-12 06:31:40'),
(11, 180, 2, 0, 1, '2021-04-12 06:36:36', 180, '2021-04-12 06:36:36'),
(13, 180, 4, 0, 1, '2021-04-12 06:36:36', 180, '2021-04-12 06:36:36'),
(20, 214, 3, 0, 1, '2021-04-20 10:01:01', 214, '2021-04-20 10:01:01'),
(22, 218, 3, 0, 1, '2021-04-21 02:44:10', 218, '2021-04-21 02:44:10'),
(23, 219, 2, 0, 1, '2021-04-21 05:00:03', 219, '2021-04-21 05:00:03'),
(24, 219, 3, 0, 1, '2021-04-21 05:00:03', 219, '2021-04-21 05:00:03'),
(25, 220, 3, 0, 1, '2021-04-21 06:57:32', 220, '2021-04-21 06:57:32'),
(26, 221, 3, 0, 1, '2021-04-22 07:08:40', 221, '2021-04-22 07:08:40'),
(27, 229, 3, 0, 1, '2021-04-22 07:36:30', 229, '2021-04-22 07:36:30'),
(30, 215, 3, 0, 1, '2021-04-22 08:04:05', 215, '2021-04-22 08:04:05'),
(31, 215, 4, 0, 1, '2021-04-22 08:04:05', 215, '2021-04-22 08:04:05'),
(33, 231, 3, 0, 1, '2021-04-22 10:59:05', 231, '2021-04-22 10:59:05'),
(34, 242, 3, 0, 1, '2021-04-23 10:06:21', 242, '2021-04-23 10:06:21'),
(35, 244, 3, 0, 1, '2021-04-23 10:44:28', 244, '2021-04-23 10:44:28'),
(38, 247, 3, 0, 1, '2021-04-23 12:03:19', 247, '2021-04-23 12:03:19'),
(39, 248, 3, 0, 1, '2021-04-23 12:26:00', 248, '2021-04-23 12:26:00'),
(40, 249, 3, 0, 1, '2021-04-23 12:45:20', 249, '2021-04-23 12:45:20'),
(41, 250, 2, 0, 1, '2021-04-24 04:43:21', 250, '2021-04-24 04:43:21'),
(42, 250, 3, 0, 1, '2021-04-24 04:43:21', 250, '2021-04-24 04:43:21'),
(43, 250, 4, 0, 1, '2021-04-24 04:43:21', 250, '2021-04-24 04:43:21'),
(44, 251, 3, 0, 1, '2021-04-24 05:05:18', 251, '2021-04-24 05:05:18'),
(48, 253, 2, 0, 1, '2021-04-26 04:15:50', 253, '2021-04-26 04:15:50'),
(49, 253, 3, 0, 1, '2021-04-26 04:15:50', 253, '2021-04-26 04:15:50'),
(50, 253, 4, 0, 1, '2021-04-26 04:15:50', 253, '2021-04-26 04:15:50'),
(51, 254, 3, 0, 1, '2021-04-26 05:22:10', 254, '2021-04-26 05:22:10'),
(52, 255, 3, 0, 1, '2021-04-26 05:32:28', 255, '2021-04-26 05:32:28'),
(53, 256, 3, 0, 1, '2021-04-26 07:14:29', 256, '2021-04-26 07:14:29'),
(54, 257, 3, 0, 1, '2021-04-26 11:10:14', 257, '2021-04-26 11:10:14'),
(55, 258, 3, 0, 1, '2021-04-26 11:34:36', 258, '2021-04-26 11:34:36'),
(56, 259, 2, 0, 1, '2021-04-27 06:31:36', 259, '2021-04-27 06:31:36'),
(57, 259, 3, 0, 1, '2021-04-27 06:31:36', 259, '2021-04-27 06:31:36'),
(58, 259, 4, 0, 1, '2021-04-27 06:31:36', 259, '2021-04-27 06:31:36'),
(59, 260, 2, 0, 1, '2021-04-27 06:34:10', 260, '2021-04-27 06:34:10'),
(60, 260, 3, 0, 1, '2021-04-27 06:34:10', 260, '2021-04-27 06:34:10'),
(61, 260, 4, 0, 1, '2021-04-27 06:34:10', 260, '2021-04-27 06:34:10'),
(62, 261, 2, 0, 1, '2021-04-27 08:21:42', 261, '2021-04-27 08:21:42'),
(63, 261, 3, 0, 1, '2021-04-27 08:21:42', 261, '2021-04-27 08:21:42'),
(69, 262, 2, 0, 1, '2021-04-28 11:25:35', 262, '2021-04-28 11:25:35'),
(70, 262, 3, 0, 1, '2021-04-28 11:25:35', 262, '2021-04-28 11:25:35'),
(71, 263, 2, 0, 1, '2021-04-28 12:12:31', 263, '2021-04-28 12:12:31'),
(72, 263, 3, 0, 1, '2021-04-28 12:12:31', 263, '2021-04-28 12:12:31'),
(73, 263, 4, 0, 1, '2021-04-28 12:12:31', 263, '2021-04-28 12:12:31'),
(74, 252, 2, 0, 1, '2021-04-29 06:37:56', 252, '2021-04-29 06:37:56'),
(75, 252, 3, 0, 1, '2021-04-29 06:37:56', 252, '2021-04-29 06:37:56'),
(76, 252, 4, 0, 1, '2021-04-29 06:37:56', 252, '2021-04-29 06:37:56'),
(77, 1, 1, 0, 1, '2021-04-29 07:46:23', 1, '2021-04-29 07:46:23'),
(78, 264, 3, 0, 1, '2021-04-29 12:35:07', 264, '2021-04-29 12:35:07'),
(91, 265, 3, 0, 1, '2021-05-01 11:08:13', 265, '2021-05-01 11:08:13'),
(92, 230, 3, 0, 1, '2021-05-03 04:49:14', 230, '2021-05-03 04:49:14'),
(94, 176, 3, 0, 1, '2021-05-03 08:45:39', 176, '2021-05-03 08:45:39'),
(95, 245, 2, 0, 1, '2021-05-03 11:45:17', 245, '2021-05-03 11:45:17'),
(96, 245, 3, 0, 1, '2021-05-03 11:45:17', 245, '2021-05-03 11:45:17'),
(99, 267, 3, 0, 1, '2021-05-03 11:48:27', 267, '2021-05-03 11:48:27'),
(100, 266, 2, 0, 1, '2021-05-03 11:48:57', 266, '2021-05-03 11:48:57'),
(101, 266, 3, 0, 1, '2021-05-03 11:48:57', 266, '2021-05-03 11:48:57'),
(102, 268, 2, 0, 1, '2021-05-03 12:02:56', 268, '2021-05-03 12:02:56'),
(103, 268, 3, 0, 1, '2021-05-03 12:02:56', 268, '2021-05-03 12:02:56'),
(104, 268, 4, 0, 1, '2021-05-03 12:02:56', 268, '2021-05-03 12:02:56'),
(109, 269, 2, 0, 1, '2021-05-04 04:05:04', 269, '2021-05-04 04:05:04'),
(110, 269, 3, 0, 1, '2021-05-04 04:05:04', 269, '2021-05-04 04:05:04');

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`id`, `username`, `password`) VALUES
(1, 'kavita', '$2b$10$W.Pw6X/vZzFBuehc8kmnH.48io7PRtoEPmR6HRZbUgd2XVUvQ36Wy'),
(172, 'Aditi', '$2b$10$W.Pw6X/vZzFBuehc8kmnH.48io7PRtoEPmR6HRZbUgd2XVUvQ36Wy'),
(173, 'Sandesh', '$2b$10$iW69Y2ow1GSZtizLDBcHF.X0DCgrVFCxQaVodFxIbhqJswbpDgA3q'),
(174, 'Mahesh', '$2b$10$Nd/YizJkX1RI.MCdPoq5..3rS5GrAgsWonbIRR1dtpM/LORpuJXlS'),
(175, 'Jay', '$2b$10$2.DvocTpEblqfABgsLZ9Het7ZxTrk/9an..gimw14X0dz0ly8BSLa'),
(176, 'Pooja', '$2b$10$1cw6ScDjjcP284tLyI116eo0lDVI0qJlqZnaHuqESvkvsu15gyyny'),
(178, 'Pratik', '$2b$10$6mBlBdPgftMWCYW5bPAoK.SVCcslYJUpFa8itSov6EPKZv5ljhQP6'),
(179, 'poojab', '$2b$10$x8ma5lbc9CxofD.iVOMct.ahfwd1PZZGWNmwSH32SNbla6lWrqp4O'),
(180, 'ramp', '$2b$10$n9wf1/l9gFsii9d/QjrLvuqlx0jqvl4hXlZF2hMb7RiVbBu5dXbHS'),
(183, 'veena', '$2b$10$m.5pVyNATQ/m9LuxN3vGXeimiiSH4DgFeKU8NJlJMKKJyGmaxGrYO'),
(214, 'charlie', '$2b$10$RefXtfDmpK9FuunA86nRm.yRnQCUOOUEUsU/OJ/5nOGD2vJaOHQcG'),
(215, 'pritam', '$2b$10$jUWbZ8NfNeSdec7Eg4EU9eRFNUl55LPbi5KenhB854pjiV3e36276'),
(216, 'Jyoti', '$2b$10$tekWkNWmFU5ltN0lR6z2z.FYllBG/fbsUSTf2fSB8Koa9HSyd1nLW'),
(218, 'abheer', '$2b$10$2uu4ItQzn6XEJ0yWYH915uG9ijZpLevQdxSMjC3Lr4/Se0iYpKEay'),
(219, 'Ahana', '$2b$10$XJIdzbcOW/1Z6Zuf96tb8u94wPtxN7m8GLho4Hl2x0BXxgCMzUJ7.'),
(220, 'Mukesh', '$2b$10$24N5886gVuHDXwfu.aHtb.p8jqwm9XLIOhdT3yXQt6Ja9/92DM8am'),
(221, 'priya', '$2b$10$qarvNKUmqJzh5/CvdRh5ge/rxIAfwQJknHBiwryYDj5q1y.t2N/ce'),
(222, 'rushi', '$2b$10$jbPXR3hVeGFLXqOzwfi.Q.pTIy0mxakwpnuAwOQ2lpzz5MCybXmkK'),
(229, 'rushi12', '$2b$10$OIEhwCS2gaTDcg/UX6S.oeSYbA5b7AEiU6WPIr1wHfWUKoIbsstce'),
(230, 'abhi123', '$2b$10$PEb6OMrLOycVY5gs1qKQX.GQQpT4WBiRmkQyBdzs4swkj0jIP6sUm'),
(231, 'Sonu', '$2b$10$93pBtegURC40IQrzOJXsSuGUEkrmv9w.iODeBrG1BQTxLgzBFlNvy'),
(239, 'Prajakta', '$2b$10$QOaKBYGBxIn4.SQ8WtY0UuWWyHS5F6EOZAwbLF40E.iv81QjsdDTS'),
(241, 'AnujaT', '$2b$10$ZovWAJEq50blM84Lr0ilIOWgs6MwnYUPFRYpsnLTgHSMHJWynhUfC'),
(242, 'PrachiS', '$2b$10$4s/MIohlBRsZo67gxfQ8R.ogArgwu0xwfemjG5ResWk9N8CO9LNda'),
(243, 'jayp', '$2b$10$D/BBLqPTIFI52SqH51bGCerXfQFyNZki7gHiLTcPRS4NWoMhF7rse'),
(244, 'xxxx', '$2b$10$jySUi7ylnZKzz8w1zzScgOQfrHPIX0HIg415QGdnM5kPnqhvgegcW'),
(245, 'Monu', '$2b$10$8SsoCYqqNmtMSFGGcs1Um.acZgyrlwzju3/8v7viIdyjDAIpA3nHq'),
(246, 'Sumedha1', '$2b$10$5sosdabvkwB72Fwzk4hWxOTIAe.mkZ8jgdtKc2JutBaZXvAr0qw0m'),
(247, 'Sumedha', '$2b$10$OdSVxzPlWiflBrpgzoT8wOAZmlEJBTNFQvK2vhA9dev2i6o7IVM.q'),
(248, 'charlie123', '$2b$10$fWIBXp.BZY9RYBMDRjfMjO5EFIQU1UhjIcQPMPoL9eyQ.Nh.uW3Qu'),
(249, 'charlie...', '$2b$10$woCX24t5vWr1xNgg8rH1d.FWQRbeAnMpj5CtgrV980PZcngOvYday'),
(250, 'avani', '$2b$10$ozl7Jl/gre9hCFCEtZBit.qvbClB8fsXyPooLws73VrLVMGennQ0e'),
(251, 'chaya', '$2b$10$.TEVGQMIVnlvQw3cqQw2HuOm47b6EhteXMpIUUH/hywyRyjZNt/C.'),
(252, 'sadhana', '$2b$10$UxG3m1mU3JMYAc7YtcZdhucgZ05ftQ2c6PHWFdphbOjDA0iqfgsfm'),
(253, 'akshay', '$2b$10$7/Z3jwQZGFlaTH6DPPDTWuWKGR2mLeyvKc3Pcms8oZR7j73uCswNm'),
(254, 'ppooja', '$2b$10$JLuSbwIdljSH7cdbqBRrxen36uMqY8pq9F8axcKAg5Qgn3qTgIAIO'),
(255, 'Kajol', '$2b$10$QSOExPIx7RvR6oMfo/PiKObR1JL9Dpe3J1D8eNllvfly9c/iHEGZS'),
(256, 'Sami', '$2b$10$BVDUrT6rYtuc15f.ZliL5e2dHx.n.I6KJuRJMxK9O.LWgvhYMHpua'),
(257, 'Mogal', '$2b$10$pALO/N8SaQjJL7Loot2bcOoNmjIikZK/lpCi086zSAiKRm/tMDbnm'),
(258, 'Monika', '$2b$10$JpgBRTm30UnivHIClFfP3uP7DNbHiTBkmwb1rgK9SM/oSRZoqZLWa'),
(259, 'shreya', '$2b$10$QVwEt5Atw.BUcGyjSyQkrOJDihs1AioMKRA6w8Qw0q7Nqau9ZxWNS'),
(260, 'chetan', '$2b$10$QOMdA6TaBaFyhH6iJpxdC.aoN1XIsbDhBxQOR0GU8rQuFvtrgXuqy'),
(261, 'Abhishek', '$2b$10$xv3qjhJZ8kgpTWnz6z003uEPVu8imo8Rl.c7FwFq/OcZdcDOGtl5.'),
(262, 'Isha', '$2b$10$92/IeLM9eoFxMCF./j8gN.uxRiTJ131WUiDyPP.074QheZ1Spkrv.'),
(263, 'jeeva', '$2b$10$VcoWS8bWRlU97QP.UPwo5uzPLV53FLv9ZwkLC9tHk9UxtqSgQcmkK'),
(264, 'arvind', '$2b$10$0fPtiWmvKUZ9VN2o/PGxvuE9zJ7d0KjR7g2t/CFKNAIUR3QXGmxf6'),
(265, 'Simran', '$2b$10$idqZ2yWGJD3fUqePsAavy.HtZoNqh34d4y3/2YuOGmn/krnSA/Iqm'),
(266, 'Riya', '$2b$10$nj3GOHzX8DZ/6qiiRwFWzO/qXLkqJ4ZHWhxBGX8uob9Mg1ae.ErPq'),
(267, 'Abhi', '$2b$10$W.Pw6X/vZzFBuehc8kmnH.48io7PRtoEPmR6HRZbUgd2XVUvQ36Wy'),
(268, 'Diya', '$2b$10$a8sYIXka7LeZu4MDVl/Hoenx9e2wl2RJ9jRZhZhbylt86dohiBylm'),
(269, 'Raj', '$2b$10$GZXEyef/foatO30Qx0tYxeguIVnB6SIM/TIK30IinUzDPB1Nkfseq');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ClientCompanies`
--
ALTER TABLE `ClientCompanies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ClientCompanyAddressMaps`
--
ALTER TABLE `ClientCompanyAddressMaps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ClientCompanyApprovals`
--
ALTER TABLE `ClientCompanyApprovals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ClientCompanyUserMappings`
--
ALTER TABLE `ClientCompanyUserMappings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Companies`
--
ALTER TABLE `Companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `CompanyAddressMaps`
--
ALTER TABLE `CompanyAddressMaps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_CompanyAddressMaps_1_idx` (`companyId`),
  ADD KEY `fk_CompanyAddressMaps_2_idx` (`createdBy`),
  ADD KEY `fk_CompanyAddressMaps_3_idx` (`lastModifiedBy`);

--
-- Indexes for table `company_Companies`
--
ALTER TABLE `company_Companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ConnectedPersons`
--
ALTER TABLE `ConnectedPersons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Countries`
--
ALTER TABLE `Countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Departments`
--
ALTER TABLE `Departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `DesignatedPersons`
--
ALTER TABLE `DesignatedPersons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Designations`
--
ALTER TABLE `Designations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ISINs`
--
ALTER TABLE `ISINs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Nationalities`
--
ALTER TABLE `Nationalities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `NatureOfBusinesses`
--
ALTER TABLE `NatureOfBusinesses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `PreClearanceRequests`
--
ALTER TABLE `PreClearanceRequests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `PreClearanceUsers`
--
ALTER TABLE `PreClearanceUsers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `RelatedClientCompanyMappings`
--
ALTER TABLE `RelatedClientCompanyMappings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_RelatedClientCompanyMap_1_idx` (`cmId`),
  ADD KEY `fk_RelatedClientCompanyMap_2_idx` (`modifiedBy`),
  ADD KEY `fk_RelatedClientCompanyMap_3_idx` (`cmClientCompanyHas`),
  ADD KEY `fk_RelatedClientCompanyMap_4_idx` (`createdBy`);

--
-- Indexes for table `RelatedCompanyMappings`
--
ALTER TABLE `RelatedCompanyMappings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_RelatedCompanyMap_1_idx` (`cmId`),
  ADD KEY `fk_RelatedCompanyMap_2_idx` (`modifiedBy`),
  ADD KEY `fk_RelatedCompanyMappings_3_idx` (`cmCompanyHas`),
  ADD KEY `fk_RelatedCompanyMappings_4_idx` (`createdBy`);

--
-- Indexes for table `RestrictedCompanyMasters`
--
ALTER TABLE `RestrictedCompanyMasters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Roles`
--
ALTER TABLE `Roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `States`
--
ALTER TABLE `States`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Tokens`
--
ALTER TABLE `Tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Tokens_1_idx` (`createdBy`);

--
-- Indexes for table `UPSI`
--
ALTER TABLE `UPSI`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `UPSICategories`
--
ALTER TABLE `UPSICategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `UPSIUser`
--
ALTER TABLE `UPSIUser`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `UserDetails`
--
ALTER TABLE `UserDetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_UserDetails_1_idx` (`userId`);

--
-- Indexes for table `UserRoleMappings`
--
ALTER TABLE `UserRoleMappings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_UserRoleMap_1_idx` (`umId`),
  ADD KEY `fk_UserRoleMap_2_idx` (`rmId`),
  ADD KEY `fk_UserRoleMapp_3_idx` (`modifiedBy`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ClientCompanies`
--
ALTER TABLE `ClientCompanies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `ClientCompanyAddressMaps`
--
ALTER TABLE `ClientCompanyAddressMaps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `ClientCompanyApprovals`
--
ALTER TABLE `ClientCompanyApprovals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ClientCompanyUserMappings`
--
ALTER TABLE `ClientCompanyUserMappings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Companies`
--
ALTER TABLE `Companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `CompanyAddressMaps`
--
ALTER TABLE `CompanyAddressMaps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `company_Companies`
--
ALTER TABLE `company_Companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ConnectedPersons`
--
ALTER TABLE `ConnectedPersons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Countries`
--
ALTER TABLE `Countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=228;

--
-- AUTO_INCREMENT for table `Departments`
--
ALTER TABLE `Departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `DesignatedPersons`
--
ALTER TABLE `DesignatedPersons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Designations`
--
ALTER TABLE `Designations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ISINs`
--
ALTER TABLE `ISINs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `Nationalities`
--
ALTER TABLE `Nationalities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=186;

--
-- AUTO_INCREMENT for table `NatureOfBusinesses`
--
ALTER TABLE `NatureOfBusinesses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `PreClearanceRequests`
--
ALTER TABLE `PreClearanceRequests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `PreClearanceUsers`
--
ALTER TABLE `PreClearanceUsers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `RelatedClientCompanyMappings`
--
ALTER TABLE `RelatedClientCompanyMappings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `RelatedCompanyMappings`
--
ALTER TABLE `RelatedCompanyMappings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `RestrictedCompanyMasters`
--
ALTER TABLE `RestrictedCompanyMasters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `States`
--
ALTER TABLE `States`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `Tokens`
--
ALTER TABLE `Tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `UPSI`
--
ALTER TABLE `UPSI`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `UPSICategories`
--
ALTER TABLE `UPSICategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `UPSIUser`
--
ALTER TABLE `UPSIUser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `UserDetails`
--
ALTER TABLE `UserDetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `UserRoleMappings`
--
ALTER TABLE `UserRoleMappings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=270;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `RelatedClientCompanyMappings`
--
ALTER TABLE `RelatedClientCompanyMappings`
  ADD CONSTRAINT `fk_RelatedClientCompanyMap_1` FOREIGN KEY (`cmId`) REFERENCES `ClientCompanies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_RelatedClientCompanyMap_2` FOREIGN KEY (`modifiedBy`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_RelatedClientCompanyMap_3` FOREIGN KEY (`cmClientCompanyHas`) REFERENCES `company_Companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_RelatedClientCompanyMap_4` FOREIGN KEY (`createdBy`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Tokens`
--
ALTER TABLE `Tokens`
  ADD CONSTRAINT `fk_Tokens_1` FOREIGN KEY (`createdBy`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `UserDetails`
--
ALTER TABLE `UserDetails`
  ADD CONSTRAINT `fk_UserDetails_1` FOREIGN KEY (`userId`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `UserRoleMappings`
--
ALTER TABLE `UserRoleMappings`
  ADD CONSTRAINT `fk_UserRoleMap_1` FOREIGN KEY (`umId`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_UserRoleMap_2` FOREIGN KEY (`rmId`) REFERENCES `Roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_UserRoleMap_3` FOREIGN KEY (`modifiedBy`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
