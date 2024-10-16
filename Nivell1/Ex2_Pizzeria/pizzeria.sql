-- MySQL Workbench Synchronization
-- Generated: 2024-10-15 18:16
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Gwénaël

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `pizzeria` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;

CREATE TABLE IF NOT EXISTS `pizzeria`.`customer` (
  `customer_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NOT NULL COMMENT 'customer name',
  `surname` VARCHAR(30) NOT NULL COMMENT 'customer surname',
  `address` VARCHAR(50) NOT NULL COMMENT 'customer address (street, street nr, floor, door)',
  `phone` VARCHAR(9) NOT NULL,
  `city_id` INT(11) NOT NULL,
  PRIMARY KEY (`customer_id`),
  INDEX `fk_customer_city1_idx` (`city_id` ASC) VISIBLE,
  CONSTRAINT `fk_customer_city1`
    FOREIGN KEY (`city_id`)
    REFERENCES `pizzeria`.`city` (`city_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

CREATE TABLE IF NOT EXISTS `pizzeria`.`province` (
  `province_id` INT(11) NOT NULL COMMENT 'province id',
  `name` VARCHAR(30) NULL DEFAULT NULL COMMENT 'province name',
  PRIMARY KEY (`province_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

CREATE TABLE IF NOT EXISTS `pizzeria`.`city` (
  `city_id` INT(11) NOT NULL AUTO_INCREMENT,
  `city_name` VARCHAR(30) NOT NULL COMMENT 'city name',
  `province_id` INT(11) NOT NULL,
  PRIMARY KEY (`city_id`),
  INDEX `fk_city_province_idx` (`province_id` ASC) VISIBLE,
  CONSTRAINT `fk_city_province`
    FOREIGN KEY (`province_id`)
    REFERENCES `pizzeria`.`province` (`province_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

CREATE TABLE IF NOT EXISTS `pizzeria`.`order` (
  `order_id` INT(11) NOT NULL AUTO_INCREMENT,
  `customer_id` INT(11) NOT NULL COMMENT 'order customer',
  `order_datetime` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `delivery_type` ENUM('HOME', 'STORE') NOT NULL,
  `amount` DECIMAL(6,2) NOT NULL,
  `city_id` INT(11) NOT NULL,
  `store_id` INT(11) NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `fk_order_customer1_idx` (`customer_id` ASC) VISIBLE,
  INDEX `fk_order_city1_idx` (`city_id` ASC) VISIBLE,
  INDEX `fk_order_store1_idx` (`store_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `pizzeria`.`customer` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_order_city1`
    FOREIGN KEY (`city_id`)
    REFERENCES `pizzeria`.`city` (`city_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_order_store1`
    FOREIGN KEY (`store_id`)
    REFERENCES `pizzeria`.`store` (`store_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

CREATE TABLE IF NOT EXISTS `pizzeria`.`product` (
  `product_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'product id',
  `name` VARCHAR(30) NOT NULL COMMENT 'product name',
  `description` VARCHAR(50) NOT NULL COMMENT 'product description',
  `image_path` VARCHAR(50) NOT NULL COMMENT 'path of the image',
  `price` DECIMAL(4,2) NOT NULL DEFAULT 0 COMMENT 'product price',
  `product_type` ENUM('Pizza', 'Hamburguesa', 'Beguda') NULL DEFAULT NULL COMMENT 'product type: 3 values are possible (Pizza, Hamburguesa, Beguda)',
  `pizza_category_id` INT(11) NULL DEFAULT NULL COMMENT 'pizza category id, not null if the producti is a pizza',
  PRIMARY KEY (`product_id`),
  INDEX `fk_product_pizza_category1_idx` (`pizza_category_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_pizza_category1`
    FOREIGN KEY (`pizza_category_id`)
    REFERENCES `pizzeria`.`pizza_category` (`category_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

CREATE TABLE IF NOT EXISTS `pizzeria`.`order_details` (
  `order_details_id` INT(11) NOT NULL AUTO_INCREMENT,
  `quantity` INT(11) NOT NULL COMMENT 'product units',
  `order_id` INT(11) NOT NULL,
  `product_id` INT(11) NOT NULL,
  PRIMARY KEY (`order_details_id`),
  INDEX `fk_order_details_order1_idx` (`order_id` ASC) VISIBLE,
  INDEX `fk_order_details_product1_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_details_order1`
    FOREIGN KEY (`order_id`)
    REFERENCES `pizzeria`.`order` (`order_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_order_details_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `pizzeria`.`product` (`product_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

CREATE TABLE IF NOT EXISTS `pizzeria`.`employee` (
  `employee_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'employee id',
  `name` VARCHAR(30) NOT NULL COMMENT 'employee name',
  `surname` VARCHAR(30) NOT NULL COMMENT 'employee surname',
  `nif` VARCHAR(9) NOT NULL COMMENT 'employee nif',
  `phone` VARCHAR(9) NOT NULL COMMENT 'employee phone',
  `position` ENUM('Cook', 'Deliverer') NOT NULL COMMENT 'job position (Cook OR Deliverer)',
  `store_id` INT(11) NOT NULL,
  PRIMARY KEY (`employee_id`),
  INDEX `fk_employee_store1_idx` (`store_id` ASC) VISIBLE,
  CONSTRAINT `fk_employee_store1`
    FOREIGN KEY (`store_id`)
    REFERENCES `pizzeria`.`store` (`store_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

CREATE TABLE IF NOT EXISTS `pizzeria`.`order_delivery` (
  `order_delivery_id` INT(11) NOT NULL AUTO_INCREMENT,
  `delivered_on` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_id` INT(11) NOT NULL,
  `employee_id` INT(11) NOT NULL,
  PRIMARY KEY (`order_delivery_id`, `order_id`),
  INDEX `fk_order_delivery_order1_idx` (`order_id` ASC) VISIBLE,
  INDEX `fk_order_delivery_employee1_idx` (`employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_delivery_order1`
    FOREIGN KEY (`order_id`)
    REFERENCES `pizzeria`.`order` (`order_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_order_delivery_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `pizzeria`.`employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

CREATE TABLE IF NOT EXISTS `pizzeria`.`store` (
  `store_id` INT(11) NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(50) NOT NULL COMMENT 'store address (street, street nr)',
  `zip_code` VARCHAR(5) NOT NULL COMMENT 'store zipcode',
  `city_id` INT(11) NOT NULL,
  PRIMARY KEY (`store_id`),
  INDEX `fk_store_city1_idx` (`city_id` ASC) VISIBLE,
  CONSTRAINT `fk_store_city1`
    FOREIGN KEY (`city_id`)
    REFERENCES `pizzeria`.`city` (`city_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

CREATE TABLE IF NOT EXISTS `pizzeria`.`pizza_category` (
  `category_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NOT NULL COMMENT 'category name',
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
