--Rollup and CUBE in sql

CREATE DATABASE phoenix_armour

use phoenix_armour


INSERT INTO employees VALUES
('A', 'male', 80000, 'IT'),
('B', 'male', 50000, 'Finance'),
('C', 'female', 45000, 'Marketing'),
('D', 'female', 50000, 'HR'),
('E', 'male', 60000, 'IT'),
('F', 'female', 30000, 'Finance'),
('G', 'female', 35000, 'Marketing'),
('H', 'male', 45000, 'HR'),
('I', 'female', 70000, 'Finance'),
('J', 'male', 90000, 'Marketing'),
('K', 'female', 50000, 'IT'),
('L', 'male', 25000, 'HR')



SELECT COALESCE(e_department, 'Total') As Department, COALESCE(e_gender, 'Total') AS Gender, SUM(e_salary) AS sum_sal FROM employees GROUP BY ROLLUP(e_department, e_gender) 

SELECT COALESCE(e_gender, 'Total avg') AS Gender, COALESCE(e_department, 'Total avg') AS Department,
AVG(e_salary) AS avg_sal FROM employees GROUP BY CUBE(e_department, e_gender)


SELECT * FROM employees
