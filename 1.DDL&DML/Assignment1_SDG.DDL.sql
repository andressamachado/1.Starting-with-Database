/*
Authors: Andressa Machado 
Assignment#1 for CST8215 - Database
SQL QUERIES FOR THE ASSIGN#1.
It include every query that we used to creat the tables. 

The database that we used was:
Indicator : 6.4.2 - Level of water stress: freshwater withdrawal as a proportion of available freshwater resources

*/

--Deleting table:
DROP TABLE Indicator; 
DROP TABLE Series; 
DROP TABLE Country;
DROP TABLE fresh_water_stress_value;  

-- Creating a table called "indicator":
CREATE TABLE indicator( 
	indicator_id CHAR(7) NOT NULL PRIMARY KEY, 
	goal VARCHAR(1), 
	target CHAR(3), 
	indicator_ref CHAR(5), 
	indicator_description VARCHAR(94)
	);

SELECT * FROM indicator;
SELECT CHAR_LENGTH('Level of water stress: freshwater withdrawal as a proportion of available freshwater resources');


--Creating a table called "country":
CREATE TABLE country ( 
	country_or_area_code CHAR(11) NOT NULL PRIMARY KEY, 
	country_or_area_name VARCHAR(52)NOT NULL 
	);

SELECT * FROM country;
SELECT CHAR_LENGTH('United Kingdom of Great Britain and Northern Ireland');

--Creating a table called "series":
CREATE TABLE series ( 
	series_code CHAR(13) NOT NULL PRIMARY KEY, 
	series_type VARCHAR(2), 
	series_description VARCHAR(94)
	);

SELECT * FROM series;
SELECT CHAR_LENGTH('ER_H2O_STRESS');
SELECT CHAR_LENGTH('Level of water stress: freshwater withdrawal as a proportion of available freshwater resources');

--Creating a table called "fresh_water_stress_value":
CREATE TABLE fresh_water_stress_value ( 
	values2014 NUMERIC(5,2) NOT NULL PRIMARY KEY,
	indicator_id CHAR(7) NOT NULL,
	series_code CHAR(13) NOT NULL,
	country_or_area_code CHAR(11) NOT NULL,
	FOREIGN KEY(indicator_id) REFERENCES indicator(indicator_id),
	FOREIGN KEY(series_code) REFERENCES series(series_code),
	FOREIGN KEY(country_or_area_code) REFERENCES country(country_or_area_code)
	);
SELECT * FROM fresh_water_stress_value;

