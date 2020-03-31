-- Student: Andressa Machado - 040923007 
-- CST 8215 302- Database
-- Lab 8 
-- march 14th 2018


DROP TABLE IF EXISTS Employee_SelfJoin;
CREATE TABLE Employee_SelfJoin(
    EmployeeID 	CHAR(  2 ) NOT NULL, 
    EmpName 	CHAR( 20 ),
    ManagerID 	CHAR(  2 ),
    CONSTRAINT EmployeeID_PK PRIMARY KEY( EmployeeID )
   ----CONSTRAINT ManagerID_FK FOREIGN KEY( ManagerID ) REFERENCES Employee_SelfJoin( EmployeeID )
);

SELECT * FROM Employee_SelfJoin;

--- adding constraint outside after table creation. 
ALTER TABLE Employee_SelfJoin ADD CONSTRAINT ManagerID_FK FOREIGN KEY( ManagerID ) REFERENCES Employee_SelfJoin(EmployeeID);

---eof: SelfJoinDDL.sql
--REMEMBER that foriegn key can be entered only after primary key has been entered in parent table
-- A manager has to be entered as an employee, before adding an employee with that person as manager.
--To avoid any ordering problem, we can break down the insert as 
-- insert only employee id and name, manager can be NULL
--then update with manager id, in any order, since all employees have already been entered!

--INSERT INTO Employee_SelfJoin( EmployeeID, EmpName, ManagerID )
--VALUES( 'g1', 'Guoh', 't1' );

INSERT INTO Employee_SelfJoin( EmployeeID, EmpName ) VALUES( 'g1', 'Guoh' );
INSERT INTO Employee_SelfJoin( EmployeeID, EmpName ) VALUES( 't1', 'Teef' );
INSERT INTO Employee_SelfJoin( EmployeeID, EmpName ) VALUES( 'h1', 'Heot' );
INSERT INTO Employee_SelfJoin( EmployeeID, EmpName ) VALUES( 'm1', 'Meit' );
INSERT INTO Employee_SelfJoin( EmployeeID, EmpName ) VALUES( 'h2', 'Hoij' );
INSERT INTO Employee_SelfJoin( EmployeeID, EmpName ) VALUES( 'm2', 'Mooq' );

UPDATE Employee_SelfJoin SET ManagerID='t1' WHERE EmployeeID='g1';
UPDATE Employee_SelfJoin SET ManagerID='m2' WHERE EmployeeID='t1';
UPDATE Employee_SelfJoin SET ManagerID='t1' WHERE EmployeeID='h1';
UPDATE Employee_SelfJoin SET ManagerID='g1' WHERE EmployeeID='m1';
UPDATE Employee_SelfJoin SET ManagerID='g1' WHERE EmployeeID='h2';


---By ensuring that manager records are entered first and then employee records
--the following order should work:
INSERT INTO Employee_SelfJoin( EmployeeID, EmpName, ManagerID ) VALUES( 'm2', 'Mooq', NULL );
INSERT INTO Employee_SelfJoin( EmployeeID, EmpName, ManagerID ) VALUES( 't1', 'Teef', 'm2' );
INSERT INTO Employee_SelfJoin( EmployeeID, EmpName, ManagerID ) VALUES( 'g1', 'Guoh', 't1' );
INSERT INTO Employee_SelfJoin( EmployeeID, EmpName, ManagerID ) VALUES( 'h1', 'Heot', 't1' );
INSERT INTO Employee_SelfJoin( EmployeeID, EmpName, ManagerID ) VALUES( 'm1', 'Meit', 'g1' );
INSERT INTO Employee_SelfJoin( EmployeeID, EmpName, ManagerID ) VALUES( 'h2', 'Hoij', 'g1' );

--- Rows that do not have employees defined as manager 
--- cannot be inserted. The following order does not work
---INSERT INTO Employee( EmployeeID, EmpName, ManagerID ) VALUES( 'g1', 'Guoh', 't1' );
---INSERT INTO Employee( EmployeeID, EmpName, ManagerID ) VALUES( 't1', 'Teef', 'm2' );
---INSERT INTO Employee( EmployeeID, EmpName, ManagerID ) VALUES( 'h1', 'Heot', 't1' );
---INSERT INTO Employee( EmployeeID, EmpName, ManagerID ) VALUES( 'm1', 'Meit', 'g1' );
---INSERT INTO Employee( EmployeeID, EmpName, ManagerID ) VALUES( 'h2', 'Hoij', 'g1' );
---INSERT INTO Employee( EmployeeID, EmpName, ManagerID ) VALUES( 'm2', 'Mooq', NULL );
--- eof: SelfJoinDML.sql

SELECT * FROM Employee_SelfJoin;

SELECT 
    e1.EmployeeID,
    e1.EmpName AS Employee,
    e2.EmpName AS Manager
FROM
    Employee_SelfJoin e1,
    Employee_SelfJoin e2
WHERE
    e2.EmployeeID = e1.ManagerID;
    
--- with proper meaningful alias names

SELECT 
    employee.EmployeeID,
    employee.EmpName AS Employee,
    manager.EmpName AS Manager
FROM
    Employee_SelfJoin employee,
    Employee_SelfJoin manager
WHERE
    manager.EmployeeID = employee.ManagerID; -- parent is manager copy

   --- SQL 92 standard code
SELECT 
    employee.EmployeeID,
    employee.EmpName AS "Employee",
    manager.EmpName AS "Manager"
FROM
    Employee_SelfJoin employee JOIN
    Employee_SelfJoin manager -- alias copy of the employee_selfjoin table
ON
    manager.EmployeeID = employee.ManagerID; -- parent is manager copy

---eof: SelfJoinQuery.sql

--- INNER JOIN:
SELECT 
	employee.EmployeeID,
	employee.EmpName AS "Employee",
	employee.EmpName AS "Manager"
FROM 
	Employee_SelfJoin employee INNER JOIN 
	Employee_SelfJoin manager
ON 
	manager.EmployeeID = employee.ManagerID; 

--- SELECT * FROM: 
SELECT * FROM Employee_SelfJoin;

--- LEFT JOIN: 
SELECT 
	employee.EmployeeID,
	employee.EmpName AS "Employee",
	employee.EmpName AS "Manager"
FROM 
	Employee_SelfJoin employee LEFT JOIN 
	Employee_SelfJoin manager
ON 
	manager.EmployeeID = employee.ManagerID; 

--- RIGHT JOIN: 
SELECT 
	employee.EmployeeID,
	employee.EmpName AS "Employee",
	employee.EmpName AS "Manager"
FROM 
	Employee_SelfJoin employee RIGHT JOIN 
	Employee_SelfJoin manager
ON 
	manager.EmployeeID = employee.ManagerID; 

--- FULL OUTER JOIN:
SELECT 
	employee.EmployeeID,
	employee.EmpName AS "Employee",
	employee.EmpName AS "Manager"
FROM 
	Employee_SelfJoin employee FULL OUTER JOIN 
	Employee_SelfJoin manager
ON 
	manager.EmployeeID = employee.ManagerID; 

--- 

INSERT INTO Employee_SelfJoin( EmployeeID, EmpName, ManagerID )
VALUES( 'c1', 'Corred', 'm2' );

INSERT INTO Employee_SelfJoin( EmployeeID, EmpName, ManagerID )
VALUES ( 'd1', 'Dijjov', 'c1' ),
( 'c2', 'Cifzuy', 'c1' ),
( 'd1', 'Dapdom', 'd1' ),
( 'x1', 'Xigmok', 'd1' ),
( 'l1', 'Luyban', 'c2' ),
( 'q1', 'Qabrex', 'c2' );


