create database fattle;
use fattle;
#=========================================================================
# 관계형 데이터베이스 정의문
CREATE TABLE `USER_TB` (
	`USER_CD`	VARCHAR(9)	NOT null primary key,
	`AVATAR_CD`	INT	NOT NULL,
	`SOCIAL_TYPE`	CHAR(5)	NOT NULL,
	`NICKNAME`	VARCHAR(16)	NOT NULL,
	`SEX`	CHAR(1)	NOT NULL	DEFAULT 'M',
	`JOIN_DT`	DATE	NOT NULL	DEFAULT (current_date),
	`GOAL_WEIGHT`	FLOAT	NOT NULL	DEFAULT 0,
	`GOAL_CALORY`	INT	NOT NULL	DEFAULT 0,
	`GOAL_CARBO`	INT	NOT NULL	DEFAULT 0,
	`GOAL_PROTEIN`	INT	NOT NULL	DEFAULT 0,
	`GOAL_FAT`	INT	NOT NULL	DEFAULT 0,
	`GROWTH_EXP`	INT	NOT NULL	DEFAULT 0,
	`STACK_EXP`	INT	NOT NULL	DEFAULT 0,
	`INTRODUCTION`	VARCHAR(100)	NULL
);

CREATE TABLE `HEALTH_TB` (
	`HEALTH_CD`	INT	NOT null auto_increment primary key,
	`USER_CD`	VARCHAR(9)	NOT NULL,
	`HEIGHT`	FLOAT	NOT NULL	DEFAULT 0,
	`WEIGHT`	FLOAT	NOT NULL	DEFAULT 0,
	`REC_DT`	DATE	NOT NULL	DEFAULT (current_date)
);

CREATE TABLE `FOOD_TB` (
	`FOOD_CD`	INT	NOT NULL	AUTO_INCREMENT primary key,
	`USER_CD`	VARCHAR(9)	NOT NULL,
	`NAME`	VARCHAR(16)	NOT NULL,
	`TYPE`	TINYINT	NOT NULL	DEFAULT 0	COMMENT '아침: 0
점심: 1
저녁: 2',
	`CALORY`	INT	NOT NULL	DEFAULT 0,
	`PROTEIN`	INT	NOT NULL	DEFAULT 0,
	`CARBO`	INT	NOT NULL	DEFAULT 0,
	`FAT`	INT	NOT NULL	DEFAULT 0,
	`REC_DT`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP(),
	`PIC_PATH`	VARCHAR(200)	NOT NULL
);

CREATE TABLE `QUEST_TB` (
	`REC_DT`	DATE	NOT NULL	DEFAULT (current_date),
	`USER_CD`	VARCHAR(9)	NOT NULL,
	`DAY_CHK`	TINYINT	NOT NULL	DEFAULT 0,
	`EXERCISE_CNT`	TINYINT	NOT NULL	DEFAULT 0,
	`FOOD_CNT`	TINYINT	NOT NULL	DEFAULT 0,
	`IS_FINISH`	TINYINT	NOT NULL	DEFAULT 0,
	primary key(`REC_DT`, `USER_CD`)
);

CREATE TABLE `AVATAR_TB` (
	`AVATAR_CD`	INT	NOT null auto_increment primary key,
	`LEVEL`	INT	NOT NULL,
	`INFO`	VARCHAR(10)	NOT NULL,
	`IMG_PATH`	VARCHAR(200)	NOT NULL
);

CREATE TABLE `FOLLOW_TB` (
	`FOLLOW_CD`	INT	NOT null primary key,
	`TO_USER_CD`	VARCHAR(9)	NOT NULL,
	`FROM_USER_CD`	VARCHAR(9)	NOT NULL
);

CREATE TABLE `EXP_HISTORY_TB` (
	`EXP_CD`	INT	NOT null auto_increment primary key,
	`USER_CD`	VARCHAR(9)	NOT NULL,
	`REC_DT`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP(),
	`TYPE`	VARCHAR(50)	NOT NULL,
	`POINT`	INT	NOT NULL	DEFAULT 0
);

CREATE TABLE `BATTLE_TB` (
	`BATTLE_CD`	CHAR(6)	NOT null primary key,
	`CREATER_CD`	VARCHAR(9)	NOT NULL,
	`NAME`	VARCHAR(20)	NOT NULL,
	`START_DT`	DATE	NOT NULL	DEFAULT (current_date),
	`END_DT`	DATE	NOT NULL,
	`BETTING`	VARCHAR(50)	NULL,
	`CONTRACT_PATH`	VARCHAR(200)	NOT NULL,
	`STATUS`	TINYINT	NOT NULL	DEFAULT 0
);

CREATE TABLE `BATTLE_PLAYER_TB` (
	`BATTLE_CD`	CHAR(6)	NOT NULL,
	`USER_CD`	VARCHAR(9)	NOT NULL,
	`BEFORE_WEIGHT`	FLOAT	NOT NULL	DEFAULT 0,
	`AFTER_WEIGHT`	FLOAT	NOT NULL	DEFAULT 0,
	`GOAL`	VARCHAR(50)	NOT NULL	DEFAULT 0	COMMENT '내기자만 목표 설정',
	`LIVE_PT`	INT	NOT NULL	DEFAULT 0,
	`FOOD_PT`	INT	NOT NULL	DEFAULT 0,
	`LIVE_USER_PT`	INT	NOT NULL	DEFAULT 0,
	`FOOD_USER_PT`	INT	NOT NULL	DEFAULT 0,
	`QUEST_PT`	INT	NOT NULL	DEFAULT 0,
	`GOAL_PT`	INT	NOT NULL	DEFAULT 0,
	primary key(`BATTLE_CD`, `USER_CD`)
);

CREATE TABLE `BATTLE_TRIGGER_TB` (
	`BATTLE_CD`	CHAR(6)	NOT NULL,
	`USER_CD`	VARCHAR(9)	NOT NULL,
	`LIVE_PT`	INT	NOT NULL	DEFAULT 0,
	primary key(`BATTLE_CD`, `USER_CD`)
);

CREATE TABLE `FOOD_BOARD_TB` (
	`FOOD_BOARD_CD`	INT	NOT null primary key,
	`BATTLE_CD`	CHAR(6)	NOT NULL,
	`PLAYER_CD`	VARCHAR(9)	NOT NULL,
	`REC_DT`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP(),
	`PIC_PATH`	VARCHAR(200)	NOT null
);

CREATE TABLE `FOOD_COMMENT_TB` (
	`FOOD_COMMENT_CD`	INT	NOT null primary key,
	`FOOD_BOARD_CD`	INT	NOT NULL,
	`BATTLE_CD`	CHAR(6)	NOT NULL,
	`TRIGGER_CD`	VARCHAR(9)	NOT NULL,
	`CONTENT`	VARCHAR(100)	NOT NULL,
	`REC_DT`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP()
);

CREATE TABLE `BATTLE_POINT_TB` (
	`POINT_CD`	INT	NOT null auto_increment primary key,
	`BATTLE_CD`	CHAR(6)	NOT NULL,
	`PLAYER_CD`	VARCHAR(9)	NOT NULL,
	`TRIGGER_CD`	VARCHAR(9)	NOT NULL,
	`TYPE`	TINYINT	NOT NULL	DEFAULT 0,
	`POINT`	INT	NOT NULL	DEFAULT 0,
	`REC_DT`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP()
);

CREATE TABLE `EXERCISE_TB` (
	`EXERCISE_CD`	INT	NOT NULL auto_increment primary key,
	`USER_CD`	VARCHAR(9)	NOT NULL,
	`TYPE_CD`	INT	NOT NULL,
	`REC_DT`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP()
);

CREATE TABLE `EX_TYPE_TB` (
	`TYPE_CD`	INT	NOT NULL auto_increment primary key,
	`NAME`	VARCHAR(20)	NOT NULL
);

CREATE TABLE `BATTLE_BETTING_TB` (
	`BETTING_CD`	INT	NOT null auto_increment primary key,
	`BATTLE_CD`	CHAR(6)	NOT NULL,
	`CONTENT`	VARCHAR(50)	NOT NULL
);


ALTER TABLE `USER_TB` ADD CONSTRAINT `FK_AVATAR_TB_TO_USER_TB_1` FOREIGN KEY (
	`AVATAR_CD`
)
REFERENCES `AVATAR_TB` (
	`AVATAR_CD`
);

ALTER TABLE `HEALTH_TB` ADD CONSTRAINT `FK_USER_TB_TO_HEALTH_TB_1` FOREIGN KEY (
	`USER_CD`
)
REFERENCES `USER_TB` (
	`USER_CD`
);

ALTER TABLE `FOOD_TB` ADD CONSTRAINT `FK_USER_TB_TO_FOOD_TB_1` FOREIGN KEY (
	`USER_CD`
)
REFERENCES `USER_TB` (
	`USER_CD`
);

ALTER TABLE `QUEST_TB` ADD CONSTRAINT `FK_USER_TB_TO_QUEST_TB_1` FOREIGN KEY (
	`USER_CD`
)
REFERENCES `USER_TB` (
	`USER_CD`
);

ALTER TABLE `FOLLOW_TB` ADD CONSTRAINT `FK_USER_TB_TO_FOLLOW_TB_1` FOREIGN KEY (
	`TO_USER_CD`
)
REFERENCES `USER_TB` (
	`USER_CD`
);

ALTER TABLE `FOLLOW_TB` ADD CONSTRAINT `FK_USER_TB_TO_FOLLOW_TB_2` FOREIGN KEY (
	`FROM_USER_CD`
)
REFERENCES `USER_TB` (
	`USER_CD`
);

ALTER TABLE `EXP_HISTORY_TB` ADD CONSTRAINT `FK_USER_TB_TO_EXP_HISTORY_TB_1` FOREIGN KEY (
	`USER_CD`
)
REFERENCES `USER_TB` (
	`USER_CD`
);

ALTER TABLE `BATTLE_TB` ADD CONSTRAINT `FK_USER_TB_TO_BATTLE_TB_1` FOREIGN KEY (
	`CREATER_CD`
)
REFERENCES `USER_TB` (
	`USER_CD`
);

ALTER TABLE `BATTLE_PLAYER_TB` ADD CONSTRAINT `FK_BATTLE_TB_TO_BATTLE_PLAYER_TB_1` FOREIGN KEY (
	`BATTLE_CD`
)
REFERENCES `BATTLE_TB` (
	`BATTLE_CD`
);

ALTER TABLE `BATTLE_PLAYER_TB` ADD CONSTRAINT `FK_USER_TB_TO_BATTLE_PLAYER_TB_1` FOREIGN KEY (
	`USER_CD`
)
REFERENCES `USER_TB` (
	`USER_CD`
);

ALTER TABLE `BATTLE_TRIGGER_TB` ADD CONSTRAINT `FK_BATTLE_TB_TO_BATTLE_TRIGGER_TB_1` FOREIGN KEY (
	`BATTLE_CD`
)
REFERENCES `BATTLE_TB` (
	`BATTLE_CD`
);

ALTER TABLE `BATTLE_TRIGGER_TB` ADD CONSTRAINT `FK_USER_TB_TO_BATTLE_TRIGGER_TB_1` FOREIGN KEY (
	`USER_CD`
)
REFERENCES `USER_TB` (
	`USER_CD`
);

ALTER TABLE `FOOD_BOARD_TB` ADD CONSTRAINT `FK_BATTLE_PLAYER_TB_TO_FOOD_BOARD_TB_1` FOREIGN KEY (
	`BATTLE_CD`
)
REFERENCES `BATTLE_PLAYER_TB` (
	`BATTLE_CD`
);

ALTER TABLE `FOOD_BOARD_TB` ADD CONSTRAINT `FK_BATTLE_PLAYER_TB_TO_FOOD_BOARD_TB_2` FOREIGN KEY (
	`PLAYER_CD`
)
REFERENCES `BATTLE_PLAYER_TB` (
	`USER_CD`
);

ALTER TABLE `FOOD_COMMENT_TB` ADD CONSTRAINT `FK_FOOD_BOARD_TB_TO_FOOD_COMMENT_TB_1` FOREIGN KEY (
	`FOOD_BOARD_CD`
)
REFERENCES `FOOD_BOARD_TB` (
	`FOOD_BOARD_CD`
);

ALTER TABLE `FOOD_COMMENT_TB` ADD CONSTRAINT `FK_BATTLE_TRIGGER_TB_TO_FOOD_COMMENT_TB_1` FOREIGN KEY (
	`BATTLE_CD`
)
REFERENCES `BATTLE_TRIGGER_TB` (
	`BATTLE_CD`
);

ALTER TABLE `FOOD_COMMENT_TB` ADD CONSTRAINT `FK_BATTLE_TRIGGER_TB_TO_FOOD_COMMENT_TB_2` FOREIGN KEY (
	`TRIGGER_CD`
)
REFERENCES `BATTLE_TRIGGER_TB` (
	`USER_CD`
);

ALTER TABLE `BATTLE_POINT_TB` ADD CONSTRAINT `FK_BATTLE_TB_TO_BATTLE_POINT_TB_1` FOREIGN KEY (
	`BATTLE_CD`
)
REFERENCES `BATTLE_TB` (
	`BATTLE_CD`
);

ALTER TABLE `BATTLE_POINT_TB` ADD CONSTRAINT `FK_BATTLE_PLAYER_TB_TO_BATTLE_POINT_TB_1` FOREIGN KEY (
	`PLAYER_CD`
)
REFERENCES `BATTLE_PLAYER_TB` (
	`USER_CD`
);

ALTER TABLE `EXERCISE_TB` ADD CONSTRAINT `FK_USER_TB_TO_EXERCISE_TB_1` FOREIGN KEY (
	`USER_CD`
)
REFERENCES `USER_TB` (
	`USER_CD`
);

ALTER TABLE `EXERCISE_TB` ADD CONSTRAINT `FK_EX_TYPE_TB_TO_EXERCISE_TB_1` FOREIGN KEY (
	`TYPE_CD`
)
REFERENCES `EX_TYPE_TB` (
	`TYPE_CD`
);

ALTER TABLE `BATTLE_BETTING_TB` ADD CONSTRAINT `FK_BATTLE_TB_TO_BATTLE_BETTING_TB_1` FOREIGN KEY (
	`BATTLE_CD`
)
REFERENCES `BATTLE_TB` (
	`BATTLE_CD`
);


#===============================================================	