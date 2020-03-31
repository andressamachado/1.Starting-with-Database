
SELECT * from employee;

SELECT * from department;

SELECT * from employee, department;

--- observe how illogical this cross join is.
SELECT * FROM employee CROSS JOIN department;
--- it is the same as
SELECT * FROM employee, department;
--- avoid doing these illogical cartesian products accidentally since it freezes the computer

SELECT * FROM employee INNER JOIN department
  ON employee.DepartmentID = department.DepartmentID;
  
--- since the primary key and foreign key have the same names we can use
--- natural join without ON condition
SELECT * FROM employee NATURAL JOIN department;