CREATE DATABASE D_company
USE D_company

CREATE TABLE employees(
	e_ID INT PRIMARY KEY IDENTITY,
	e_name VARCHAR(120) NOT NULL,
	e_salary INT NOT NULL,
	e_designation VARCHAR(70) NOT NULL
)

CREATE TABLE cities(
	city_ID INT PRIMARY KEY,
	city_name VARCHAR(50) NOT NULL
)

INSERT INTO employees VALUES('Muhammad Kaif', 250000, 'MERN stack dev'), 
('Abdul Samad', 300000, 'Game dev'), 
('Atiq', 200000, 'Laravel dev'),
('Bilal', 250000, 'MERN stack dev'),
('Gohar', 400000, 'Django dev'),
('Salman', 150000, 'Flutter dev'),
('Ali', 200000, 'Game dev'),
('Zeeshan', 200000, 'Laravel dev'),
('Hamza', 300000, 'Django dev'),
('Irfan', 230000, 'Flutter dev')

INSERT INTO CITIES VALUES(1, 'Karachi'), (2, 'Lahore'), (3, 'Islamabad')

UPDATE employees SET e_city_ID = 3 WHERE e_ID = 10


SELECT * FROM employees
SELECT * FROM cities

--ALIAS IN SQL

SELECT e_designation AS dsg FROM employees


-- AGGREGATE FUNCTION

SELECT sum(e_salary) AS total_salary FROM employees
SELECT count(e_name) AS name FROM employees
SELECT max(e_salary) AS max_salary FROM employees
SELECT min(e_salary) AS min_salary FROM employees
SELECT AVG(e_salary) AS avg_salary FROM employees


-- GROUP BY CLAUSE

SELECT e_designation FROM employees GROUP BY e_designation

-- IF YOU WANT TO SELECT MORE THAN ONE COLUMN THEN YOU HAVE TO USE A AGGREGATE FUNCTION ONLY IF YOU ARE USING ONE COLUMN WITH THE GROUP BY CLAUSE

SELECT e_designation, count(*) AS emp_per_dsg FROM employees GROUP BY e_designation

SELECT e_designation, sum(e_salary) AS Salaries FROM employees GROUP BY e_designation

SELECT e_designation, e_city_ID, avg(e_salary) FROM employees GROUP By e_designation, e_city_ID
