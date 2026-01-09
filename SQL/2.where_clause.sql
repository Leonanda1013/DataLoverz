SHOW TABLES;

SELECT * FROM `employee_salary`;

SELECT * FROM `employee_salary` WHERE `salary`>50000;

SELECT * FROM `employee_demographics` WHERE gender = "Male" && age >=40;

-- LIKE Statement
SELECT * FROM `parks_departments`;
SELECT * FROM `parks_departments` WHERE department_name LIKE 'A%';
