-- SHOW TABLES;

SELECT * FROM `employee_salary`;
SELECT * FROM `employee_demographics`;

-- Inner Join
SELECT * FROM employee_salary as sal INNER JOIN employee_demographics as dem  ON sal.employee_id = dem.employee_id;

-- Outter Join
SELECT * FROM employee_salary as sal LEFT JOIN employee_demographics as dem  ON sal.employee_id = dem.employee_id;

-- self join
SELECT * FROM employee_salary as sal INNER JOIN employee_salary as dem  ON sal.employee_id + 1 = dem.employee_id;

-- multiple table
SELECT * FROM employee_demographics 
INNER JOIN employee_salary 
	on employee_demographics.employee_id = employee_salary.employee_id 
INNER JOIN parks_departments 
	ON  employee_salary.dept_id = parks_departments.department_id;
