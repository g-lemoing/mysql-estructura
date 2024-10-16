-- MySQL Script generated by MySQL Workbench
-- Wed Oct 16 13:36:26 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema youtube
-- -----------------------------------------------------
-- Simple DB model for a YouTube App

-- -----------------------------------------------------
-- Schema youtube
--
-- Simple DB model for a YouTube App
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `youtube` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `youtube` ;

-- -----------------------------------------------------
-- Table `youtube`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT COMMENT 'user id',
  `email` VARCHAR(30) NOT NULL COMMENT 'user email',
  `password` VARCHAR(20) NOT NULL COMMENT 'user password',
  `username` VARCHAR(30) NOT NULL COMMENT 'user name',
  `birthdate` DATETIME NOT NULL,
  `sex` ENUM('M', 'F') NULL COMMENT 'User sex, Two possible values: M --> Home, F --> Dona',
  `country` VARCHAR(30) NULL COMMENT 'user country',
  `zipcode` VARCHAR(15) NULL COMMENT 'user zipcode',
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  INDEX `index_username` (`country` ASC, `username` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`video` (
  `video_id` INT NOT NULL AUTO_INCREMENT COMMENT 'video id',
  `title` VARCHAR(30) NOT NULL COMMENT 'video title',
  `description` VARCHAR(100) NOT NULL COMMENT 'video description (max 100 characters)',
  `size` INT NOT NULL COMMENT 'video size Mb',
  `filename` VARCHAR(50) NOT NULL COMMENT 'video filename',
  `duration` TIME NOT NULL COMMENT 'video duration',
  `thumbnail` VARCHAR(50) NOT NULL COMMENT 'thumbnail path',
  `views_qty` INT NOT NULL DEFAULT 0 COMMENT 'number of views',
  `likes_qty` INT NOT NULL DEFAULT 0 COMMENT 'quantity of likes',
  `dislikes_qty` INT NOT NULL DEFAULT 0 COMMENT 'quantity of dislikes',
  `state` ENUM('Public', 'Ocult', 'Privat') NOT NULL COMMENT 'video state (3 possible values: Public, Ocult, Privat)',
  `publishedby_user_id` INT NOT NULL,
  `publishedon` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'publication date',
  PRIMARY KEY (`video_id`),
  INDEX `fk_video_user1_idx` (`publishedby_user_id` ASC) VISIBLE,
  INDEX `index_title` (`title` ASC) VISIBLE,
  CONSTRAINT `fk_video_user1`
    FOREIGN KEY (`publishedby_user_id`)
    REFERENCES `youtube`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`tag` (
  `tag_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NOT NULL COMMENT 'tag name',
  PRIMARY KEY (`tag_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`video_has_tags`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`video_has_tags` (
  `video_has_tags_id` INT NOT NULL AUTO_INCREMENT COMMENT 'id of the relationship of each tag belonging to a video',
  `video_id` INT NOT NULL,
  `tag_id` INT NOT NULL,
  PRIMARY KEY (`video_has_tags_id`),
  INDEX `fk_video_has_tags_video_idx` (`video_id` ASC) VISIBLE,
  INDEX `fk_video_has_tags_tag1_idx` (`tag_id` ASC) VISIBLE,
  CONSTRAINT `fk_video_has_tags_video`
    FOREIGN KEY (`video_id`)
    REFERENCES `youtube`.`video` (`video_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_video_has_tags_tag1`
    FOREIGN KEY (`tag_id`)
    REFERENCES `youtube`.`tag` (`tag_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`channel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`channel` (
  `channel_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NOT NULL COMMENT 'channel name',
  `createdon` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'date and time of channel creation',
  `description` VARCHAR(100) NULL COMMENT 'channel description',
  `createdby_user_id` INT NOT NULL COMMENT 'user who created the channel',
  PRIMARY KEY (`channel_id`),
  INDEX `fk_channel_user1_idx` (`createdby_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_channel_user1`
    FOREIGN KEY (`createdby_user_id`)
    REFERENCES `youtube`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`user_subscribes_channel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`user_subscribes_channel` (
  `user_subscribes_channel_id` INT NOT NULL AUTO_INCREMENT,
  `channel_id` INT NOT NULL COMMENT 'channel id',
  `user_id` INT NOT NULL COMMENT 'user id',
  PRIMARY KEY (`user_subscribes_channel_id`),
  INDEX `fk_user_subscribes_channel_channel1_idx` (`channel_id` ASC) VISIBLE,
  INDEX `fk_user_subscribes_channel_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_subscribes_channel_channel1`
    FOREIGN KEY (`channel_id`)
    REFERENCES `youtube`.`channel` (`channel_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user_subscribes_channel_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `youtube`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`user_rates_videos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`user_rates_videos` (
  `user_rates_videos_id` INT NOT NULL AUTO_INCREMENT COMMENT 'id of the rating of a video by a user',
  `rating` ENUM('Like', 'Dislike') NOT NULL COMMENT 'Rating given by user to a video (2 values are possible: Like, Dislike)',
  `video_id` INT NOT NULL COMMENT 'id of the rated video',
  `user_id` INT NOT NULL COMMENT 'id of the rating user',
  `createdon` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'rating date',
  PRIMARY KEY (`user_rates_videos_id`),
  INDEX `fk_user_rates_videos_video1_idx` (`video_id` ASC) VISIBLE,
  INDEX `fk_user_rates_videos_user1_idx` (`user_id` ASC) VISIBLE,
  UNIQUE INDEX `idx_user_video` (`video_id` ASC, `user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_rates_videos_video1`
    FOREIGN KEY (`video_id`)
    REFERENCES `youtube`.`video` (`video_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user_rates_videos_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `youtube`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`playlist` (
  `playlist_id` INT NOT NULL AUTO_INCREMENT COMMENT 'playlist id',
  `name` VARCHAR(30) NOT NULL COMMENT 'playlist name',
  `createdon` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation date of the playlist',
  `state` ENUM('Public', 'Privat') NOT NULL COMMENT 'playlist state (2 possible values: Public, Privat)',
  `user_id` INT NOT NULL COMMENT 'user who creates playlist',
  PRIMARY KEY (`playlist_id`),
  INDEX `fk_playlist_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `youtube`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`playlist_has_videos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`playlist_has_videos` (
  `playlist_has_videos_id` INT NOT NULL AUTO_INCREMENT COMMENT 'id of the relationship between video and playlist',
  `video_id` INT NOT NULL COMMENT 'id of the video',
  `playlist_id` INT NOT NULL COMMENT 'id of the playlist',
  PRIMARY KEY (`playlist_has_videos_id`),
  INDEX `fk_playlist_has_videos_video1_idx` (`video_id` ASC) VISIBLE,
  INDEX `fk_playlist_has_videos_playlist1_idx` (`playlist_id` ASC) VISIBLE,
  UNIQUE INDEX `idx_playlist_video` (`video_id` ASC, `playlist_id` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_has_videos_video1`
    FOREIGN KEY (`video_id`)
    REFERENCES `youtube`.`video` (`video_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_playlist_has_videos_playlist1`
    FOREIGN KEY (`playlist_id`)
    REFERENCES `youtube`.`playlist` (`playlist_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`review` (
  `review_id` INT NOT NULL AUTO_INCREMENT COMMENT 'review id',
  `contents` VARCHAR(200) NOT NULL COMMENT 'contents review',
  `createdon` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'date and time of the review',
  `video_id` INT NOT NULL COMMENT 'referred reviewed video',
  `user_id` INT NOT NULL COMMENT 'user who wrote the review',
  PRIMARY KEY (`review_id`),
  INDEX `fk_review_video1_idx` (`video_id` ASC) VISIBLE,
  INDEX `fk_review_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `index_createdon` (`createdon` DESC) VISIBLE,
  CONSTRAINT `fk_review_video1`
    FOREIGN KEY (`video_id`)
    REFERENCES `youtube`.`video` (`video_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_review_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `youtube`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`user_review_rating`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`user_review_rating` (
  `user_review_rating_id` INT NOT NULL AUTO_INCREMENT COMMENT 'rating id of a user about a review',
  `rating` ENUM('Like', 'Dislike') NOT NULL COMMENT 'rating of the review (2 values are possible: \'Like\', \'Dislike\')',
  `createdon` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'date and time user rates a review',
  `user_id` INT NOT NULL COMMENT 'user who rates the review',
  `review_id` INT NOT NULL COMMENT 'review that is rated',
  PRIMARY KEY (`user_review_rating_id`),
  INDEX `fk_user_review_rating_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_user_review_rating_review1_idx` (`review_id` ASC) VISIBLE,
  UNIQUE INDEX `idx_user_review` (`user_id` ASC, `review_id` ASC) VISIBLE,
  INDEX `index_createdon` (`createdon` DESC) VISIBLE,
  CONSTRAINT `fk_user_review_rating_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `youtube`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user_review_rating_review1`
    FOREIGN KEY (`review_id`)
    REFERENCES `youtube`.`review` (`review_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
