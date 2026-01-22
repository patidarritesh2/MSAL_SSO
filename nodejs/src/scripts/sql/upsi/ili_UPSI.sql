DROP TABLE IF EXISTS `UPSI`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UPSI` (
  `id` int NOT NULL AUTO_INCREMENT,
  `details` varchar(255) DEFAULT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  `subPurpose` varchar(255) DEFAULT NULL,
  `upsiCategoryId` int NOT NULL,
  `sharedAt` datetime DEFAULT NULL,
  `publishedAt` datetime DEFAULT NULL,
  `createdBy` int NOT NULL,
  `modifiedBy` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `modifiedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
