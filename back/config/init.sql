-- MySQL Script generated by MySQL Workbench
-- Mon Jun 25 11:51:18 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema corpalif
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema corpalif
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `corpalif` DEFAULT CHARACTER SET utf8 ;
USE `corpalif` ;

-- -----------------------------------------------------
-- Table `corpalif`.`Categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `corpalif`.`Categories` (
  `idCategories` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`idCategories`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `corpalif`.`sous_categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `corpalif`.`sous_categories` (
  `idsous_categories` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `Categories_idCategories` INT NOT NULL,
  PRIMARY KEY (`idsous_categories`),
  CONSTRAINT `fk_sous_categories_Categories1`
    FOREIGN KEY (`Categories_idCategories`)
    REFERENCES `corpalif`.`Categories` (`idCategories`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_sous_categories_Categories1_idx` ON `corpalif`.`sous_categories` (`Categories_idCategories` ASC);


-- -----------------------------------------------------
-- Table `corpalif`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `corpalif`.`users` (
  `idusers` INT NOT NULL AUTO_INCREMENT,
  `fristname` VARCHAR(70) NULL,
  `lastname` VARCHAR(70) NULL,
  `civiliter` VARCHAR(70) NULL,
  `statussocial` VARCHAR(70) NULL,
  `adresse` VARCHAR(255) NULL,
  `codepostal` VARCHAR(45) NULL,
  `ville` VARCHAR(70) NULL,
  `structure` VARCHAR(70) NULL,
  `service` VARCHAR(70) NULL,
  `fonction` VARCHAR(70) NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(70) NULL,
  `status` VARCHAR(70) NULL,
  `fgpasword` VARCHAR(70) NULL,
  `tel_fix` VARCHAR(70) NULL,
  `tel_port` VARCHAR(70) NULL,
  PRIMARY KEY (`idusers`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `corpalif`.`articles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `corpalif`.`articles` (
  `idarticles` INT NOT NULL AUTO_INCREMENT,
  `titre` VARCHAR(70) NULL,
  `contenu` LONGTEXT NULL,
  `versioncourt` LONGTEXT NULL,
  `imgurl` VARCHAR(255) NULL,
  `cible_status` VARCHAR(45) NULL,
  `img_caroussel` VARCHAR(255) NULL,
  `in_caroussel` TINYINT NULL,
  `date_create` DATETIME NULL,
  `visible` TINYINT NULL,
  `sous_categories_idsous_categories` INT NOT NULL,
  `users_idusers` INT NOT NULL,
  PRIMARY KEY (`idarticles`),
  CONSTRAINT `fk_articles_sous_categories1`
    FOREIGN KEY (`sous_categories_idsous_categories`)
    REFERENCES `corpalif`.`sous_categories` (`idsous_categories`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_articles_users1`
    FOREIGN KEY (`users_idusers`)
    REFERENCES `corpalif`.`users` (`idusers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_articles_sous_categories1_idx` ON `corpalif`.`articles` (`sous_categories_idsous_categories` ASC);

CREATE INDEX `fk_articles_users1_idx` ON `corpalif`.`articles` (`users_idusers` ASC);


-- -----------------------------------------------------
-- Table `corpalif`.`anuaires`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `corpalif`.`anuaires` (
  `idanuaires` INT NOT NULL AUTO_INCREMENT,
  `code_postal` VARCHAR(70) NULL,
  `ville` VARCHAR(70) NULL,
  `adresse` VARCHAR(255) NULL,
  `phone` VARCHAR(45) NULL,
  `description` VARCHAR(70) NULL,
  PRIMARY KEY (`idanuaires`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `corpalif`.`types_anuaires`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `corpalif`.`types_anuaires` (
  `idtypes_anuaires` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  PRIMARY KEY (`idtypes_anuaires`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `corpalif`.`anuaires_types_anuaires`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `corpalif`.`anuaires_types_anuaires` (
  `anuaires_idanuaires` INT NOT NULL,
  `types_anuaires_idtypes_anuaires` INT NOT NULL,
  PRIMARY KEY (`anuaires_idanuaires`, `types_anuaires_idtypes_anuaires`),
  CONSTRAINT `fk_anuaires_has_types_anuaires_anuaires1`
    FOREIGN KEY (`anuaires_idanuaires`)
    REFERENCES `corpalif`.`anuaires` (`idanuaires`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_anuaires_has_types_anuaires_types_anuaires1`
    FOREIGN KEY (`types_anuaires_idtypes_anuaires`)
    REFERENCES `corpalif`.`types_anuaires` (`idtypes_anuaires`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_anuaires_has_types_anuaires_types_anuaires1_idx` ON `corpalif`.`anuaires_types_anuaires` (`types_anuaires_idtypes_anuaires` ASC);

CREATE INDEX `fk_anuaires_has_types_anuaires_anuaires1_idx` ON `corpalif`.`anuaires_types_anuaires` (`anuaires_idanuaires` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `corpalif`.`Categories`
-- -----------------------------------------------------
START TRANSACTION;
USE `corpalif`;
INSERT INTO `corpalif`.`Categories` (`idCategories`, `name`) VALUES (1, 'COORDINATION REGIONAL');
INSERT INTO `corpalif`.`Categories` (`idCategories`, `name`) VALUES (2, 'SOINS PALLIATIFS');
INSERT INTO `corpalif`.`Categories` (`idCategories`, `name`) VALUES (3, 'ANNUAIRE FRANCILIEN');
INSERT INTO `corpalif`.`Categories` (`idCategories`, `name`) VALUES (4, 'ENPLOI / FORMATION');
INSERT INTO `corpalif`.`Categories` (`idCategories`, `name`) VALUES (5, 'VEILLE MEDICALE');

COMMIT;


-- -----------------------------------------------------
-- Data for table `corpalif`.`sous_categories`
-- -----------------------------------------------------
START TRANSACTION;
USE `corpalif`;
INSERT INTO `corpalif`.`sous_categories` (`idsous_categories`, `name`, `Categories_idCategories`) VALUES (1, 'La Corpalif', 1);
INSERT INTO `corpalif`.`sous_categories` (`idsous_categories`, `name`, `Categories_idCategories`) VALUES (2, 'Actualités', 1);
INSERT INTO `corpalif`.`sous_categories` (`idsous_categories`, `name`, `Categories_idCategories`) VALUES (3, 'Boite à outils', 1);
INSERT INTO `corpalif`.`sous_categories` (`idsous_categories`, `name`, `Categories_idCategories`) VALUES (4, 'Adhérer', 1);
INSERT INTO `corpalif`.`sous_categories` (`idsous_categories`, `name`, `Categories_idCategories`) VALUES (5, 'Les adhérents', 1);
INSERT INTO `corpalif`.`sous_categories` (`idsous_categories`, `name`, `Categories_idCategories`) VALUES (6, 'Nous soutenir', 1);
INSERT INTO `corpalif`.`sous_categories` (`idsous_categories`, `name`, `Categories_idCategories`) VALUES (7, 'Nous contacter', 1);

COMMIT;
