-- JOINS IN SQL

use phoenix_armour

SELECT * FROM employees
SELECT * FROM cities


-- INNER JOIN

SELECT e_ID, e_name, e_gender, e_salary, e_department, city_name FROM employees
INNER JOIN cities
ON employees.e_city_ID = cities.city_ID


-- LEFT JOIN

SELECT e_ID, e_name, e_gender, e_salary, e_department, city_name FROM employees
LEFT JOIN cities
ON employees.e_city_ID = cities.city_ID

-- RIGHT JOIN

SELECT e_ID, e_name, e_gender, e_salary, e_department, city_name FROM employees
RIGHT JOIN cities
ON employees.e_city_ID = cities.city_ID

--  FULL OUTER JOIN

SELECT e_ID, e_name, e_gender, e_salary, e_department, city_name FROM employees
FULL OUTER JOIN cities
ON employees.e_city_ID = cities.city_ID


