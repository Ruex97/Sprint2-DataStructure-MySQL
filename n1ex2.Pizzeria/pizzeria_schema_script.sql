-- MySQL Workbench Synchronization
-- Generated: 2023-01-18 11:06
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: xavir

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `pizzeria` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `pizzeria`.`province` (
  `province_id` INT(11) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`province_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`locality` (
  `locality_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `province_province_id` INT(11) NOT NULL,
  PRIMARY KEY (`locality_id`),
  INDEX `fk_locality_province_idx` (`province_province_id` ASC) VISIBLE,
  CONSTRAINT `fk_locality_province`
    FOREIGN KEY (`province_province_id`)
    REFERENCES `pizzeria`.`province` (`province_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`customers` (
  `customers_id` INT(11) NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `postal_code` VARCHAR(45) NOT NULL,
  `phone_number` VARCHAR(45) NOT NULL,
  `locality_id` INT(11) NOT NULL,
  PRIMARY KEY (`customers_id`),
  INDEX `fk_customers_locality1_idx` (`locality_id` ASC) VISIBLE,
  CONSTRAINT `fk_customers_locality1`
    FOREIGN KEY (`locality_id`)
    REFERENCES `pizzeria`.`locality` (`locality_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`orders` (
  `orders_id` INT(11) NOT NULL AUTO_INCREMENT,
  `date_time` DATE NOT NULL,
  `delivery_or_pickup` VARCHAR(45) NOT NULL,
  `delivery_date_time` DATE NULL DEFAULT NULL,
  `quantity_burguers` TINYINT(5) NULL DEFAULT NULL,
  `quantity_pizzas` TINYINT(5) NULL DEFAULT NULL,
  `quantity_drinks` TINYINT(5) NULL DEFAULT NULL,
  `price` FLOAT(11) NOT NULL,
  `customer_id` INT(11) NOT NULL,
  `restaurant_id` INT(11) NOT NULL,
  `delivery_employee_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`orders_id`),
  INDEX `fk_orders_customers1_idx` (`customer_id` ASC) VISIBLE,
  INDEX `fk_orders_restaurant1_idx` (`restaurant_id` ASC) VISIBLE,
  INDEX `fk_orders_employee1_idx` (`delivery_employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_customers1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `pizzeria`.`customers` (`customers_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_orders_restaurant1`
    FOREIGN KEY (`restaurant_id`)
    REFERENCES `pizzeria`.`restaurant` (`restaurant_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_orders_employee1`
    FOREIGN KEY (`delivery_employee_id`)
    REFERENCES `pizzeria`.`employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`products` (
  `product_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `image` VARCHAR(45) NOT NULL,
  `price` FLOAT(11) NOT NULL,
  `product_type` VARCHAR(45) NULL DEFAULT NULL,
  `pizza_category_id` INT(11) NOT NULL,
  PRIMARY KEY (`product_id`),
  INDEX `fk_products_pizza_category1_idx` (`pizza_category_id` ASC) VISIBLE,
  CONSTRAINT `fk_products_pizza_category1`
    FOREIGN KEY (`pizza_category_id`)
    REFERENCES `pizzeria`.`pizza_category` (`pizza_category_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`pizza_category` (
  `pizza_category_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`pizza_category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`products_has_orders` (
  `products_product_id` INT(11) NOT NULL,
  `orders_orders_id` INT(11) NOT NULL,
  PRIMARY KEY (`products_product_id`, `orders_orders_id`),
  INDEX `fk_products_has_orders_orders1_idx` (`orders_orders_id` ASC) VISIBLE,
  INDEX `fk_products_has_orders_products1_idx` (`products_product_id` ASC) VISIBLE,
  CONSTRAINT `fk_products_has_orders_products1`
    FOREIGN KEY (`products_product_id`)
    REFERENCES `pizzeria`.`products` (`product_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_products_has_orders_orders1`
    FOREIGN KEY (`orders_orders_id`)
    REFERENCES `pizzeria`.`orders` (`orders_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`restaurant` (
  `restaurant_id` INT(11) NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(45) NOT NULL,
  `postal_code` VARCHAR(45) NOT NULL,
  `locality_id` INT(11) NOT NULL,
  PRIMARY KEY (`restaurant_id`),
  INDEX `fk_restaurant_locality1_idx` (`locality_id` ASC) VISIBLE,
  CONSTRAINT `fk_restaurant_locality1`
    FOREIGN KEY (`locality_id`)
    REFERENCES `pizzeria`.`locality` (`locality_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`employee` (
  `employee_id` INT(11) NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `nif` VARCHAR(45) NOT NULL,
  `phone_number` VARCHAR(45) NOT NULL,
  `job_type` VARCHAR(45) NOT NULL,
  `restaurant_id` INT(11) NOT NULL,
  PRIMARY KEY (`employee_id`),
  INDEX `fk_employee_restaurant1_idx` (`restaurant_id` ASC) VISIBLE,
  CONSTRAINT `fk_employee_restaurant1`
    FOREIGN KEY (`restaurant_id`)
    REFERENCES `pizzeria`.`restaurant` (`restaurant_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
