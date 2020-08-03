-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `loyalty1` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema project
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema project
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `loyalty1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `loyalty1` ;

-- -----------------------------------------------------
-- Table `mydb`.`Value Added Services`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loyalty1`.`Value Added Services` (
  `PLAN_TYPE` INT NULL,
  `VAS` VARCHAR(45) NULL,
  `PAYMENT_AMOUNT` VARCHAR(45) NULL,
  `PLAN_DESCRIPTION` VARCHAR(45) NULL,
  `PLAN_ID` INT NOT NULL,
  PRIMARY KEY (`PLAN_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DEAL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loyalty1`.`DEAL` (
  `DEAL_START_DATE` DATETIME NULL,
  `DEAL_DURATION` VARCHAR(45) NULL,
  `DEAL_TYPE` VARCHAR(45) NULL,
  `DEAL_VAS` VARCHAR(45) NULL,
  `DEAL_ID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DEAL_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DEAL_has_Value Added Services`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loyalty1`.`DEAL_has_Value Added Services` (
  `DEAL_purchase_PURCHASE_ID` INT NOT NULL,
  `DEAL_purchase_customer_CUSTOMER_ID` INT(100) NOT NULL,
  `DEAL_ID` VARCHAR(45) NOT NULL,
  `Value Added Services_PLAN_ID` INT NOT NULL,
  PRIMARY KEY (`DEAL_purchase_PURCHASE_ID`, `DEAL_purchase_customer_CUSTOMER_ID`, `DEAL_ID`, `Value Added Services_PLAN_ID`),
  INDEX `fk_DEAL_has_Value Added Services_Value Added Services1_idx` (`Value Added Services_PLAN_ID` ASC) VISIBLE,
  INDEX `fk_DEAL_has_Value Added Services_DEAL1_idx` (`DEAL_purchase_PURCHASE_ID` ASC, `DEAL_purchase_customer_CUSTOMER_ID` ASC, `DEAL_ID` ASC) VISIBLE,
  CONSTRAINT `DEAL_ID`
    FOREIGN KEY (`DEAL_ID`)
    REFERENCES `loyalty1`.`DEAL` (`DEAL_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DEAL_has_Value Added Services_Value Added Services1`
    FOREIGN KEY (`Value Added Services_PLAN_ID`)
    REFERENCES `loyalty1`.`Value Added Services` (`PLAN_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `loyalty1` ;

-- -----------------------------------------------------
-- Table `project`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loyalty1`.`customer` (
  `CUSTOMER_ID` INT(100) NOT NULL,
  `CUSTOMER_NAME` VARCHAR(45) NOT NULL,
  `CUSTOMER_TYPE` VARCHAR(45) NOT NULL,
  `CUSTOMER_PHONE` VARCHAR(45) NOT NULL,
  `CUSTOMER_START_DATE` VARCHAR(45) NOT NULL,
  `CUSTOMER_STATUS` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CUSTOMER_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `project`.`loyalty_points`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loyalty1`.`loyalty_points` (
  `LOYALTY_POINTS_VALUE` INT NULL DEFAULT NULL,
  `LOYALTY_POINT_DEFAULT_VALUE` VARCHAR(45) NULL DEFAULT NULL,
  `REDEMPTION_LAST_DATE` VARCHAR(45) NULL,
  `POINTS_REDEMPTION_ELGIBILITY` VARCHAR(45) NULL,
  `POINTS_REDEMPTION_METHOD` VARCHAR(45) NULL,
  `FINAL_VAL` INT NULL,
  `LP_ID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`LP_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `project`.`purchase`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loyalty1`.`purchase` (
  `PURCHASE_VAS_TYPE` VARCHAR(45) NULL DEFAULT NULL,
  `PURCHASE_PAYMENT_TYPE` VARCHAR(45) NULL DEFAULT NULL,
  `PURCHASE_COUNT` VARCHAR(45) NULL DEFAULT NULL,
  `PURCHASE_DATE` VARCHAR(45) NULL DEFAULT NULL,
  `PURCHASE_ID` INT NOT NULL,
  `CUSTOMER_ID` INT(100) NOT NULL,
  `DEAL_ID` VARCHAR(45) NULL,
  `POINTS_EARNED` FLOAT NULL,
  `POINTS_REDEMEED` FLOAT NULL,
  PRIMARY KEY (`PURCHASE_ID`, `CUSTOMER_ID`),
  INDEX `fk_purchase_customer1_idx` (`CUSTOMER_ID` ASC) VISIBLE,
  CONSTRAINT `fk_purchase_customer1`
    FOREIGN KEY (`CUSTOMER_ID`)
    REFERENCES `loyalty1`.`customer` (`CUSTOMER_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `project`.`purchase_has_Value Added Services`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loyalty1`.`purchase_has_Value Added Services` (
  `purchase_PURCHASE_ID` INT NOT NULL,
  `purchase_customer_CUSTOMER_ID` INT(100) NOT NULL,
  `Value Added Services_PLAN_ID` INT NOT NULL,
  PRIMARY KEY (`purchase_PURCHASE_ID`, `purchase_customer_CUSTOMER_ID`, `Value Added Services_PLAN_ID`),
  INDEX `fk_purchase_has_Value Added Services_Value Added Services1_idx` (`Value Added Services_PLAN_ID` ASC) VISIBLE,
  INDEX `fk_purchase_has_Value Added Services_purchase1_idx` (`purchase_PURCHASE_ID` ASC, `purchase_customer_CUSTOMER_ID` ASC) VISIBLE,
  CONSTRAINT `fk_purchase_has_Value Added Services_purchase1`
    FOREIGN KEY (`purchase_PURCHASE_ID` , `purchase_customer_CUSTOMER_ID`)
    REFERENCES `loyalty1`.`purchase` (`PURCHASE_ID` , `CUSTOMER_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_has_Value Added Services_Value Added Services1`
    FOREIGN KEY (`Value Added Services_PLAN_ID`)
    REFERENCES `loyalty1`.`Value Added Services` (`PLAN_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `project`.`purchase_has_DEAL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loyalty1`.`purchase_has_DEAL` (
  `purchase_PURCHASE_ID` INT NOT NULL,
  `purchase_CUSTOMER_ID` INT(100) NOT NULL,
  `DEAL_ID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`purchase_PURCHASE_ID`, `purchase_CUSTOMER_ID`, `DEAL_ID`),
  INDEX `fk_purchase_has_DEAL_DEAL1_idx` (`DEAL_ID` ASC) VISIBLE,
  INDEX `fk_purchase_has_DEAL_purchase1_idx` (`purchase_PURCHASE_ID` ASC, `purchase_CUSTOMER_ID` ASC) VISIBLE,
  CONSTRAINT `fk_purchase_has_DEAL_purchase1`
    FOREIGN KEY (`purchase_PURCHASE_ID` , `purchase_CUSTOMER_ID`)
    REFERENCES `loyalty1`.`purchase` (`PURCHASE_ID` , `CUSTOMER_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `project`.`customer_has_loyalty_points`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loyalty1`.`customer_has_loyalty_points` (
  `customer_CUSTOMER_ID` INT(100) NOT NULL,
  `loyalty_points_LP_ID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`customer_CUSTOMER_ID`, `loyalty_points_LP_ID`),
  INDEX `fk_customer_has_loyalty_points_loyalty_points1_idx` (`loyalty_points_LP_ID` ASC) VISIBLE,
  INDEX `fk_customer_has_loyalty_points_customer1_idx` (`customer_CUSTOMER_ID` ASC) VISIBLE,
  CONSTRAINT `fk_customer_has_loyalty_points_customer1`
    FOREIGN KEY (`customer_CUSTOMER_ID`)
    REFERENCES `loyalty1`.`customer` (`CUSTOMER_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customer_has_loyalty_points_loyalty_points1`
    FOREIGN KEY (`loyalty_points_LP_ID`)
    REFERENCES `loyalty1`.`loyalty_points` (`LP_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
