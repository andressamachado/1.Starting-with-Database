/*EDITED BY: Andressa Machado 
DATE: Mar 7 2018
REFERENCE : Meeting Minutes - Marc 6 */


--INNER JOIN
--test
SELECT
	Country.Code,
	Country.Name,
	City.Name
FROM
	Country,
	City
WHERE
	Country.Code = City.CountryCode;
	
-- we need to write the table name before the column name in this case.
--Solution for exercise 1:
SELECT
	Country.Code,
	Country.Name,
	City.Name
FROM
	Country
INNER JOIN
	City
ON
	Country.Code = City.CountryCode;


--LEFT JOIN
--Solution for exercise 2:
SELECT
	Country.Code,
	Country.Name,
	City.Name
FROM
	Country
LEFT JOIN
	City
ON
	Country.Code = City.CountryCode;



--RIGHT JOIN
--test:
SELECT
Country.Code,
Country.Name
FROM
Country
WHERE
Country.Code NOT IN( SELECT CountryCode FROM CountryLanguage );

--Solution for exercise 3:
--How many rows have language listed for countries
SELECT count(*) FROM CountryLanguage;
--984

--How many countries are there:
SELECT count(*) FROM Country;
--239
--Looks like one country could have many language
--check with inner join before trying outer join
--verify number of rows - equal or lesser than bigger table

SELECT 
	count(*)
FROM 
	countrylanguage INNER JOIN country
ON 
	countrylanguage.countrycode = country.code;

--Observe the number of rowns for outer join
SELECT 
	count(*)
FROM 
	countrylanguage RIGHT OUTER JOIN country
ON 
	countrylanguage.countrycode=country.code;
--count is 990 (more than 984 of inner join)
--look like six extra rows.
--right side is country - we got all countries
--implies six countres dont have language 
--counter check the logic of placing country on left side.


SELECT 
	count(*)
FROM 
	country RIGHT OUTER JOIN countrylanguage
ON 
	countrylanguage.countrycode=country.code;
--You see all countrylanguage have countries in them


--to present better choose columns, give alias names for columns
SELECT 
	Country.Code AS "Country Code",
	Country.Name AS "Country"
FROM
	countrylanguage RIGHT OUTER JOIN country
ON
	countrylanguage.countrycode = country.code
WHERE
	countrylanguage.countrycode IS NULL;

