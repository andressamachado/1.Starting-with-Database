/**
 * @author: Andressa Machado - 040923007 
 * CST8215 - DATABASE
 * Section: 302
 * Professor: Kumari Gurusamy.
 * Assignment #2 - PART III - Efficient Physical Design Process.
 * This file contains the DDL queries for the Assignment#2
 *last updated March 28th, 2018.
 */

-- Creating tables
-- My data doesn't have neither the Age information nor the Sex information, but I included them anyway to complete. 

-- Creating table sdg111:
DROP TABLE IF EXISTS SDG111;

CREATE TABLE SDG111(
	IndicatorID VARCHAR(8),
	SeriesCode VARCHAR(15),
	CountryCode VARCHAR(15),
	Age VARCHAR(1), 
	Sex VARCHAR(1), 
	V2014 NUMERIC(8,2)
);



-- After import data from Excel:
SELECT * FROM SDG111;	

-- Creating table country:
DROP TABLE IF EXISTS country;

CREATE TABLE country(
	Country_Code VARCHAR(11),
	Country_Name VARCHAR(52),
	Parent_Country VARCHAR(11)
);


-- After import data from Excel:
SELECT * FROM country;

-- Adding primary keys and foreign keys to the tables 

ALTER TABLE SDG111 ADD CONSTRAINT SDG111_PK 
	PRIMARY KEY(IndicatorID, SeriesCode, CountryCode);
	
ALTER TABLE SDG111 ADD CONSTRAINT SDG111_FK_Ind 
	FOREIGN KEY(IndicatorID) REFERENCES Indicator(Indicator_ID);

ALTER TABLE country ADD CONSTRAINT country_pk
	PRIMARY KEY (country_code);
	
ALTER TABLE SDG111 ADD CONSTRAINT SDG111_FK_Country 
	FOREIGN KEY(countrycode) REFERENCES country(country_code);
	
ALTER TABLE SDG111 ADD CONSTRAINT series_pk
	FOREIGN KEY(seriescode) REFERENCES Series(series_code);


--Create indexes for at least two columns of any two tables, columns that would be frequently
--used in WHERE filter OR in ORDER BY, GROUP BY in a SELECT. INDEX should be added to DDL file

DROP INDEX index_country_code;

CREATE INDEX index_country_code
ON sdg111 (countrycode);

DROP INDEX index_country_name;

CREATE INDEX index_country_name
ON country (country_name);

--creating Index with two columns
DROP INDEX index_code_v2014;

CREATE INDEX index_code_v2014
ON sdg111 (countrycode, v2014);

-- Write a view with the join or union or any where that was created in PART II in the DDL file.

CREATE VIEW values_for_2014 AS 
SELECT
	country_name, sdg.v2014 
FROM 
	country AS co
LEFT JOIN
	sdg111 AS sdg
ON
	co.country_code = sdg.countrycode
WHERE 
	v2014 = (SELECT MAX (v2014) FROM sdg111); 
	
DROP VIEW values_for_2014;
