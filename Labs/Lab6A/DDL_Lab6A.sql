/*@author: Andressa Machado - 040923007
 * Section 302
 * Professor: Kumari Gurusamy.  
 * This SQL file contains all the DDL statements for the Lab6A
 * Lab6A for CST8215 - Database.
 * last updated 28.feb.2018
*/

DROP TABLE  IF EXISTS city;

DROP TABLE IF EXISTS country;

--creating country table
CREATE TABLE country ( 
	country_code CHAR(3) PRIMARY KEY,
	country VARCHAR(14), 
	country_population NUMERIC
	);


SELECT * FROM country;

--creating city table
CREATE TABLE city (
	city_ID VARCHAR(4) NOT NULL PRIMARY KEY, 
	city VARCHAR(10), city_population NUMERIC, 
	country_code CHAR(3),
	FOREIGN KEY (country_code) REFERENCES country(country_code)
	);

SELECT * FROM city;