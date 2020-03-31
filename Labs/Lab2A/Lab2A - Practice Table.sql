SELECT * FROM Practice WHERE Part='BOLT'; -- Brings only rows with BOLT as Part
--There were three rows

/**SELECT * FROM Practice; -- * Means all columns
--the above line brings the whole table - all rows.
-- since there is no WHERE to filter for rows. **/

-- Query 1 :
SELECT * FROM Practice WHERE Material='STEEL'; -- brings only part column, all rows.
-- Four rows

--Query 2 :
SELECT * FROM Practice WHERE Material='BRASS';

SELECT * FROM Practice WHERE Material= 'SCREW';
--It has two conditions, either of it can be matched
--Six rows 

SELECT * FROM Practice WHERE Part='BOLD' OR Part='NUT';

SELECT * FROM Practice WHERE Part='SCREW' OR Part='WASHER';

-- Query 3
SELECT COUNT(*) FROM Practice WHERE Material ='ALUMINIUM';
--There are four parts from Aluminium
SELECT COUNT(*) FROM Practice WHERE Material ='STEEL';
--There are also four parts from Steel

-- Query 4:
SELECT Part, Material -- will list all parts not made from aluminiun
FROM Practice 
WHERE Material !=('ALUMINIUM');

-- Query 5:
SELECT Part, Material
FROM Practice
WHERE Material !=('BRASS');