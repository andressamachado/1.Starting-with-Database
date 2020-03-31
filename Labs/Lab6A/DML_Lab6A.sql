/*@author: Andressa Machado - 040923007
 * Section 302
 * Professor: Kumari Gurusamy.  
 * This SQL file contains all the DML statements for the Lab6A
 * Lab6A for CST8215 - Database.
 * last updated 28.feb.2018
*/

--Deleting specific row from the country_table
DELETE FROM country
WHERE country = 'Canada';


--Deleting specific row from the city_table
DELETE FROM city
WHERE city = 'Calgary';


--inserting values for the country table
INSERT INTO country (country_code, country, country_population) 
VALUES  
	( 'CAN', 'Canada', 35540419 ), 
	('GBR', 'United Kingdom', 63181775);

SELECT * FROM country;


--inserting values for the city table
INSERT INTO city (city_ID, city, city_population, country_code) 
VALUES  
	( '1814', 'Winnipeg', 618477, 'CAN'),
	( '1820', 'London', 339917, 'CAN'),
	( '1811', 'Calgary', 767082, 'CAN'),
	( '456', 'London', 7285000, 'GBR'),
	( '462', 'Manchester', 430000, 'GBR'),
	( '464', 'Bristol', 402000, 'GBR');

SELECT * FROM city;