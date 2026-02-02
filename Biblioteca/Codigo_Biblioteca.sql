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
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `idCliente` INT NOT NULL,
  `NomeCliente` VARCHAR(64) NOT NULL,
  `Contato` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE INDEX `idCliente_UNIQUE` (`idCliente` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Emprestimos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Emprestimos` (
  `idEmprestimos` INT NOT NULL,
  `Livro` VARCHAR(64) NOT NULL,
  `DataEmprestimo` DATETIME NOT NULL,
  `PrazoDevolução` DATETIME NOT NULL,
  `ValorTotalMulta` DECIMAL(2) NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idEmprestimos`, `Cliente_idCliente`),
  UNIQUE INDEX `idEmprestimos_UNIQUE` (`idEmprestimos` ASC) VISIBLE,
  INDEX `fk_Emprestimos_Cliente_idx` (`Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Emprestimos_Cliente`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Coleção`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Coleção` (
  `idColeção` INT NOT NULL,
  `Nome` VARCHAR(64) NOT NULL,
  `QtdLivros` INT NOT NULL,
  PRIMARY KEY (`idColeção`),
  UNIQUE INDEX `idColeção_UNIQUE` (`idColeção` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Livros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Livros` (
  `idLivro` INT NOT NULL,
  `NomeLivro` VARCHAR(64) NOT NULL,
  `Genero` VARCHAR(64) NOT NULL,
  `Editora` VARCHAR(64) NOT NULL,
  `NumPaginas` INT NOT NULL,
  `ValorDiarioMulta` DECIMAL(2) NOT NULL,
  `Estoque` INT NOT NULL,
  `Coleção_idColeção` INT NULL,
  PRIMARY KEY (`idLivro`, `Coleção_idColeção`),
  UNIQUE INDEX `idLivros_UNIQUE` (`idLivro` ASC) VISIBLE,
  INDEX `fk_Livros_Coleção1_idx` (`Coleção_idColeção` ASC) VISIBLE,
  CONSTRAINT `fk_Livros_Coleção1`
    FOREIGN KEY (`Coleção_idColeção`)
    REFERENCES `mydb`.`Coleção` (`idColeção`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Livros_foi_Emprestado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Livros_foi_Emprestado` (
  `Livros_idLivro` INT NOT NULL,
  `Emprestimos_idEmprestimos` INT NOT NULL,
  PRIMARY KEY (`Livros_idLivro`, `Emprestimos_idEmprestimos`),
  INDEX `fk_Livros_has_Emprestimos_Emprestimos1_idx` (`Emprestimos_idEmprestimos` ASC) VISIBLE,
  INDEX `fk_Livros_has_Emprestimos_Livros1_idx` (`Livros_idLivro` ASC) VISIBLE,
  CONSTRAINT `fk_Livros_has_Emprestimos_Livros1`
    FOREIGN KEY (`Livros_idLivro`)
    REFERENCES `mydb`.`Livros` (`idLivro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Livros_has_Emprestimos_Emprestimos1`
    FOREIGN KEY (`Emprestimos_idEmprestimos`)
    REFERENCES `mydb`.`Emprestimos` (`idEmprestimos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
