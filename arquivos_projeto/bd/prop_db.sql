SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `prop` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;

CREATE TABLE IF NOT EXISTS `prop`.`objetivos` (
  `id_objetivo` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_usuario` INT(11) NOT NULL,
  `titulo` VARCHAR(200) NOT NULL,
  `descricao` TEXT NULL DEFAULT NULL,
  `desc_motivacao` VARCHAR(200) NULL DEFAULT NULL,
  `img_motivacao` BLOB NULL DEFAULT NULL,
  `deadline` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id_objetivo`),
  INDEX `id_usuario_idx` (`id_usuario` ASC),
  CONSTRAINT `id_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `prop`.`usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `prop`.`usuarios` (
  `id_usuario` INT(11) NOT NULL AUTO_INCREMENT,
  `primeiro_nome` VARCHAR(65) NULL DEFAULT NULL,
  `nick` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `senha` VARCHAR(12) NULL DEFAULT NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `prop`.`metas` (
  `id_meta` INT(11) NOT NULL,
  `id_objetivo` INT(11) NULL DEFAULT NULL,
  `titulo` VARCHAR(45) NULL DEFAULT NULL,
  `descricao` VARCHAR(200) NULL DEFAULT NULL,
  `data_incio_estimada` DATE NULL DEFAULT NULL,
  `data_fim_estimada` DATE NULL DEFAULT NULL,
  `data_inicio` DATE NULL DEFAULT NULL,
  `data_termino` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id_meta`),
  INDEX `id_objetivo_idx` (`id_objetivo` ASC),
  CONSTRAINT `id_objetivo`
    FOREIGN KEY (`id_objetivo`)
    REFERENCES `prop`.`objetivos` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `prop`.`tarefas` (
  `id_tarefa` INT(11) NOT NULL,
  `id_meta` INT(11) NULL DEFAULT NULL,
  `titulo` VARCHAR(45) NULL DEFAULT NULL,
  `descricao` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_tarefa`),
  INDEX `id_meta_idx` (`id_meta` ASC),
  CONSTRAINT `id_meta`
    FOREIGN KEY (`id_meta`)
    REFERENCES `prop`.`metas` (`id_meta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
