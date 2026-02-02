-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema modelo_Academico
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema modelo_Academico
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `modelo_Academico` DEFAULT CHARACTER SET utf8 ;
USE `modelo_Academico` ;

-- -----------------------------------------------------
-- Table `modelo_Academico`.`Aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelo_Academico`.`Aluno` (
  `idAluno` INT NOT NULL,
  `Nome` VARCHAR(64) NOT NULL,
  `CPF` VARCHAR(15) NOT NULL,
  `DataNascimento` DATETIME NULL,
  PRIMARY KEY (`idAluno`),
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE,
  UNIQUE INDEX `idAluno_UNIQUE` (`idAluno` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelo_Academico`.`curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelo_Academico`.`curso` (
  `NomeCurso` VARCHAR(64) NOT NULL,
  `CargaHoraria` INT NOT NULL,
  `Valor` INT NOT NULL,
  `NotaMinima` INT NOT NULL,
  PRIMARY KEY (`NomeCurso`),
  UNIQUE INDEX `idcurso_UNIQUE` (`NomeCurso` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelo_Academico`.`Turma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelo_Academico`.`Turma` (
  `idTurma` INT NOT NULL,
  `NomeTurma` VARCHAR(65) NOT NULL,
  `DataInicio` DATETIME NOT NULL,
  `NumVagas` INT NOT NULL,
  `curso_NomeCurso` VARCHAR(64) NOT NULL,
  PRIMARY KEY (`idTurma`, `curso_NomeCurso`),
  UNIQUE INDEX `idTurma_UNIQUE` (`idTurma` ASC) VISIBLE,
  INDEX `fk_Turma_curso1_idx` (`curso_NomeCurso` ASC) VISIBLE,
  CONSTRAINT `fk_Turma_curso1`
    FOREIGN KEY (`curso_NomeCurso`)
    REFERENCES `modelo_Academico`.`curso` (`NomeCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelo_Academico`.`Matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelo_Academico`.`Matricula` (
  `idMatricula` INT NOT NULL,
  `DataMatricula` DATETIME NOT NULL,
  `Prestações` INT NOT NULL,
  `Aluno_idAluno` INT NOT NULL,
  `Turma_idTurma` INT NOT NULL,
  PRIMARY KEY (`idMatricula`, `Aluno_idAluno`, `Turma_idTurma`),
  UNIQUE INDEX `idMatricula_UNIQUE` (`idMatricula` ASC) VISIBLE,
  INDEX `fk_Matricula_Aluno_idx` (`Aluno_idAluno` ASC) VISIBLE,
  INDEX `fk_Matricula_Turma1_idx` (`Turma_idTurma` ASC) VISIBLE,
  CONSTRAINT `fk_Matricula_Aluno`
    FOREIGN KEY (`Aluno_idAluno`)
    REFERENCES `modelo_Academico`.`Aluno` (`idAluno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Matricula_Turma1`
    FOREIGN KEY (`Turma_idTurma`)
    REFERENCES `modelo_Academico`.`Turma` (`idTurma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelo_Academico`.`Avaliação`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelo_Academico`.`Avaliação` (
  `idAvaliação` INT NOT NULL,
  `Nota` INT NULL,
  `Data` DATETIME NULL,
  `Matricula_idMatricula` INT NOT NULL,
  PRIMARY KEY (`idAvaliação`, `Matricula_idMatricula`),
  UNIQUE INDEX `idAvaliação_UNIQUE` (`idAvaliação` ASC) VISIBLE,
  INDEX `fk_Avaliação_Matricula1_idx` (`Matricula_idMatricula` ASC) VISIBLE,
  CONSTRAINT `fk_Avaliação_Matricula1`
    FOREIGN KEY (`Matricula_idMatricula`)
    REFERENCES `modelo_Academico`.`Matricula` (`idMatricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
