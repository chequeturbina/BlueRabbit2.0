-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema bluerabbit
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bluerabbit
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bluerabbit` DEFAULT CHARACTER SET utf8 ;
USE `bluerabbit` ;

-- -----------------------------------------------------
-- Table `bluerabbit`.`Comida`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bluerabbit`.`Comida` ;

CREATE TABLE IF NOT EXISTS `bluerabbit`.`Comida` (
  `idComida` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL,
  PRIMARY KEY (`idComida`),
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bluerabbit`.`Menu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bluerabbit`.`Menu` ;

CREATE TABLE IF NOT EXISTS `bluerabbit`.`Menu` (
  `idMenu` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL,
  `Comida_idComida` INT NOT NULL,
  PRIMARY KEY (`idMenu`, `Comida_idComida`),
  INDEX `fk_Menu_Comida_idx` (`Comida_idComida` ASC),
  CONSTRAINT `fk_Menu_Comida`
    FOREIGN KEY (`Comida_idComida`)
    REFERENCES `bluerabbit`.`Comida` (`idComida`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bluerabbit`.`Puesto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bluerabbit`.`Puesto` ;

CREATE TABLE IF NOT EXISTS `bluerabbit`.`Puesto` (
  `idPuesto` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `informacion` VARCHAR(100) NULL,
  `calificacion` FLOAT NULL,
  `Menu_idMenu` INT NOT NULL,
  `Menu_Comida_idComida` INT NOT NULL,
  PRIMARY KEY (`idPuesto`, `Menu_idMenu`, `Menu_Comida_idComida`),
  INDEX `fk_Puesto_Menu1_idx` (`Menu_idMenu` ASC, `Menu_Comida_idComida` ASC),
  CONSTRAINT `fk_Puesto_Menu1`
    FOREIGN KEY (`Menu_idMenu` , `Menu_Comida_idComida`)
    REFERENCES `bluerabbit`.`Menu` (`idMenu` , `Comida_idComida`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bluerabbit`.`Usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bluerabbit`.`Usuario` ;

CREATE TABLE IF NOT EXISTS `bluerabbit`.`Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `correoElectronico` VARCHAR(100) NOT NULL,
  `contrasena` VARCHAR(45) NOT NULL,
  `apellidoPaterno` VARCHAR(100) NULL,
  `apellidoMaterno` VARCHAR(100) NULL,
  `foto` VARCHAR(100) NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE INDEX `correoElectronico_UNIQUE` (`correoElectronico` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bluerabbit`.`Comentarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bluerabbit`.`Comentarios` ;

CREATE TABLE IF NOT EXISTS `bluerabbit`.`Comentarios` (
  `idComentarios` INT NOT NULL AUTO_INCREMENT,
  `Puesto_idPuesto` INT NOT NULL,
  `Puesto_Menu_idMenu` INT NOT NULL,
  `Puesto_Menu_Comida_idComida` INT NOT NULL,
  `Usuario_idUsuario` INT NOT NULL,
  `comentarios` VARCHAR(150) NOT NULL DEFAULT 'Null',
  PRIMARY KEY (`idComentarios`, `Puesto_idPuesto`, `Puesto_Menu_idMenu`, `Puesto_Menu_Comida_idComida`, `Usuario_idUsuario`),
  INDEX `fk_Puesto_has_Usuario_Usuario1_idx` (`Usuario_idUsuario` ASC),
  INDEX `fk_Puesto_has_Usuario_Puesto1_idx` (`Puesto_idPuesto` ASC, `Puesto_Menu_idMenu` ASC, `Puesto_Menu_Comida_idComida` ASC),
  CONSTRAINT `fk_Puesto_Usuario_Puesto1`
    FOREIGN KEY (`Puesto_idPuesto` , `Puesto_Menu_idMenu` , `Puesto_Menu_Comida_idComida`)
    REFERENCES `bluerabbit`.`Puesto` (`idPuesto` , `Menu_idMenu` , `Menu_Comida_idComida`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Puesto_has_Usuario_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `bluerabbit`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bluerabbit`.`Calificaciones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bluerabbit`.`Calificaciones` ;

CREATE TABLE IF NOT EXISTS `bluerabbit`.`Calificaciones` (
  `Puesto_idPuesto` INT NOT NULL,
  `Puesto_Menu_idMenu` INT NOT NULL,
  `Puesto_Menu_Comida_idComida` INT NOT NULL,
  `Usuario_idUsuario` INT NOT NULL,
  `calificacion` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`Puesto_idPuesto`, `Puesto_Menu_idMenu`, `Puesto_Menu_Comida_idComida`, `Usuario_idUsuario`),
  INDEX `fk_Puesto_has_Usuario_Usuario2_idx` (`Usuario_idUsuario` ASC),
  INDEX `fk_Puesto_has_Usuario_Puesto2_idx` (`Puesto_idPuesto` ASC, `Puesto_Menu_idMenu` ASC, `Puesto_Menu_Comida_idComida` ASC),
  CONSTRAINT `fk_Puesto_Usuario_Puesto2`
    FOREIGN KEY (`Puesto_idPuesto` , `Puesto_Menu_idMenu` , `Puesto_Menu_Comida_idComida`)
    REFERENCES `bluerabbit`.`Puesto` (`idPuesto` , `Menu_idMenu` , `Menu_Comida_idComida`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Puesto_has_Usuario_Usuario2`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `bluerabbit`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
