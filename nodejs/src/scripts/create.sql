--new user table==================================================
CREATE TABLE `ili`.`Users` (
  `id` INT NOT NULL,
  `username` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC));


ALTER TABLE `ili`.`Users` 
CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT ;

--Conutries Master Table=======================================

CREATE TABLE `Countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--userdetails=================================================
CREATE TABLE `ili`.`UserDetails` (
`id` INT NOT NULL AUTO_INCREMENT,
`userId` INT NOT NULL,
`firstName` VARCHAR(50) NOT NULL,
`middleName` VARCHAR(50) NULL,
`lastName` VARCHAR(50) NOT NULL,
`dob` DATE NOT NULL,
`nationality` INT NOT NULL,
`category` TINYINT NOT NULL,
`isDesignatedPerson` TINYINT NOT NULL,
`email` VARCHAR(100) NOT NULL,
`secondaryEmail` VARCHAR(100) NOT NULL,
`profilePicture` VARCHAR(250) NULL,
`status` INT NOT NULL,
`createdBy` INT NOT NULL,
`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
`addedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
`modifiedBy` INT NOT NULL,
`modifiedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
`deactivatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
`reasonForDeactivation` VARCHAR(255) NOT NULL,
`loggedInAt` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
`loggedOutAt` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
INDEX `fk_UserDetails_1_idx` (`userId` ASC),
CONSTRAINT `fk_UserDetails_1`
FOREIGN KEY (`userId`)
REFERENCES `ili`.`Users` (`id`)
ON DELETE CASCADE
ON UPDATE CASCADE);

--UserRoleMapping Tbale============================================
CREATE TABLE `UserRoleMappings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `umId` int(11) NOT NULL,
  `rmId` int(11) unsigned NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `createdBy` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  `modifiedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_UserRoleMap_1_idx` (`umId`),
  KEY `fk_UserRoleMap_2_idx` (`rmId`),
  KEY `fk_UserRoleMapp_3_idx` (`modifiedBy`),
  CONSTRAINT `fk_UserRoleMap_1` FOREIGN KEY(`umId`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_UserRoleMap_2` FOREIGN KEY(`rmId`) REFERENCES `Roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_UserRoleMap_3` FOREIGN KEY(`modifiedBy`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- Role Master Table=============================================
CREATE TABLE `Roles` (
  `id` int(11) unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `createdBy` int(10) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--Token MAster Table====================================
CREATE TABLE `Tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(100) NOT NULL,
  `tokenFor` varchar(100) NOT NULL,
  `createdBy` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expiredAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_Tokens_1_idx` (`createdBy`),
  CONSTRAINT `fk_Tokens_1` FOREIGN KEY (`createdBy`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;


--IDDetailMaster Table===============================================
CREATE TABLE `ili`.`IDDetailMaster` (
  `id` INT NOT NULL,
  `idName` VARCHAR(45) NOT NULL,
  `issuingAuthority` VARCHAR(45) NOT NULL,
  `issuingCountry` VARCHAR(45) NOT NULL,
  `issuingState` VARCHAR(45) NOT NULL,
  `isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
  `createdBy` INT NOT NULL,
  `createdAt` DATETIME NOT NULL,
  `modifiedBy` INT NOT NULL,
  `modifiedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`));

--Person Tbale=========================================
CREATE TABLE `ili`.`Person` (
  `id` INT NOT NULL,
  `organizationName` NVARCHAR(50) NOT NULL,
  `orgPANNo` NVARCHAR(15) NOT NULL,
  `personName` NVARCHAR(50) NOT NULL,
  `isMinor` TINYINT(1) NOT NULL DEFAULT 0,
  `gardianPANNo` NVARCHAR(15) NOT NULL,
  `panNo` NVARCHAR(15) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `mobileNo` NVARCHAR(20) NOT NULL,
  `alternateMobNo` NVARCHAR(50) NOT NULL,
  `landlineNo` NVARCHAR(20) NOT NULL,
  `emailId` NVARCHAR(50) NOT NULL,
  `DateOfAddition` DATETIME NOT NULL,
  `DateOfCessation` DATETIME NOT NULL,
  `IsEmployee` TINYINT(1) NOT NULL DEFAULT 0,
  `isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
  `createdBy` INT(10) NOT NULL,
  `createdAt` DATETIME NOT NULL,
  `modifiedBy` INT(10) NOT NULL,
  `modifiedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`));

--RelatedCompanyMappingTable===============================
CREATE TABLE `RelatedCompanyMappings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cmId` int(11) NOT NULL,
  `cmCompanyHas` varchar(50) CHARACTER SET utf8 NOT NULL,
  `companyName` varchar(50) CHARACTER SET utf8 NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `createdBy` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  `modifiedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_RelatedCompanyMap_1_idx` (`cmId`),
  KEY `fk_RelatedCompanyMap_2_idx` (`modifiedBy`),
  CONSTRAINT `fk_RelatedCompanyMap_1` FOREIGN KEY (`cmId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_RelatedCompanyMap_2` FOREIGN KEY (`modifiedBy`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--CompanyHasTable For relation bet company and its mapping companyHas Values=========
CREATE TABLE `ili`.`CompanyHas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `companyId` INT NOT NULL,
  `companyHasId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_CompanyHas_1_idx` (`companyId` ASC),
  INDEX `fk_CompanyHas_2_idx` (`companyHasId` ASC),
  CONSTRAINT `fk_CompanyHas_1` FOREIGN KEY (`companyId`) REFERENCES `ili`.`Companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_CompanyHas_2` FOREIGN KEY (`companyHasId`) REFERENCES `ili`.`RelatedCompanyMappings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE);
  ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
  
--Company Master Model========================================
CREATE TABLE `Companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyLogo` varchar(255) DEFAULT NULL,
  `companyName` varchar(255) DEFAULT NULL,
  `nseCode` varchar(45) NOT NULL,
  `bseCode` varchar(45) NOT NULL,
  `companyHas` int(11) NOT NULL,
  `registrationDate` date NOT NULL,
  `regularDisclosure` varchar(50) NOT NULL,
  `previousDisclosureDate` date NOT NULL,
  `nextDisclosureDate` date NOT NULL,
  `businessNature` int(10) unsigned NOT NULL,
  `companyClass` tinyint(4) NOT NULL,
  `financialYearFrom` date NOT NULL,
  `financialYearTo` date NOT NULL,
  `companyWebsite` varchar(50) NOT NULL,
  `securityListedClass` varchar(255) NOT NULL,
  `thresholdPeriodicity` int(11) NOT NULL,
  `thresholdValue` varchar(255) NOT NULL,
  `thresholdQuantity` varchar(50) NOT NULL,
  `tradingAllowdInClient` tinyint(4) DEFAULT NULL,
  `tradingAllowdInNonClient` tinyint(4) DEFAULT NULL,
  `createdBy` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedBy` int(11) NOT NULL,
  `modifiedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;


--Client Company Master Table========================================
CREATE TABLE `ClientCompanies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyName` varchar(255) DEFAULT NULL,
  `nseCode` varchar(45) NOT NULL,
  `bseCode` varchar(45) NOT NULL,
  `companyHas` int(11) NOT NULL,
  `registrationDate` date NOT NULL,
  `businessNature` int(10) unsigned NOT NULL,
  `companyClass` tinyint(4) NOT NULL,
  `companyWebsite` varchar(50) NOT NULL,
  `securityListedClass` varchar(255) NOT NULL,
  `approvalStatus` varchar(45) DEFAULT NULL,
  `createdBy` int(11) NOT NULL,
  `createdAt` date NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  `modifiedAt` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--Company Address Mapping Table============================
CREATE TABLE `CompanyAddressMaps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyId` int(11) NOT NULL,
  `addressType` enum('Registered Office','Corporate Office','Sales Office') DEFAULT 'Registered Office',
  `address` text,
  `country` int(11) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `pin` int(11) DEFAULT NULL,
  `landlineNumber` varchar(45) DEFAULT NULL,
  `faxNumber` varchar(45) DEFAULT NULL,
  `emailId` varchar(45) DEFAULT NULL,
  `isDeleted` varchar(45) NOT NULL DEFAULT '0',
  `createdBy` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastModifiedBy` int(11) DEFAULT NULL,
  `lastUpdatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_CompanyAddressMaps_1_idx` (`companyId`),
  KEY `fk_CompanyAddressMaps_2_idx` (`createdBy`),
  KEY `fk_CompanyAddressMaps_3_idx` (`lastModifiedBy`),
  CONSTRAINT `fk_CompanyAddressMaps_1` FOREIGN KEY (`companyId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_CompanyAddressMaps_2` FOREIGN KEY (`createdBy`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_CompanyAddressMaps_3` FOREIGN KEY (`lastModifiedBy`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--Related CompanyHas MApping Table==========================
CREATE TABLE `RelatedCompanyMappings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cmId` int(11) NOT NULL,
  `cmCompanyHas` int(11) NOT NULL,
  `companyName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `isDeleted` tinyint(1) DEFAULT '0',
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_RelatedCompanyMap_1_idx` (`cmId`),
  KEY `fk_RelatedCompanyMap_2_idx` (`modifiedBy`),
  KEY `fk_RelatedCompanyMappings_3_idx` (`cmCompanyHas`),
  KEY `fk_RelatedCompanyMappings_4_idx` (`createdBy`),
  CONSTRAINT `fk_RelatedCompanyMap_1` FOREIGN KEY (`cmId`) REFERENCES `Companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_RelatedCompanyMap_2` FOREIGN KEY (`modifiedBy`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_RelatedCompanyMappings_3` FOREIGN KEY (`cmCompanyHas`) REFERENCES `company_Companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_RelatedCompanyMappings_4` FOREIGN KEY (`createdBy`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;


--ClientCompanyAddressMaps===========================================
CREATE TABLE `ClientCompanyAddressMaps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientCompanyId` int(11) NOT NULL,
  `addressType` enum('Registered Office','Corporate Office','Sales Office') DEFAULT 'Registered Office',
  `address` text,
  `country` int(11) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `pin` int(11) DEFAULT NULL,
  `landlineNumber` varchar(45) DEFAULT NULL,
  `faxNumber` varchar(45) DEFAULT NULL,
  `emailId` varchar(45) DEFAULT NULL,
  `isDeleted` varchar(45) NOT NULL DEFAULT '0',
  `createdBy` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastModifiedBy` int(11) DEFAULT NULL,
  `lastUpdatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ClientCompanyAddressMaps_1_idx` (`clientCompanyId`),
  KEY `fk_ClientCompanyAddressMaps_2_idx` (`createdBy`),
  KEY `fk_ClientCompanyAddressMaps_3_idx` (`lastModifiedBy`),
  CONSTRAINT `fk_ClientCompanyAddressMaps_1` FOREIGN KEY (`clientCompanyId`) REFERENCES `ClientCompanies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ClientCompanyAddressMaps_2` FOREIGN KEY (`createdBy`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ClientCompanyAddressMaps_3` FOREIGN KEY (`lastModifiedBy`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--Related Client CompanyHas Mapping=================================
CREATE TABLE `RelatedClientCompanyMappings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cmId` int(11) NOT NULL,
  `cmClientCompanyHas` int(11) NOT NULL,
  `clientCompanyName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `isDeleted` tinyint(1) DEFAULT '0',
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_RelatedClientCompanyMap_1_idx` (`cmId`),
  KEY `fk_RelatedClientCompanyMap_2_idx` (`modifiedBy`),
  KEY `fk_RelatedClientCompanyMap_3_idx` (`cmClientCompanyHas`),
  KEY `fk_RelatedClientCompanyMap_4_idx` (`createdBy`),
  CONSTRAINT `fk_RelatedClientCompanyMap_1` FOREIGN KEY (`cmId`) REFERENCES `ClientCompanies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_RelatedClientCompanyMap_2` FOREIGN KEY (`modifiedBy`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_RelatedClientCompanyMap_3` FOREIGN KEY (`cmClientCompanyHas`) REFERENCES `company_Companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_RelatedClientCompanyMap_4` FOREIGN KEY (`createdBy`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--PreClearance Request========================================
CREATE TABLE `ili`.`preClearanceRequests` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `clientCompany` INT NOT NULL,
  `requestDate` DATETIME NOT NULL,
  `quantityRequest` INT NOT NULL,
  `tradingType` VARCHAR(45) NOT NULL,
  `securityType` VARCHAR(45) NOT NULL,
  `ISIN` INT NOT NULL,
  `lastDateOfProposedTrading` DATETIME NOT NULL,
  `estimatedValue` INT NOT NULL,
  `isUPSIProcess` TINYINT NOT NULL,
  `statusOfRequest` VARCHAR(45) NULL,
  `quantityApproved` INT NOT NULL,
  `reasonForDisapproved` TEXT NULL,
  `approvedBy` INT NOT NULL,
  `approvedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` TINYINT NOT NULL,
  `createdBy` INT NOT NULL,
  `craetedAt` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `lastModifiedBy` INT NULL,
  `lastModifiedAt` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_preClearanceRequests_1_idx` (`clientCompany` ASC),
  INDEX `fk_preClearanceRequests_2_idx` (`ISIN` ASC),
  INDEX `fk_preClearanceRequests_3_idx` (`approvedBy` ASC),
  INDEX `fk_preClearanceRequests_4_idx` (`createdBy` ASC),
  INDEX `fk_preClearanceRequests_5_idx` (`lastModifiedBy` ASC),
  CONSTRAINT `fk_preClearanceRequests_1`
    FOREIGN KEY (`clientCompany`)
    REFERENCES `ili`.`ClientCompanies` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_preClearanceRequests_2`
    FOREIGN KEY (`ISIN`)
    REFERENCES `ili`.`ISINs` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_preClearanceRequests_3`
    FOREIGN KEY (`approvedBy`)
    REFERENCES `ili`.`Users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_preClearanceRequests_4`
    FOREIGN KEY (`createdBy`)
    REFERENCES `ili`.`Users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_preClearanceRequests_5`
    FOREIGN KEY (`lastModifiedBy`)
    REFERENCES `ili`.`Users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);



--ClientCompany User mapping========================================
CREATE TABLE `ClientCompanyUserMappings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cmId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `isDeleted` tinyint(1) DEFAULT '0',
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_ClientCompanyUserMap_1_idx` (`cmId`),
  KEY `fk_ClientCompanyUserMap_2_idx` (`modifiedBy`),
  KEY `fk_ClientCompanyUserMap_3_idx` (`userId`),
  KEY `fk_ClientCompanyUserMap_4_idx` (`createdBy`),
  CONSTRAINT `fk_ClientCompanyUserMap_1` FOREIGN KEY (`cmId`) REFERENCES `ClientCompanies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ClientCompanyUserMap_2` FOREIGN KEY (`modifiedBy`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ClientCompanyUserMap_3` FOREIGN KEY (`userId`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ClientCompanyUserMap_4` FOREIGN KEY (`createdBy`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--Nature of business == ==========================
CREATE TABLE `NatureOfBusinesses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=latin1;


INSERT INTO `NatureOfBusinesses` VALUES (1,'Agriculture'),(2,'Auto'),(3,'Automobiles'),(4,'Banking'),(5,'Biotechnology'),(6,'Cement'),(7,'Component'),(8,'Consumer'),(9,'Education'),(10,'Engineering'),(11,'Entertainment'),(12,'Electricity Generation'),(13,'Electricity Supply'),(14,'Financial'),(15,'Food'),(16,'Healthcare'),(17,'Housing Finance'),(18,'Industry Gems'),(19,'Infrastructure Insurance IT and ITES Manufacturing'),(20,'Insurance'),(21,'Jewellery'),(22,'Markets'),(23,'NBFC'),(24,'Oil and Gas'),(25,'Pharmaceuticals'),(26,'Real Estate'),(27,'Research'),(28,'Sanitation'),(29,'Services'),(30,'Training'),(31,'Others');

--Alter table client company
ALTER TABLE `ili`.`ClientCompanies` 
CHANGE COLUMN `approvalStatus` `approvalStatus` INT(11) NULL DEFAULT 0 ;

-- Restricted company master
CREATE TABLE `ili`.`RestrictedCompanyMasters` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `companyName` VARCHAR(255) NOT NULL,
  `nseCode` VARCHAR(45) NULL DEFAULT 'Null',
  `bseCode` VARCHAR(45) NULL DEFAULT 'Null',
  PRIMARY KEY (`id`));

--alter client company adress mapping
ALTER TABLE `ili`.`ClientCompanyAddressMaps` 
CHANGE COLUMN `address` `address1` TEXT NULL DEFAULT NULL ;

ALTER TABLE `ili`.`ClientCompanyAddressMaps` 
ADD COLUMN `address2` TEXT NULL DEFAULT NULL AFTER `modifiedAt`,
ADD COLUMN `address3` TEXT NULL DEFAULT NULL AFTER `address2`;

--alter client company address mapping
ALTER TABLE `ili`.`ClientCompanyAddressMaps` 
CHANGE COLUMN `state` `state` INT(11) NULL DEFAULT NULL ;

--lter company address mapping
ALTER TABLE `ili`.`CompanyAddressMaps` 
CHANGE COLUMN `state` `state` INT(11) NULL DEFAULT NULL ;


ALTER TABLE `UserDetails` ADD `departmentId` INT NULL AFTER `profilePicture`;
ALTER TABLE `UserDetails` ADD `designationId` INT NULL AFTER `profilePicture`;


ALTER TABLE `Roles` ADD `code` VARCHAR(25) NOT NULL AFTER `name`;
UPDATE `Roles` SET `code` = 'CO' WHERE `Roles`.`id` = 1;
UPDATE `Roles` SET `code` = 'SA' WHERE `Roles`.`id` = 2;
UPDATE `Roles` SET `code` = 'DP' WHERE `Roles`.`id` = 3;
UPDATE `Roles` SET `code` = 'UO' WHERE `Roles`.`id` = 4;

--alter user details
ALTER TABLE `ili`.`UserDetails` 
ADD COLUMN `isDeleted` TINYINT(1) NOT NULL DEFAULT 0 AFTER `loggedOutAt`;

--alter client company table
ALTER TABLE `ili`.`ClientCompanies` 
ADD COLUMN `isDeleted` TINYINT(1) NOT NULL DEFAULT 0 AFTER `reasonFor`;

--alter company table
ALTER TABLE `ili`.`Companies` 
ADD COLUMN `isDeleted` TINYINT(1) NOT NULL DEFAULT 0 AFTER `connectedShares`;

--alter upsi table
ALTER TABLE `ili`.`UPSI` 
ADD COLUMN `isDeleted` TINYINT(1) NOT NULL DEFAULT 0 AFTER `modifiedAt`;

--alter table UserRoleMapping
ALTER TABLE `ili`.`UserRoleMappings` 
DROP FOREIGN KEY `fk_UserRoleMap_1`;
ALTER TABLE `ili`.`UserRoleMappings` 
DROP INDEX `fk_UserRoleMap_1_idx` ;

--alter company table
ALTER TABLE .`CompanyAddressMaps` 
CHANGE COLUMN `state` `state` INT(11) NULL DEFAULT NULL ;


ALTER TABLE `ConnectedPersons` 
CHANGE COLUMN `gardianPANNo` `gardianPANNo` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `panNo` `panNo` TEXT NULL DEFAULT NULL ;
ALTER TABLE `ConnectedPersons` 
CHANGE COLUMN `orgPANNo` `orgPANNo` TEXT NULL DEFAULT NULL ;
ALTER TABLE `ConnectedPersons` 
CHANGE COLUMN `isMinor` `isMinor` VARCHAR(50) NULL DEFAULT NULL ;

ALTER TABLE `ili`.`Persons` 
RENAME TO  `ili`.`ConnectedPersons` ;

--Alter ISIN TABLE
ALTER TABLE `ISINs` CHANGE `isDeleted` `deleted` TINYINT NULL DEFAULT NULL;

--ALTER PRECLEARANCE REQUESTTABLE
ALTER TABLE `PreClearanceRequests` 
ADD COLUMN `lastDateOfApprovedTrading` TIMESTAMP NULL DEFAULT NULL AFTER `lastModifiedAt`;

ALTER TABLE `PreClearanceRequests` 
CHANGE COLUMN `approvedAt` `approvedAt` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ;

ALTER TABLE `UserDetails` 
ADD COLUMN `whetherFromRelatedCompany` VARCHAR(255) NULL DEFAULT NULL AFTER `isDeleted`,
ADD COLUMN `insiderlensId` INT(11) NULL DEFAULT NULL AFTER `whetherFromRelatedCompany`,
ADD COLUMN `employeeId` INT(11) NULL DEFAULT NULL AFTER `insiderlensId`,
ADD COLUMN `city` VARCHAR(255) NULL DEFAULT NULL AFTER `employeeId`,
ADD COLUMN `PAN` VARCHAR(255) NULL DEFAULT NULL AFTER `city`,
ADD COLUMN `landlineNo` BIGINT NULL DEFAULT NULL AFTER `PAN`,
ADD COLUMN `MobileNo1` BIGINT NULL DEFAULT NULL AFTER `landlineNo`,
ADD COLUMN `MobileNo2` BIGINT NULL DEFAULT NULL AFTER `MobileNo1`,
ADD COLUMN `position` INT(11) NULL DEFAULT NULL AFTER `MobileNo2`,
ADD COLUMN `idInfo` VARCHAR(200) NULL DEFAULT NULL AFTER `position`,
ADD COLUMN `idNumber` BIGINT NULL DEFAULT NULL AFTER `idInfo`,
ADD COLUMN `effectiveFrom` TIMESTAMP NULL DEFAULT NULL AFTER `idNumber`,
ADD COLUMN `effectiveTo` TIMESTAMP NULL DEFAULT NULL AFTER `effectiveFrom`,
ADD COLUMN `attachment` VARCHAR(200) NULL DEFAULT NULL AFTER `effectiveTo`,
ADD COLUMN `desigEffectiveFrom` TIMESTAMP NULL DEFAULT NULL AFTER `attachment`,
ADD COLUMN `desigEffectiveTo` TIMESTAMP NULL DEFAULT NULL AFTER `desigEffectiveFrom`,
ADD COLUMN `deptEffectiveFrom` TIMESTAMP NULL DEFAULT NULL AFTER `desigEffectiveTo`,
ADD COLUMN `deptEffectiveTo` TIMESTAMP NULL DEFAULT NULL AFTER `deptEffectiveFrom`,
ADD COLUMN `institution` VARCHAR(255) NULL DEFAULT NULL AFTER `deptEffectiveTo`,
ADD COLUMN `qualification` VARCHAR(255) NULL DEFAULT NULL AFTER `institution`,
ADD COLUMN `passingYear` TIMESTAMP NULL DEFAULT NULL AFTER `qualification`;

ALTER TABLE `ConnectedPersons` 
CHANGE COLUMN `organizationName` `organizationName` VARCHAR(200) NULL DEFAULT NULL ;


ALTER TABLE `Companies` CHANGE `regularDisclosure` `regularDisclosure` INT(50) NOT NULL;

ALTER TABLE `ClientCompanies` ADD `tradingAllow` BOOLEAN NULL DEFAULT FALSE AFTER `securityListedClass`;

--Alter user details table
ALTER TABLE `ili`.`UserDetails` 
ADD COLUMN `empName` VARCHAR(255) NULL DEFAULT NULL AFTER `passingYear`,
ADD COLUMN `empDesignation` VARCHAR(255) NULL DEFAULT NULL AFTER `empName`,
ADD COLUMN `empMobileNo` BIGINT(20) NULL DEFAULT NULL AFTER `empDesignation`,
ADD COLUMN `empEmailId` VARCHAR(45) NULL DEFAULT NULL AFTER `empMobileNo`,
ADD COLUMN `empFromDate` TIMESTAMP NULL DEFAULT NULL AFTER `empEmailId`,
ADD COLUMN `empToDate` TIMESTAMP NULL DEFAULT NULL AFTER `empFromDate`;



ALTER TABLE `UserDetails` CHANGE `idNumber` `idNumber` VARCHAR(400) NULL DEFAULT NULL;
ALTER TABLE `UPSI` ADD `attachment` VARCHAR(400) NULL DEFAULT NULL AFTER `publishedAt`;


ALTER TABLE `HoldingDisclosures` CHANGE `disclosureType` `disclosureType` VARCHAR(600) NULL DEFAULT NULL;



ALTER TABLE `HoldingDisclosures` CHANGE `modifyBy` `modifiedBy` TIMESTAMP NULL DEFAULT NULL;

ALTER TABLE `HoldingDisclosures` CHANGE `modifyAt` `modifiedAt` TIMESTAMP NULL DEFAULT NULL;


ALTER TABLE `ClientCompanies` CHANGE `registrationDate` `registrationDate` TIMESTAMP NULL DEFAULT NULL;

ALTER TABLE `IntimationOfTrades` CHANGE `transactionForAddition` `transactionForAddition` INT NULL DEFAULT NULL;
ALTER TABLE `IntimationOfTrades` CHANGE `transactionForDeduction` `transactionForDeduction` INT NULL DEFAULT NULL;
ALTER TABLE `IntimationOfTrades` CHANGE `reason` `reason` VARCHAR(200) NOT NULL;
ALTER TABLE `IntimationOfTrades` CHANGE `regulation` `regulation` VARCHAR(400) NOT NULL;

ALTER TABLE `IntimationOfTrades` CHANGE `tradingType` `tradingType` VARCHAR(400) NULL DEFAULT NULL;



ALTER TABLE `Undertakings` CHANGE `configurable_name` `configurable_name` VARCHAR(200) NOT NULL;
ALTER TABLE `Undertakings` ADD `createdBy` INT NOT NULL AFTER `dialog_body`;
ALTER TABLE `Undertakings` ADD `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP AFTER `createdBy`;


-- //Nupur
ALTER TABLE `IntimationOfTrades` CHANGE `intimationDate` `intimationDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE `IntimationOfTrades` CHANGE `tradingType` `tradingType` VARCHAR(200) DEFAULT  NULL;
ALTER TABLE `IntimationOfTrades` CHANGE `reason` `reason` VARCHAR(200) NOT NULL;
ALTER TABLE `IntimationOfTrades` CHANGE `regulation` `regulation` VARCHAR(200) NOT NULL;
ALTER TABLE `IntimationOfTrades` CHANGE `transactionForDeduction` `transactionForDeduction` INT(11) NULL DEFAULT NULL;
ALTER TABLE `IntimationOfTrades` CHANGE `modifyBy` `modifiedBy` INT(11) NULL DEFAULT NULL;
ALTER TABLE `IntimationOfTrades` CHANGE `modifyAt` `modifiedAt` TIMESTAMP NULL DEFAULT NULL;

ALTER TABLE 'EmailTemplates' CONVERT TO CHARACTER SET utf8;


ALTER TABLE `ReferenceDocuments` ADD `visible` BOOLEAN NOT NULL DEFAULT FALSE AFTER `attachment`;

