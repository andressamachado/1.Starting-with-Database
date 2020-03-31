/*
Authors: Andressa Machado 
Assignment#1 for CST8215 - Database
SQL QUERIES FOR THE ASSIGN#1.
It include every query that we used to insert values into the tables.  

The database that we used was:
Indicator : 6.4.2 - Level of water stress: freshwater withdrawal as a proportion of available freshwater resources

*/

--Inserting values to the indicator table:
INSERT INTO indicator
VALUES (
	'C060402', 
	'6', 
	'6.4', 
	'6.4.2',  
	'Level of water stress: freshwater withdrawal as a proportion of available freshwater resources'
	);

SELECT * FROM indicator;


--Inserting values to the series table: 
INSERT INTO series
VALUES (
	'ER_H2O_STRESS',
	'SD',
	'Level of water stress: freshwater withdrawal as a proportion of available freshwater resources'
	);
	

SELECT * FROM series;