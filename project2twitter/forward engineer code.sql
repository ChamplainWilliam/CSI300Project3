-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `twitter` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `twitter` DEFAULT CHARACTER SET utf8 ;
USE `twitter` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `userID` INT NOT NULL,
  `username` VARCHAR(255) NOT NULL,
  `email_address` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`userID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tweet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tweet` ;

CREATE TABLE IF NOT EXISTS `tweet` (
  `tweetID` INT NOT NULL,
  `userID` INT NOT NULL,
  `content` VARCHAR(255) NOT NULL,
  `tweet_time` DATETIME NOT NULL,
  `is_retweetID` INT NULL DEFAULT NULL,
  PRIMARY KEY (`tweetID`),
  CONSTRAINT `fk_tweet_is_retweetID`
    FOREIGN KEY (`is_retweetID`)
    REFERENCES `tweet` (`tweetID`),
  CONSTRAINT `fk_tweet_userID`
    FOREIGN KEY (`userID`)
    REFERENCES `user` (`userID`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `2_idx` ON `tweet` (`userID` ASC) VISIBLE;

CREATE INDEX `3_idx` ON `tweet` (`is_retweetID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comment` ;

CREATE TABLE IF NOT EXISTS `comment` (
  `commentID` INT NOT NULL,
  `userID` INT NOT NULL,
  `tweetID` INT NOT NULL,
  `comment_content` VARCHAR(255) NOT NULL,
  `comment_time` DATETIME NOT NULL,
  PRIMARY KEY (`commentID`),
  CONSTRAINT `fk_comment_tweetID`
    FOREIGN KEY (`tweetID`)
    REFERENCES `tweet` (`tweetID`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_comment_userID`
    FOREIGN KEY (`userID`)
    REFERENCES `user` (`userID`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `4_idx` ON `comment` (`tweetID` ASC) VISIBLE;

CREATE INDEX `5_idx` ON `comment` (`userID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `favorite`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `favorite` ;

CREATE TABLE IF NOT EXISTS `favorite` (
  `favoriteID` INT NOT NULL,
  `tweetID` INT NOT NULL,
  `userID` INT NOT NULL,
  `favorite_time` DATETIME NOT NULL,
  PRIMARY KEY (`favoriteID`),
  CONSTRAINT `fk_favorite_tweetID`
    FOREIGN KEY (`tweetID`)
    REFERENCES `tweet` (`tweetID`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_favorite_userID`
    FOREIGN KEY (`userID`)
    REFERENCES `user` (`userID`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `6_idx` ON `favorite` (`userID` ASC) VISIBLE;

CREATE INDEX `7_idx` ON `favorite` (`tweetID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `follow`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `follow` ;

CREATE TABLE IF NOT EXISTS `follow` (
  `followID` INT NOT NULL,
  `follow_time` DATETIME NOT NULL,
  `followerID` INT NOT NULL,
  `followedID` INT NOT NULL,
  PRIMARY KEY (`followID`),
  CONSTRAINT `fk_follow_followedID`
    FOREIGN KEY (`followedID`)
    REFERENCES `user` (`userID`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_follow_followerID`
    FOREIGN KEY (`followerID`)
    REFERENCES `user` (`userID`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `_idx` ON `follow` (`followerID` ASC) VISIBLE;

CREATE INDEX `1_idx` ON `follow` (`followedID` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
