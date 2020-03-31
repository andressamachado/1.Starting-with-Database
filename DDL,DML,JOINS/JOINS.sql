SELECT * FROM Park_t;
SELECT * FROM Park_T WHERE ParkName LIKE 'Bruce%';
--Got abbreviations ON
--need to find what is the name related to abbreviation ON
SELECT * FROM Province_t;
SELECT province FROM Province_t WHERE abbreviation LIKE 'ON';
--Combining the 2 queries you can find the answer for 
--what is the nae of the province in which bruce peninsula park is present
SELECT
	province 
FROM 
	Province_t 
WHERE 
	abbreviation LIKE 
		(SELECT 
			abbreviation
		FROM 
			Park_T 
		WHERE 
			ParkName LIKE 'Bruce%');

SELECT 
	province 
FROM
	park_t JOIN Province_t
	ON
	Park_t.abbreviation = Province_T.abbreviation
WHERE 
			ParkName LIKE 'Bruce%';



--INNER = intersecao 
SELECT 
	*
FROM
	park_t INNER JOIN Province_t
	ON
	Park_t.abbreviation = Province_T.abbreviation;

--RIGHT OUTER = all from province even the ones who belongs to park_t
SELECT 
	*
FROM
	park_t RIGHT OUTER JOIN Province_t
ON
	Park_t.abbreviation = Province_T.abbreviation;
WHERE 
	Park_t.abbreviation IS NULL;


--equivalent to JOIN
SELECT 
	*
FROM
	Park_t, Province_t
	WHERE
	Park_t.abbreviation = Province_t.abbreviation;

SELECT * FROM Province_t;