-- MySQL Workbench Synchronization
-- Generated: 2023-01-12 18:40
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: xavir

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `Optica` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `Optica`.`suppliers` (
  `suppliers_id` INT(11) NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `phone_number` VARCHAR(45) NOT NULL,
  `fax` VARCHAR(45) NOT NULL,
  `company_nif` VARCHAR(45) NOT NULL,
  `address_id` INT(11) NOT NULL,
  PRIMARY KEY (`suppliers_id`),
  INDEX `fk_suppliers_address1_idx` (`address_id` ASC) VISIBLE,
  CONSTRAINT `fk_suppliers_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `Optica`.`address` (`address_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Optica`.`address` (
  `address_id` INT(11) NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(45) NOT NULL,
  `number` INT(11) NOT NULL,
  `flat` INT(11) NULL DEFAULT NULL,
  `door` INT(11) NULL DEFAULT NULL,
  `CP` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`address_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Optica`.`glasses` (
  `glasses_id` INT(11) NOT NULL AUTO_INCREMENT,
  `brand` VARCHAR(45) NOT NULL,
  `crystal_graduation` VARCHAR(45) NOT NULL,
  `mount_type` VARCHAR(45) NOT NULL,
  `mount_colour` VARCHAR(45) NOT NULL,
  `glass_colour` VARCHAR(45) NOT NULL,
  `price` FLOAT(11) NOT NULL,
  `suppliers_id` INT(11) NOT NULL,
  PRIMARY KEY (`glasses_id`),
  INDEX `fk_glasses_suppliers1_idx` (`suppliers_id` ASC) VISIBLE,
  CONSTRAINT `fk_glasses_suppliers1`
    FOREIGN KEY (`suppliers_id`)
    REFERENCES `Optica`.`suppliers` (`suppliers_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Optica`.`customers` (
  `customers_id` INT(11) NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `postal_address` VARCHAR(45) NOT NULL,
  `phone_number` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `registration_date` DATE NOT NULL,
  `affiliate_id` INT(11) NULL DEFAULT NULL,
  `sellers_sellers_id` INT(11) NOT NULL,
  PRIMARY KEY (`customers_id`),
  INDEX `fk_customers_sellers1_idx` (`sellers_sellers_id` ASC) VISIBLE,
  CONSTRAINT `fk_customers_sellers1`
    FOREIGN KEY (`sellers_sellers_id`)
    REFERENCES `Optica`.`sellers` (`sellers_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Optica`.`sellers` (
  `sellers_id` INT(11) NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`sellers_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Optica`.`Sellings` (
  `Sellings_id` INT(11) NOT NULL AUTO_INCREMENT,
  `selling_date` DATE NOT NULL,
  `glasses_id` INT(11) NOT NULL,
  `sellers_sellers_id` INT(11) NOT NULL,
  `customers_customers_id` INT(11) NOT NULL,
  PRIMARY KEY (`Sellings_id`),
  INDEX `fk_Sellings_glasses1_idx` (`glasses_id` ASC) VISIBLE,
  INDEX `fk_Sellings_sellers1_idx` (`sellers_sellers_id` ASC) VISIBLE,
  INDEX `fk_Sellings_customers1_idx` (`customers_customers_id` ASC) VISIBLE,
  CONSTRAINT `fk_Sellings_glasses1`
    FOREIGN KEY (`glasses_id`)
    REFERENCES `Optica`.`glasses` (`glasses_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Sellings_sellers1`
    FOREIGN KEY (`sellers_sellers_id`)
    REFERENCES `Optica`.`sellers` (`sellers_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Sellings_customers1`
    FOREIGN KEY (`customers_customers_id`)
    REFERENCES `Optica`.`customers` (`customers_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
