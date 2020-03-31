-- FileName: Inventory-DDL.sql
-- Description: script to create Inventory database, create TABLEs
-- CST 8215
-- Year: 2016-2017
-- Last Modified: 2 Jan 2017

-- SET ROLE web;

-- DROP DATABASE IF EXISTS Inventory;

-- CREATE DATABASE Inventory
--        WITH OWNER = web
--        ENCODING = 'UTF8'
--        TABLESPACE = pg_default
--        LC_COLLATE = 'English_United States.1252'
--        LC_CTYPE = 'English_United States.1252'
--        CONNECTION LIMIT = -1;


DROP TABLE IF EXISTS Invoice_Line_T;
DROP TABLE IF EXISTS Product_T;
DROP TABLE IF EXISTS Invoice_T;
DROP TABLE IF EXISTS Customer_T;

CREATE TABLE Customer_T (
Cust_Id CHAR( 4 ),
Cust_Fname VARCHAR( 30 ) NULL,
Cust_Lname VARCHAR( 30 ) NOT NULL,
Cust_Phone VARCHAR( 15 ) NOT NULL,
Cust_Address VARCHAR( 20 ) NOT NULL,
Cust_City VARCHAR( 15 ) NOT NULL,
Cust_Prov CHAR( 2 ) NULL,
Cust_PostCode CHAR( 6 ) NOT NULL,
Cust_Balance DECIMAL( 9,2 ), 
CONSTRAINT PK_Customer PRIMARY KEY( Cust_Id )
);

CREATE TABLE Invoice_T (
Invoice_Number CHAR( 6 ),
Cust_Id CHAR( 4 ) NOT NULL,
Invoice_Date DATE,
CONSTRAINT PK_Invoice PRIMARY KEY( Invoice_Number ),
CONSTRAINT FK_Cust_ID FOREIGN KEY( Cust_Id ) REFERENCES Customer_T( Cust_ID )
);

CREATE TABLE Product_T (
Prod_Code CHAR( 5 ),
Prod_Description VARCHAR( 60 ) NOT NULL,
Prod_Indate DATE NOT NULL,
Prod_QOH INTEGER NOT NULL,
Prod_Min INTEGER,
Prod_Price DECIMAL( 5,2 ) NOT NULL,
Prod_Discount INTEGER,
CONSTRAINT PK_Product PRIMARY KEY( Prod_Code )
);

CREATE TABLE Invoice_Line_T (
Invoice_Number CHAR( 6 ),
Invoice_Line INTEGER,
Prod_Code CHAR( 5 ) NOT NULL,
Line_units INTEGER NOT NULL,
Line_Price DECIMAL( 5,2 ) NOT NULL,
CONSTRAINT PK_Invoice_Line PRIMARY KEY( Invoice_Number, Invoice_Line ),
CONSTRAINT FK1_Invoice_Line FOREIGN KEY( Invoice_Number ) REFERENCES Invoice_T( Invoice_Number ),
CONSTRAINT FK2_Invoice_Line FOREIGN KEY( Prod_Code ) REFERENCES Product_T( Prod_Code )
);

--eof: Inventory-DDL.sql
