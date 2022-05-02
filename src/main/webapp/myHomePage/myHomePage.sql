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

ALTER TABLE `myhomepage`.`board` 
CHANGE COLUMN `BoardID` `boardID` INT NOT NULL ,
CHANGE COLUMN `BoardTitle` `boardTitle` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NULL DEFAULT NULL ,
CHANGE COLUMN `BoardDate` `boardDate` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NULL DEFAULT NULL ,
CHANGE COLUMN `BoardContent` `boardContent` TEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NULL DEFAULT NULL ;



CREATE TABLE `myhomepage`.`comment` (
  `boardID` INT NULL,
  `commentID` INT NULL,
  `userID` VARCHAR(45) NULL,
  `commentDate` VARCHAR(45) NULL,
  `commentContent` VARCHAR(45) NULL,
  `commentAvailable` INT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

alter table comment add primary key (commentID);

ALTER TABLE `myhomepage`.`comment` 
CHANGE COLUMN `commentContent` `commentText` VARCHAR(45) NULL DEFAULT NULL ;

SELECT * FROM myhomepage.board;