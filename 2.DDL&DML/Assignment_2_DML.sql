 /0**
 * @author: Andressa Machado - 040923007 
 * CST8215 - DATABASE
 * Section: 302
 * Professor: Kumari Gurusamy.
 * Assignment #2 - PART II - Simple and Advanced SQL Select queries.
 * This file contains all the required queries for the Assignment#2.
 *last updated March 28th, 2018.
 */

--PART II - Simple and Advanced SQL Select queries:

--Write four simple Select Queries with WHERE condition filters on single tables, using >, =, 
--BETWEEN, IN, LIKE etc. Practice ORDER BY, DISTINCT, Aliases, LIMIT while writing these.

--Querie 1: ORDER BY
SELECT
    v2014 AS values2014
FROM
    sdg111 AS sdg
 WHERE 
	v2014 > 3
ORDER BY 
	v2014; 

--Querie 2: BETWEEN
SELECT 
	v2014 AS values2014
FROM 
	sdg111 AS sdg
WHERE 
	v2014 
BETWEEN 
	3 AND 5
ORDER BY 
	v2014;

--Querie 3: DISTINCT
SELECT 
	COUNT (DISTINCT countrycode) AS different_countries
FROM 
	sdg111
WHERE 
	v2014 = 0;

SELECT 
	DISTINCT countrycode AS different_countries
FROM 
	sdg111
WHERE 
	v2014 = 0
ORDER BY 
	different_countries;

--Querie 4: LIMIT
SELECT 
	country_name AS countries
FROM 
	country
WHERE 
	country_name 
LIKE 
	'%a'
ORDER BY
	country_name  DESC
LIMIT 10;


--Write a join to create a meaningful user display of a few columns from 2 or more different tables. 
--Comment above the code about the purpose of the join.

--This LEFT JOIN query shows us all the places that is not included in the parent_country table, but still have values
-- for them in the v2014. 
SELECT 
	country_name, sdg.v2014 
FROM 
	country AS co
LEFT JOIN
	sdg111 AS sdg
ON
	co.country_code = sdg.countrycode 
WHERE co.parent_country IS NULL;

SELECT * FROM country;

--Write a union with the same set of columns to create a meaningful UNION.

--This UNION query shows us that we just have one series code, It means that in this schema we just have one field of research. 
SELECT 
	series_code
FROM 
	series
UNION
SELECT 
	seriescode
FROM 
	sdg111; 


--Write a sub query to find a country name with a maximum or minimum value. Comment about the code about the purpose of the subquery.

--This Select query shows us the names of the countrys with the maximun value and the minimun values
SELECT 
	country_name, sdg.v2014 
FROM 
	country AS co
LEFT JOIN
	sdg111 AS sdg
ON
	co.country_code = sdg.countrycode
WHERE 
	v2014 = (SELECT MAX (v2014) FROM sdg111)
OR
	v2014 = (SELECT MIN (v2014) FROM sdg111)
ORDER BY 
	v2014;

-- This Select querie shows us the name of the country with the maximun value
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


--Write a group by with having (gender or age or LDC) to have a meaningful query 

--This querie shows us what are the values for Landlocked Developing Countries and Least Developed Countries. 
SELECT 
	country_name, sdg.v2014 
FROM 
	country AS co
LEFT JOIN
	sdg111 AS sdg
ON
	co.country_code = sdg.countrycode
GROUP BY 
	country_name, sdg.v2014
HAVING 
	country_name LIKE '%countries';

