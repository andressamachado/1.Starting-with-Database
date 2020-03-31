 /**
 * @author: Andressa Machado - 040923007 
 * CST8215 - DATABASE
 * Section: 302
 * Professor: Kumari Gurusamy.
 * Lab 9 -  Query Inventory Database
 *last updated April 2nd, 2018.
 */

/*1. List all customers (concatenate last name, first name), and balances (Cust Balance), for those customers
with balances not equal to zero. Sort in descending order by balance. Make sure you have inserted some
non-zero values in the customer table database. For an explanation on concatenation refer section 2.11.1 on
page 12.*/

SELECT * FROM customer_t;

SELECT 
	textcat(textcat(cust_fname,text ' '),cust_lname) AS customers
FROM
	customer_t
WHERE 
	cust_balance > 0
ORDER BY 
	cust_balance;

	
/*2. List invoice numbers, product codes, line price, line units (quantity) and line cost (line price * quantity) for
lines with line costs greater than $500. Sort the result in descending order by line cost. Secondary ordering
by invoice number in descending order */

SELECT 
	invoice_number, prod_code, line_price, line_units, line_units * line_price AS line_cost
FROM 
	invoice_line_t
WHERE 
	line_units * line_price  > 500 
ORDER BY
	line_cost DESC;


/* 3. List product code, product description, product quantity on hand, product price and the inventory cost of
the product (price * quantity on hand), for those products with quantity on hand greater than 50. Sort by
product description in ascending order.*/

SELECT
	prod_code, prod_description, prod_qoh, prod_price, prod_price * prod_qoh AS inventory_cost
FROM 
	product_t
WHERE 
	prod_qoh > 50
ORDER BY 
	prod_description; 

/*4. List customer last name, customer first name and customer balance for those customers with zero balance,
who are in Ottawa. Sort by customer last name in an ascending order. */

SELECT 
	cust_lname, cust_fname, cust_balance 
FROM 
	customer_t
WHERE 
	cust_city = 'Ottawa' AND cust_balance = 0
ORDER BY 
	cust_lname;

/*5. List invoice number, product code, line units and line price for those invoice lines that have line prices greater
than $600 or less than $100. Sort line price in descending order. */

SELECT
	invoice_number, line_units, line_price, product.prod_code
FROM 
	invoice_line_t AS line
LEFT JOIN
	product_t AS product

ON
	line.prod_code = product.prod_code
WHERE 
	line_price > 600 OR line_price < 100
ORDER BY 
	line_price DESC; 

/* 6. List customer name (concatenate First name Last name), and address for those customers who have last
names beginning with the same first letter of your surname (last name) and have customer balances between
0 and 100 (inclusive). */

SELECT 
	textcat(textcat(cust_fname,text ', '),cust_lname) AS "customers name", cust_address
FROM 
	customer_t
WHERE 	
	cust_balance <= 100
ORDER BY 
	cust_lname;

-- Or we can have the same result with the following querie

SELECT 
	CONCAT (cust_lname, ', ', cust_fname) AS "Customer Name", 
	cust_address
FROM 
	Customer_t
WHERE 
	cust_balance <= 100
ORDER BY 
	cust_lname;


/*7. List product description, quantity on hand and product price for those products with quantity on hand equal
to 60, 70, 80, 90. Sort by quantity on hand in an ascending order. */

SELECT
	prod_description, prod_qoh, prod_price
FROM
	product_t
WHERE
	prod_qoh IN ( 60 , 70 , 80, 90) 
ORDER BY 
	prod_qoh;
	
/* 8. List product description, quantity on hand, product price and product discount for all products with null
values for product discount. */

SELECT
	prod_description, prod_qoh, prod_price, prod_discount
FROM 
	product_t
WHERE
	prod_discount IS NULL;
	
/* 9. List names of all cities where customers are located (city names only, not customer names). Do not repeat
any rows. Sort by city name in an ascending order. */ 

SELECT DISTINCT 
		cust_city
FROM 
	customer_t
ORDER BY 
	cust_city;
	
/*10. Match all customers who are in Ottawa using the syntax: WHERE Cust City = 'ottawa'; Note: ottawa is
in lowercase.*/

SELECT 
	cust_city, CONCAT (cust_lname, ', ', cust_fname) AS "Customer Name"
FROM 
	customer_t
WHERE 
	UPPER (cust_citY) = UPPER('ottawa');

--Or we can have the same result with the following query

SELECT 
	cust_city, CONCAT (cust_lname, ', ', cust_fname) AS "Customer Name"
FROM 
	customer_t
WHERE 
	cust_city ILIKE 'ottawa';