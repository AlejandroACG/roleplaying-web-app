CREATE TABLE PLAYERS (
PLAYER_ID VARCHAR2(20) CONSTRAINT PK_ID_USER PRIMARY KEY,
FIRST_NAME VARCHAR2(50)NOT NULL,
LAST_NAME VARCHAR2(50)NOT NULL,
NICKNAME VARCHAR2(50) UNIQUE,
EMAIL VARCHAR2(100)NOT NULL,
REGIST_DATE DATE NOT NULL
);

CREATE SEQUENCE PLAYERS_SEQUENCE;
CREATE OR REPLACE TRIGGER PLAYERS_ON_INSERT
  BEFORE INSERT ON PLAYERS
  FOR EACH ROW
BEGIN
  SELECT PLAYERS_SEQUENCE.NEXTVAL
  INTO :NEW.PLAYER_ID
  FROM DUAL;
END;
/
CREATE TABLE CHARACTERS (
CHARACTER_ID VARCHAR2(20) CONSTRAINT PK_ID_CHARACTER PRIMARY KEY,
PLAYER_ID VARCHAR2(20) CONSTRAINT FK_ID_USER REFERENCES PLAYERS (PLAYER_ID)ON DELETE CASCADE,
FIRST_NAME VARCHAR2(50)NOT NULL,
RACE VARCHAR2(50)NOT NULL,
ALIGNMENT VARCHAR2(50) NOT NULL,
CHARACTER_CLASS VARCHAR2(50) NOT NULL,
LORE VARCHAR2(4000)
);

CREATE SEQUENCE CHARACTERS_SEQUENCE;
CREATE OR REPLACE TRIGGER CHARACTERS_ON_INSERT
  BEFORE INSERT ON CHARACTERS
  FOR EACH ROW
BEGIN
  SELECT CHARACTERS_SEQUENCE.NEXTVAL
  INTO :NEW.CHARACTER_ID
  FROM DUAL;
END;
/
--INITIAL PARAMETERIZATION

BEGIN
    INSERT INTO PLAYERS(PLAYER_ID, FIRST_NAME, LAST_NAME, NICKNAME, EMAIL, REGIST_DATE) VALUES (NULL,'Antonio','Rodriguez','Uroboros','antRod@gmail.com','01-04-2020');
    INSERT INTO PLAYERS(PLAYER_ID, FIRST_NAME, LAST_NAME, NICKNAME, EMAIL, REGIST_DATE) VALUES (NULL,'Marta','Gonzalez','Liliana','magon@gmail.com','25-07-2019');
    INSERT INTO PLAYERS(PLAYER_ID, FIRST_NAME, LAST_NAME, NICKNAME, EMAIL, REGIST_DATE) VALUES (NULL,'Carlos','Martinez','Illidan','cartinez@gmail.com','12-09-2022');
    INSERT INTO PLAYERS(PLAYER_ID, FIRST_NAME, LAST_NAME, NICKNAME, EMAIL, REGIST_DATE) VALUES (NULL,'Rocio','Calvo','Lilibeth','rovio@gmail.com','07-01-2023');
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('ERROR: ' || SQLCODE || ' : ' || SQLERRM);
    DBMS_OUTPUT.PUT_LINE('DATA PARAMETERIZATION FAILED');
    ROLLBACK;
END;
/    
    
    
BEGIN
    INSERT INTO CHARACTERS(CHARACTER_ID, PLAYER_ID, FIRST_NAME, RACE, ALIGNMENT, CHARACTER_CLASS, LORE) VALUES (NULL,'1','Eldric','Wood Elf','Neutral Good', 'Druid','Eldric was born in a small wood elf settlement known as Ailanthar, nestled within a lush and ancient forest called Sylvaril. From a young age, Eldric displayed a strong connection to nature and a deep interest in its secrets. He learned to listen to the whispers of the trees and interpret the language of animals, becoming a druid devoted to protecting and preserving the natural balance.');
    INSERT INTO CHARACTERS(CHARACTER_ID, PLAYER_ID, FIRST_NAME, RACE, ALIGNMENT, CHARACTER_CLASS, LORE) VALUES (NULL,'1',' Caelum','Human','Chaotic Neutral','Rogue', 'Caelum Blackstone grew up on the streets of a bustling city, known as Ironhaven. Born into a family of thieves, Caelum quickly learned that the key to survival was wit, agility, and a little bit of luck. As a child, he spent his days picking pockets and running scams with other street kids, honing his skills in deception and sleight of hand.');
    INSERT INTO CHARACTERS(CHARACTER_ID, PLAYER_ID, FIRST_NAME, RACE, ALIGNMENT, CHARACTER_CLASS, LORE) VALUES (NULL,'1','Thore','Dwarf','Lawful Good','Paladin','Thoren Ironshield was born and raised in the sturdy dwarven fortress of Stonehold, carved deep within the heart of the Ironspine Mountains. From a young age, Thoren was drawn to the principles of honor, justice, and duty, and he dedicated himself to the service of his people and the defense of his homeland.');
    INSERT INTO CHARACTERS(CHARACTER_ID, PLAYER_ID, FIRST_NAME, RACE, ALIGNMENT, CHARACTER_CLASS, LORE) VALUES (NULL,'2','Lila','Half-Elf','Chaotic Good','Bard','Lila Moonshadow was born in the vibrant and cosmopolitan city of Freehaven, where the blending of cultures and traditions made for a rich tapestry of life. Her elven father was a skilled musician, and her human mother was an accomplished painter, instilling in Lila a deep appreciation for the arts from a very young age.');
    INSERT INTO CHARACTERS(CHARACTER_ID, PLAYER_ID, FIRST_NAME, RACE, ALIGNMENT, CHARACTER_CLASS, LORE) VALUES (NULL,'2','Magnus','Dragonborn','Lawful Neutral','Cleric','Magnus Emberheart hails from the proud dragonborn city of Drakonspire, a bastion of honor and tradition built upon the slopes of an ancient volcano. Born into a family of devout worshipers of the dragon god Bahamut, Magnus was raised with a deep respect for the virtues of law, order, and self-discipline.');
    INSERT INTO CHARACTERS(CHARACTER_ID, PLAYER_ID, FIRST_NAME, RACE, ALIGNMENT, CHARACTER_CLASS, LORE) VALUES (NULL,'3','Seraphina','Tiefling',' True Neutral','Sorcerer','Seraphina Stormrider was born in the remote village of Darkstone, nestled in the shadow of the ominous Ashen Peaks. As a tiefling, Seraphinas fiendish heritage set her apart from the rest of the villagers and made her the subject of suspicion and mistrust. Despite this, she found solace in her innate connection to the elemental forces that surrounded her, particularly the fierce storms that frequently battered the peaks.');
    INSERT INTO CHARACTERS(CHARACTER_ID, PLAYER_ID, FIRST_NAME, RACE, ALIGNMENT, CHARACTER_CLASS, LORE) VALUES (NULL,'4','Talon','Halfling','Neutral Good','Ranger','Talon Swiftfoot was born in the peaceful halfling village of Willowbrook, nestled in the heart of the Whispering Woods. Surrounded by nature and the woodland creatures that called the forest home, Talon quickly developed a keen affinity for the wilderness and its inhabitants.');
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('ERROR: ' || SQLCODE || ' : ' || SQLERRM);
    DBMS_OUTPUT.PUT_LINE('DATA PARAMETERIZATION FAILED');
END;

--CONTINGENCY METHODS:

BEGIN
	DELETE FROM PLAYERS WHERE PLAYER_ID='1';
	DELETE FROM PLAYERS WHERE PLAYER_ID='2';
	DELETE FROM PLAYERS WHERE PLAYER_ID='3';
    DELETE FROM PLAYERS WHERE PLAYER_ID='4';
	COMMIT;
EXCEPTION 
	WHEN OTHERS THEN
	DBMS_OUTPUT.PUT_LINE('ERROR: ' || SQLCODE || ' : ' || SQLERRM);
	DBMS_OUTPUT.PUT_LINE('TABLE RECORDS WILL NOT BE DELETED');
     	ROLLBACK;
END;
/


BEGIN
	DELETE FROM CHARACTERS WHERE CHARACTER_ID='1';
	DELETE FROM CHARACTERS WHERE CHARACTER_ID='2';
	DELETE FROM CHARACTERS WHERE CHARACTER_ID='3';
    DELETE FROM CHARACTERS WHERE CHARACTER_ID='4';
    DELETE FROM CHARACTERS WHERE CHARACTER_ID='5';
    DELETE FROM CHARACTERS WHERE CHARACTER_ID='6';
    DELETE FROM CHARACTERS WHERE CHARACTER_ID='7';
	COMMIT;
EXCEPTION 
	WHEN OTHERS THEN
	DBMS_OUTPUT.PUT_LINE('ERROR: ' || SQLCODE || ' : ' || SQLERRM);
	DBMS_OUTPUT.PUT_LINE('TABLE RECORDS WILL NOT BE DELETED');
     	ROLLBACK;
END;
/
DROP TRIGGER CHARACTERS_ON_INSERT;
DROP SEQUENCE CHARACTERS_SEQUENCE;
DROP TRIGGER PLAYERS_ON_INSERT;
DROP SEQUENCE PLAYERS_SEQUENCE;
DROP TABLE CHARACTERS;
DROP TABLE PLAYERS;



SELECT * FROM PLAYERS;
SELECT * FROM CHARACTERS;