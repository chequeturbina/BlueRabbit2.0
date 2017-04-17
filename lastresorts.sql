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
-- Table `lastrabbit`.`Comida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lastrabbit`.`Comida` (
  `idComida` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL,
  PRIMARY KEY (`idComida`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lastrabbit`.`Puesto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lastrabbit`.`Puesto` (
  `idPuesto` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(150) NULL,
  `descripcion` VARCHAR(150) NULL,
  `calificacion` INT NULL,
  `Comida_idComida` INT NOT NULL,
  PRIMARY KEY (`idPuesto`),
  INDEX `fk_Puesto_Comida_idx` (`Comida_idComida` ASC),
  CONSTRAINT `fk_Puesto_Comida`
    FOREIGN KEY (`Comida_idComida`)
    REFERENCES `lastrabbit`.`Comida` (`idComida`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lastrabbit`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lastrabbit`.`Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL,
  `correo` VARCHAR(100) NULL,
  `contrasena` VARCHAR(100) NULL,
  `foto` VARCHAR(100) NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lastrabbit`.`Comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lastrabbit`.`Comentarios` (
  `idComentarios` INT NOT NULL AUTO_INCREMENT,
  `comentarios` VARCHAR(150) NULL,
  `calificaion` INT NULL,
  `Puesto_idPuesto` INT NOT NULL,
  `Usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`idComentarios`, `Puesto_idPuesto`),
  INDEX `fk_Comentarios_Puesto1_idx` (`Puesto_idPuesto` ASC),
  INDEX `fk_Comentarios_Usuario1_idx` (`Usuario_idUsuario` ASC),
  CONSTRAINT `fk_Comentarios_Puesto1`
    FOREIGN KEY (`Puesto_idPuesto`)
    REFERENCES `lastrabbit`.`Puesto` (`idPuesto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comentarios_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `lastrabbit`.`Usuario` (`idUsuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO comida("idcomida","nombre") VALUES (1,"huevos");
