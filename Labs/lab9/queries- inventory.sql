SELECT * FROM customer_t;


-- using "" you preserve upper case and spaces
SELECT 
	cust_lname,
	cust_fname,
	CONCAT (cust_lname, ', ', cust_fname) AS "Customer Name" 
FROM 
	Customer_t
ORDER BY 
	cust_lname; 


SELECT 
	CONCAT (cust_lname, ', ', cust_fname) AS "Customer Name" 
FROM 
	Customer_t
ORDER BY 
	cust_lname; 



SELECT 
	invoice_number,
	prod_Code, 
	line_Price
FROM 
	Invoice_Line_t; 

SELECT * FROM Invoice_t;
SELECT * FROM Invoice_Line_t;

SELECT 
	Prod_code,
	prod_description
FROM 
	Product_t;


SELECT 
	Invoice_number,
	invoice_date
FROM 
	Invoice_t;


SELECT 
	Invoice_number,
	invoice_date
FROM 
	Invoice_t
ORDER BY
	Invoice_date DESC;


SELECT 
	Invoice_number,
	EXTRACT (year FROM invoice_date) AS Invoice_Year
FROM 
	Invoice_t;


--Q5:
SELECT 
	CONCAT (cust_lname, ', ', cust_fname),
	cust_City
FROM 
	customer_t
WHERE
	Cust_City <> 'ottawa';

SELECT 
	CONCAT (cust_lname, ', ', cust_fname),
	cust_City
FROM 
	customer_t
WHERE
	Cust_City != 'ottawa';



-- Ilike: ignores case. Compare w/ "Ottawa" and "ottawa":
SELECT 
	CONCAT (cust_lname, ', ', cust_fname),
	cust_City
FROM 
	customer_t
WHERE
	Cust_City NOT ILIKE 'ottawa';

SELECT 
	CONCAT (cust_lname, ', ', cust_fname),
	cust_City
FROM 
	customer_t
WHERE
	Cust_City NOT LIKE 'Ottawa';

	SELECT 
	CONCAT (cust_lname, ', ', cust_fname),
	cust_City
FROM 
	customer_t
WHERE
	Cust_City NOT LIKE 'ottawa';