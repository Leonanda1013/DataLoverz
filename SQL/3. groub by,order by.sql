SHOW TABLES;

SELECT * FROM `employee_demographics`;
SELECT gender FROM `employee_demographics` GROUP BY gender;
SELECT gender, AVG(age), COUNT(age) FROM `employee_demographics` GROUP BY gender;

SELECT occupation, AVG(salary) FROM `employee_salary`GROUP BY occupation;

SELECT * FROM `employee_demographics` ORDER BY gender;
SELECT * FROM `employee_demographics` ORDER BY employee_id DESC;