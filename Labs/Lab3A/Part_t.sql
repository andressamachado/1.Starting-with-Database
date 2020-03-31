
--QUERY 1
SELECT * FROM part_t;

SELECT Part, Material, Size, Cost FROM part_t;

--practice 1c:
SELECT Part, Material, Cost FROM part_t;

--QUERY 2
SELECT Part, Material, Cost FROM part_t WHERE Cost<1.00; 

--practice 2b:
SELECT Part, Size, Cost FROM part_t WHERE Cost>=2.10;

--QUERY 3
SELECT AVG(Cost) FROM part_t WHERE Material='BRASS';

--practice 3b:
SELECT AVG(Cost) FROM part_t WHERE Part='SCREW';

--QUERY 4
SELECT SUBSTRING(Part FROM 1 FOR 3) FROM part_t;

--practice 4b:
SELECT SUBSTRING(Material FROM 1 FOR 5) FROM part_t;

--QUERY 5
INSERT INTO part_t(Part, Material, Size, Cost) VALUES('NAIL', 'STEEL', 'SMALL',0.15);
SELECT * FROM part_t WHERE Part='NAIL';

--practice 5b:
INSERT INTO part_t(Part, Material, Size, Cost) VALUES('HAMMER', 'STEEL', 'SMALL', 7.15);
SELECT * FROM part_t WHERE Part='HAMMER';


--QUIZ TEST
SELECT * 

FROM Part_T

WHERE Cost = ( SELECT MIN( Cost ) FROM Part_T );

--
SELECT * 

FROM Part_T

WHERE Cost = ( SELECT MAX( Cost ) FROM Part_T );

--
SELECT AVG( Cost )

FROM Part_T

WHERE Part = 'BOLT';