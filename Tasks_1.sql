CREATE DATABASE Kababjees

use Kababjees

CREATE TABLE customers(
	c_ID INT PRIMARY KEY IDENTITY,
	c_f_name VARCHAR(120) NOT NULL,
	c_l_name VARCHAR(120) NOT NULL,
	o_country VARCHAR(100) NOT NULL
)

CREATE TABLE orders(
	o_ID INT PRIMARY KEY IDENTITY,
	o_date DATE DEFAULT(GETDATE()),
	o_amount INT NOT NULL,
	o_c_ID INT FOREIGN KEY REFERENCES customers(c_ID)
)

INSERT INTO customers VALUES 
('Zeeshan', 'Ahmed', 'Romania')

INSERT INTO orders(o_amount, o_c_ID) VALUES
(15000, 6)


SELECT * FROM customers
SELECT * FROM orders


-- TASK - 1: Total orders per customer

SELECT customers.c_ID, customers.c_f_name, customers.c_l_name, count(orders.o_c_ID) AS total_orders_per_cus FROM customers, orders WHERE customers.c_ID = orders.o_c_ID GROUP BY customers.c_ID, customers.c_f_name, customers.c_l_name

-- TASK - 2: Average order amount per country

SELECT customers.o_country, avg(orders.o_amount) AS avg_order_amount FROM customers, orders WHERE customers.c_ID = orders.o_c_ID GROUP BY customers.o_country

-- TASK - 3: Top 3 most expensive orders

SELECT TOP 3 orders.o_ID, customers.c_ID, orders.o_date, orders.o_amount AS exp_orders FROM orders INNER JOIN customers
ON orders.o_c_ID = customers.c_ID ORDER BY orders.o_amount DESC

-- TASK - 4: Total order amount for each customer

SELECT customers.c_ID, customers.c_f_name + ' ' + customers.c_l_name AS Full_name, SUM(orders.o_amount) AS total_amount FROM customers, orders WHERE customers.c_ID = orders.o_c_ID GROUP BY customers.c_ID, customers.c_f_name, customers.c_l_name


-- TASK - 5: Customers with more than one order:

SELECT cus.c_ID, cus.c_f_name, cus.c_l_name, count(ord.o_c_ID) AS total_orders FROM customers AS cus, orders AS ord WHERE cus.c_ID = ord.o_c_ID GROUP BY cus.c_ID, cus.c_f_name, cus.c_l_name HAVING count(ord.o_c_ID) > 1

-- TASK - 6: Highest and Lowest order amount per customer

SELECT cus.c_ID, cus.c_f_name, cus.c_l_name, MAX(ord.o_amount) AS highest_amount, MIN(ord.o_amount) AS lowest_amount FROM customers AS cus, orders AS ord WHERE cus.c_ID = ord.o_c_ID GROUP BY cus.c_ID, cus.c_f_name, cus.c_l_name

