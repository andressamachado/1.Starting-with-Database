-- Student: Andressa Machado - 040923007 
-- CST 8215 302- Database
-- Lab 8 
-- march 14th 2018


CREATE TABLE department (
    DepartmentID INT,
    DepartmentName VARCHAR(20)
);
 
CREATE TABLE employee (
	DepartmentID INT,
	LastName VARCHAR(20)
);


SELECT * FROM department; 

INSERT INTO department VALUES(31, 'Sales');
INSERT INTO department VALUES(33, 'Engineering');
INSERT INTO department VALUES(34, 'Clerical');
INSERT INTO department VALUES(35, 'Marketing');


--- observe why this insert doesnt work.
--- edit this appropriately
INSERT INTO employee (LastName, DepartmentID) VALUES('Rafferty', 31);
INSERT INTO employee (LastName, DepartmentID) VALUES('Jones', 33);
INSERT INTO employee (LastName, DepartmentID) VALUES('Heisenberg', 33);
INSERT INTO employee (LastName, DepartmentID) VALUES('Robinson', 34);
INSERT INTO employee (LastName, DepartmentID) VALUES('Smith', 34);
INSERT INTO employee (LastName, DepartmentID) VALUES('Williams', NULL);

SELECT * FROM employee; 