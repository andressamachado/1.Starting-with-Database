SELECT * FROM country;
SELECT count(*) FROM country;

--Q1
SELECT 
	name, 
	surfacearea, 
	lifeexpectancy 
FROM 
	country;

--Q2
SELECT 
	code,
	name, 
	continent  
FROM 
	country;

--Q3
SELECT id, name FROM city ORDER BY name;  -- ORDER BY doesnt disturb the data.
SELECT id, name FROM city ORDER BY city;

SELECT code, name FROM country WHERE name LIKE 'G%';
SELECT code, name FROM country WHERE name LIKE '%g';

--Q4
SELECT max(population) FROM city;
SELECT name, population FROM city WHERE population = 10500000;

--DON'T DO THIS WAY
--Select name, max(population) FROM city; 

--Sub Query:
SELECT 
	name, 
	population 
FROM 
	city 
WHERE 
	population = (SELECT 
				max(population) 
			FROM 
				city);

-- Finding Joao Pessoa :) 
SELECT name FROM city WHERE name LIKE '%ssoa';

--Insert into table_t
INSERT INTO city(ID, name, countrycode, district, population)
	VALUES(4084, 'Victoria', 'CAN', 'British Colombia', 80032); 
