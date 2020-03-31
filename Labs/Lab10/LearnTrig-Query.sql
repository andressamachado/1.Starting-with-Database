-- Filename: LearnTrig-Query.sql

-- Query statements to test trigger in LearnTrigger lab

SELECT * FROM employee;
SELECT * FROM employee_audit;


-- no change becuase First_Name is changed not last name
UPDATE Employee SET First_Name = 'Biun' WHERE First_Name = 'Buin';

-- no change becuase Last_Name 'Biun' does not exist
UPDATE Employee SET Last_Name = 'Biun' WHERE Last_Name = 'Buin';

-- no change because Last_Name 'Zugud' does not exist
UPDATE Employee SET Last_Name = 'Zugud' WHERE Last_Name = 'Zugod';

-- update successful
UPDATE Employee SET Last_Name = 'Zugod' WHERE Last_Name = 'Zogud';


UPDATE Employee SET Last_Name = 'machado' WHERE Last_Name = 'Machado';

-- eof: LearnTrig-Query.sql