-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema plusoneseat
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema plusoneseat
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `plusoneseat` DEFAULT CHARACTER SET utf8 ;
USE `plusoneseat` ;

-- -----------------------------------------------------
-- Table `plusoneseat`.`location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `plusoneseat`.`location` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `latitude` DOUBLE NOT NULL,
  `longitude` DECIMAL NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE INDEX `location_index` ON `plusoneseat`.`location` (`latitude` ASC, `longitude` ASC);

CREATE INDEX `address_index` ON `plusoneseat`.`location` (`address` ASC);


-- -----------------------------------------------------
-- Table `plusoneseat`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `plusoneseat`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  `surname` VARCHAR(20) NOT NULL,
  `email` VARCHAR(30) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `location` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_user_location1`
    FOREIGN KEY (`location`)
    REFERENCES `plusoneseat`.`location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `location_idx` ON `plusoneseat`.`user` (`location` ASC);


-- -----------------------------------------------------
-- Table `plusoneseat`.`message`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `plusoneseat`.`message` (
  `content` VARCHAR(500) NOT NULL,
  `time` DATETIME NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  `sender` INT NOT NULL,
  `receiver` INT NOT NULL,
  PRIMARY KEY (`id`, `sender`, `receiver`),
  CONSTRAINT `fk_message_user_a`
    FOREIGN KEY (`sender`)
    REFERENCES `plusoneseat`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_message_user_b`
    FOREIGN KEY (`receiver`)
    REFERENCES `plusoneseat`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `sender_idx` ON `plusoneseat`.`message` (`sender` ASC);

CREATE INDEX `receiver_idx` ON `plusoneseat`.`message` (`receiver` ASC);


-- -----------------------------------------------------
-- Table `plusoneseat`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `plusoneseat`.`menu` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(100) NULL,
  `course_number` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `plusoneseat`.`event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `plusoneseat`.`event` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `eventcol` VARCHAR(45) NULL,
  `location` INT NOT NULL,
  `host` INT NOT NULL,
  `time` DATETIME NOT NULL,
  `menu` INT NOT NULL,
  `price` DECIMAL NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_event_location1`
    FOREIGN KEY (`location`)
    REFERENCES `plusoneseat`.`location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_user1`
    FOREIGN KEY (`host`)
    REFERENCES `plusoneseat`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_menu_type1`
    FOREIGN KEY (`menu`)
    REFERENCES `plusoneseat`.`menu` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `location_idx` ON `plusoneseat`.`event` (`location` ASC);

CREATE INDEX `host_idx` ON `plusoneseat`.`event` (`host` ASC);

CREATE INDEX `menu_fk` ON `plusoneseat`.`event` (`menu` ASC);

CREATE INDEX `price_idx` ON `plusoneseat`.`event` (`price` ASC);

CREATE INDEX `time_idx` ON `plusoneseat`.`event` (`time` ASC);


-- -----------------------------------------------------
-- Table `plusoneseat`.`guest`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `plusoneseat`.`guest` (
  `event` INT NOT NULL,
  `guest` INT NOT NULL,
  `status` INT NOT NULL,
  PRIMARY KEY (`event`, `guest`),
  CONSTRAINT `fk_event_has_user_event1`
    FOREIGN KEY (`event`)
    REFERENCES `plusoneseat`.`event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_has_user_user1`
    FOREIGN KEY (`guest`)
    REFERENCES `plusoneseat`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `guest_idx` ON `plusoneseat`.`guest` (`guest` ASC);

CREATE INDEX `event_idx` ON `plusoneseat`.`guest` (`event` ASC);


-- -----------------------------------------------------
-- Table `plusoneseat`.`course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `plusoneseat`.`course` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(100) NULL,
  `menu_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_course_menu1`
    FOREIGN KEY (`menu_id`)
    REFERENCES `plusoneseat`.`menu` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_course_menu1_idx` ON `plusoneseat`.`course` (`menu_id` ASC);


-- -----------------------------------------------------
-- Table `plusoneseat`.`plate`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `plusoneseat`.`plate` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(100) NULL,
  `course_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_plate_course1`
    FOREIGN KEY (`course_id`)
    REFERENCES `plusoneseat`.`course` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_plate_course1_idx` ON `plusoneseat`.`plate` (`course_id` ASC);


-- -----------------------------------------------------
-- Table `plusoneseat`.`tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `plusoneseat`.`tag` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `plusoneseat`.`plate_has_tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `plusoneseat`.`plate_has_tag` (
  `plate_id` INT NOT NULL,
  `tag_id` INT NOT NULL,
  PRIMARY KEY (`plate_id`, `tag_id`),
  CONSTRAINT `fk_plate_has_tag_plate1`
    FOREIGN KEY (`plate_id`)
    REFERENCES `plusoneseat`.`plate` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_plate_has_tag_tag1`
    FOREIGN KEY (`tag_id`)
    REFERENCES `plusoneseat`.`tag` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_plate_has_tag_tag1_idx` ON `plusoneseat`.`plate_has_tag` (`tag_id` ASC);

CREATE INDEX `fk_plate_has_tag_plate1_idx` ON `plusoneseat`.`plate_has_tag` (`plate_id` ASC);


-- -----------------------------------------------------
-- Table `plusoneseat`.`course_has_tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `plusoneseat`.`course_has_tag` (
  `course_id` INT NOT NULL,
  `tag_id` INT NOT NULL,
  PRIMARY KEY (`course_id`, `tag_id`),
  CONSTRAINT `fk_course_has_tag_course1`
    FOREIGN KEY (`course_id`)
    REFERENCES `plusoneseat`.`course` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_course_has_tag_tag1`
    FOREIGN KEY (`tag_id`)
    REFERENCES `plusoneseat`.`tag` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_course_has_tag_tag1_idx` ON `plusoneseat`.`course_has_tag` (`tag_id` ASC);

CREATE INDEX `fk_course_has_tag_course1_idx` ON `plusoneseat`.`course_has_tag` (`course_id` ASC);


-- -----------------------------------------------------
-- Table `plusoneseat`.`menu_has_tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `plusoneseat`.`menu_has_tag` (
  `menu_id` INT NOT NULL,
  `tag_id` INT NOT NULL,
  PRIMARY KEY (`menu_id`, `tag_id`),
  CONSTRAINT `fk_menu_has_tag_menu1`
    FOREIGN KEY (`menu_id`)
    REFERENCES `plusoneseat`.`menu` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_menu_has_tag_tag1`
    FOREIGN KEY (`tag_id`)
    REFERENCES `plusoneseat`.`tag` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_menu_has_tag_tag1_idx` ON `plusoneseat`.`menu_has_tag` (`tag_id` ASC);

CREATE INDEX `fk_menu_has_tag_menu1_idx` ON `plusoneseat`.`menu_has_tag` (`menu_id` ASC);


-- -----------------------------------------------------
-- Table `plusoneseat`.`comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `plusoneseat`.`comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` VARCHAR(45) NOT NULL,
  `time` DATETIME NOT NULL,
  `event` INT NOT NULL,
  `user` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_comment_event1`
    FOREIGN KEY (`event`)
    REFERENCES `plusoneseat`.`event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_user1`
    FOREIGN KEY (`user`)
    REFERENCES `plusoneseat`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `event_idx` ON `plusoneseat`.`comment` (`event` ASC);

CREATE INDEX `user_idx` ON `plusoneseat`.`comment` (`user` ASC);


-- -----------------------------------------------------
-- Table `plusoneseat`.`rating`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `plusoneseat`.`rating` (
  `rating` DECIMAL NOT NULL,
  `comment` VARCHAR(45) NOT NULL,
  `time` DATETIME NOT NULL,
  `reviewer` INT NOT NULL,
  `rating_type` INT NOT NULL,
  `reviewee` INT NOT NULL,
  PRIMARY KEY (`reviewer`, `reviewee`),
  CONSTRAINT `fk_rating_user1`
    FOREIGN KEY (`reviewer`)
    REFERENCES `plusoneseat`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rating_user2`
    FOREIGN KEY (`reviewee`)
    REFERENCES `plusoneseat`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `reviewer_idx` ON `plusoneseat`.`rating` (`reviewer` ASC);

CREATE INDEX `reviewee_idx` ON `plusoneseat`.`rating` (`reviewee` ASC);


-- -----------------------------------------------------
-- Table `plusoneseat`.`picture`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `plusoneseat`.`picture` (
  `id` INT NOT NULL,
  `file_location` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `plusoneseat`.`event_has_picture`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `plusoneseat`.`event_has_picture` (
  `event_id` INT NOT NULL,
  `picture_id` INT NOT NULL,
  PRIMARY KEY (`event_id`, `picture_id`),
  CONSTRAINT `fk_event_has_picture_event1`
    FOREIGN KEY (`event_id`)
    REFERENCES `plusoneseat`.`event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_has_picture_picture1`
    FOREIGN KEY (`picture_id`)
    REFERENCES `plusoneseat`.`picture` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_event_has_picture_picture1_idx` ON `plusoneseat`.`event_has_picture` (`picture_id` ASC);

CREATE INDEX `fk_event_has_picture_event1_idx` ON `plusoneseat`.`event_has_picture` (`event_id` ASC);


-- -----------------------------------------------------
-- Table `plusoneseat`.`user_has_picture`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `plusoneseat`.`user_has_picture` (
  `user_id` INT NOT NULL,
  `picture_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `picture_id`),
  CONSTRAINT `fk_user_has_picture_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `plusoneseat`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_picture_picture1`
    FOREIGN KEY (`picture_id`)
    REFERENCES `plusoneseat`.`picture` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_user_has_picture_picture1_idx` ON `plusoneseat`.`user_has_picture` (`picture_id` ASC);

CREATE INDEX `fk_user_has_picture_user1_idx` ON `plusoneseat`.`user_has_picture` (`user_id` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
