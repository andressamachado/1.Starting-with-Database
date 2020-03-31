-- Student: Andressa Machado - 040923007 
-- CST 8215 302- Database
-- Lab 8 
-- march 14th 2018
          

SELECT COUNT(*) FROM city WHERE countrycode = 'BRA';

SELECT COUNT(*) FROM city WHERE countrycode = 'CHN';

SELECT COUNT(*) FROM city WHERE countrycode = 'JPN';

SELECT COUNT(*) FROM city WHERE countrycode = 'IND';

SELECT COUNT(*) FROM city WHERE countrycode = 'USA';

SELECT * FROM city;

-- List the countries that have more than 200 cities in the database, use GROUP BY and HAVING

SELECT
    CountryCode, Count(City.name)
FROM
    City
GROUP BY
    CountryCode
HAVING
    Count(City.name) > 200;


--Modify the statement to replace the country code with country name. Your result should be similar
--to the list below. (Hint: Use Join in addition to Group by and Having)

SELECT 
	co.name, COUNT(ci.name)	
FROM 
	city AS ci
JOIN 
	country AS co
ON 
	ci.countrycode = co.code 
GROUP BY 
	co.name
HAVING 
	COUNT (ci.name) > 200;

	




 