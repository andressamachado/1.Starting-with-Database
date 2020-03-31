
--displaying all the table"
SELECT * FROM wildlife_t; 
SELECT * FROM vegetation_t;
SELECT * FROM province_t;
SELECT * FROM parkwildlife_t;
SELECT * FROM parkvegetation_t;

-- UNION
SELECT Province, ParkName
FROM 
	province_t INNER JOIN park_t
	ON
	Province_t.abbreviation = Park_t.abbreviation
WHERE
	Province_t.abbreviation LIKE 'ON'

    UNION

SELECT province, ParkName
FROM 
	province_t INNER JOIN park_t
	ON
	Province_t.abbreviation = park_t.abbreviation
WHERE
	province_t.abbreviation LIKE 'QC'; 

--turn the join into a subquerie: 

SELECT ParkName
FROM 
	park_t
WHERE
	Park_t.abbreviation LIKE (SELECT abbreviation from province_t where abbreviation like 'ON'); 

--benefit of outer join is to see where the match isnt happening
--it gives province names where no parks have been entered yet
SELECT province, ParkName
FROM 
	province_t LEFT OUTER JOIN park_t
	ON
	Province_t.abbreviation = park_t.abbreviation
	WHERE
	Park_t.abbreviation IS NULL;

--Q4 
SELECT 
	count (*), parkname
	...
GROUP BY
		PARKNAME
HAVING 
		COUNT (*) 2 >;  