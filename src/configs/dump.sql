

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema helena_med
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `helena_med` ;

-- -----------------------------------------------------
-- Schema helena_med
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `helena_med` DEFAULT CHARACTER SET utf8 ;
USE `helena_med` ;

-- -----------------------------------------------------
-- Table `helena_med`.`address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `helena_med`.`address` ;

CREATE TABLE IF NOT EXISTS `helena_med`.`address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `line1` VARCHAR(45) NOT NULL,
  `line2` VARCHAR(45) NOT NULL,
  `zip_code` VARCHAR(8) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` CHAR(2) NOT NULL,
  `observation` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `helena_med`.`appointment_exam`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `helena_med`.`appointment_exam` ;

CREATE TABLE IF NOT EXISTS `helena_med`.`appointment_exam` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_appointment` INT NOT NULL,
  `id_exam` INT NOT NULL,
  `id_lab` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_appointment_idx` (`id_appointment` ASC) VISIBLE,
  INDEX `id_exam_idx` (`id_exam` ASC) VISIBLE,
  INDEX `id_lab_idx` (`id_lab` ASC) VISIBLE,
  CONSTRAINT `id_appointment`
    FOREIGN KEY (`id_appointment`)
    REFERENCES `helena_med`.`doc_appointment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_exam`
    FOREIGN KEY (`id_exam`)
    REFERENCES `helena_med`.`exam` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_lab`
    FOREIGN KEY (`id_lab`)
    REFERENCES `helena_med`.`lab` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `helena_med`.`appointment_prescription`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `helena_med`.`appointment_prescription` ;

CREATE TABLE IF NOT EXISTS `helena_med`.`appointment_prescription` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_appointment` INT NULL,
  PRIMARY KEY (`id`),
	CONSTRAINT `fk_id_appointment`
    FOREIGN KEY (`id_appointment`)
    REFERENCES `helena_med`.`doc_appointment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `helena_med`.`blood_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `helena_med`.`blood_type` ;

CREATE TABLE IF NOT EXISTS `helena_med`.`blood_type` (
  `id` INT NOT NULL,
  `blood_type` VARCHAR(2) NOT NULL,
  `rh_factor` CHAR(1) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `helena_med`.`doc_appointment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `helena_med`.`doc_appointment` ;

CREATE TABLE IF NOT EXISTS `helena_med`.`doc_appointment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `time` TIME NOT NULL,
  `id_doctor` INT NULL,
  `notes` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_doctor_idx` (`id_doctor` ASC) VISIBLE,
  CONSTRAINT `id_doctor`
    FOREIGN KEY (`id_doctor`)
    REFERENCES `helena_med`.`doctors` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `helena_med`.`doctors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `helena_med`.`doctors` ;

CREATE TABLE IF NOT EXISTS `helena_med`.`doctors` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `id_specialty` INT NOT NULL,
  `id_address` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_specialty_idx` (`id_specialty` ASC) VISIBLE,
  INDEX `id_address_idx` (`id_address` ASC) VISIBLE,
  CONSTRAINT `id_specialty`
    FOREIGN KEY (`id_specialty`)
    REFERENCES `helena_med`.`medical_specialties` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_address`
    FOREIGN KEY (`id_address`)
    REFERENCES `helena_med`.`address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `helena_med`.`emmergency_contact`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `helena_med`.`emmergency_contact` ;

CREATE TABLE IF NOT EXISTS `helena_med`.`emmergency_contact` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `helena_med`.`exam`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `helena_med`.`exam` ;

CREATE TABLE IF NOT EXISTS `helena_med`.`exam` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `result` TEXT NULL,
  `date` DATE NULL,
  `time` TIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `helena_med`.`lab`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `helena_med`.`lab` ;

CREATE TABLE IF NOT EXISTS `helena_med`.`lab` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NULL,
  `id_address` INT NULL,
  `labcol` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `id_address_idx` (`id_address` ASC) VISIBLE,
	constraint `fk_id_address`
    FOREIGN KEY (`id_address`)
    REFERENCES `helena_med`.`address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `helena_med`.`medical_specialties`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `helena_med`.`medical_specialties` ;

CREATE TABLE IF NOT EXISTS `helena_med`.`medical_specialties` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `helena_med`.`medication`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `helena_med`.`medication` ;

CREATE TABLE IF NOT EXISTS `helena_med`.`medication` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `dosage` INT NOT NULL,
  `dosage_unit` VARCHAR(10) NOT NULL,
  `lab_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `helena_med`.`prescription`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `helena_med`.`prescription` ;

CREATE TABLE IF NOT EXISTS `helena_med`.`prescription` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_appointment_prescription` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_appointment_idx` (`id_appointment_prescription` ASC) VISIBLE,
  CONSTRAINT `fk_presc_id_appointment`
    FOREIGN KEY (`id_appointment_prescription`)
    REFERENCES `helena_med`.`appointment_prescription` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `helena_med`.`prescription_medication`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `helena_med`.`prescription_medication` ;

CREATE TABLE IF NOT EXISTS `helena_med`.`prescription_medication` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_prescription` INT NOT NULL,
  `id_medication` INT NOT NULL,
  `dosage` INT NOT NULL,
  `frequency` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_prescription_idx` (`id_prescription` ASC) VISIBLE,
  INDEX `id_medication_idx` (`id_medication` ASC) VISIBLE,
  CONSTRAINT `id_prescription`
    FOREIGN KEY (`id_prescription`)
    REFERENCES `helena_med`.`prescription` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_medication`
    FOREIGN KEY (`id_medication`)
    REFERENCES `helena_med`.`medication` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `helena_med`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `helena_med`.`user` ;

CREATE TABLE IF NOT EXISTS `helena_med`.`user` (
  `iduser` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `gender` VARCHAR(45) NULL,
  `id_blood_type` INT NULL,
  `id_emmergency_contact` INT NULL,
  `id_address` INT NULL,
  PRIMARY KEY (`iduser`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  INDEX `id_blood_type_idx` (`id_blood_type` ASC) VISIBLE,
  INDEX `id_emmergency_contact_idx` (`id_emmergency_contact` ASC) VISIBLE,
  INDEX `id_address_idx` (`id_address` ASC) VISIBLE,
  CONSTRAINT `id_blood_type`
    FOREIGN KEY (`id_blood_type`)
    REFERENCES `helena_med`.`blood_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_emmergency_contact`
    FOREIGN KEY (`id_emmergency_contact`)
    REFERENCES `helena_med`.`emmergency_contact` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_address`
    FOREIGN KEY (`id_address`)
    REFERENCES `helena_med`.`address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
