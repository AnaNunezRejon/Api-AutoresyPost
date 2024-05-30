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
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`autor` (
  `id_autor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `imagen` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_autor`))
ENGINE = InnoDB;

INSERT INTO autor (nombre, email, imagen) VALUES
('Juan García', 'juangarcia@example.com', 'imagen1.jpg'),
('María Martínez', 'mariamartinez@example.com', 'imagen2.jpg'),
('Pedro Rodríguez', 'pedrorodriguez@example.com', 'imagen3.jpg'),
('Ana López', 'analopez@example.com', 'imagen4.jpg'),
('Carlos Pérez', 'carlosperez@example.com', 'imagen5.jpg'),
('Laura González', 'lauragonzalez@example.com', 'imagen6.jpg'),
('Diego Hernández', 'diegohernandez@example.com', 'imagen7.jpg'),
('Sara Díaz', 'saradiaz@example.com', 'imagen8.jpg'),
('Pablo Sánchez', 'pablosanchez@example.com', 'imagen9.jpg'),
('Elena Gómez', 'elenagomez@example.com', 'imagen10.jpg');



-- -----------------------------------------------------
-- Table `mydb`.`post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`post` (
  `id_post` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `fecha_creacion` VARCHAR(45) NOT NULL,
  `categoria` VARCHAR(45) NOT NULL,
  `id_autor` INT NOT NULL,
  PRIMARY KEY (`id_post`),
  INDEX `id_autor_idx` (`id_autor` ASC) VISIBLE,
  CONSTRAINT `id_autor`
    FOREIGN KEY (`id_autor`)
    REFERENCES `mydb`.`autor` (`id_autor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO post (titulo, descripcion, fecha_creacion, categoria, id_autor) VALUES
('Título del Post 1', 'Descripción del Post 1', '2024-05-18', 'Categoría 1', 1),
('Título del Post 2', 'Descripción del Post 2', '2024-05-18', 'Categoría 1', 1),
('Título del Post 3', 'Descripción del Post 3', '2024-05-18', 'Categoría 2', 2),
('Título del Post 4', 'Descripción del Post 4', '2024-05-18', 'Categoría 2', 2),
('Título del Post 5', 'Descripción del Post 5', '2024-05-18', 'Categoría 3', 3),
('Título del Post 6', 'Descripción del Post 6', '2024-05-18', 'Categoría 3', 3),
('Título del Post 7', 'Descripción del Post 7', '2024-05-18', 'Categoría 4', 4),
('Título del Post 8', 'Descripción del Post 8', '2024-05-18', 'Categoría 4', 4),
('Título del Post 9', 'Descripción del Post 9', '2024-05-18', 'Categoría 5', 5),
('Título del Post 10', 'Descripción del Post 10', '2024-05-18', 'Categoría 5', 5),
('Título del Post 11', 'Descripción del Post 11', '2024-05-18', 'Categoría 6', 6),
('Título del Post 12', 'Descripción del Post 12', '2024-05-18', 'Categoría 6', 6),
('Título del Post 13', 'Descripción del Post 13', '2024-05-18', 'Categoría 7', 7),
('Título del Post 14', 'Descripción del Post 14', '2024-05-18', 'Categoría 7', 7),
('Título del Post 15', 'Descripción del Post 15', '2024-05-18', 'Categoría 8', 8),
('Título del Post 16', 'Descripción del Post 16', '2024-05-18', 'Categoría 8', 8),
('Título del Post 17', 'Descripción del Post 17', '2024-05-18', 'Categoría 9', 9),
('Título del Post 18', 'Descripción del Post 18', '2024-05-18', 'Categoría 9', 9),
('Título del Post 19', 'Descripción del Post 19', '2024-05-18', 'Categoría 10', 10),
('Título del Post 20', 'Descripción del Post 20', '2024-05-18', 'Categoría 10', 10);



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
