-- MySQL Workbench Synchronization
-- Generated: 2024-10-15 12:14
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Gwénaël

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `optics` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `optics`.`supplier` (
  `nif` VARCHAR(15) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `phone` VARCHAR(15) NOT NULL,
  `fax` VARCHAR(15) NULL DEFAULT NULL,
  `address` INT(11) NOT NULL,
  PRIMARY KEY (`nif`),
  INDEX `fk_supplier_address1_idx` (`address` ASC) VISIBLE,
  INDEX `idx_name` (`name` ASC) VISIBLE,
  CONSTRAINT `fk_supplier_address1`
    FOREIGN KEY (`address`)
    REFERENCES `optics`.`address` (`address_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optics`.`glasses` (
  `glasses_id` INT(11) NOT NULL AUTO_INCREMENT,
  `brand` VARCHAR(30) NOT NULL,
  `left_graduation` DECIMAL(4,2) NOT NULL,
  `right_graduation` DECIMAL(4,2) NOT NULL,
  `frame_type` ENUM('Flotant', 'Pasta', 'Metàl·lica') NOT NULL,
  `frame_color` VARCHAR(30) NOT NULL,
  `leftglass_color` VARCHAR(30) NOT NULL,
  `rightglass_color` VARCHAR(30) NOT NULL,
  `price` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`glasses_id`),
  INDEX `fk_glasses_glasses_procurement1_idx` (`brand` ASC) VISIBLE,
  INDEX `idx_brand` (`brand` ASC) VISIBLE,
  CONSTRAINT `fk_glasses_glasses_procurement1`
    FOREIGN KEY (`brand`)
    REFERENCES `optics`.`glasses_procurement` (`glasses_brand`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optics`.`customer` (
  `customer_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'customer id',
  `name` VARCHAR(30) NOT NULL COMMENT 'customer name',
  `surname` VARCHAR(30) NOT NULL COMMENT 'customer surname',
  `phone` VARCHAR(9) NOT NULL COMMENT 'customer phone',
  `email_address` VARCHAR(30) NOT NULL COMMENT 'customer email',
  `registered_on` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'date and time the customer was registered',
  `address_id` INT(11) NOT NULL COMMENT 'customer address',
  `mgm_id` INT(11) NULL DEFAULT NULL COMMENT 'customer who recommended this new customer (member get member)',
  PRIMARY KEY (`customer_id`),
  INDEX `fk_customer_address1_idx` (`address_id` ASC) VISIBLE,
  INDEX `fk_customer_customer1_idx` (`mgm_id` ASC) VISIBLE,
  INDEX `idx_name` (`surname` ASC, `name` ASC) INVISIBLE,
  INDEX `idx_phone` (`phone` ASC) INVISIBLE,
  CONSTRAINT `fk_customer_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `optics`.`address` (`address_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customer_customer1`
    FOREIGN KEY (`mgm_id`)
    REFERENCES `optics`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optics`.`glasses_procurement` (
  `glasses_brand` VARCHAR(30) NOT NULL COMMENT 'brand name',
  `supplier_nif` VARCHAR(15) NOT NULL COMMENT 'supplier of the brand',
  UNIQUE INDEX `glasses_brand_UNIQUE` (`glasses_brand` ASC) VISIBLE,
  PRIMARY KEY (`glasses_brand`),
  INDEX `supplier_id_idx` (`supplier_nif` ASC) VISIBLE,
  CONSTRAINT `supplier_id`
    FOREIGN KEY (`supplier_nif`)
    REFERENCES `optics`.`supplier` (`nif`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optics`.`address` (
  `address_id` INT(11) NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(30) NOT NULL,
  `street_nr` VARCHAR(5) NOT NULL,
  `floor` VARCHAR(5) NULL DEFAULT NULL,
  `door` VARCHAR(5) NULL DEFAULT NULL,
  `city` VARCHAR(30) NOT NULL,
  `zip_code` VARCHAR(10) NOT NULL,
  `country` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`address_id`),
  INDEX `idx_zipcode` (`zip_code` ASC, `city` ASC) INVISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optics`.`sale` (
  `sale_id` INT(11) NOT NULL AUTO_INCREMENT,
  `customer_id` INT(11) NOT NULL,
  `glasses_id` INT(11) NOT NULL,
  `seller_id` INT(11) NOT NULL,
  `sale_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sale_id`),
  INDEX `fk_sale_customer1_idx` (`customer_id` ASC) VISIBLE,
  INDEX `fk_sale_glasses_id_idx` (`glasses_id` ASC) VISIBLE,
  INDEX `fk_sale_salesperson1_idx` (`seller_id` ASC) VISIBLE,
  CONSTRAINT `fk_sale_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `optics`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sale_glasses_id`
    FOREIGN KEY (`glasses_id`)
    REFERENCES `optics`.`glasses` (`glasses_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sale_salesperson1`
    FOREIGN KEY (`seller_id`)
    REFERENCES `optics`.`salesperson` (`salesperson_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optics`.`salesperson` (
  `salesperson_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NOT NULL COMMENT 'seller name',
  PRIMARY KEY (`salesperson_id`),
  INDEX `idx_name` (`name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
