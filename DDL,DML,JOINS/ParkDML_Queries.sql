--- The simple select queries that you have learnt so far

-- SELECT Everything from the table - all rows, all columns
SELECT * FROM Province_T;
--SELECT All rows from the table but only two columns that are specified
SELECT Abbreviation, Capital FROM Province_T;
--SELECT only those rows that meet the condition given (WHERE)
SELECT Abbreviation, Capital FROM Province_T WHERE province = 'Ontario';
-- AVOIDING DUPLICATES in display
SELECT VegID FROM ParkVegetation_T;
--USE DISTINCT
SELECT DISTINCT VegID FROM ParkVegetation_T;
-- ORDERING/SORTING the values
SELECT Abbreviation, Capital FROM Province_T ORDER BY Capital DESC;
-- PATTERN MATCHING for varchar - character varying datatypes
SELECT Abbreviation, Capital FROM Province_T WHERE province LIKE 'O%';
-- with numbers WHERE numbervar < 10


--- A sample of join query that you are learning today.
--JOIN two tables using primary key and foriegn key
SELECT 
	VegName, ParkName 
FROM 
	Park_T JOIN ParkVegetation_T 
	ON Park_T.ParkID = ParkVegetation_T.ParkID
	JOIN Vegetation_T
	ON ParkVegetation_T.VegID = Vegetation_T.VegID;