CREATE SCHEMA `myhomepage` ;

CREATE TABLE `myhomepage`.`user` (
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NULL,
  PRIMARY KEY (`email`));

