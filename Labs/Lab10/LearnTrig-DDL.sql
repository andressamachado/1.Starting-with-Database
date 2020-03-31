 /**
 * @author: Andressa Machado - 040923007 
 * CST8215 - DATABASE
 * Section: 300
 * Professor: Kumari Gurusamy.
 * Lab 10 -  Trigger
 *last updated April 16th, 2018.
 */
 
-- Filename: LearnTrig-DDL.sql

-- DROP TRIGGER first becuase TRIGGER uses FUNCTION
DROP TRIGGER IF EXISTS Emp_Last_Name_Change ON Employee;
DROP FUNCTION IF EXISTS Log_Last_Name_Change();

-- Lab10 
DROP TRIGGER IF EXISTS Emp_First_Name_Change ON Employee;
DROP FUNCTION IF EXISTS Log_First_Name_Change();

DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Employee_Audit;


-- create employee table
CREATE TABLE Employee(
   ID SERIAL primary key,
   First_name VARCHAR(40) NOT NULL,
   Last_Name  VARCHAR(40) NOT NULL
);


-- create table to store audit detail
CREATE TABLE Employee_Audit (
   ID SERIAL PRIMARY KEY,
   Employee_ID INT4 NOT NULL,
   First_Name VARCHAR (40) NOT NULL,
   Last_Name VARCHAR(40) NOT NULL,
   Changed_ON TIMESTAMP(6) NOT NULL
);


CREATE TABLE New_T AS 
SELECT Employee_ID, Changed_ON FROM Employee_Audit;

-- function to use in trigger
CREATE OR REPLACE FUNCTION Log_Last_Name_Change()
  RETURNS TRIGGER AS
$Emp_Last_Name_Change$
BEGIN
    -- check if last_name has changed
    -- compare NEW. to OLD.
    IF NEW.last_name <> OLD.last_name THEN
    INSERT INTO employee_audit( Employee_ID, First_Name, Last_Name, Changed_ON )
    VALUES( OLD.id, OLD.First_Name, OLD.Last_Name, NOW() );
    END IF;

    RETURN NEW;
END;
$Emp_Last_Name_Change$ LANGUAGE plpgSQL;

CREATE TRIGGER Emp_Last_Name_Change BEFORE UPDATE ON Employee
FOR EACH ROW EXECUTE PROCEDURE Log_Last_Name_Change();

-- eof: LearnTrig-DDL.sql

-- Lab 10 - same for First_Name;
CREATE OR REPLACE FUNCTION Log_First_Name_Change()
  RETURNS TRIGGER AS
$Emp_First_Name_Change$
BEGIN
    -- check if first_name has changed
    -- compare NEW. to OLD.
    IF NEW.first_name <> OLD.first_name THEN
    INSERT INTO employee_audit( Employee_ID, First_Name, Last_Name, Changed_ON )
    VALUES( OLD.id, OLD.First_Name, OLD.First_Name, NOW() );
    END IF;

    RETURN NEW;
END;
$Emp_First_Name_Change$ LANGUAGE plpgSQL;

CREATE TRIGGER Emp_First_Name_Change BEFORE UPDATE ON Employee
FOR EACH ROW EXECUTE PROCEDURE Log_First_Name_Change();