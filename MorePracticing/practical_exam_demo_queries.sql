-- Practical Exam Demo Queries
SELECT * FROM Customer_types;
SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM Order_lines;
SELECT * FROM Products;

-- Q1 What is the smallest order total that is greater than 0 (zero)? Include all digits including leading zeros if applicable.
SELECT
	MIN(order_total)
FROM
	Orders
WHERE
	order_total > 0;
-- Answer: 0.52

-- Q2 How many customers have an address2?
SELECT
	count(address2)
FROM
	Customers;
-- Answer: 327

-- Q3 How many customers are in the prairie  provinces?  The prairie provinces consist of Alberta (AB), Saskatchewan (SK) and Manitoba (MB).
SELECT
	count(province)
FROM
	Customers
WHERE
	province IN('AB', 'SK', 'MB');
-- Answer: 367

-- Q4 How many customer orders contain dohicky 2.5?
SELECT
	count(Orders.id)
FROM
	Orders JOIN Order_lines
	ON
	Orders.id = Order_lines.order_id
	JOIN Products
	ON
	Order_lines.product_id = Products.id
WHERE
	Products.name = 'Dohicky 2.5';
-- Answer: 2466

-- Q5 How many orders have an order_total that is less than the sum of their line_total(s)?
SELECT
	Orders.id,
	Orders.order_total,
	SUM(Order_lines.line_total)
FROM
	Orders JOIN Order_lines
	ON
	Orders.id = Order_lines.order_id
GROUP BY
	Orders.id
HAVING
	Orders.order_total < SUM(Order_lines.line_total)
ORDER BY
	Orders.id;
-- Answer: 383

-- Q6 How many customers do not have an order?
SELECT
	count(Customers.id)
FROM
	Customers LEFT OUTER JOIN Orders
	ON
	Customers.id = Orders.customer_id
WHERE
	Orders.customer_id IS NULL;
-- Answer: 18

-- Q7 What was the largest order total for Gage Burke?
SELECT
	MAX(Orders.order_total)
FROM
	Customers JOIN Orders
	ON
	Customers.id = Orders.customer_id
WHERE
	Customers.name = 'Gage Burke';
-- Answer: 3142.96

-- Q8 How many orders have a cvv of 668?
SELECT
	count(cvv)
FROM
	Orders
WHERE
	cvv = '668';
-- Answer: 17

-- Q9 How many of each of the following products were sold in the largest order?  (largest order_total) 
--- If the product was not in the largest order, enter 0.
SELECT
	id
FROM
	Orders
WHERE
	order_total = (SELECT MAX(order_total) FROM Orders);
--- the largest order_total is from order_id 926
SELECT
	Products.name,
	SUM(Order_lines.quantity)
FROM
	Products JOIN Order_lines
	ON
	Products.id = Order_lines.product_id
WHERE
	Order_lines.order_id = 926
GROUP BY
	Products.name
ORDER BY
	Products.name;
-- Answer: 0, 5, 5, 3, 0, 0, 0, 2, 0, 13

-- Q10 How many order lines are there?
SELECT
	count(id)
FROM
	Order_lines;
-- Answer: 22490

-- Q11 In what city was the largest order placed?
SELECT
	Customers.city,
	Orders.id
FROM
	Customers JOIN Orders
	ON
	Customers.id = Orders.customer_id
WHERE
	Orders.order_total = (SELECT MAX(order_total) FROM Orders);
--- the largest order_total is from order_id 926 (from Q9)
-- Answer: Valcourt

-- Q12 How many products where sold for less than their price? Sell price is in the orders lines whereas the regular price in the products listing.
--- Return the count of the order lines and not the sum of the quantity.
SELECT
	count(Order_lines.order_id)
FROM
	Order_lines JOIN Products
	ON
	Order_lines.product_id = Products.id
WHERE
	Order_lines.sell_price < Products.price;
-- Answer: 4355
-- Why is the correct answer 4356?

-- Q13 How many orders to not have an order_total?
SELECT
	order_total
FROM
	Orders
WHERE
	order_total IS NULL;
-- Answer: 1097
-- Why does count(order_total) return 0?

-- Q14 How many orders have no order lines?
SELECT
	count(Orders.id)
FROM
	Orders LEFT OUTER JOIN Order_lines
	ON
	Orders.id = Order_lines.order_id
WHERE
	Order_lines.id IS NULL;
-- Answer: 1055

-- Q15 How many orders did Gage Burke place?
SELECT
	count(Orders.order_total)
FROM
	Customers JOIN Orders
	ON
	Customers.id = Orders.customer_id
WHERE
	Customers.name = 'Gage Burke';
-- Answer: 2

-- Q16 How many orders where placed for customers in the city of Ajax?
SELECT
	count(Orders.id)
FROM
	Customers JOIN Orders
	ON
	Customers.id = Orders.customer_id
WHERE
	Customers.city = 'Ajax';
-- Answer: 56

-- Q17 How many orders were placed in September 2013?
SELECT
	count(id)
FROM
	Orders
WHERE
	EXTRACT(YEAR FROM order_date) = 2013
	AND
	EXTRACT(MONTH FROM order_date) = 09;
-- Answer: 776
-- Other valid answers are 709 and 749

-- Q18 What is the average sell_price for each product. Round to 2 decimal places.  If null value is returned, enter a 0.  Make sure to enter both decimal places.
SELECT
	Products.name,
	AVG(Order_lines.sell_price)
FROM
	Products LEFT OUTER JOIN Order_lines
	ON
	Products.id = Order_lines.product_id
GROUP BY
	Products.name
ORDER BY
	Products.name;
-- Answer: 0, 66.70, 23.41, 90.71, 54.04, 63.61, 81.36, 143.13, 41.57, 453.99

-- Q19 Which product had the largest total sell_price?
SELECT
	Products.name,
	MAX(Order_lines.sell_price) AS "Max"
FROM
	Products LEFT OUTER JOIN Order_lines
	ON
	Products.id = Order_lines.product_id
GROUP BY
	Products.name
ORDER BY
	"Max" DESC;
-- Answer: Widget 1.0

-- Q20 How many customers have a name that starts with 'Ginger'?
SELECT
	count(name)
FROM
	Customers
WHERE
	name LIKE 'Ginger%';
-- Answer: 2

-- Q21 Which product was not sold?
SELECT
	Products.name,
	count(Order_lines.id)
FROM
	Products LEFT OUTER JOIN Order_lines
	ON
	Products.id = Order_lines.product_id
GROUP BY
	Products.name
ORDER BY
	Products.name;
-- Answer: AlienGlows Notebook

-- Q22 How many customers have an orphanded customer type?
--- an orphanded customer type means customer_type_id that is not in the Customer_types table?
SELECT
	count(Customers.customer_type_id)
FROM
	Customer_types RIGHT OUTER JOIN Customers
	ON
	Customer_types.id = Customers.customer_type_id
WHERE
	Customers.customer_type_id NOT IN (1, 2, 3, 4);
-- Answer: 442

-- Q23 What is the gross margin for Widget 1.0. 
--- The gross margin is calulated by dividing the total line_total by the total quantity sold.   total $$/total quantity = gross margin
--- Enter the answer rounded to 2 decimal places.
SELECT
	Products.name,
	SUM(Order_lines.line_total)/SUM(Order_lines.quantity) AS "Gross Margin"
FROM
	Products JOIN Order_lines
	ON
	Products.id = Order_lines.product_id
WHERE
	Products.name = 'Widget 1.0'
GROUP BY
	Products.name;
-- Answer: 454.02

-- Q24 What is the smallest order total (greater than zero) for Orders that have the Dohicky Master Edition 2.5 in it?
SELECT
	MIN(Orders.order_total)
FROM
	Orders JOIN Order_lines
	ON
	Orders.id = Order_lines.order_id
	JOIN Products
	ON
	Order_lines.product_id = Products.id
WHERE
	Orders.order_total > 0
	AND
	Products.name = 'Dohicky Master Edition 2.5';
--Answer: 7.20

-- Q25 What was the total line_total for each product that was sold in the largest order? (largest order_total). 
--- Enter 0 if the product was not in the largest order. Make sure to enter both decimal places.
SELECT
	id
FROM
	Orders
WHERE
	order_total = (SELECT MAX(order_total) FROM Orders);
--- the largest order_total is from order_id 926 (from Q9)
SELECT
	Products.name,
	SUM(Order_lines.line_total)
FROM
	Products JOIN Order_lines
	ON
	Products.id = Order_lines.product_id
WHERE
	Order_lines.order_id = 926
GROUP BY
	Products.name
ORDER BY
	Products.name;
-- Answer: 0, 371.25, 129.95, 299.97, 0, 0, 0, 319.98, 0, 6111.14

-- Q26 Who placed the largest order?
SELECT
	Customers.name,
	Orders.order_total
FROM
	Customers JOIN Orders
	ON
	Customers.id = Orders.customer_id
WHERE
	Orders.order_total = (SELECT MAX(order_total) FROM Orders);
-- Answer: Christopher Contreras