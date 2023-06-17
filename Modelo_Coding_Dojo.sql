-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema DB_Codingdojo
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `DB_Codingdojo` ;

-- -----------------------------------------------------
-- Schema DB_Codingdojo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DB_Codingdojo` DEFAULT CHARACTER SET utf8 ;
USE `DB_Codingdojo` ;

-- -----------------------------------------------------
-- Table `DB_Codingdojo`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_Codingdojo`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `tiempo_creacion` DATETIME NOT NULL DEFAULT NOW(),
  `tiempo_actualizacion` DATETIME NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_Codingdojo`.`quehaceres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_Codingdojo`.`quehaceres` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(500) NOT NULL,
  `estatus` VARCHAR(45) NOT NULL,
  `tiempo_creacion` DATETIME NOT NULL DEFAULT NOW(),
  `tiempo_actualizacion` DATETIME NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_quehaceres_usuarios_idx` (`usuario_id` ASC) VISIBLE)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

USE db_codingdojo;

-- Consulta: crea 3 usuarios nuevos
INSERT INTO usuarios (nombre, apellido, password, email)
VALUES 
('Isabella', 'Ospina', '1234','isabella@gmail.com'),
('Miguel', 'Ospina', '5678','miguel@gmail.com'),
('Ana', 'Chaverra', '9012','miangel0312@gmail.com');

-- Consulta: recupera todos los usuarios
SELECT * FROM usuarios;

-- Consulta: recupera el primer usuario usando su dirección de correo electrónico
SELECT * FROM usuarios WHERE email = 'isabella@gmail.com';

-- Consulta: recupera el último usuario usando su id
SELECT * FROM usuarios WHERE id = 3;

-- Consulta: cambia el usuario con id=3 para que su apellido sea Panqueques
UPDATE  usuarios SET apellido = 'Panqueques' WHERE id = 3;

-- Consulta: elimina el usuario con id=2 de la base de datos
DELETE FROM usuarios WHERE id = 2;

-- Consulta: obtén todos los usuarios, ordenados por su nombre
SELECT * FROM usuarios ORDER BY nombre;

-- Consulta BONUS: obtén todos los usuarios, ordenados por su nombre en orden descendente
SELECT * FROM usuarios ORDER BY nombre DESC;

