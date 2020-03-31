DROP TABLE IF EXISTS Country_T;
CREATE TABLE Country_T( 
	CountryCode	        CHAR( 3 ) NOT NULL,
	CountryName 		CHAR( 35 ) UNIQUE,
        Capital			CHAR( 30 ) ,
	CONSTRAINT CountryCode_PK PRIMARY KEY( CountryCode ) );

-- Observe domain constraints
ALTER TABLE Country_T ADD Life_Expectancy NUMERIC(5,2) CONSTRAINT LE_CK CHECK (Life_Expectancy >=25);
-- observe how you can drop named constraints easily
-- remember constraint names should be unique
ALTER TABLE Country_T DROP CONSTRAINT LE_CK;
-- you dont delete columns, you drop them - you do this in DDL since it is structural change

ALTER TABLE Country_T DROP Capital;
ALTER TABLE Country_T DROP CountryName;
ALTER TABLE Country_T DROP Life_Expectancy;

-- note: you can delete rows (not drop), in DML with or without Where condition