-- MySQL Script generated by MySQL Workbench
-- Wed Mar 20 10:31:10 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

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
-- Table `aes_modval_edw`.`D_ProductLine`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aes_modval_edw`.`D_ProductLine` ;

CREATE TABLE IF NOT EXISTS `aes_modval_edw`.`D_ProductLine` (
  `idProductLine` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`idProductLine`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aes_modval_edw`.`D_Product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aes_modval_edw`.`D_Product` ;

CREATE TABLE IF NOT EXISTS `aes_modval_edw`.`D_Product` (
  `productCode` VARCHAR(15) NULL,
  `name` VARCHAR(45) NULL,
  `idProductLine` INT(11) NULL,
  `MSRP` VARCHAR(45) NULL,
  `buyPrice` VARCHAR(45) NULL,
  `idProduct` INT(11) NOT NULL AUTO_INCREMENT,
  INDEX `idProductLineFK_idx` (`idProductLine` ASC) VISIBLE,
  PRIMARY KEY (`idProduct`),
  CONSTRAINT `idProductLineFK`
    FOREIGN KEY (`idProductLine`)
    REFERENCES `aes_modval_edw`.`D_ProductLine` (`idProductLine`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aes_modval_edw`.`D_Country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aes_modval_edw`.`D_Country` ;

CREATE TABLE IF NOT EXISTS `aes_modval_edw`.`D_Country` (
  `idCountry` INT(3) NOT NULL AUTO_INCREMENT,
  `countryName` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idCountry`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aes_modval_edw`.`D_State`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aes_modval_edw`.`D_State` ;

CREATE TABLE IF NOT EXISTS `aes_modval_edw`.`D_State` (
  `idState` INT(3) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `idCountry` INT(3) NOT NULL,
  INDEX `iataCodeFK_idx` (`idCountry` ASC) VISIBLE,
  PRIMARY KEY (`idState`),
  CONSTRAINT `iataCodeFK`
    FOREIGN KEY (`idCountry`)
    REFERENCES `aes_modval_edw`.`D_Country` (`idCountry`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aes_modval_edw`.`D_City`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aes_modval_edw`.`D_City` ;

CREATE TABLE IF NOT EXISTS `aes_modval_edw`.`D_City` (
  `idCity` INT(5) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NULL,
  `idState` INT(3) NULL,
  PRIMARY KEY (`idCity`),
  INDEX `idStateFK_idx` (`idState` ASC) VISIBLE,
  CONSTRAINT `idStateFK`
    FOREIGN KEY (`idState`)
    REFERENCES `aes_modval_edw`.`D_State` (`idState`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aes_modval_edw`.`D_Office`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aes_modval_edw`.`D_Office` ;

CREATE TABLE IF NOT EXISTS `aes_modval_edw`.`D_Office` (
  `idOffice` INT(5) NOT NULL AUTO_INCREMENT,
  `idCountry` INT(3) NULL,
  `idState` INT(3) NULL,
  `idCity` INT(5) NULL,
  `phone` VARCHAR(50) NULL,
  `addressLine1` VARCHAR(50) NULL,
  `addressLine2` VARCHAR(50) NULL,
  `postalCode` VARCHAR(50) NULL,
  `territory` VARCHAR(50) NULL,
  PRIMARY KEY (`idOffice`),
  INDEX `idCountryFK_idx` (`idCountry` ASC) VISIBLE,
  INDEX `idStateFK_idx` (`idState` ASC) VISIBLE,
  INDEX `idCityFK_idx` (`idCity` ASC) VISIBLE,
  CONSTRAINT `idCountryOfficeFK`
    FOREIGN KEY (`idCountry`)
    REFERENCES `aes_modval_edw`.`D_Country` (`idCountry`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idStateOfficeFK`
    FOREIGN KEY (`idState`)
    REFERENCES `aes_modval_edw`.`D_State` (`idState`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idCityOfficeFK`
    FOREIGN KEY (`idCity`)
    REFERENCES `aes_modval_edw`.`D_City` (`idCity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aes_modval_edw`.`D_Customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aes_modval_edw`.`D_Customer` ;

CREATE TABLE IF NOT EXISTS `aes_modval_edw`.`D_Customer` (
  `idCustomer` INT NOT NULL AUTO_INCREMENT,
  `customerNumber` INT(11) NULL,
  `city` INT(5) NULL,
  `state` INT(3) NULL,
  `country` INT(3) NULL,
  `name` VARCHAR(50) NULL,
  `phone` VARCHAR(50) NULL,
  `addressLine1` VARCHAR(50) NULL,
  `addressLine2` VARCHAR(50) NULL,
  `postalCode` VARCHAR(50) NULL,
  `creditLimit` DECIMAL(10,2) NULL,
  PRIMARY KEY (`idCustomer`),
  INDEX `idCityFK_idx` (`city` ASC) VISIBLE,
  INDEX `idStateFK_idx` (`state` ASC) VISIBLE,
  INDEX `idCountry_idx` (`country` ASC) VISIBLE,
  CONSTRAINT `idCityCustomerFK`
    FOREIGN KEY (`city`)
    REFERENCES `aes_modval_edw`.`D_City` (`idCity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idStateCustomerFK`
    FOREIGN KEY (`state`)
    REFERENCES `aes_modval_edw`.`D_State` (`idState`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idCountryCustomerFK`
    FOREIGN KEY (`country`)
    REFERENCES `aes_modval_edw`.`D_Country` (`idCountry`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aes_modval_edw`.`D_Employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aes_modval_edw`.`D_Employee` ;

CREATE TABLE IF NOT EXISTS `aes_modval_edw`.`D_Employee` (
  `idEmployee` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NULL,
  `extension` VARCHAR(10) NULL,
  `email` VARCHAR(100) NULL,
  `officeCode` INT(5) NULL,
  `jobTitle` VARCHAR(50) NULL,
  `reportsTo` INT(11) NULL,
  PRIMARY KEY (`idEmployee`),
  INDEX `idOfficeCodeFK_idx` (`officeCode` ASC) VISIBLE,
  CONSTRAINT `idOfficeCodeFK`
    FOREIGN KEY (`officeCode`)
    REFERENCES `aes_modval_edw`.`D_Office` (`idOffice`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aes_modval_edw`.`D_Date`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aes_modval_edw`.`D_Date` ;

CREATE TABLE IF NOT EXISTS `aes_modval_edw`.`D_Date` (
  `idDate` INT(20) NOT NULL AUTO_INCREMENT,
  `day` INT(11) NULL,
  `month` INT(11) NULL,
  `year` VARCHAR(50) NULL,
  `weekDay` VARCHAR(15) NULL,
  `dayNumber` INT(11) NULL,
  PRIMARY KEY (`idDate`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aes_modval_edw`.`H_OrderDetails`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aes_modval_edw`.`H_OrderDetails` ;

CREATE TABLE IF NOT EXISTS `aes_modval_edw`.`H_OrderDetails` (
  `idOrderDetails` INT(20) NOT NULL AUTO_INCREMENT,
  `orderNumber` INT(11) NULL,
  `idOrderDate` INT(20) NULL,
  `idRequiredDate` INT(20) NULL,
  `idShippedDate` INT(20) NULL,
  `idStatus` VARCHAR(15) NULL,
  `idCustomer` INT(11) NULL,
  `idProduct` INT(11) NULL,
  `quantityOrdered` INT(11) NULL,
  `priceEach` DECIMAL(10,2) NULL,
  `employeeNumber` INT(11) NULL,
  PRIMARY KEY (`idOrderDetails`),
  INDEX `idOrderDateFK_idx` (`idOrderDate` ASC) VISIBLE,
  INDEX `idRequiredDateFK_idx` (`idRequiredDate` ASC) VISIBLE,
  INDEX `idShippedDate_idx` (`idShippedDate` ASC) VISIBLE,
  INDEX `idcustomerFK_idx` (`idCustomer` ASC) VISIBLE,
  INDEX `idProductOrderFK_idx` (`idProduct` ASC) VISIBLE,
  CONSTRAINT `idOrderDateFK`
    FOREIGN KEY (`idOrderDate`)
    REFERENCES `aes_modval_edw`.`D_Date` (`idDate`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idRequiredDateFK`
    FOREIGN KEY (`idRequiredDate`)
    REFERENCES `aes_modval_edw`.`D_Date` (`idDate`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idShippedDate`
    FOREIGN KEY (`idShippedDate`)
    REFERENCES `aes_modval_edw`.`D_Date` (`idDate`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idcustomerOrderFK`
    FOREIGN KEY (`idCustomer`)
    REFERENCES `aes_modval_edw`.`D_Customer` (`idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idProductOrderFK`
    FOREIGN KEY (`idProduct`)
    REFERENCES `aes_modval_edw`.`D_Product` (`idProduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aes_modval_edw`.`H_Calls`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aes_modval_edw`.`H_Calls` ;

CREATE TABLE IF NOT EXISTS `aes_modval_edw`.`H_Calls` (
  `employeeNumber` INT(11) NULL,
  `idCustomer` INT(11) NULL,
  `idProduct` INT(11) NULL,
  INDEX `employeeNumberFK_idx` (`employeeNumber` ASC) VISIBLE,
  INDEX `idCustomerFK_idx` (`idCustomer` ASC) VISIBLE,
  INDEX `idProductCodeFK_idx` (`idProduct` ASC) VISIBLE,
  CONSTRAINT `employeeNumberFK`
    FOREIGN KEY (`employeeNumber`)
    REFERENCES `aes_modval_edw`.`D_Employee` (`idEmployee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idCustomerCallFK`
    FOREIGN KEY (`idCustomer`)
    REFERENCES `aes_modval_edw`.`D_Customer` (`idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idProductCodeFK`
    FOREIGN KEY (`idProduct`)
    REFERENCES `aes_modval_edw`.`D_Product` (`idProduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
