CREATE TABLE `myhomepage`.`user` (
  `id` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE);
  
ALTER TABLE `myhomepage`.`user` 
CHARACTER SET = utf8 , COLLATE = utf8_bin ;


SELECT * FROM myhomepage.user;

CREATE TABLE `myhomepage`.`board` (
  `BoardID` INT NOT NULL,
  `BoardTitle` VARCHAR(45) NULL,
  `userID` VARCHAR(45) NULL,
  `BoardDate` VARCHAR(45) NULL,
  `BoardContent` TEXT NULL,
  PRIMARY KEY (`BoardID`),
  UNIQUE INDEX `BoardID_UNIQUE` (`BoardID` ASC) VISIBLE);

 SELECT * FROM myhomepage.board;
 
ALTER TABLE `myhomepage`.`board` 
CHARACTER SET = utf8 , COLLATE = utf8_bin ;
