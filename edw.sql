-- MySQL Script generated by MySQL Workbench
-- Wed Mar 20 19:52:34 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema aes_modval_edw
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `aes_modval_edw` ;

-- -----------------------------------------------------
-- Schema aes_modval_edw
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `aes_modval_edw` DEFAULT CHARACTER SET utf8 ;
USE `aes_modval_edw` ;

-- -----------------------------------------------------
-- Table `aes_modval_edw`.`D_City`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aes_modval_edw`.`D_City` ;

CREATE TABLE IF NOT EXISTS `aes_modval_edw`.`D_City` (
  `idCity` INT(5) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NULL DEFAULT NULL,
  `idState` INT(3) NULL DEFAULT NULL,
  PRIMARY KEY (`idCity`),
  INDEX `idStateFK_idx` (`idState` ASC) VISIBLE,
  CONSTRAINT `idStateFK`
    FOREIGN KEY (`idState`)
    REFERENCES `aes_modval_edw`.`d_state` (`idState`))
ENGINE = InnoDB
AUTO_INCREMENT = 4357
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `aes_modval_edw`.`D_Country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aes_modval_edw`.`D_Country` ;

CREATE TABLE IF NOT EXISTS `aes_modval_edw`.`D_Country` (
  `idCountry` INT(3) NOT NULL AUTO_INCREMENT,
  `countryName` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idCountry`))
ENGINE = InnoDB
AUTO_INCREMENT = 1784
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `aes_modval_edw`.`D_Customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aes_modval_edw`.`D_Customer` ;

CREATE TABLE IF NOT EXISTS `aes_modval_edw`.`D_Customer` (
  `idCustomer` INT(11) NOT NULL AUTO_INCREMENT,
  `customerNumber` INT(11) NULL DEFAULT NULL,
  `city` INT(5) NULL DEFAULT NULL,
  `name` VARCHAR(50) NULL DEFAULT NULL,
  `phone` VARCHAR(50) NULL DEFAULT NULL,
  `addressLine1` VARCHAR(50) NULL DEFAULT NULL,
  `addressLine2` VARCHAR(50) NULL DEFAULT NULL,
  `postalCode` VARCHAR(50) NULL DEFAULT NULL,
  `creditLimit` DECIMAL(10,2) NULL DEFAULT NULL,
  `contactName` VARCHAR(60) NULL DEFAULT NULL,
  PRIMARY KEY (`idCustomer`),
  INDEX `idCityFK_idx` (`city` ASC) VISIBLE,
  CONSTRAINT `idCityCustomerFK`
    FOREIGN KEY (`city`)
    REFERENCES `aes_modval_edw`.`d_city` (`idCity`))
ENGINE = InnoDB
AUTO_INCREMENT = 3328
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `aes_modval_edw`.`D_Date`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aes_modval_edw`.`D_Date` ;

CREATE TABLE IF NOT EXISTS `aes_modval_edw`.`D_Date` (
  `idDate` INT(20) NOT NULL AUTO_INCREMENT,
  `day` INT(11) NULL DEFAULT NULL,
  `month` INT(11) NULL DEFAULT NULL,
  `year` VARCHAR(50) NULL DEFAULT NULL,
  `weekDay` VARCHAR(15) NULL DEFAULT NULL,
  `dayNumber` INT(11) NULL DEFAULT NULL,
  `date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`idDate`))
ENGINE = InnoDB
AUTO_INCREMENT = 20050611
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `aes_modval_edw`.`D_Employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aes_modval_edw`.`D_Employee` ;

CREATE TABLE IF NOT EXISTS `aes_modval_edw`.`D_Employee` (
  `idEmployee` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NULL DEFAULT NULL,
  `extension` VARCHAR(10) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `officeCode` INT(5) NULL DEFAULT NULL,
  `employeeNumber` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idEmployee`),
  INDEX `idOfficeCodeFK_idx` (`officeCode` ASC) VISIBLE,
  CONSTRAINT `idOfficeCodeFK`
    FOREIGN KEY (`officeCode`)
    REFERENCES `aes_modval_edw`.`d_office` (`idOffice`))
ENGINE = InnoDB
AUTO_INCREMENT = 979
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `aes_modval_edw`.`D_Office`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aes_modval_edw`.`D_Office` ;

CREATE TABLE IF NOT EXISTS `aes_modval_edw`.`D_Office` (
  `idOffice` INT(5) NOT NULL AUTO_INCREMENT,
  `idCity` INT(5) NULL DEFAULT NULL,
  `phone` VARCHAR(50) NULL DEFAULT NULL,
  `addressLine1` VARCHAR(50) NULL DEFAULT NULL,
  `addressLine2` VARCHAR(50) NULL DEFAULT NULL,
  `postalCode` VARCHAR(50) NULL DEFAULT NULL,
  `territory` VARCHAR(50) NULL DEFAULT NULL,
  `officeCode` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`idOffice`),
  INDEX `idCityFK_idx` (`idCity` ASC) VISIBLE,
  CONSTRAINT `idCityOfficeFK`
    FOREIGN KEY (`idCity`)
    REFERENCES `aes_modval_edw`.`d_city` (`idCity`))
ENGINE = InnoDB
AUTO_INCREMENT = 364
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `aes_modval_edw`.`D_Product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aes_modval_edw`.`D_Product` ;

CREATE TABLE IF NOT EXISTS `aes_modval_edw`.`D_Product` (
  `productCode` VARCHAR(15) NULL DEFAULT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `idProductLine` INT(11) NULL DEFAULT NULL,
  `MSRP` VARCHAR(45) NULL DEFAULT NULL,
  `buyPrice` VARCHAR(45) NULL DEFAULT NULL,
  `idProduct` INT(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idProduct`),
  INDEX `idProductLineFK_idx` (`idProductLine` ASC) VISIBLE,
  CONSTRAINT `idProductLineFK`
    FOREIGN KEY (`idProductLine`)
    REFERENCES `aes_modval_edw`.`d_productline` (`idProductLine`))
ENGINE = InnoDB
AUTO_INCREMENT = 4951
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `aes_modval_edw`.`D_ProductLine`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aes_modval_edw`.`D_ProductLine` ;

CREATE TABLE IF NOT EXISTS `aes_modval_edw`.`D_ProductLine` (
  `idProductLine` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idProductLine`))
ENGINE = InnoDB
AUTO_INCREMENT = 452
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `aes_modval_edw`.`D_State`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aes_modval_edw`.`D_State` ;

CREATE TABLE IF NOT EXISTS `aes_modval_edw`.`D_State` (
  `idState` INT(3) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `idCountry` INT(3) NOT NULL,
  PRIMARY KEY (`idState`),
  INDEX `iataCodeFK_idx` (`idCountry` ASC) VISIBLE,
  CONSTRAINT `iataCodeFK`
    FOREIGN KEY (`idCountry`)
    REFERENCES `aes_modval_edw`.`d_country` (`idCountry`))
ENGINE = InnoDB
AUTO_INCREMENT = 811
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `aes_modval_edw`.`H_Calls`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aes_modval_edw`.`H_Calls` ;

CREATE TABLE IF NOT EXISTS `aes_modval_edw`.`H_Calls` (
  `employeeNumber` INT(11) NULL DEFAULT NULL,
  `idCustomer` INT(11) NULL DEFAULT NULL,
  `idProduct` INT(11) NULL DEFAULT NULL,
  `date` DATE NULL DEFAULT NULL,
  INDEX `employeeNumberFK_idx` (`employeeNumber` ASC) VISIBLE,
  INDEX `idCustomerFK_idx` (`idCustomer` ASC) VISIBLE,
  INDEX `idProductCodeFK_idx` (`idProduct` ASC) VISIBLE,
  CONSTRAINT `employeeNumberFK`
    FOREIGN KEY (`employeeNumber`)
    REFERENCES `aes_modval_edw`.`d_employee` (`idEmployee`),
  CONSTRAINT `idCustomerCallFK`
    FOREIGN KEY (`idCustomer`)
    REFERENCES `aes_modval_edw`.`d_customer` (`idCustomer`),
  CONSTRAINT `idProductCodeFK`
    FOREIGN KEY (`idProduct`)
    REFERENCES `aes_modval_edw`.`d_product` (`idProduct`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `aes_modval_edw`.`H_OrderDetails`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aes_modval_edw`.`H_OrderDetails` ;

CREATE TABLE IF NOT EXISTS `aes_modval_edw`.`H_OrderDetails` (
  `idOrderDetails` INT(20) NOT NULL AUTO_INCREMENT,
  `orderNumber` INT(11) NULL DEFAULT NULL,
  `idOrderDate` INT(20) NULL DEFAULT NULL,
  `idRequiredDate` INT(20) NULL DEFAULT NULL,
  `idShippedDate` INT(20) NULL DEFAULT NULL,
  `idStatus` VARCHAR(15) NULL DEFAULT NULL,
  `idCustomer` INT(11) NULL DEFAULT NULL,
  `idProduct` INT(11) NULL DEFAULT NULL,
  `quantityOrdered` INT(11) NULL DEFAULT NULL,
  `priceEach` DECIMAL(10,2) NULL DEFAULT NULL,
  `employeeNumber` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idOrderDetails`),
  INDEX `idOrderDateFK_idx` (`idOrderDate` ASC) VISIBLE,
  INDEX `idRequiredDateFK_idx` (`idRequiredDate` ASC) VISIBLE,
  INDEX `idShippedDate_idx` (`idShippedDate` ASC) VISIBLE,
  INDEX `idcustomerFK_idx` (`idCustomer` ASC) VISIBLE,
  INDEX `idProductOrderFK_idx` (`idProduct` ASC) VISIBLE,
  CONSTRAINT `idOrderDateFK`
    FOREIGN KEY (`idOrderDate`)
    REFERENCES `aes_modval_edw`.`d_date` (`idDate`),
  CONSTRAINT `idProductOrderFK`
    FOREIGN KEY (`idProduct`)
    REFERENCES `aes_modval_edw`.`d_product` (`idProduct`),
  CONSTRAINT `idRequiredDateFK`
    FOREIGN KEY (`idRequiredDate`)
    REFERENCES `aes_modval_edw`.`d_date` (`idDate`),
  CONSTRAINT `idShippedDate`
    FOREIGN KEY (`idShippedDate`)
    REFERENCES `aes_modval_edw`.`d_date` (`idDate`),
  CONSTRAINT `idcustomerOrderFK`
    FOREIGN KEY (`idCustomer`)
    REFERENCES `aes_modval_edw`.`d_customer` (`idCustomer`))
ENGINE = InnoDB
AUTO_INCREMENT = 12605
DEFAULT CHARACTER SET = utf8;

USE `aes_modval_edw` ;

-- -----------------------------------------------------
-- procedure fill_date_dimension
-- -----------------------------------------------------

USE `aes_modval_edw`;
DROP procedure IF EXISTS `aes_modval_edw`.`fill_date_dimension`;

DELIMITER $$
USE `aes_modval_edw`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `fill_date_dimension`(IN startdate DATE,IN stopdate DATE)
BEGIN
    DECLARE currentdate DATE;
    SET currentdate = startdate;
    WHILE currentdate < stopdate DO
        INSERT INTO d_date VALUES (
        YEAR(currentdate)*10000+MONTH(currentdate)*100 + DAY(currentdate),
                        DAY(currentdate),
                        MONTH(currentdate),
                        YEAR(currentdate),
                        DATE_FORMAT(currentdate,'%W'),
                        DAYOFWEEK(currentdate),
                        currentdate);
        SET currentdate = ADDDATE(currentdate,INTERVAL 1 DAY);
    END WHILE;
END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
