CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `commentID` int NOT NULL,
  `userID` int NOT NULL,
  `tweetID` int NOT NULL,
  `comment_content` varchar(255) NOT NULL,
  `comment_time` datetime NOT NULL,
  PRIMARY KEY (`commentID`),
  KEY `4_idx` (`tweetID`),
  KEY `5_idx` (`userID`),
  CONSTRAINT `fk_comment_tweetID` FOREIGN KEY (`tweetID`) REFERENCES `tweet` (`tweetID`) ON DELETE CASCADE,
  CONSTRAINT `fk_comment_userID` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,3,1,'Hi Jacky, cool tweet!','2015-11-01 00:00:00'),(2,1,2,'Hey William, cool tweet!','2014-02-01 00:00:00'),(3,7,3,'Hello Irvin, cool tweet!','2021-04-22 00:00:00'),(4,5,4,'Hey Dylan, cool tweet!','2012-02-01 00:00:00');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite`
--

DROP TABLE IF EXISTS `favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite` (
  `favoriteID` int NOT NULL,
  `tweetID` int NOT NULL,
  `userID` int NOT NULL,
  `favorite_time` datetime NOT NULL,
  PRIMARY KEY (`favoriteID`),
  KEY `6_idx` (`userID`),
  KEY `7_idx` (`tweetID`),
  CONSTRAINT `fk_favorite_tweetID` FOREIGN KEY (`tweetID`) REFERENCES `tweet` (`tweetID`) ON DELETE CASCADE,
  CONSTRAINT `fk_favorite_userID` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite`
--

LOCK TABLES `favorite` WRITE;
/*!40000 ALTER TABLE `favorite` DISABLE KEYS */;
INSERT INTO `favorite` VALUES (1,1,1,'2023-01-01 00:00:00'),(2,1,2,'2023-02-11 00:00:00'),(3,1,3,'2023-02-12 00:00:00'),(4,1,4,'2023-03-17 00:00:00'),(5,1,5,'2023-07-21 00:00:00'),(6,1,6,'2023-07-11 00:00:00'),(7,1,7,'2023-12-21 00:00:00'),(8,1,8,'2024-01-06 00:00:00');
/*!40000 ALTER TABLE `favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follow` (
  `followID` int NOT NULL,
  `follow_time` datetime NOT NULL,
  `followerID` int NOT NULL,
  `followedID` int NOT NULL,
  PRIMARY KEY (`followID`),
  KEY `_idx` (`followerID`),
  KEY `1_idx` (`followedID`),
  CONSTRAINT `fk_follow_followedID` FOREIGN KEY (`followedID`) REFERENCES `user` (`userID`) ON DELETE CASCADE,
  CONSTRAINT `fk_follow_followerID` FOREIGN KEY (`followerID`) REFERENCES `user` (`userID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow`
--

LOCK TABLES `follow` WRITE;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
INSERT INTO `follow` VALUES (1,'2023-01-21 00:00:00',1,2),(2,'2023-01-31 00:00:00',2,1),(3,'2023-02-12 00:00:00',3,8),(4,'2023-02-12 00:00:00',3,2),(5,'2023-03-14 00:00:00',3,4),(6,'2023-03-15 00:00:00',3,1),(7,'2023-04-12 00:00:00',4,5),(8,'2023-04-12 00:00:00',4,6),(9,'2023-05-12 00:00:00',5,1),(10,'2023-05-13 00:00:00',6,1),(11,'2023-06-13 00:00:00',7,1),(12,'2023-06-13 00:00:00',8,1),(13,'2023-06-02 00:00:00',6,2),(14,'2023-07-01 00:00:00',6,5),(15,'2023-07-02 00:00:00',3,7),(16,'2023-08-15 00:00:00',5,2),(17,'2023-09-01 00:00:00',7,3),(18,'2023-10-02 00:00:00',8,7),(19,'2023-10-04 00:00:00',8,4);
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweet`
--

DROP TABLE IF EXISTS `tweet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweet` (
  `tweetID` int NOT NULL,
  `userID` int NOT NULL,
  `content` varchar(255) NOT NULL,
  `tweet_time` datetime NOT NULL,
  `is_retweetID` int DEFAULT NULL,
  PRIMARY KEY (`tweetID`),
  KEY `2_idx` (`userID`),
  KEY `3_idx` (`is_retweetID`),
  CONSTRAINT `fk_tweet_is_retweetID` FOREIGN KEY (`is_retweetID`) REFERENCES `tweet` (`tweetID`),
  CONSTRAINT `fk_tweet_userID` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweet`
--

LOCK TABLES `tweet` WRITE;
/*!40000 ALTER TABLE `tweet` DISABLE KEYS */;
INSERT INTO `tweet` VALUES (1,1,'William tweet 1','2014-01-31 00:00:00',NULL),(2,1,'William tweet 2','2015-02-20 00:00:00',NULL),(3,2,'Jacky tweet 1','2015-10-31 00:00:00',NULL),(4,2,'Jacky tweet 2','2016-02-25 00:00:00',NULL),(5,3,'Dylan tweet 1','2012-01-31 00:00:00',NULL),(6,3,'Dylan tweet 2','2019-01-31 00:00:00',NULL),(7,4,'Irvin tweet 1','2021-04-21 00:00:00',NULL),(8,4,'Irvin tweet 2','2023-01-11 00:00:00',NULL),(9,5,'James tweet 1','2016-01-12 00:00:00',NULL),(10,5,'James tweet 2','2018-03-07 00:00:00',NULL),(11,6,'Frank tweet 1','2015-07-18 00:00:00',NULL),(12,6,'Frank tweet 2','2018-01-21 00:00:00',NULL),(13,7,'Evan tweet 1','2019-03-25 00:00:00',NULL),(14,7,'Evan tweet 2','2020-02-15 00:00:00',NULL),(15,8,'John tweet 1','2020-05-19 00:00:00',NULL),(16,8,'John tweet 2','2021-07-05 00:00:00',NULL),(17,1,'william retweeting jacky','2024-04-07 20:50:19',3);
/*!40000 ALTER TABLE `tweet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userID` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'William Chen','williamchen@gmail.com','password'),(2,'Jacky Zhang','jackyzhang@gmail.com','password'),(3,'Dylan Pallatroni','dylanpallatroni@gmail.com','password'),(4,'Irvin Vien','irvinvien@gmail.com','password'),(5,'James Zhang','jameszhang@gmail.com','password'),(6,'Frank Canovatchel','frankcanovatchel@gmail.com','password'),(7,'Evan Lee','evanlee@gmail.com','password'),(8,'John Cha','johncha@gmail.com','password');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mydb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-07 20:53:05
