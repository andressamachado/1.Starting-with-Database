/**
 * @author: Andressa Machado - 040923007 
 * CST8215 - DATABASE
 * Section: 302
 * Professor: Kumari Gurusamy.
 * Practical Exam
 * last updated 11-April-2018.
 */


--Question1: How many airlines start with the word 'Air' in their name?
--487

SELECT COUNT(airlines.name) FROM airlines WHERE name ILIKE 'Air%';

--Question2:How many airports have an iata that start with 'Y'?
--346

SELECT COUNT(airports.iata) FROM airports WHERE iata ILIKE 'Y%';

--Question3: What is the callsign for the airline called "Air Aurora"?
--BOREALIS

SELECT callsign FROM airlines WHERE name ILIKE 'Air Aurora';

--Question4: What is the iata for "Pease International Tradeport" airport?
--PSM

SELECT iata FROM airports WHERE name ILIKE 'Pease International Tradeport';

--Question5: What is the code for the Boeing 737-900?
--739

SELECT * FROM aircrafts;
SELECT * FROM airlines;

SELECT * FROM aircrafts WHERE name ILIKE 'Boeing%' AND description ILIKE '737-900'

--Question6: How many routes are serviced by the aircraft that have a description of "767-400"?
--153

SELECT * FROM route_aircrafts;
SELECT * FROM aircrafts;

SELECT 
	COUNT(route_aircrafts.id) 
FROM 
	route_aircrafts JOIN aircrafts 
	ON 
	route_aircrafts.aircraft_id = aircrafts.id
WHERE 
	aircrafts.description = '767-400'

--Question7: What airline (name of the airline based off of the airline_id) operates the route with an id of 120?
--Helvetic Airways

SELECT * FROM airlines;
SELECT * FROM route_aircrafts;
SELECT * FROM routes;

SELECT 
	airlines.name, airlines.id 
FROM 
	airlines JOIN routes 
	ON
	airlines.id = routes.airline_id
WHERE 
	routes.id = '120';

--Question8: How many airports are in Vietnam, Cambodia and Laos?  Provide the combined total from all 3 countries.
--54

SELECT * FROM airports;
SELECT * FROM countries;

SELECT 
	COUNT(airports.id)
FROM
	airports JOIN countries
	ON 
	airports.country_id = countries.id
WHERE 
	
	countries.name IN ('Vietnam', 'Cambodia', 'Laos');

--Question9: What is the aircraft code for the aircraft that operates route id 548?
--320

SELECT * FROM aircrafts;
SELECT * FROM route_aircrafts;

SELECT 
	aircrafts.name, aircrafts.code, aircrafts.description
FROM
	aircrafts JOIN route_aircrafts
	ON
	aircrafts.id = route_aircrafts.aircraft_id
WHERE 
	route_id = 548;

/*Question10: How many airports in a timezone name containing 'America' are used as a source airport (source_airport_id) 
for a route that has aircraft that have a wake of 'H' or 'L'? */
--2

SELECT * FROM aircrafts;
SELECT * FROM airports;
SELECT * FROM routes;

SELECT 
	airports.name,COUNT(airports.timezone_name) 
FROM 
	airports 
WHERE 
	airports.name ILIKE '%america%'
GROUP BY 
	airports.name

SELECT 
	airports.id, COUNT(airports.timezone_name) 
FROM 
	airports 
WHERE 
	airports.name ILIKE '%america%'
GROUP BY 
	airports.id
--There are 3 differents airports: Americana, Las Americas Intl, Scott Afb Midamerica (1762, 3790, 9149)

SELECT 
	routes.source_airport_id 
FROM 
	routes 
WHERE 
	source_airport_id IN ('1762', '3790', '9149') 
GROUP BY 
	routes.source_airport_id 
ORDER BY 
	routes.source_airport_id 

