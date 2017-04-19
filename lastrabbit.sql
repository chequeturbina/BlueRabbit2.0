-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema lastrabbit
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lastrabbit
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lastrabbit` DEFAULT CHARACTER SET utf8 ;
USE `lastrabbit` ;

-- -----------------------------------------------------
-- Table `lastrabbit`.`Puesto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lastrabbit`.`Puesto` ;

CREATE TABLE IF NOT EXISTS `lastrabbit`.`Puesto` (
  `idPuesto` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(150) NOT NULL,
  `descripcion` VARCHAR(150) NOT NULL,
  `calificacion` INT NOT NULL,
  `menu` TEXT(2500) NOT NULL,
  `latitud` FLOAT NOT NULL,
  `longitud` FLOAT NOT NULL,
  PRIMARY KEY (`idPuesto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lastrabbit`.`Usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lastrabbit`.`Usuario` ;

CREATE TABLE IF NOT EXISTS `lastrabbit`.`Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `correo` VARCHAR(100) NOT NULL,
  `contrasena` VARCHAR(100) NOT NULL,
  `foto` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lastrabbit`.`Comentarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lastrabbit`.`Comentarios` ;

CREATE TABLE IF NOT EXISTS `lastrabbit`.`Comentarios` (
  `idComentarios` INT NOT NULL AUTO_INCREMENT,
  `comentarios` VARCHAR(200) NOT NULL,
  `calificaion` INT NOT NULL,
  `Usuario_idUsuario` INT NOT NULL,
  `Puesto_idPuesto` INT NOT NULL,
  PRIMARY KEY (`idComentarios`, `Puesto_idPuesto`),
  INDEX `fk_Comentarios_Usuario_idx` (`Usuario_idUsuario` ASC),
  INDEX `fk_Comentarios_Puesto1_idx` (`Puesto_idPuesto` ASC),
  CONSTRAINT `fk_Comentarios_Usuario`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `lastrabbit`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comentarios_Puesto1`
    FOREIGN KEY (`Puesto_idPuesto`)
    REFERENCES `lastrabbit`.`Puesto` (`idPuesto`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
