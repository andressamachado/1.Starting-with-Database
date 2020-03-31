SELECT * FROM Park_t;
SELECT * FROM Park_T WHERE ParkName LIKE 'Bruce%';
--Got abbreviations ON
--need to find what is the name related to abbreviation ON
SELECT * FROM Province_t;
SELECT province FROM Province_t WHERE abbreviation LIKE 'ON';
--Combining the 2 queries you can find the answer for 
--what is the name of the province in which bruce peninsula park is present
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


--joins to replace subqueries: To list all Park Names and Province Names together, it is good to join the two tables based on common column.
SELECT 
	park_t.parkname, 
	province_t.province
FROM 
	park_t JOIN province_t 
ON 
	park_t.Abbreviation = province_t.Abbreviation;



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

--To filter out rows that donot have matching values.
SELECT 
	*
FROM
	park_t RIGHT OUTER JOIN Province_t
ON
	Park_t.abbreviation = Province_T.abbreviation
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

--UNION: 
SELECT 
	vegetation_t.vegname,
	park_t.parkname
FROM 
	vegetation_t JOIN parkvegetation_t 
	ON 
   	vegetation_t.vegid = parkvegetation_t.vegid
  	 JOIN park_t
  	 ON
  	 park_t.parkid = parkvegetation_t.parkid
WHERE 
	parkname LIKE 'Bruce Peninsula';
	

SELECT 
	vegetation_t.vegname,
	park_t.parkname
FROM 
	vegetation_t JOIN parkvegetation_t 
	ON 
   	vegetation_t.vegid = parkvegetation_t.vegid
   	JOIN park_t
   	ON
  	park_t.parkid = parkvegetation_t.parkid
WHERE 
	parkname LIKE 'Forillon';

--All parks except those in Ontario: EXCEPT
Select 
	parkid, parkname from park_t
EXCEPT
	Select parkid, parkname from park_t join province_t on park_t.abbreviation = province_t.abbreviation
	Where province LIKE 'Onta%';

--INTERSECT 
Select 
	parkid, parkname 
from 	
	park_t
INTERSECT
Select 
	parkid, parkname from park_t join province_t on park_t.abbreviation = province_t.abbreviation
Where 
	province 
LIKE 
	'Onta%';

